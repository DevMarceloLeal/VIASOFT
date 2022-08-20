object FrameAgrupamento: TFrameAgrupamento
  Left = 0
  Top = 0
  Width = 442
  Height = 157
  TabOrder = 0
  PixelsPerInch = 96
  object LabelCreditos: TLabel
    Left = 23
    Top = 14
    Width = 135
    Height = 16
    Caption = 'Centro de Custos Pai'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
  object LabelDebitos: TLabel
    Left = 225
    Top = 12
    Width = 149
    Height = 16
    Caption = 'Centro de Custos Filho:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
  object dbgPai: TDBGrid
    Tag = 40
    Left = 16
    Top = 34
    Width = 201
    Height = 118
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    TitleFont.Quality = fqClearTypeNatural
    Columns = <
      item
        Expanded = False
        FieldName = 'CentroCustos'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end>
  end
  object dbgFilho: TDBGrid
    Tag = 41
    Left = 223
    Top = 34
    Width = 202
    Height = 118
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CentroCustos'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end>
  end
end
