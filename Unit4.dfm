object Form4: TForm4
  Left = 469
  Top = 217
  BorderStyle = bsToolWindow
  Caption = 'Mp3 File Info'
  ClientHeight = 234
  ClientWidth = 272
  Color = 7927995
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 32
    Width = 265
    Height = 201
    Caption = 'ID3 Tag informacija'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Naziv          :'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 70
      Height = 13
      Caption = 'Izvodjac         :'
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 53
      Height = 13
      Caption = 'Album       :'
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 64
      Height = 13
      Caption = 'Godina         :'
    end
    object Label5: TLabel
      Left = 8
      Top = 112
      Width = 46
      Height = 13
      Caption = 'Zanr       :'
    end
    object Label6: TLabel
      Left = 8
      Top = 136
      Width = 63
      Height = 13
      Caption = 'Komentar     :'
    end
    object SpeedButton1: TSpeedButton
      Left = 104
      Top = 168
      Width = 57
      Height = 25
      Caption = '&OK'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 16
      Top = 168
      Width = 65
      Height = 22
      Caption = '<< Prethodno '
      Flat = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 184
      Top = 168
      Width = 65
      Height = 22
      Caption = '&Sljedece >>'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object Genre: TEdit
      Left = 72
      Top = 112
      Width = 185
      Height = 21
      Color = 4605514
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object Year: TEdit
      Left = 72
      Top = 88
      Width = 185
      Height = 21
      Color = 4605514
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Album: TEdit
      Left = 72
      Top = 64
      Width = 185
      Height = 21
      Color = 4605514
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object Artist: TEdit
      Left = 72
      Top = 40
      Width = 185
      Height = 21
      Color = 4605514
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object Title: TEdit
      Left = 72
      Top = 16
      Width = 185
      Height = 21
      Color = 4605514
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object Comment: TEdit
      Left = 72
      Top = 136
      Width = 185
      Height = 21
      Color = 4605514
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object Edit7: TEdit
    Left = 4
    Top = 4
    Width = 265
    Height = 21
    Color = 4605514
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
end
