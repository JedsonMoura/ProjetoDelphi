unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, uDTMConexao, ZDataset, Enter, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabLmanutencao: TTabSheet;
    tabManutencao: TTabSheet;
    Panel1: TPanel;
    mskEdit: TMaskEdit;
    btnPesquisar: TButton;
    grdListagem: TDBGrid;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    btnApagar: TSpeedButton;
    btnFechar: TSpeedButton;
    btnNavegation: TDBNavigator;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    QryListagemcategoriaId: TIntegerField;
    QryListagemdescricao: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure pnlRodapeClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);



  private
    { Private declarations }

  EstadoDoCadastro : TEstadoDoCadastro;

  procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar , btnGravar,
                        btnApagar :TSpeedButton; Navegador: TDBNavigator;
                        pgcPrincipal:TPageControl; Flag:Boolean);

  procedure ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);


  public
    { Public declarations }
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

 //Procedimentos de Controle de Tela
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);

  begin
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,
                 btnNavegation,pgcPrincipal,false);

     EstadoDoCadastro := ecInserir;
end;


procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar , btnGravar,
                        btnApagar :TSpeedButton; Navegador: TDBNavigator;
                        pgcPrincipal:TPageControl; Flag: Boolean);
begin
  btnNovo.Enabled :=Flag;
  btnApagar.Enabled :=Flag;
  btnAlterar.Enabled :=Flag;
  Navegador.Enabled := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
  btnCancelar.Enabled := not(Flag);
  btnGravar.Enabled := not(Flag);

end;



procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,
                 btnNavegation,pgcPrincipal,false);

 EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,
                 btnNavegation,pgcPrincipal,false);

  ControlarIndiceTab(pgcPrincipal,0);

       EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal :TPageControl;Indice:Integer);

begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
      pgcPrincipal.TabIndex:=Indice;

end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,
                 btnNavegation,pgcPrincipal,true);
 ControlarIndiceTab(pgcPrincipal,0);
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);

begin
Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin

  Try
   ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,
                   btnNavegation,pgcPrincipal,true);

   if (EstadoDoCadastro = ecInserir) then
      ShowMessage('Inserir')
   else if (EstadoDoCadastro = ecAlterar) then
      ShowMessage('Alterado')
      else
            ShowMessage('Nada Consta')


  Finally

   EstadoDoCadastro := ecNenhum;

  End;




end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
QryListagem.Connection := dtmPrincipal.ConexaoDB;
dtsListagem.DataSet := QryListagem;
grdListagem.DataSource :=dtsListagem;
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
x'x
end;

procedure TfrmTelaHeranca.pnlRodapeClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar,
                 btnNavegation,pgcPrincipal,true);
end;

end.
