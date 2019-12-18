unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao,Enter;

type
  TfrmPrincipal = class(TForm)
    MainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATORIO1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    menuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    N3: TMenuItem;
    PRODUTO2: TMenuItem;
    N4: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    var

      TeclaEnter :  TMrEnter;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
frmCadCategoria := TfrmCadCategoria.Create(Self);
frmCadCategoria.ShowModal;
frmCadCategoria.Release;
end;


procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);
  end;


procedure TfrmPrincipal.FormCreate(Sender: TObject);



begin
{dtmPrincipal := TdtmPrincipal.Create(Self);
dtmPrincipal.ConexaoDB.SQLHourGlass :=True;
dtmPrincipal.ConexaoDB.Protocol := 'mssql';
dtmPrincipal.ConexaoDB.LibraryLocation := 'C:\ProjetosDelphi\ntwdblib.dll';
dtmPrincipal.ConexaoDB.HostName := '.\SQLEXPRESS';
//dtmPrincipal.ConexaoDB.Port :='1433';
dtmPrincipal.ConexaoDB.User := '';
dtmPrincipal.ConexaoDB.Password:='';
dtmPrincipal.ConexaoDB.Database :='Vendas';
dtmPrincipal.ConexaoDB.Connected :=True;

dtmPrincipal := TdtmPrincipal.Create(Self);
with dtmPrincipal.ConexaoDB do
begin
  SQLHourGlass :=True;
  Protocol := 'mssql';
  LibraryLocation := 'C:\ProjetosDelphi\ntwdblib.dll';
  HostName := '.\SQLEXPRESS';
  User := '';
  Password:='';
  Database :='Vendas';
  Connected :=True;
}

      TeclaEnter :=TMrEnter.Create(Self);
      TeclaEnter.FocusEnabled :=True;
      TeclaEnter.FocusColor := clInfoBk;

end;

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin
  //Close;
  Application.Terminate;
end;

end.
