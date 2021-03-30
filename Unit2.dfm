object Form2: TForm2
  Left = 382
  Top = 248
  Width = 321
  Height = 423
  HorzScrollBar.Visible = False
  Anchors = []
  Caption = 'Play List'
  Color = 7927995
  Constraints.MinHeight = 137
  Constraints.MinWidth = 267
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  DesignSize = (
    305
    385)
  PixelsPerInch = 96
  TextHeight = 13
  object Add: TSpeedButton
    Left = 0
    Top = 363
    Width = 33
    Height = 25
    Hint = 'Add item'
    Anchors = [akLeft, akBottom]
    Caption = '&Dodaj'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu4
    ShowHint = True
    OnClick = AddClick
  end
  object List: TSpeedButton
    Left = 120
    Top = 361
    Width = 41
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Lista'
    Flat = True
    PopupMenu = PopupMenu1
    OnClick = ListClick
  end
  object Rem: TSpeedButton
    Left = 32
    Top = 363
    Width = 41
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Ponisti'
    Flat = True
    Layout = blGlyphBottom
    PopupMenu = PopupMenu2
    OnClick = RemClick
  end
  object SpeedButton1: TSpeedButton
    Left = 72
    Top = 363
    Width = 49
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Oznaci'
    Flat = True
    PopupMenu = PopupMenu3
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 160
    Top = 361
    Width = 49
    Height = 24
    Hint = 'Help'
    Anchors = [akLeft, akBottom]
    Caption = '&Pomoc'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu7
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object lirik: TMemo
    Left = 4
    Top = 4
    Width = 306
    Height = 357
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvLowered
    BorderStyle = bsNone
    Color = 4605514
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu6
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
    OnDblClick = lirikDblClick
  end
  object Memo1: TMemo
    Left = 4
    Top = 4
    Width = 306
    Height = 357
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 4605514
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAqua
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+'
      '=====> MP3 Player - Vladana Perlic <====='
      '+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+'
      ''
      'Ovaj mp3 je jednostavni muzicki player koji'
      'reprodukuje razne tipove formata windows audio i '
      'video fajlova. Sa ovim mp3 playerom mozete '
      'reprodukovati sve sto Windows Media Player moze '
      'reprodukovati osim play list fajlova i fajlova '
      'koji nisu audio video fajlovi.'
      '********Karakteristike ovog mp3 playera*********'
      '1. Reprodukuj i kontrolisi mnogo fajlova audio i '
      '   video formata'
      '2. Prikazi ID3 tag informacije'
      '3. Mozete napisati lyric file i prikazati ga u '
      '   lyric window-u (prozoru) ovog mp3 playera'
      '4. Otidjite na folder fajla direktno sa mp3 playera'
      '5. Sacuvajte i ucitajte vas (*.plf) playlist file'
      '6. Skeniraj i automatski ukloni fajlove koje je '
      '   nemoguce reprodukovati'
      '7. Drag (vuci) & drop (ispusti) files/folder u '
      '   playlist window'
      '8. Jos mnogo toga, samo isprobajte!!!'
      ''
      '****** Main Window Keyboard Shortcuts *******'
      ''
      'Key'#9#9'Akcija'
      
        '----------------------------------------------------------------' +
        '-------------'
      '(Opcije/Prekidaci)'
      'Ctrl+C                     Prekidac Continuous'
      'Ctrl+R                     Prekidac Repeat (ponavljanje)'
      'Ctrl+S'#9'               prekidac Shuffle (naizmjenicno)'
      'L                              Prikazi/Sakrij Play Listu'
      'T                             Prekidac On Top'
      ''
      '(Playback Kontrole)'
      'Z'#9#9'Prethodna numera'
      'X'#9#9'Play/Restart/Unpause'
      'C'#9#9'Pauzirati/Prekinuti pauzu'
      'V'#9#9'Stop'
      'B'#9#9'Sljedeca numera'
      'N                             Nasumicna numera'
      'O'#9#9'Otvori fajl'
      'Ctrl+O'#9#9'Otvori folder'
      ''
      ''
      'Left Arrow'#9'Premotaj unazad 7 sekundi'
      'Right Arrow'#9'Premotaj naprijed 7 sekundi'
      'Up Arrow'#9'                Pojacaj zvuk'
      'Down Arrow'#9'Smanji zvuk'
      ''
      '****** Play ListWindow Keyboard Shortcuts *******'
      ''
      'Key'#9#9'Akcija'
      
        '----------------------------------------------------------------' +
        '-------------'
      '(Opcije/Prekidaci)'
      'Isto kao main window shortcut, plus:'
      'G                             Idi na file''s Folder'
      'I                               Vidi File Info'
      ''
      '(Playback kontrole)'
      'Isto kao main window shortcut, osim:'
      'Gornja stelica+Ctrl'#9'Pojacaj zvuk'
      'Donja strelica+Ctrl'#9'Smanji zvuk'
      ''
      '***********Cesto postavljana pitanja***************'
      ''
      'Kakve fajlove ovaj player moze da reprodukuje? '
      'To zavisi od vase verzije Windows Media Player '
      'i dostupnog codec-a u vasem PC-u.'
      ''
      'Kako upravljati ovim playerom?'
      'Isto kao i sa WinAmp-om. Mislim da svako zna '
      'upravljati WinAmp-om pa tako i ovim playerom.'
      ''
      'Ako budete imali ikakav problem sa reprodukovanjem'
      'muzickog ili video fajla pokusajte instalirati '
      'najnoviji Windows Media Player(version 7 i iznad '
      'je preporuceno) ili intalirati  '
      'najnoviji video i audio codec i decodec.'
      ''
      ''
      '***********************************************')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
    OnDblClick = Memo1DblClick
  end
  object ListA: TListBox
    Left = 8
    Top = 176
    Width = 169
    Height = 121
    ItemHeight = 13
    TabOrder = 0
    Visible = False
    OnDblClick = ListADblClick
  end
  object ListB: TListBox
    Left = 4
    Top = 4
    Width = 306
    Height = 358
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvLowered
    Color = 4605514
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4454713
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Pitch = fpFixed
    Font.Style = []
    ItemHeight = 13
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = PopupMenu5
    TabOrder = 1
    OnClick = ListBClick
    OnDblClick = ListBDblClick
    OnKeyDown = ListBKeyDown
    OnKeyUp = ListBKeyUp
    OnMouseDown = ListBMouseDown
    OnMouseUp = ListBMouseUp
  end
  object Panel1: TPanel
    Left = 208
    Top = 360
    Width = 81
    Height = 25
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BiDiMode = bdLeftToRight
    Caption = '- - : - -'
    Color = 4605514
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Modern'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    OnClick = Panel1Click
  end
  object GroupBox1: TGroupBox
    Left = 50
    Top = 26
    Width = 193
    Height = 81
    Anchors = []
    Caption = 'Skeniranje losih fajlova'
    Color = 4605514
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    Visible = False
    DesignSize = (
      193
      81)
    object Label1: TLabel
      Left = 5
      Top = 12
      Width = 16
      Height = 13
      Anchors = []
      Caption = 'Fajl'
    end
    object Label2: TLabel
      Left = 90
      Top = 25
      Width = 14
      Height = 13
      Anchors = []
      Caption = '0%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 56
      Top = 56
      Width = 83
      Height = 17
      Anchors = [akLeft, akRight]
      Caption = '&Stop'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 40
      Width = 158
      Height = 9
      Smooth = True
      TabOrder = 1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 104
    Top = 256
    object Newlist1: TMenuItem
      Caption = 'Nova lista'
      OnClick = Newlist1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Savelist1: TMenuItem
      Caption = 'Sacuvaj listu'
      OnClick = Savelist1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Shufflelist1: TMenuItem
      Caption = 'Naizmjenicna lista'
      OnClick = Shufflelist1Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object LoadList1: TMenuItem
      Caption = 'Ucitaj listu'
      OnClick = LoadList1Click
    end
    object Addtolist1: TMenuItem
      Caption = 'Dodaj na listu'
      OnClick = Addtolist1Click
    end
  end
  object SD: TSaveDialog
    Filter = 'Reprodukuj list file (*.plf)|*.plf'
    Left = 184
    Top = 216
  end
  object PopupMenu2: TPopupMenu
    Left = 40
    Top = 256
    object Clearplaylist1: TMenuItem
      Caption = 'Isprazni Play listu'
      OnClick = Clearplaylist1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object ClearBadFiles1: TMenuItem
      Caption = 'Ukloni lose fajlove'
      OnClick = ClearBadFiles1Click
    end
    object Crop1: TMenuItem
      Caption = 'Ukloni neoznacene'
      OnClick = Crop1Click
    end
    object Clearselected1: TMenuItem
      Caption = 'Ukloni oznacene'
      OnClick = Clearselected1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 72
    Top = 256
    object DeselectAll2: TMenuItem
      Caption = 'Ukloni oznaku sa svih'
      OnClick = DeselectAll2Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object InvertSelection1: TMenuItem
      Caption = 'Invertuj selekciju'
      OnClick = InvertSelection1Click
    end
    object SelectAll1: TMenuItem
      Caption = 'Odaberi sve'
      OnClick = SelectAll1Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 8
    Top = 256
    object AddFolder1: TMenuItem
      Caption = 'Dodaj folder'
      OnClick = AddFolder1Click
    end
    object IncludeSubfolder1: TMenuItem
      Caption = 'Ukljuci podfolder'
      Checked = True
      OnClick = IncludeSubfolder1Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object AddFiles1: TMenuItem
      Caption = 'Dodaj fajl(ove)'
      OnClick = AddFiles1Click
    end
  end
  object PopupMenu5: TPopupMenu
    Left = 152
    Top = 216
    object Gotofile1: TMenuItem
      Caption = 'Go to file''s folder'
      ShortCut = 71
      OnClick = Gotofile1Click
    end
    object Viewfileinfo1: TMenuItem
      Caption = 'Vidi file info'
      ShortCut = 73
      OnClick = Viewfileinfo1Click
    end
    object Lyric1: TMenuItem
      Caption = 'Lyric'
      ShortCut = 16460
      OnClick = Lyric1Click
    end
    object Refresh1: TMenuItem
      Caption = 'Osvjezi'
      ShortCut = 16466
      OnClick = Refresh1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 216
    object Form2ShortCut1: TMenuItem
      Caption = 'Form2ShortCut'
      Visible = False
      object Next1: TMenuItem
        Caption = 'Next'
        OnClick = Next1Click
      end
      object Prev1: TMenuItem
        Caption = 'Prev'
        OnClick = Prev1Click
      end
      object Volplus1: TMenuItem
        Caption = 'Volplus'
        OnClick = Volplus1Click
      end
      object volmin1: TMenuItem
        Caption = 'volmin'
        OnClick = volmin1Click
      end
    end
  end
  object PopupMenu6: TPopupMenu
    Left = 216
    Top = 216
    object Reload1: TMenuItem
      Caption = 'Reload'
      OnClick = Reload1Click
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
    object Edit1: TMenuItem
      Caption = 'Edit/Create'
      OnClick = Edit1Click
    end
    object Help1: TMenuItem
      Caption = 'Pomoc'
      OnClick = Help1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Closelyricwindow1: TMenuItem
      Caption = 'Zatvori'
      OnClick = Closelyricwindow1Click
    end
  end
  object PopupMenu7: TPopupMenu
    Left = 152
    Top = 256
    object Help2: TMenuItem
      Caption = 'O mom mp3 programu'
      OnClick = Help2Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object About1: TMenuItem
      Caption = 'Informacije o meni!'
      OnClick = About1Click
    end
  end
end
