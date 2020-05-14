unit Apollo_DPM_PackageFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Menus, Vcl.ExtCtrls,
  Apollo_DPM_Engine,
  Apollo_DPM_Form,
  Apollo_DPM_Package;

type
  TfrmPackage = class(TFrame)
    lblPackageDescription: TLabel;
    btnInstall: TButton;
    cbbVersions: TComboBox;
    lblVersion: TLabel;
    aiVerListLoad: TActivityIndicator;
    pmActions: TPopupMenu;
    mniAdd: TMenuItem;
    mniPackageSettings: TMenuItem;
    mniRemove: TMenuItem;
    mniUpdateTo: TMenuItem;
    lblVersionlDescribe: TLabel;
    mniDependencies: TMenuItem;
    procedure cbbVersionsDropDown(Sender: TObject);
    procedure mniAddClick(Sender: TObject);
    procedure mniPackageSettingsClick(Sender: TObject);
    procedure mniRemoveClick(Sender: TObject);
    procedure cbbVersionsChange(Sender: TObject);
    procedure mniUpdateToClick(Sender: TObject);
    procedure mniDependenciesClick(Sender: TObject);
  private
    { Private declarations }
    FAllowAction: TAllowActionFunc;
    FDPMEngine: TDPMEngine;
    FIsRepoVersionsLoaded: Boolean;
    FPackage: TPackage;
    FSHAs: TArray<string>;
    function GetIndexByVersion(const aVersion: TVersion): Integer;
    function GetVersionByIndex(const aIndex: Integer): TVersion;
    procedure AddVersionToCombo(const aName, aSHA: string);
    procedure FillVersionsCombo;
    procedure InitActions;
    procedure InitState;
    procedure SetVersionDescribe;
  public
    { Public declarations }
    function IsShowThisPackage(aPackage: TPackage): Boolean;
    procedure Refresh;
    constructor Create(AOwner: TComponent; aPackage: TPackage; aDPMEngine: TDPMEngine); reintroduce;
    destructor Destroy; override;
  end;

const
  cLatestVersionOrCommit = 'the latest version or commit';
  cLatestCommit = 'the latest commit';

implementation

{$R *.dfm}

uses
  Apollo_DPM_UIHelper;

{ TfrmPackage }

procedure TfrmPackage.AddVersionToCombo(const aName, aSHA: string);
begin
  cbbVersions.Items.Add(aName);
  FSHAs := FSHAs + [aSHA];
end;

procedure TfrmPackage.cbbVersionsChange(Sender: TObject);
begin
  InitState;
end;

procedure TfrmPackage.cbbVersionsDropDown(Sender: TObject);
begin
  if FIsRepoVersionsLoaded then
    Exit;

  AsyncLoad(
    aiVerListLoad,
    procedure
    begin
      FDPMEngine.LoadRepoVersions(FPackage);
    end,
    procedure
    begin
      FIsRepoVersionsLoaded := True;
      FillVersionsCombo;
    end
  );
end;

constructor TfrmPackage.Create(AOwner: TComponent; aPackage: TPackage; aDPMEngine: TDPMEngine);
begin
  inherited Create(AOwner);

  FPackage := aPackage;
  FDPMEngine := aDPMEngine;

  FIsRepoVersionsLoaded := False;
  lblPackageDescription.Caption := FPackage.Description;

  Refresh;
end;

destructor TfrmPackage.Destroy;
begin
  FPackage.Free;

  inherited;
end;

procedure TfrmPackage.FillVersionsCombo;
var
  i: Integer;
  Version: TVersion;
  VersionIndex: Integer;
begin
  FSHAs := [];
  cbbVersions.Items.Clear;

  for Version in FPackage.Versions do
    AddVersionToCombo(Version.DisplayName, Version.SHA);

  if not FIsRepoVersionsLoaded then
    AddVersionToCombo(cLatestVersionOrCommit, '')
  else
    AddVersionToCombo(cLatestCommit, '');

  VersionIndex := GetIndexByVersion(FPackage.InstalledVersion);
  if VersionIndex >= 0 then
    cbbVersions.ItemIndex := VersionIndex
  else
    cbbVersions.ItemIndex := cbbVersions.Items.Count - 1;
end;

function TfrmPackage.GetIndexByVersion(const aVersion: TVersion): Integer;
var
  i: Integer;
begin
  Result := -1;

  for i := 0 to Length(FSHAs) - 1 do
    if FSHAs[i] = aVersion.SHA then
      Exit(i);
end;

function TfrmPackage.GetVersionByIndex(const aIndex: Integer): TVersion;
var
  i: Integer;
  Version: TVersion;
begin
  Result.Init;

  for Version in FPackage.Versions do
    if Version.SHA = FSHAs[aIndex] then
      Exit(Version);
end;

procedure TfrmPackage.InitActions;
begin
  {mniAdd.Visible := FAllowAction(FPackage, GetSelectedVersion, atAdd);
  mniRemove.Visible := FAllowAction(FPackage, GetSelectedVersion, atRemove);
  mniUpdateTo.Visible := FAllowAction(FPackage, GetSelectedVersion, atUpdateTo);
  mniDependencies.Visible := FAllowAction(FPackage, GetSelectedVersion, atDependencies);
  mniPackageSettings.Visible := FAllowAction(FPackage, GetSelectedVersion, atPackageSettings);}
end;

procedure TfrmPackage.InitState;
begin
  //InitActions;
  SetVersionDescribe;
end;

function TfrmPackage.IsShowThisPackage(aPackage: TPackage): Boolean;
begin
  Result := aPackage.Name = FPackage.Name;
end;

procedure TfrmPackage.mniAddClick(Sender: TObject);
var
  Version: TVersion;
begin
  Version := GetVersionByIndex(cbbVersions.ItemIndex);

  if not Version.IsEmpty then
    FDPMEngine.AddPackage(Version.SHA, FPackage)
  else
  if cbbVersions.Items[cbbVersions.ItemIndex] = cLatestVersionOrCommit then
    FDPMEngine.AddPackageLatestVersionOrCommit(FPackage)
  else
  if cbbVersions.Items[cbbVersions.ItemIndex] = cLatestCommit then
    FDPMEngine.AddPackageLatestCommit(FPackage);
end;

procedure TfrmPackage.mniDependenciesClick(Sender: TObject);
var
  Version: TVersion;
begin
  //Version := GetSelectedVersion;
  //FActionProc(atDependencies, Version, FPackage);
end;

procedure TfrmPackage.mniPackageSettingsClick(Sender: TObject);
var
  Version: TVersion;
begin
  //Version := GetSelectedVersion;
  //FActionProc(atPackageSettings, Version, FPackage);
end;

procedure TfrmPackage.mniRemoveClick(Sender: TObject);
var
  Version: TVersion;
begin
  //Version := GetSelectedVersion;
  //FActionProc(atRemove, Version, FPackage);
end;

procedure TfrmPackage.mniUpdateToClick(Sender: TObject);
var
  Version: TVersion;
begin
  //Version := GetSelectedVersion;
  //FActionProc(atUpdateTo, Version, FPackage);
end;

procedure TfrmPackage.Refresh;
begin
  FillVersionsCombo;
  InitState;
end;

procedure TfrmPackage.SetVersionDescribe;
var
  Version: TVersion;
begin
  {lblVersionlDescribe.Caption := '';
  lblVersionlDescribe.Font.Color := clWindowText;
  //Version := GetSelectedVersion;

  if not Version.SHA.IsEmpty and (Version.SHA = FPackage.InstalledVersion.SHA) then
    begin
      lblVersionlDescribe.Caption := Format('was installed at %s',
        [FormatDateTime('hh:mm:ss ddddd', Version.InstallTime)]);
      lblVersionlDescribe.Font.Color := clGreen;
    end
  else
  if Version.RemoveTime > 0 then
    begin
      lblVersionlDescribe.Caption := Format('was removed at %s',
        [FormatDateTime('hh:mm:ss ddddd', Version.RemoveTime)]);
      lblVersionlDescribe.Font.Color := clRed;
    end;}
end;

end.
