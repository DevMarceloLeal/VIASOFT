object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Centro de Custos'
  ClientHeight = 476
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 361
    Width = 435
    Height = 7
    Shape = bsBottomLine
  end
  object Bevel2: TBevel
    Left = -6
    Top = 61
    Width = 435
    Height = 7
    Shape = bsBottomLine
  end
  inline FrameCadastroOperacoes: TFrameCadastroOperacoes
    Left = 0
    Top = 0
    Width = 429
    Height = 58
    TabOrder = 0
    ExplicitWidth = 429
    ExplicitHeight = 58
    inherited lblCentroCustos: TLabel
      Width = 88
      Height = 13
      Font.Height = -11
      Font.Name = 'Tahoma'
      ExplicitWidth = 88
      ExplicitHeight = 13
    end
    inherited lblValor: TLabel
      Width = 44
      Height = 13
      Font.Height = -11
      Font.Name = 'Tahoma'
      ExplicitWidth = 44
      ExplicitHeight = 13
    end
    inherited btnLancar: TBitBtn
      Left = 262
      Top = 27
      ExplicitLeft = 262
      ExplicitTop = 27
    end
    inherited edtValor: TEdit
      Height = 21
      ExplicitHeight = 21
    end
    inherited edtCentroCustos: TEdit
      Height = 21
      ExplicitHeight = 21
    end
    inherited btnSair: TBitBtn
      Left = 340
      Top = 27
      ExplicitLeft = 340
      ExplicitTop = 27
    end
  end
  inline FrameLog: TFrameLog
    Left = 3
    Top = 74
    Width = 421
    Height = 137
    TabOrder = 1
    ExplicitLeft = 3
    ExplicitTop = 74
    ExplicitWidth = 421
    inherited LabelTitulo: TLabel
      Width = 421
    end
    inherited MemoLog: TMemo
      Left = 10
      Width = 408
      Height = 99
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      ExplicitLeft = 10
      ExplicitWidth = 408
      ExplicitHeight = 99
    end
  end
  inline FrameAgrupamento: TFrameAgrupamento
    Left = 4
    Top = 203
    Width = 417
    Height = 152
    TabOrder = 2
    ExplicitLeft = 4
    ExplicitTop = 203
    ExplicitWidth = 417
    ExplicitHeight = 152
    inherited LabelCreditos: TLabel
      Left = 13
      Top = 7
      Width = 140
      Caption = 'Centro de Custos Pai:'
      ExplicitLeft = 13
      ExplicitTop = 7
      ExplicitWidth = 140
    end
    inherited LabelDebitos: TLabel
      Left = 215
      Top = 7
      ExplicitLeft = 215
      ExplicitTop = 7
    end
    inherited dbgPai: TDBGrid
      Left = 9
      Top = 29
      Width = 198
      Font.Height = -11
      Font.Name = 'Tahoma'
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
    end
    inherited dbgFilho: TDBGrid
      Left = 213
      Top = 29
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
    end
  end
  inline FrameSaldo: TFrameSaldo
    Left = 4
    Top = 375
    Width = 417
    Height = 100
    TabOrder = 3
    ExplicitLeft = 4
    ExplicitTop = 375
    ExplicitWidth = 417
    ExplicitHeight = 100
    inherited LabelTitulo: TLabel
      Width = 417
    end
    inherited LabelTotalGeral: TLabel
      Left = 12
      Top = 60
      Width = 396
      ExplicitLeft = 12
      ExplicitTop = 60
      ExplicitWidth = 396
    end
  end
end
