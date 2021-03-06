
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,ShellApi, Forms,
  Dialogs, StdCtrls, Buttons, MPlayer, ExtCtrls, ComCtrls,MMSystem, jpeg,CommCtrl,Menus;

type
  TForm1 = class(TForm)
    MP: TMediaPlayer;
    OD: TOpenDialog;
    Bar: TProgressBar;
    Timer1: TTimer;
    Next: TSpeedButton;
    Play: TSpeedButton;
    Open: TSpeedButton;
    Prev: TSpeedButton;
    ScrollBar1: TScrollBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    PlayOrder: TComboBox;
    Panel2: TPanel;
    SpeedButton3: TSpeedButton;
    Panel3: TPanel;
    Image1: TImage;
    SpeedButton4: TSpeedButton;
    Timer2: TTimer;
    MainMenu1: TMainMenu;
    TheShortCut: TMenuItem;
    Pos1: TMenuItem;
    Next1: TMenuItem;
    Prev1: TMenuItem;
    Pause1: TMenuItem;
    Open1: TMenuItem;
    Stop1: TMenuItem;
    Play1: TMenuItem;
    Vol1: TMenuItem;
    PosMin1: TMenuItem;
    Volmin1: TMenuItem;
    OpenFolder1: TMenuItem;
    PlayShuffle1: TMenuItem;
    Shuffle1: TMenuItem;
    Repeat1: TMenuItem;
    Continuous1: TMenuItem;
    OnTop1: TMenuItem;
    PlayListShow1: TMenuItem;
    Panel6: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure BarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure PlayClick(Sender: TObject);    
    procedure NextClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure PrevClick(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2Click(Sender: TObject);
    procedure Vol1Click(Sender: TObject);
    procedure Pos1Click(Sender: TObject);
    procedure Volmin1Click(Sender: TObject);
    procedure PosMin1Click(Sender: TObject);
    procedure OpenFolder1Click(Sender: TObject);
    procedure PlayShuffle1Click(Sender: TObject);
    procedure Shuffle1Click(Sender: TObject);
    procedure Repeat1Click(Sender: TObject);
    procedure Continuous1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
  private
    procedure ScrollTitle;
  public
    procedure CreateShortCut;
    procedure MPPlay(PlayMp:Boolean);
    procedure MPOPen;
    procedure MPPrev;
    procedure MPNExt;
    procedure MPShuffle;
    procedure MPRepeat;
  end;

var
  played: string;
  L:integer;
  Min, Max : Integer;
  Form1: TForm1;
  IsScrolled: boolean;
  Mp3Title: string;

implementation
uses unit2,unit4;
{$R *.dfm}

//Napravi shortcut (precicu) koristeci TMainMenu
//Napravi shortcut, vecina precica radi i u form1, i u form2, osim set volume
procedure TForm1.CreateShortCut;
begin
//Shortcut komande
 Prev1.OnClick:=Prev.OnClick;
 Open1.OnClick:=open.OnClick;
 Stop1.OnClick:=speedbutton1.OnClick;
 play1.OnClick:=Play.OnClick;
 Pause1.OnClick:=SpeedButton2.OnClick;
 Next1.OnClick:=Next.OnClick;
 OnTop1.OnClick:=SpeedButton4.OnClick;
 PlayListShow1.OnClick:=SpeedButton3.OnClick;
//Podesi shortcut dugme
 Vol1.ShortCut:=ShortCut(VK_UP,[]);//Pojacaj zvuk
 VolMin1.ShortCut:=Shortcut(VK_DOWN,[]);//Stisaj zvuk
 Pos1.ShortCut:=ShortCut(VK_Right,[]);//Premotaj naprijed za 5 sekundi
 PosMin1.ShortCut:=Shortcut(VK_LEFT,[]);//Premotaj nazad za 5 seconds

 Play1.ShortCut:=ShortCut(Word('X'),[]);
 Pause1.ShortCut:=ShortCut(Word('C'),[]);
 Next1.ShortCut:=ShortCut(Word('B'),[]);
 Prev1.ShortCut:=ShortCut(Word('Z'),[]);
 Stop1.ShortCut:=ShortCut(Word('V'),[]);
 PlayShuffle1.ShortCut:=ShortCut(Word('N'),[]);//Pusti random(nasumican) fajl
 Open1.ShortCut:=ShortCut(Word('O'),[]);
 OpenFolder1.ShortCut:=ShortCut(Word('O'),[ssCtrl]);//Otvori folder

 OnTop1.ShortCut:=ShortCut(Word('T'),[]);//On top (na vrh) prekidac
 PlayListShow1.ShortCut:=ShortCut(Word('L'),[]);

 Continuous1.ShortCut:=ShortCut(Word('C'),[ssShift]);//kontinualan redoslijed sviranja (play order)
 Shuffle1.ShortCut:=ShortCut(Word('S'),[ssShift]);
 Repeat1.ShortCut:=ShortCut(Word('R'),[ssShift]);
end;

//Ova procedura omogucava scroll-ovanje (pomijeranje) naziva u panel1
//Stavila sam ovu proceduru u Timer2
procedure TForm1.ScrollTitle;
var i:integer;
begin
panel1.Caption:=mp3title;
 if length(mp3title)>15 then
  begin
  Application.Title:=Mp3Title;
  Panel1.Caption:=Mp3Title;
   for i:=1 to (Length(Mp3Title)-1) do
    begin
     Mp3Title[i]:=Panel1.Caption[i+1];
     Mp3Title[Length(Mp3Title)]:=Panel1.Caption[1];
    end;
     end else
 if length(mp3title)<=15 then
  begin
   Application.Title:=Mp3Title;
   Panel1.Caption:=Mp3Title;
  end;
end;

//Funkcija koja sluzi da se podesi midi volume radi u *.mid u *.rmi fajlovima
function setmidivolume(volume:DWord):Dword;
var  vol:integer;
MyMidiOutCaps: TMidiOutCaps;
begin
  vol:=(volume)*65537*257;
  if MidiOutGetDevCaps(MIDI_MAPPER,@MyMidiOutCaps,sizeof(MyMidiOutCaps))=MMSYSERR_NOERROR then
//Samo se pobrinite da vas midi device nije error (greska), mozete podesiti midi volume i bez koristenja MidiOutGetDevCaps
   begin
    MidiOutSetVolume(Midi_MAPPER, MakeLong(vol, vol));//Glavni kod da se podesi midi volume
   end;
end;

//Funkcija da se dobije wave volume
function getwavevolume:byte;
var
  Volume: DWord;
  MyWaveOutCaps: TWaveOutCaps;
  vol:real;
  s:string;
begin
  if WaveOutGetDevCaps(WAVE_MAPPER,@MyWaveOutCaps,sizeof(MyWaveOutCaps))=MMSYSERR_NOERROR then
//Takodje, samo se pobrinite da vas wave device nije error, mozete dobiti wave volume bez upotrebe WaveOutGetDevCaps
   begin
    WaveOutGetVolume(WAVE_MAPPER, @Volume);//Glavni kod da se dobije wave volume
    vol:=(Volume div 65537 div 257);
    s:=floattostr(int(vol));
    getwavevolume:=strtoint(s);
   end;
end;

//Funkcija da se podesi wave volume
function setwavevolume(volume:DWord):Dword;
var  vol:integer;
MyWaveOutCaps: TWaveOutCaps;
begin
 vol:=(volume)*65537*257;
  if WaveOutGetDevCaps(WAVE_MAPPER,@MyWaveOutCaps,sizeof(MyWaveOutCaps))=MMSYSERR_NOERROR then
//Samo se pobrinite da vas wave device nije error, mozete dobiti wave volume bez upotrebe WaveOutGetDevCaps
   begin
    WaveOutSetVolume(WAVE_MAPPER, MakeLong(vol, vol));//Main code to set wave volume
   end;
end;

//Ponavljajte play order (redoslijed sviranja)
procedure TForm1.MPRepeat;
begin
 if form2.ListA.Count<>0 then
  begin
   MPPlay(true);
  end;
end;

//Shuffle/random (naizmjenicni) play order
procedure TForm1.MPShuffle;
begin
if form2.ListA.Count<>0 then
 begin
  randomize;
  form2.ListA.ItemIndex:=random(form2.ListA.Count-1);
  form2.ListB.ItemIndex:=form2.ListA.ItemIndex;
  MPPlay(true);
 end;
end;

//Idite na sljedeci item (stavku)
procedure TForm1.MPNext;
begin
if (form2.ListA.Count<>0) and (form2.ListA.ItemIndex<>-1) then
 begin
  if form2.ListA.ItemIndex=form2.ListA.Count-1 then
   begin
    form2.ListA.ItemIndex:=0;
     end else
    if form2.ListA.ItemIndex<>form2.ListA.Count-1 then
   begin
    form2.ListA.ItemIndex:=form2.ListA.ItemIndex+1;
   end;
 form2.ListB.ItemIndex:=form2.ListA.ItemIndex;
end else
 if form2.ListA.ItemIndex=-1 then
  begin
   form2.ListA.ItemIndex:=0;
   form2.ListB.ItemIndex:=form2.ListA.ItemIndex;
  end;
end;

//Idite na prosli item
procedure TForm1.MPPrev;
begin
if form2.ListA.Count<>0 then
 begin
  if form2.ListA.ItemIndex=0 then
   begin
    form2.ListA.ItemIndex:=form2.ListA.Count-1;
     end else
    if form2.ListA.ItemIndex<>0 then
   begin
    form2.ListA.ItemIndex:=form2.ListA.ItemIndex-1;
  end;
 form2.ListB.ItemIndex:=form2.ListA.ItemIndex;
end;
 if form2.ListA.ItemIndex=-1 then
  begin
   form2.ListA.ItemIndex:=0;
   form2.ListB.ItemIndex:=form2.ListA.ItemIndex;
  end;
end;

//Otvori file(s) i onda ih stavi u Form2.ListA i Form2.ListB
procedure TForm1.MPOPen;
var i:integer;
begin
//Mozete dodati i druge tipove fajlove u zavisnosti od vaseg Windows Media Player-a
//Fajlovi koje je moguce pustiti zavise od vase Windows Media Player verzije and dostupnog codec-a u vasem PC-u.
od.Filter:='All supported files|*.mp3;*.wav;*.mid;*.rmi;*.avi;*.mpg;*.mpeg;*.wma|Audio module files (*.mp3;*.wav;*.wma)|*.mp3;*.wav;*.wma|Midi module files (*.mid;*.rmi)|*.mid;*.rmi|Video files (*.avi;*.mpg;*.mpeg)|*.avi;*.mpg;*.mpeg|All files (*.*)|*.*';
 if od.Execute then
  begin
    form2.ListA.Items.AddStrings(od.Files);
    for i:=0 to od.Files.Count-1 do
     begin
      form2.ListB.Items.add(extractfilename(od.Files[i]));
       end;
    if form2.ListA.ItemIndex=-1 then
     begin
      form2.ListA.ItemIndex:=0;
      form2.ListB.ItemIndex:=form2.ListA.ItemIndex;
       end;
     end;
 form2.Caption:='Play Lista: '+inttostr(form2.ListB.Count)+' stavke';
end;

//Play then groovy the file
procedure TForm1.MPPlay(PlayMp:Boolean);
begin
 if form2.ListA.Count<>0 then
  begin
   if PlayMP then
    begin
     try
      MP.FileName:=form2.ListA.Items[form2.ListA.ItemIndex];
      form2.ListA.Selected[form2.ListA.ItemIndex]:=true;
      MP.Open;
      MP.Play;
      timer1.Enabled:=true;
(*---------------------------------------*)
//Podesi scrolled title (naziv) u panel1
      if length(extractfilename(mp.FileName))>15 then
       begin
        Mp3Title:=extractfilename(mp.FileName)+' *** ';
        timer2.Enabled:=true;
         end else
      if length(extractfilename(mp.FileName))<=15 then
       begin
        Mp3Title:=extractfilename(mp.FileName);
        timer2.Enabled:=true;
       end;
(*---------------------------------------*)
      except
       //Ako se pronadje file koji je nemoguce reprodukovati onda...
       timer1.Enabled:=false;
       timer2.Enabled:=false;
       Form2.DelBadFile; //Automatski skeniraj i onda obrisi lose fajlove
       MPNext;
       MPPLay(true);
       timer1.Enabled:=true;
       panel1.Caption:=mp.FileName;
       mp3title:=extractfilename(mp.FileName)+' *** ';
       timer2.Enabled:=true;
      end;
    end;
 end else
 if form2.ListA.ItemIndex=-1 then
  begin
   exit;
  end;
end;

//Timer1 koristi da podesis seeking bar (linija koja prikazuje progres pjesme)
procedure TForm1.Timer1Timer(Sender: TObject);
var r:real;
begin
try
 form2.TimesCounter;//TimesCounter (brojac vremena) funkacija unit2
 bar.Max:=mp.Length;//Podesi seeking bar na max
 bar.Position:=mp.Position;//Podesi poziciju seeking bar-a
 r:=int(bar.Position/bar.Max*100);
 panel6.caption:=floattostr(r)+'%';//Prikazi procentualno vrijeme reprodukovanog fajla
except
//Ako se pronadje fajl koji je nemoguce reprodukovati ili los file onda...
  form2.index;//Vidi unit2 za index procedure
  form2.del;//Vidi unit2 za del procedure
  MPPlay(true);//Pokusaj reprodukovati drugi fajl...
 end;
(*---------------------------------------*)
//Podesi play order
 if bar.Position=mp.Length then
  begin
   timer1.Enabled:=false;
   timer2.Enabled:=false;
   bar.Position:=0;
   Panel1.Caption:='==> Vladana Player <==';
   MP.Close;
  case playorder.ItemIndex of
  -1: begin MPnext;
            MPPlay(true); end;
   0: begin MPnext;
            MPPlay(true); end;
   1: MPShuffle;
   2: MPRepeat;
  end;
 end;
end;

//Otidji na time position (odredjenu tacku na seeking bar-u) kada kliknes na seeking bar
procedure TForm1.BarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var f: string;
begin
try
 if Button = mbLeft then//lijevi gumb misa
  begin
   f := floattostr(int(((mp.length / (Form1.Width-bar.Left-50) * x))));//Izracunava novu poziciju...
   Bar.Position := strtoint(f);//...mediaplayer-a na temelju pozicije progressbar-a
   mp.Position := strtoint(f);
    if panel1.Caption<>'Pauzirati' then
     mp.Play;
     Timer1.Enabled := true;
  end;
except
 exit;
end;
end;

//Napravi shourcuts (precice) koristeci TMainMenu
procedure TForm1.FormCreate(Sender: TObject);
var i:integer; f:real;
begin
 CreateShortCut;//Napravi shortcut
 application.Title:=panel1.Caption;
(*---------------------------------------*)
 IsScrolled:=false;//...ukazuje na scroll title
 bar.Brush.Color :=$0046464A;//Podesi boju pozadine seeking bar-a
 SendMessage(Bar.Handle, PBM_SETBARCOLOR, 0, clred);//Podesi boju seeking bar-a
 (*---------------------------------------*)
//Popuni playorder combobox items
 playorder.Items.Add('Con');
 playorder.Items.Add('Shu');
 playorder.Items.Add('Rep');
 playorder.AutoDropDown:=true;
 playorder.ItemIndex:=0;
(*---------------------------------------*)
//Podesi poziciju kontrole jacine zvuka (volume control)
 i:=getwavevolume;
 scrollbar1.Position:=i;
 f:=int(i/scrollbar1.Max*100);
 panel3.Caption:=floattostr(f)+'%';
(*---------------------------------------*)
//Podesi izgled hint-a (nagovjestaja)
 application.HintColor:=$0046464A;
 screen.HintFont.Color:=cllime;
 application.HintHidePause:=2000;
end;

procedure TForm1.NextClick(Sender: TObject);
begin
  MPNext;//Idi na sljedeci item (stavku) i onda je reprodukuj
  mpplay(true);
end;

procedure TForm1.PlayClick(Sender: TObject);
begin
 if panel1.Caption='Pauzirano' then //reprodukuj trenutku MP poziciju kada je Mp pauziran
  begin
   timer2.Enabled:=true;
   mp.Position:=bar.Position;
   mp.Play;
  end else
 if form2.ListB.ItemIndex=-1 then //da bi se izbjegla greska (error) ako nista nije selectovano(oznaceno) "List out bound (-0)"
  begin
   form2.ListB.ItemIndex:=0;
   form2.ListA.ItemIndex:=form2.ListB.ItemIndex;
   MPplay(true);
  end else
   begin
    MPplay(true);
   end;
///////
 if (form2.ListA.Count=0) and (timer1.Enabled=false) then
  begin
   MPOpen;
  end;
end;

procedure TForm1.OpenClick(Sender: TObject);
begin
  MPopen;//Otvori fajlove
  form2.addNumber;
   form2.Caption:='Play Lista: '+inttostr(form2.ListB.Count)+' stavke';
end;

procedure TForm1.PrevClick(Sender: TObject);
begin
  MPprev;//Idi na sljedecu stavku i onda je reprodukuj
  mpplay(true);
end;

//Podesi wave i midi jacinu zvuka (volume) koristeci scroll bar
procedure TForm1.ScrollBar1Change(Sender: TObject);
var f:real;
begin
 setwavevolume(scrollbar1.Position);
 setmidivolume(scrollbar1.Position);
 f:=int(scrollbar1.Position/scrollbar1.Max*100);
 panel3.Caption:=floattostr(f)+'%';
end;

//Prestani sa reprodukcijom
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if (timer1.Enabled) then
 begin
  mp.Stop;
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  panel1.Caption:='=> Vladana Player <=';
  application.Title:=form1.Caption;
  bar.Position:=0;
  panel2.Caption:='- - : - -';
  form2.Panel1.Caption:='- - : - -'
end;
end;

//Pauza
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 if (timer1.Enabled) and (timer2.Enabled) then
  begin
   mp.Pause;
   timer2.Enabled:=false;
   panel1.Caption:='Pauzirano';
  end else
 if panel1.Caption='Pauzirano' then
  begin
   timer2.Enabled:=true;
   mp.Position:=bar.Position;
   mp.Play;
  end;
end;

//Prekidac show/hide play list
procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 if speedbutton3.Font.Style=[fsstrikeout] then
  begin
   speedbutton3.Font.Style:=[];
   form2.Show;
    end else
 if speedbutton3.Font.Style=[] then
  begin
   speedbutton3.Font.Style:=[fsstrikeout];
   form2.Close;
    end;
end;

//Seeking bar hint
procedure TForm1.BarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var r:real;
begin
 r:=int(bar.Position/bar.Max*100);
 bar.Hint:='Korak: '+floattostr(r)+'%';//Prikazi time percentage (vrijeme u procentu) reprodukovanog fajla
 bar.ShowHint:=true;
end;

//Prekidac on top
procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
 if speedbutton4.Font.Style=[fsstrikeout] then
  begin
   speedbutton4.Font.Style:=[];
   SetWindowPos(form1.Handle, HWND_TOPMOST, 0,0,0,0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end else
 if speedbutton4.Font.Style=[] then
  begin

   speedbutton4.Font.Style:=[fsstrikeout];
   SetWindowPos(form1.Handle, HWND_NOTOPMOST,0,0,0,0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
    end;
end;

//Scroll title u panel1
procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Scrolltitle;
end;

//Otvori Windows volume control (kontrolu jacine zvuka)
procedure TForm1.Panel3Click(Sender: TObject);
var
  MyWin: array[0..255] of Char;
const
  Size: Integer = MAX_PATH;
begin
 GetWindowsDirectory(MyWin, Size);
 ShellExecute(Form1.Handle,'otvori','sndvol32.exe',nil,MyWin,SW_SHOWNORMAL);
end;

//Panel1 hint
procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 panel1.Hint:=mp.FileName;
end;

//Podesi tip tajmera u panel2
procedure TForm1.Panel2Click(Sender: TObject);
begin
 if (form2.times = 'odbrojavanje') or (form2.times= '') then  //prikazuje koliko je vremena proslo od pocetka pjesme (odbrojavanje)
 begin
  form2.times:='proslo vrijeme';
   end else
    form2.times:='odbrojavanje';
end;

//MainMenu1 items upotreba komande za shortcut
procedure TForm1.Vol1Click(Sender: TObject);
begin
  Scrollbar1.Position:=Scrollbar1.Position+2;
end;

procedure TForm1.Pos1Click(Sender: TObject);
begin
if timer1.Enabled then
 begin
  mp.Position:=mp.Position+5000;
  mp.Play;
 end;
end;

procedure TForm1.VolMin1Click(Sender: TObject);
begin
  Scrollbar1.Position:=Scrollbar1.Position-2;
end;

procedure TForm1.PosMin1Click(Sender: TObject);
begin
if timer1.Enabled then
 begin
 mp.Position:=mp.Position-5000;
 mp.Play;
 end;
end;

procedure TForm1.OpenFolder1Click(Sender: TObject);
begin
 Form2.AddFolder1Click(Form2);
end;

procedure TForm1.PlayShuffle1Click(Sender: TObject);
begin
 MPShuffle;
end;

procedure TForm1.Shuffle1Click(Sender: TObject);
begin
 PlayOrder.ItemIndex:=1;
end;

procedure TForm1.Repeat1Click(Sender: TObject);
begin
 PlayOrder.ItemIndex:=2;
end;

procedure TForm1.Continuous1Click(Sender: TObject);
begin
  PlayOrder.ItemIndex:=0;
end;

//Desava se kada se izadje iz aplikacije
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 mainmenu1.Free; //free mainmenu1 nakon sto je kopiran u form2.mainmenu1
 timer1.Enabled:=false; //zaustavi tajmer da se izbjegne greska
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 timer1.Destroying; //unisti timer1
end;
//Prvo instaliraj fbvumeter komponentu!!!
//Da je omogucis, idi u volume control ==> recording control then select output port

procedure TForm1.Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 panel3.Hint:='Jacina zvuka'+#10#13+'Klikni da otvoris vol. control';
end;

procedure TForm1.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if form2.times='proslo' then begin
    panel2.Hint:='Preostalo vrijeme';
   end else
   begin
    panel2.Hint:='Proslo vrijeme';
    end;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
 MP.Frames:=11025;
end;

end.
