object FrameCadastroOperacoes: TFrameCadastroOperacoes
  Left = 0
  Top = 0
  Width = 411
  Height = 71
  TabOrder = 0
  PixelsPerInch = 96
  object lblCentroCustos: TLabel
    Left = 12
    Top = 13
    Width = 94
    Height = 15
    Caption = 'Centro de Custos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    ParentFont = False
  end
  object lblValor: TLabel
    Left = 122
    Top = 13
    Width = 45
    Height = 15
    Caption = 'Valor R$:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    ParentFont = False
  end
  object btnLancar: TBitBtn
    Left = 237
    Top = 26
    Width = 75
    Height = 28
    Cursor = crHandPoint
    Caption = 'Lan'#231'ar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    TabOrder = 2
  end
  object edtValor: TEdit
    Left = 119
    Top = 30
    Width = 95
    Height = 23
    Alignment = taRightJustify
    TabOrder = 1
    StyleElements = [seFont, seClient]
    OnKeyPress = edtValorKeyPress
  end
  object edtCentroCustos: TEdit
    Left = 9
    Top = 30
    Width = 104
    Height = 23
    Alignment = taCenter
    TabOrder = 0
    StyleElements = [seFont, seClient]
    OnKeyPress = edtValorKeyPress
  end
  object btnSair: TBitBtn
    Left = 318
    Top = 26
    Width = 75
    Height = 28
    Cursor = crHandPoint
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    TabOrder = 3
  end
end
