object FrameLog: TFrameLog
  Left = 0
  Top = 0
  Width = 344
  Height = 137
  TabOrder = 0
  PixelsPerInch = 96
  object LabelTitulo: TLabel
    Left = 0
    Top = 0
    Width = 126
    Height = 21
    Align = alTop
    Alignment = taCenter
    Caption = 'Log de Opera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
  object MemoLog: TMemo
    Left = 3
    Top = 26
    Width = 338
    Height = 97
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    StyleElements = [seClient, seBorder]
  end
end
