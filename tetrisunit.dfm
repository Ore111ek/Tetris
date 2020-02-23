object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Tetris'
  ClientHeight = 730
  ClientWidth = 514
  Color = 8421631
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 16
    Top = 16
    Width = 480
    Height = 760
  end
  object Label1: TLabel
    Left = 381
    Top = 24
    Width = 73
    Height = 20
    Caption = #1057#1095#1105#1090': 000'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 110
    Top = 249
    Width = 292
    Height = 33
    Caption = 'W - '#1087#1086#1074#1086#1088#1086#1090' '#1090#1077#1090#1088#1072#1084#1080#1085#1086
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 92
    Top = 298
    Width = 328
    Height = 33
    Caption = 'A - '#1089#1076#1074#1080#1075' '#1090#1077#1090#1088#1072#1084#1080#1085#1086' '#1074#1083#1077#1074#1086
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 83
    Top = 347
    Width = 346
    Height = 33
    Caption = 'D - '#1089#1076#1074#1080#1075' '#1090#1077#1090#1088#1072#1084#1080#1085#1086' '#1074#1087#1088#1072#1074#1086
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 110
    Top = 396
    Width = 292
    Height = 33
    Caption = 'S - '#1091#1089#1082#1086#1088#1077#1085#1085#1086#1077' '#1087#1072#1076#1077#1085#1080#1077
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Button1: TButton
    Left = 18
    Top = 680
    Width = 75
    Height = 25
    Caption = #1053#1086#1074#1072#1103' '#1080#1075#1088#1072
    TabOrder = 0
    OnClick = Button1Click
    OnKeyDown = Button1KeyDown
  end
  object Button2: TButton
    Left = 116
    Top = 680
    Width = 75
    Height = 25
    Caption = #1055#1072#1091#1079#1072
    TabOrder = 1
    OnClick = Button2Click
    OnKeyDown = Button2KeyDown
  end
  object Button3: TButton
    Left = 420
    Top = 680
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = Button3Click
    OnKeyDown = Button3KeyDown
  end
  object Button4: TButton
    Left = 218
    Top = 680
    Width = 76
    Height = 25
    Caption = #1057#1076#1072#1090#1100#1089#1103
    TabOrder = 3
    OnClick = Button4Click
    OnKeyDown = Button4KeyDown
  end
  object Button5: TButton
    Left = 321
    Top = 680
    Width = 75
    Height = 25
    Caption = #1057#1083#1086#1078#1085#1086#1089#1090#1100
    TabOrder = 4
    OnClick = Button5Click
    OnKeyDown = Button5KeyDown
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 40
    OnTimer = Timer1Timer
    Left = 488
    Top = 704
  end
end
