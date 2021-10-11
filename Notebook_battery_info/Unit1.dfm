object Form1: TForm1
  Left = 231
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'APM'
  ClientHeight = 778
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object Label1: TLabel
    Left = 55
    Top = 17
    Width = 92
    Height = 17
    Caption = 'BatteryDevice:'
  end
  object Label29: TLabel
    Left = 69
    Top = 716
    Width = 79
    Height = 17
    Caption = 'Cycle Count:'
  end
  object Label28: TLabel
    Left = 81
    Top = 693
    Width = 66
    Height = 17
    Caption = 'Capacity4:'
  end
  object Label27: TLabel
    Left = 81
    Top = 669
    Width = 66
    Height = 17
    Caption = 'Capacity3:'
  end
  object Label26: TLabel
    Left = 81
    Top = 646
    Width = 66
    Height = 17
    Caption = 'Capacity2:'
  end
  object Label25: TLabel
    Left = 81
    Top = 622
    Width = 66
    Height = 17
    Caption = 'Capacity1:'
  end
  object Label24: TLabel
    Left = 69
    Top = 599
    Width = 82
    Height = 17
    Caption = 'Granularity4:'
  end
  object Label23: TLabel
    Left = 69
    Top = 575
    Width = 82
    Height = 17
    Caption = 'Granularity3:'
  end
  object Label22: TLabel
    Left = 69
    Top = 552
    Width = 82
    Height = 17
    Caption = 'Granularity2:'
  end
  object Label21: TLabel
    Left = 69
    Top = 528
    Width = 82
    Height = 17
    Caption = 'Granularity1:'
  end
  object Label20: TLabel
    Left = 72
    Top = 504
    Width = 77
    Height = 17
    Caption = 'Critical Bias:'
  end
  object Label19: TLabel
    Left = 59
    Top = 481
    Width = 90
    Height = 17
    Caption = 'Default Alert2:'
  end
  object Label18: TLabel
    Left = 59
    Top = 457
    Width = 90
    Height = 17
    Caption = 'Default Alert1:'
  end
  object Label17: TLabel
    Left = 64
    Top = 434
    Width = 86
    Height = 17
    Caption = 'Temperature:'
  end
  object Label16: TLabel
    Left = 30
    Top = 410
    Width = 117
    Height = 17
    Caption = 'Manufacture Date:'
  end
  object Label15: TLabel
    Left = 73
    Top = 387
    Width = 76
    Height = 17
    Caption = 'Capabilities:'
  end
  object Label14: TLabel
    Left = 112
    Top = 363
    Width = 34
    Height = 17
    Caption = 'Rate:'
  end
  object Label13: TLabel
    Left = 26
    Top = 340
    Width = 122
    Height = 17
    Caption = 'Designed Capacity:'
  end
  object Label12: TLabel
    Left = 8
    Top = 316
    Width = 142
    Height = 17
    Caption = 'Full Charged Capacity:'
  end
  object Label11: TLabel
    Left = 89
    Top = 293
    Width = 58
    Height = 17
    Caption = 'Capacity:'
  end
  object Label10: TLabel
    Left = 48
    Top = 269
    Width = 101
    Height = 17
    Caption = 'Estimated Time:'
  end
  object Label8: TLabel
    Left = 95
    Top = 222
    Width = 52
    Height = 17
    Caption = 'Voltage:'
  end
  object Label7: TLabel
    Left = 69
    Top = 198
    Width = 78
    Height = 17
    Caption = 'Technology:'
  end
  object Label6: TLabel
    Left = 83
    Top = 175
    Width = 66
    Height = 17
    Caption = 'Chemistry:'
  end
  object Label5: TLabel
    Left = 66
    Top = 151
    Width = 80
    Height = 17
    Caption = 'Power State:'
  end
  object Label4: TLabel
    Left = 79
    Top = 128
    Width = 66
    Height = 17
    Caption = 'Unique ID:'
  end
  object Label3: TLabel
    Left = 56
    Top = 104
    Width = 94
    Height = 17
    Caption = 'Serial Number:'
  end
  object Label2: TLabel
    Left = 57
    Top = 81
    Width = 88
    Height = 17
    Caption = 'Device Name:'
  end
  object Label9: TLabel
    Left = 23
    Top = 57
    Width = 124
    Height = 17
    Caption = 'Manufacture Name:'
  end
  object Label30: TLabel
    Left = 68
    Top = 246
    Width = 80
    Height = 17
    Caption = 'Life Percent:'
  end
  object ComboBox1: TComboBox
    Left = 161
    Top = 11
    Width = 261
    Height = 25
    Style = csDropDownList
    ItemHeight = 17
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 325
    Top = 746
    Width = 98
    Height = 24
    Caption = 'Refresh'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit29: TEdit
    Left = 161
    Top = 714
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 2
  end
  object Edit28: TEdit
    Left = 161
    Top = 690
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 3
  end
  object Edit27: TEdit
    Left = 161
    Top = 667
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 4
  end
  object Edit26: TEdit
    Left = 161
    Top = 643
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 5
  end
  object Edit25: TEdit
    Left = 161
    Top = 620
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 6
  end
  object Edit24: TEdit
    Left = 161
    Top = 596
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 7
  end
  object Edit23: TEdit
    Left = 161
    Top = 572
    Width = 261
    Height = 23
    AutoSize = False
    TabOrder = 8
  end
  object Edit22: TEdit
    Left = 161
    Top = 549
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 9
  end
  object Edit21: TEdit
    Left = 161
    Top = 525
    Width = 261
    Height = 23
    AutoSize = False
    TabOrder = 10
  end
  object Edit20: TEdit
    Left = 161
    Top = 502
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 11
  end
  object Edit19: TEdit
    Left = 161
    Top = 478
    Width = 261
    Height = 23
    AutoSize = False
    TabOrder = 12
  end
  object Edit18: TEdit
    Left = 161
    Top = 455
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 13
  end
  object Edit17: TEdit
    Left = 161
    Top = 431
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 14
  end
  object Edit16: TEdit
    Left = 161
    Top = 408
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 15
  end
  object Edit15: TEdit
    Left = 161
    Top = 384
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 16
  end
  object Edit14: TEdit
    Left = 161
    Top = 361
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 17
  end
  object Edit13: TEdit
    Left = 161
    Top = 337
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 18
  end
  object Edit12: TEdit
    Left = 161
    Top = 314
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 19
  end
  object Edit11: TEdit
    Left = 161
    Top = 290
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 20
  end
  object Edit10: TEdit
    Left = 161
    Top = 266
    Width = 261
    Height = 23
    AutoSize = False
    TabOrder = 21
  end
  object Edit9: TEdit
    Left = 161
    Top = 243
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 22
  end
  object Edit8: TEdit
    Left = 161
    Top = 219
    Width = 261
    Height = 23
    AutoSize = False
    TabOrder = 23
  end
  object Edit7: TEdit
    Left = 161
    Top = 196
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 24
  end
  object Edit6: TEdit
    Left = 161
    Top = 172
    Width = 261
    Height = 23
    AutoSize = False
    TabOrder = 25
  end
  object Edit5: TEdit
    Left = 161
    Top = 149
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 26
  end
  object Edit4: TEdit
    Left = 161
    Top = 125
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 27
  end
  object Edit3: TEdit
    Left = 161
    Top = 102
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 28
  end
  object Edit2: TEdit
    Left = 161
    Top = 78
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 29
  end
  object Edit1: TEdit
    Left = 161
    Top = 55
    Width = 261
    Height = 22
    AutoSize = False
    TabOrder = 30
  end
  object XPManifest1: TXPManifest
    Left = 5
    Top = 110
  end
end
