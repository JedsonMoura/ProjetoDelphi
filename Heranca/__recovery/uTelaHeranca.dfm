object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe aqui o Titulo'
  ClientHeight = 473
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 900
    Height = 428
    ActivePage = tabManutencao
    Align = alClient
    TabOrder = 0
    object tabLmanutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
    end
    object tabManutencao: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 66
        Align = alTop
        TabOrder = 0
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 66
        Width = 892
        Height = 334
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 428
    Width = 900
    Height = 45
    Align = alBottom
    TabOrder = 1
    OnClick = pnlRodapeClick
    DesignSize = (
      900
      45)
    object btnNovo: TSpeedButton
      Left = 8
      Top = 11
      Width = 73
      Height = 22
      Caption = '&NOVO'
      OnClick = btnNovoClick
    end
    object btnAlterar: TSpeedButton
      Left = 87
      Top = 11
      Width = 73
      Height = 22
      Caption = '&ALTERAR'
      OnClick = btnAlterarClick
    end
    object btnCancelar: TSpeedButton
      Left = 166
      Top = 11
      Width = 73
      Height = 22
      Caption = '&CANCELAR'
      OnClick = btnCancelarClick
    end
    object btnGravar: TSpeedButton
      Left = 245
      Top = 11
      Width = 73
      Height = 22
      Caption = '&GRAVAR'
      OnClick = btnGravarClick
    end
    object btnApagar: TSpeedButton
      Left = 324
      Top = 11
      Width = 73
      Height = 22
      Caption = '&APAGA&R'
      OnClick = btnApagarClick
    end
    object btnFechar: TSpeedButton
      Left = 823
      Top = 11
      Width = 73
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '&FECHAR'
      OnClick = btnFecharClick
    end
    object btnNavegation: TDBNavigator
      Left = 403
      Top = 10
      Width = 232
      Height = 23
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
  end
  object mskEdit: TMaskEdit
    Left = 8
    Top = 47
    Width = 433
    Height = 21
    TabOrder = 2
    Text = ''
    TextHint = 'Digite sua Pesquisa'
  end
  object btnPesquisar: TButton
    Left = 455
    Top = 44
    Width = 130
    Height = 27
    Caption = '&Pesquisar'
    TabOrder = 3
  end
  object QryListagem: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'select categoriaId,'
      #9#9'descricao '
      #9'From Categoria')
    Params = <>
    Left = 660
    Top = 32
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231'ao'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsListagem: TDataSource
    Left = 728
    Top = 32
  end
end
