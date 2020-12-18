unit Apollo_DPM_Engine;

interface

uses
  Apollo_DPM_GitHubAPI,
  Apollo_DPM_Package,
  Apollo_DPM_Types,
  System.SysUtils,
  ToolsAPI,
  Vcl.Menus;

type
  TDPMEngine = class
  private
    FGHAPI: TGHAPI;
    FPrivatePackages: TPackageList;
    function AddPackageFiles(aPackage: TPackage): TArray<string>;
    function DefineVersion(aPackage: TPackage; const aVersion: TVersion): TVersion;
    function GetActiveProject: IOTAProject;
    function GetActiveProjectPath: string;
    function GetApolloMenuItem: TMenuItem;
    function GetIDEMainMenu: TMainMenu;
    function GetPackagePath(aPackage: TPackage): string;
    function GetPrivatePackagesPath: string;
    function GetVendorsPath: string;
    function IsProjectOpened: Boolean;
    function SaveContent(const aPackagePath, aSourcePath, aContent: string): string;
    procedure AddApolloMenuItem;
    procedure AddDPMMenuItem;
    procedure BuildMenu;
    procedure DPMMenuItemClick(Sender: TObject);
    procedure LoadRepoTree(aPackage: TPackage; const aVersion: TVersion);
    procedure SavePackage(aPackage: TPackage);
    procedure WriteFile(const aPath: string; const aBytes: TBytes);
  public
    function AllowAction(const aActionType: TFrameActionType): Boolean;
    function GetPrivatePackages: TPackageList;
    function LoadRepoData(const aRepoURL: string; out aRepoOwner, aRepoName, aError: string): Boolean;
    procedure AddNewPrivatePackage(aPackage: TPackage);
    procedure InstallPackage(aPackage: TPackage; const aVersion: TVersion);
    procedure LoadRepoVersions(aPackage: TPackage);
    procedure UpdatePrivatePackage(aPackage: TPackage);
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  Apollo_DPM_Consts,
  Apollo_DPM_Form,
  Apollo_DPM_Validation,
  System.Classes,
  System.IOUtils,
  System.NetEncoding;

{ TDPMEngine }

procedure TDPMEngine.AddApolloMenuItem;
var
  ApolloItem: TMenuItem;
begin
  ApolloItem := TMenuItem.Create(nil);
  ApolloItem.Name := cApolloMenuItemName;
  ApolloItem.Caption := cApolloMenuItemCaption;

  GetIDEMainMenu.Items.Insert(GetIDEMainMenu.Items.Count - 1, ApolloItem);
end;

procedure TDPMEngine.AddDPMMenuItem;
var
  DPMMenuItem: TMenuItem;
begin
  DPMMenuItem := TMenuItem.Create(nil);
  DPMMenuItem.Caption := cDPMMenuItemCaption;
  DPMMenuItem.OnClick := DPMMenuItemClick;

  GetApolloMenuItem.Add(DPMMenuItem);
end;

procedure TDPMEngine.AddNewPrivatePackage(aPackage: TPackage);
begin
  SavePackage(aPackage);
  GetPrivatePackages.Add(aPackage);
end;

function TDPMEngine.AddPackageFiles(aPackage: TPackage): TArray<string>;
var
  Blob: TBlob;
  TreeNode: TTreeNode;
begin
  Result := [];

  for TreeNode in aPackage.RepoTree do
  begin
    if TreeNode.FileType <> 'blob' then
      Continue;

    Blob := FGHAPI.GetRepoBlob(TreeNode.URL);
    SaveContent(GetPackagePath(aPackage), TreeNode.Path, Blob.Content);
  end;
end;

function TDPMEngine.AllowAction(const aActionType: TFrameActionType): Boolean;
begin
  Result := False;
  case aActionType of
    fatInstall: Result := IsProjectOpened;
    fatEditPackage: Result := True;
  end;
end;

procedure TDPMEngine.BuildMenu;
begin
  if GetApolloMenuItem = nil then
    AddApolloMenuItem;

  AddDPMMenuItem;
end;

constructor TDPMEngine.Create;
begin
  FGHAPI := TGHAPI.Create;

  FPrivatePackages := nil;

  BuildMenu;

  Validation := TValidation.Create(Self);
end;

function TDPMEngine.DefineVersion(aPackage: TPackage; const aVersion: TVersion): TVersion;
begin
  if not aVersion.SHA.IsEmpty then
    Exit(aVersion);

  if aVersion.Name = cStrLatestVersionOrCommit then
  begin
    LoadRepoVersions(aPackage);
    if Length(aPackage.Versions) > 0 then
      Exit(aPackage.Versions[0]);
  end;

  Result.Name := '';
  Result.SHA := FGHAPI.GetMasterBranchSHA(aPackage.RepoOwner, aPackage.RepoName);
end;

destructor TDPMEngine.Destroy;
begin
  Validation.Free;
  FGHAPI.Free;

  if Assigned(FPrivatePackages) then
    FPrivatePackages.Free;

  if GetApolloMenuItem <> nil then
    GetIDEMainMenu.Items.Remove(GetApolloMenuItem);

  inherited;
end;

procedure TDPMEngine.DPMMenuItemClick(Sender: TObject);
begin
  DPMForm := TDPMForm.Create(Self);
  try
    DPMForm.ShowModal;
  finally
    DPMForm.Free;
    FreeAndNil(FPrivatePackages);
  end;
end;

function TDPMEngine.GetActiveProject: IOTAProject;
var
  i: Integer;
  Module: IOTAModule;
  ModuleServices: IOTAModuleServices;
  Project: IOTAProject;
  ProjectGroup: IOTAProjectGroup;
begin
  Result := nil;

  ModuleServices := BorlandIDEServices as IOTAModuleServices;
  for i := 0 to ModuleServices.ModuleCount - 1 do
  begin
    Module := ModuleServices.Modules[i];
    if Supports(Module, IOTAProjectGroup, ProjectGroup) then
      Exit(ProjectGroup.ActiveProject)
    else
    if Supports(Module, IOTAProject, Project) then
      Exit(Project);
  end;
end;

function TDPMEngine.GetActiveProjectPath: string;
begin
  Result := TDirectory.GetParent(GetActiveProject.FileName);
end;

function TDPMEngine.GetApolloMenuItem: TMenuItem;
var
  MenuItem: TMenuItem;
begin
  Result := nil;

  for MenuItem in GetIDEMainMenu.Items do
    if MenuItem.Name = cApolloMenuItemName then
      Exit(MenuItem);
end;

function TDPMEngine.GetIDEMainMenu: TMainMenu;
begin
  Result := (BorlandIDEServices as INTAServices).MainMenu;
end;

function TDPMEngine.GetPackagePath(aPackage: TPackage): string;
begin
  Result := TPath.Combine(GetVendorsPath, aPackage.Name);
end;

function TDPMEngine.GetPrivatePackages: TPackageList;
var
  FileArr: TArray<string>;
  FileItem: string;
  PackageFileData: TPackageFileData;
  PackageFileDataArr: TArray<TPackageFileData>;
begin
  if FPrivatePackages = nil then
  begin
    if TDirectory.Exists(GetPrivatePackagesPath) then
    begin
      FileArr := TDirectory.GetFiles(GetPrivatePackagesPath, '*.json');
      PackageFileDataArr := [];
      for FileItem in FileArr do
      begin
        PackageFileData.FilePath := FileItem;
        PackageFileData.JSONString := TFile.ReadAllText(FileItem, TEncoding.ANSI);

        PackageFileDataArr := PackageFileDataArr + [PackageFileData];
      end;

      if Length(PackageFileDataArr) > 0 then
        FPrivatePackages := TPackageList.Create(PackageFileDataArr);
    end;
  end;

  if FPrivatePackages = nil then
    FPrivatePackages := TPackageList.Create(True);
  Result := FPrivatePackages;
end;

function TDPMEngine.GetPrivatePackagesPath: string;
begin
  Result := TPath.Combine(TPath.GetPublicPath, cPrivatePackagesPath);
end;

function TDPMEngine.GetVendorsPath: string;
begin
  Result := TDirectory.GetParent(GetActiveProjectPath) + '\Vendors';
end;

procedure TDPMEngine.InstallPackage(aPackage: TPackage; const aVersion: TVersion);
var
  Version: TVersion;
begin
  Version := DefineVersion(aPackage, aVersion);
  LoadRepoTree(aPackage, Version);

  AddPackageFiles(aPackage);
end;

function TDPMEngine.IsProjectOpened: Boolean;
begin
  Result := GetActiveProject <> nil;
end;

function TDPMEngine.LoadRepoData(const aRepoURL: string; out aRepoOwner, aRepoName,
  aError: string): Boolean;
var
  RepoURL: string;
  SHA: string;
  URLWords: TArray<string>;
begin
  Result := False;
  RepoURL := aRepoURL;
  aRepoOwner := '';
  aRepoName := '';
  aError := '';

  if RepoURL.Contains('://') then
    RepoURL := RepoURL.Substring(RepoURL.IndexOf('://') + 3, RepoURL.Length);
  URLWords := RepoURL.Split(['/']);

  if (not (Length(URLWords) >= 3)) or
   ((Length(URLWords) > 0) and (URLWords[0].ToLower <> 'github.com'))
  then
  begin
    aError := cStrTheGitHubRepositoryUrlIsInvalid;
    Exit;
  end;

  try
    SHA := FGHAPI.GetMasterBranchSHA(URLWords[1], URLWords[2]);
  except
    aError := cStrCantLoadTheRepositoryURL;
    Exit;
  end;

  if SHA.IsEmpty then
    Exit;

  Result := True;
  aRepoOwner := URLWords[1];
  aRepoName := URLWords[2];
end;

procedure TDPMEngine.LoadRepoTree(aPackage: TPackage; const aVersion: TVersion);
begin
  aPackage.RepoTree := FGHAPI.GetRepoTree(aPackage.RepoOwner, aPackage.RepoName, aVersion.SHA);
end;

procedure TDPMEngine.LoadRepoVersions(aPackage: TPackage);
var
  Tag:  TTag;
  Tags: TArray<TTag>;
  Version: TVersion;
begin
  if aPackage.AreVersionsLoaded then
    Exit;

  Tags := FGHAPI.GetRepoTags(aPackage.RepoOwner, aPackage.RepoName);

  for Tag in Tags do
  begin
    Version.Name := Tag.Name;
    Version.SHA := Tag.SHA;

    aPackage.AddVersion(Version);
  end;

  aPackage.AreVersionsLoaded := True;
end;

function TDPMEngine.SaveContent(const aPackagePath, aSourcePath,
  aContent: string): string;
var
  Bytes: TBytes;
  RepoPathPart: string;
  RepoPathParts: TArray<string>;
begin
  Result := aPackagePath;
  RepoPathParts := aSourcePath.Split(['/']);

  for RepoPathPart in RepoPathParts do
    Result := Result + '\' + RepoPathPart;

  Bytes := TNetEncoding.Base64.DecodeStringToBytes(aContent);

  WriteFile(Result, Bytes);
end;

procedure TDPMEngine.SavePackage(aPackage: TPackage);
var
  Bytes: TBytes;
  Path: string;
begin
  Bytes := TEncoding.ANSI.GetBytes(aPackage.GetJSONString);
  Path := TPath.Combine(GetPrivatePackagesPath, aPackage.Name + '.json');

  WriteFile(Path, Bytes);
  aPackage.FilePath := Path;
end;

procedure TDPMEngine.UpdatePrivatePackage(aPackage: TPackage);
begin
  TFile.Delete(aPackage.FilePath);
  SavePackage(aPackage);
end;

procedure TDPMEngine.WriteFile(const aPath: string; const aBytes: TBytes);
var
  FS: TFileStream;
begin
  ForceDirectories(TDirectory.GetParent(aPath));

  FS := TFile.Create(aPath);
  try
    FS.Position := FS.Size;
    FS.Write(aBytes[0], Length(aBytes));
  finally
    FS.Free;
  end;
end;

end.
