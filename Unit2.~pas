//
{ Unit2 je Play List unit
{Play lista se sastoji od 2 ListBox-a
ListA : prikazi fajl sa potpunom putanjom, ListB : samo prikazi ime fajla bez putanje sa numeracijom
}


unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, ExtCtrls,ShellApi, FileCtrl, MPlayer,
  ComCtrls, CommCtrl;

type
  TForm2 = class(TForm)
    ListA: TListBox;
    ListB: TListBox;
    Rem: TSpeedButton;
    List: TSpeedButton;
    PopupMenu1: TPopupMenu;
    LoadList1: TMenuItem;
    Addtolist1: TMenuItem;
    SpeedButton1: TSpeedButton;
    Savelist1: TMenuItem;
    SD: TSaveDialog;
    Newlist1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Clearplaylist1: TMenuItem;
    Clearselected1: TMenuItem;
    Crop1: TMenuItem;
    PopupMenu3: TPopupMenu;
    SelectAll1: TMenuItem;
    InvertSelection1: TMenuItem;
    DeselectAll2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Add: TSpeedButton;
    PopupMenu4: TPopupMenu;
    AddFolder1: TMenuItem;
    AddFiles1: TMenuItem;
    Panel1: TPanel;
    PopupMenu5: TPopupMenu;
    Gotofile1: TMenuItem;
    Memo1: TMemo;
    Viewfileinfo1: TMenuItem;
    ClearBadFiles1: TMenuItem;
    MainMenu1: TMainMenu;
    Form2ShortCut1: TMenuItem;
    Next1: TMenuItem;
    Prev1: TMenuItem;
    Volplus1: TMenuItem;
    volmin1: TMenuItem;
    Refresh1: TMenuItem;
    Lyric1: TMenuItem;
    lirik: TMemo;
    PopupMenu6: TPopupMenu;
    Closelyricwindow1: TMenuItem;
    Reload1: TMenuItem;
    Copy1: TMenuItem;
    Help1: TMenuItem;
    N5: TMenuItem;
    Edit1: TMenuItem;
    IncludeSubfolder1: TMenuItem;
    N6: TMenuItem;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu7: TPopupMenu;
    Help2: TMenuItem;
    N7: TMenuItem;
    About1: TMenuItem;
    ProgressBar1: TProgressBar;
    Shufflelist1: TMenuItem;
    N8: TMenuItem;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure ListADblClick(Sender: TObject);
    procedure ListBDblClick(Sender: TObject);
    procedure ListBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoadList1Click(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure Addtolist1Click(Sender: TObject);
    procedure Savelist1Click(Sender: TObject);
    procedure Newlist1Click(Sender: TObject);
    procedure Clearplaylist1Click(Sender: TObject);
    procedure Clearselected1Click(Sender: TObject);
    procedure Crop1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure InvertSelection1Click(Sender: TObject);
    procedure DeselectAll2Click(Sender: TObject);
    procedure RemClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AddFolder1Click(Sender: TObject);
    procedure AddFiles1Click(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure ListBMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Gotofile1Click(Sender: TObject);
    procedure Viewfileinfo1Click(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure ClearBadFiles1Click(Sender: TObject);
    procedure Next1Click(Sender: TObject);
    procedure Prev1Click(Sender: TObject);
    procedure ListBClick(Sender: TObject);
    procedure Volplus1Click(Sender: TObject);
    procedure volmin1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Lyric1Click(Sender: TObject);
    procedure lirikDblClick(Sender: TObject);
    procedure Closelyricwindow1Click(Sender: TObject);
    procedure Reload1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure IncludeSubfolder1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Shufflelist1Click(Sender: TObject);
  private
    procedure DragHandler (var Msg : TMessage); message WM_DROPFILES;
  public
    MyMenu: TMenuItem;
    sel,topint: integer;
    MultiSel: string;
    listindex: string;
    Times: string;
    procedure index;
    procedure del;
    procedure DelSel;
    procedure InvertSelection;
    procedure AddList;
    procedure TimesCounter;
    procedure LirikLoad(filename:string);
    procedure addNumber;
    procedure DelBadFile;
  end;

var
  Form2: TForm2;
  DroppedFile : Array[0..MAX_PATH * 2] of Char;
  TotalDroppedFiles, Counter : Cardinal;
  FindFile1 : _WIN32_FIND_DATAA;
  FindHandle : Cardinal;
  IsLooping : Boolean;
  FinalName : PChar;
  ListBoxHandle : HWND;
  TempList:TListBox;
  Cancel: boolean;

implementation
uses unit1,unit4,unit3;
{$R *.dfm}
//Skeniraj, a zatim obrisi lose fajlove
procedure TForm2.DelBadFile;
var i,pos:integer; MP1:TMediaPlayer;
begin
 sendmessage(progressbar1.Handle,PBM_SETBARCOLOR,0,clAqua);
 cancel:=false;
 MP1:=TMediaPlayer.Create(self);
 MP1.Parent:=self;
 MP1.SendToBack;
 MP1.Visible:=false;
 groupbox1.Visible:=true;
 if listb.Count>0 then
  for i:=lista.Count-1 downto 0 do
  begin
   Label1.Caption:=extractfilename(lista.Items[i]);
   label2.Caption:=floattostr(100-int(i/lista.Count*100))+'%';
   progressbar1.Position:=strtoint(floattostr(100-int(i/lista.Count*100)));
   application.ProcessMessages;
   if cancel=true then
   break;
    try
     if lista.Items[i]<>Form1.MP.FileName then  //nije potrebno skenirati fajl koji se trenutno reproducira
     begin
        MP1.FileName:=lista.Items[i];
        MP1.Open;
      end else
     if lista.Items[i]=Form1.MP.FileName then
       begin
        pos:=Form1.MP.Position;
        Form1.MP.Open;
        Form1.MP.Position:=pos;
        Form1.MP.Play;
       end;
     except
      Lista.Items.Delete(i);
      Listb.Items.Delete(i);
     end;
   end;
  MP1.Free;
  groupbox1.Visible:=false;
end;

procedure FileFilter(TheList:TListBox);
var j:integer;
begin
 TheList.MultiSelect:=true;
       for j:=0 to TheList.Count-1 do
        begin
        if (lowercase(extractfileext(TheList.Items[j]))<>'.mp3')
         and (lowercase(extractfileext(TheList.Items[j]))<>'.avi')
         and (lowercase(extractfileext(TheList.Items[j]))<>'.mpg')
         and (lowercase(extractfileext(TheList.Items[j]))<>'.mid')
         and (lowercase(extractfileext(TheList.Items[j]))<>'.rmi')
         and (lowercase(extractfileext(TheList.Items[j]))<>'.wav')
         and (lowercase(extractfileext(TheList.Items[j]))<>'.wma')
         and (lowercase(extractfileext(TheList.Items[j]))<>'.mpeg')
         then begin
      TheList.Selected[j]:=true;
        end;
     end;
      TheList.DeleteSelected;
 TheList.MultiSelect:=false;
end;      

procedure TForm2.DragHandler(var Msg: TMessage);
var i,j:integer;
begin
//Ako je poruka jednaka WM_DROPFILES
if Msg.Msg = WM_DROPFILES then
  begin
    TotalDroppedFiles := DragQueryFile(Msg.wParam, $FFFFFFFF, nil, 0);
    //Ubrzajte proces dodavanja fajlova na listu
    TempList.Items.BeginUpdate;
    for Counter := 0 to TotalDroppedFiles -1 do
      begin
        //Prihvatite dropped (ispusteni) fajl
        DragQueryFile(Msg.wParam, Counter, DroppedFile, SizeOf(DroppedFile));
        //Ako je dropped file u stvari directory ...
                  if GetFileAttributes(DroppedFile) and FILE_ATTRIBUTE_DIRECTORY = 0 then
            begin
              //Ako je dropped file jednostavno file
              SendMessage(TempList.Handle, LB_ADDSTRING, 0, Integer(@DroppedFile));
              FileFilter(TempList);
                        for i:=0 to templist.Count-1 do
                         begin
                          lista.Items.Add(templist.Items[i]);
                          listb.Items.Add(extractfilename(templist.Items[i]));
                         end;
                    end else
        if GetFileAttributes(DroppedFile) and FILE_ATTRIBUTE_DIRECTORY = FILE_ATTRIBUTE_DIRECTORY then
          begin
            //DIRECTORY
              //Dodajte slash (kosu crtu) na kraju directory-a
              lstrcat(DroppedFile, '\');
              //Pokusajte naci prvi fajl u directory
              FindHandle := FindFirstFile(PChar(DroppedFile +'*.*'), FindFile1);
              //Ako je handle pretrage VALID
              if FindHandle <> INVALID_HANDLE_VALUE then
                begin
                  repeat
                    //Nastavi pronalaziti fajlove
                    IsLooping := FindNextFile(FindHandle, FindFile1);
                    //Napuni buffer sa null vrijednostima
                    FillChar(FinalName^ , MAX_PATH * 2 , #0);
                    //Prikaci ime directory-a na buffer
                    lstrcpy(FinalName, DroppedFile);
                    //Prikaci ime fajla koje smo pronasli buffer-u
                    lstrcat(FinalName, FindFile1.cFileName);
                    //Vidi da li je rezultat directory, dodaj ako nije
                    if GetFileAttributes(FinalName) and FILE_ATTRIBUTE_DIRECTORY = 0 then
                       SendMessage(TempList.Handle, LB_ADDSTRING, 0, Integer(FinalName));
                  //Ponavljaj dok god ima fajlova koje treba obraditi
                  until not IsLooping;
                    FileFilter(TempList);
                    for i:=0 to templist.Count-1 do
                         begin
                          lista.Items.Add(templist.Items[i]);
                          listb.Items.Add(extractfilename(templist.Items[i]));
                         end;
                        end;
                  Windows.FindClose(FindHandle);
                end;
      end;
  DragFinish(Msg.wParam);
  //Zavrsi update process liste i prikazi dodane stavke (items)
 TempList.Items.EndUpdate;
 TempList.Clear;
 AddNumber;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
  End;
end;

procedure FindFiles(FilesList: TStringList; StartDir, FileMask: string; IncludeRoot:boolean);
var
  SR: TSearchRec;
  DirList: TStringList;
  IsFound: Boolean;
  i: integer;
begin
  if length(StartDir)<>0 then
   if StartDir[length(StartDir)] <> '\' then
  begin
    StartDir := StartDir + '\';
  end;

  IsFound :=FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;
  while IsFound do begin
    FilesList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
   end;
  FindClose(SR);

  if IncludeRoot=true then
  begin
  // Napravi listu subdirectories
  DirList := TStringList.Create;
  IsFound := FindFirst(StartDir+'*.*', faAnyFile, SR) = 0;
  while IsFound do begin
    if ((SR.Attr and faDirectory)<>0) and
         (SR.Name[1] <> '.') then
      DirList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  // Skeniraj listu subdirectories
  for i := 0 to DirList.Count - 1 do
    FindFiles(FilesList, DirList[i], FileMask,includeroot);

  DirList.Free;
  end;
end;

//Dodaj broj play listi
procedure TForm2.addNumber;
var i,j:integer; L:TListBox; s:string;
begin
topint:=listb.TopIndex;
try//izbjegavaj gresku
 L:=Tlistbox.CreateParented(form2.Handle);

 for i:=0 to listb.Count-1 do
  begin
   L.Items.Add(inttostr(i+1)+'. '+extractfilename(lista.Items[i]));
  end;
 L.TopIndex:=Topint;
 Listb.Items:=L.Items;
 Listb.TopIndex:=L.TopIndex;
 L.Clear;
 L.Free;
except
 abort;
end;
end;

//Prikazi lyric file
procedure TForm2.LirikLoad(filename:string);
begin
lirik.Clear;
try
 lirik.Lines.LoadFromFile(lowercase((filename+'.txt')));
 lirik.Lines.Insert(0,'');
 except
  lirik.Lines.Add('Lyric file nije pronadjen za');
  lirik.Lines.Add('"'+extractfilename(filename)+'"');
  lirik.Lines.Insert(0,'');
 end;
end;

//Napravi tajmer za played file
procedure Tform2.TimesCounter;//Ova procedura ne radi za video fajlove npr. *.avi,*.mpeg,*.mpg,*.mov....,

var t : integer;   //t=pozicija mediaplayer-a
    min, sec : integer;   //minute, sekunde u izracunavanju!!
    s1, s2, result : string; // minute(s1), sekunde(s2) kada su prikazane kao rezultat
begin
if (times = 'odbrojavanje') or (times= '') then  //prikazuje play time pjesme(odbrojavanje)
 begin
   t:=form1.MP.Position;
   sec := t div 1000;
   min := sec div 60;
   sec := (sec - min * 60);
   if min >9 then s1 := intToStr(min)
   else s1 := '0' + intToStr(min);
   if sec >9 then s2 := intToStr(sec)
   else s2 := '0' + intToStr(sec);
   result := S1 + ':' + S2;
   Panel1.Caption:=''+result+' ';
   form1.Panel2.Caption:=''+result+' ';
 end
else        //prikazuje play time pjesme (counting out)
 begin
   try
   t:= form1.MP.Length - form1.MP.Position;
   sec := t div 1000;
   min := sec div 60;
   sec := (sec - min * 60);
   if min >9 then s1 := intToStr(min)
   else s1 := '0' + intToStr(min);
   if sec >9 then s2 := intToStr(sec)
   else s2 := '0' + intToStr(sec);
   result := S1 + ':' + S2;
   Panel1.Caption:='- '+result+' ';
   form1.Panel2.Caption:='- '+result+' ';
   except
    exit;
   end
end;
end;

//Dodaj stavke naplay list-u
procedure TForm2.Addlist;
var i:integer;
    L:TListBox;
begin
  form1.OD.Filter:='Play list files (*.plf)|*.plf';
 if form1.od.Execute then
 L:=Tlistbox.CreateParented(form2.Handle);
 if form1.od.FileName<>'' then
  begin
 L.Items.LoadFromFile(form1.od.FileName);
 listA.Items.AddStrings(L.Items);
  for i:=0 to L.items.count-1 do
begin
  listB.Items.Add(extractfilename(L.Items[i]));
  end;
  end else
   if form1.od.FileName='' then
  begin
   L.Free;
   end;
end;

//Invertuj selekciju
procedure TForm2.InvertSelection;
var i,j,k:integer;
begin
Lista.ClearSelection;
if listb.Count<>0 then
listb.MultiSelect:=true;
lista.MultiSelect:=true;
j:=listb.ItemIndex;
 for i := 0 to ListB.Count-1 do
  begin
   listb.Selected[i]:=not listb.Selected[i];
   lista.Selected[i]:=listb.Selected[i];
  end;
  listb.ItemIndex:=j;
  DragAcceptFiles(listB.Handle , True);//potrebno je refreshovati listb da se omoguci drag i drop
end;

//Ukloni oznacene fajlove sa ListA i ListB
procedure TForm2.DelSel;
var i:integer;
begin
 for i := 0 to (ListB.Items.Count - 1) do begin
    if ListB.Selected[i]=true then
     begin
      listA.Selected[i]:=true;
       end;
   end;
 listA.DeleteSelected;
 listB.DeleteSelected;
end;

//Sinhronizuj ListA i ListB
procedure TForm2.index;
begin
 lista.ItemIndex:=listb.ItemIndex;
 listb.ItemIndex:=lista.ItemIndex;
end;

//Obrisi oznacene fajlove
procedure TForm2.del;
begin
  ListA.DeleteSelected;
  ListB.DeleteSelected;
end;

procedure TForm2.FormCreate(Sender: TObject);
var j:integer;
  P: array [0..255] of Char;
  TempPath: string;
begin

 form2.Show;
 form2.Width:=form1.Width;
 form2.Top:=form1.Top+form1.Height;
 form2.Left:=form1.Left;
(*---------------------------------------*)
TempList:=TListBox.Create(self);
TempList.Parent:=self;
TempList.Visible:=false;
DragAcceptFiles(listB.Handle , True);
GetMem(FinalName, MAX_PATH * 2);
ListBoxHandle := FindWindowEx(Form2.Handle , 0, 'TListBox', nil);
//Automatski ucitaj play list
 GetTempPath(255,P);
 TempPath:=StrPas(P);
 if fileExists(TempPath+'PlayList.plf') then
  begin
 ListA.Items.LoadFromFile(TempPath+'PlayList.plf');
     for j:=0 to lista.Count-1 do
     begin
      ListB.Items.add(extractfilename(lista.Items[j]));
      ListA.ItemIndex:=0;
      ListB.ItemIndex:=ListA.ItemIndex;
      ListB.Selected[ListB.ItemIndex]:=true;
       end;
  end;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
(*---------------------------------------*)
//Podesi shortcut keys
 next1.ShortCut:=ShortCut(VK_DOWN,[]);
 prev1.ShortCut:=ShortCut(VK_UP,[]);
 volplus1.ShortCut:=ShortCut(VK_UP,[ssCtrl]);
 volmin1.ShortCut:=ShortCut(VK_DOWN,[ssCtrl]);

 MyMenu:=TMenuItem.Create(Mainmenu1);
 MyMenu.Add(form1.MainMenu1.Items);
 mymenu.Visible:=false;
 form2.MainMenu1.Items.Add(mymenu);
 form2.MainMenu1.Items.Visible:=false;
 addNumber;
end;

//Play file
procedure TForm2.ListADblClick(Sender: TObject);
begin
 Form1.MPPlay(true);
end;

procedure TForm2.ListBDblClick(Sender: TObject);
begin
 Form1.MPPlay(true);
end;

procedure TForm2.ListBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 index;
 case key of
  VK_CONTROL:  MultiSel:='true';
  VK_RETURN: form1.MPPlay(true);
  VK_DELETE: begin
              DelSel;
              addnumber;
               form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items'; end;
 end;
end;

procedure TForm2.LoadList1Click(Sender: TObject);
var i:integer;
begin
 form1.OD.Filter:='Play list files (*.plf)|*.plf';
 if form1.OD.Execute then
  if form1.od.FileName<>'' then
  begin
    listA.Clear;
    listB.Clear;
    listA.Items.LoadFromFile(form1.od.FileName);
  for i:=0 to listA.items.count-1 do
begin
  listB.Items.Add(extractfilename(listA.Items[i])) ;
 end;
 end;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
 addnumber;
end;

procedure TForm2.ListClick(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y-120);
end;

procedure TForm2.Addtolist1Click(Sender: TObject);
begin
 AddList;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
 addnumber;
end;

procedure TForm2.Savelist1Click(Sender: TObject);
begin
  sD.Filter:='Play list files (*.plf)|*.plf';
 if sd.Execute then
  lista.Items.SaveToFile(sd.FileName); 
end;

procedure TForm2.Newlist1Click(Sender: TObject);
begin
 listA.Clear;
 listb.Clear;
end;

procedure TForm2.Clearplaylist1Click(Sender: TObject);
begin
if lista.Count>0 then
 begin
 lista.Clear;
 listb.Clear;
  form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
end;
end;

procedure TForm2.Clearselected1Click(Sender: TObject);
begin
if lista.Count>0 then
 begin
 listb.MultiSelect:=true;
 lista.MultiSelect:=true;
 DelSel;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
end;
  addnumber;
end;

procedure TForm2.Crop1Click(Sender: TObject);
var i:integer;
begin
if lista.Count<>0 then
 begin
 listb.MultiSelect:=true;
 lista.MultiSelect:=true;
 InvertSelection;
 for i:=0 to listB.Count-1 do
  begin
   if listb.Selected[i]=true then
    begin
     lista.Selected[i]:=true;
   end;
  end;
 lista.DeleteSelected;
 listb.DeleteSelected;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
end;
 addnumber;
end;

procedure TForm2.SelectAll1Click(Sender: TObject);
begin
 listb.MultiSelect:=true;
 lista.MultiSelect:=true;
 listb.SelectAll;
 lista.SelectAll;
end;

procedure TForm2.InvertSelection1Click(Sender: TObject);
begin
 InvertSelection;
end;

procedure TForm2.DeselectAll2Click(Sender: TObject);
begin
 listb.ClearSelection;
 lista.ClearSelection;
end;

procedure TForm2.RemClick(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y-84);
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
 popupmenu3.Popup(mouse.CursorPos.X,mouse.CursorPos.Y-68);

end;

procedure TForm2.AddFolder1Click(Sender: TObject);
var dir:string;
    FilesList:TStringList;
    i,j:integer;
    L:TListBox;
begin
Dir:=GetCurrentDir;
if  SelectDirectory('Trazi fajlove u folderu','',Dir) then
 begin
 SetCurrentDir(Dir);
 FilesList := TStringList.Create;
 L:=TListBox.Create(self);
 L.Parent:=self;
 L.Visible:=false;
try
 if includesubfolder1.Checked=true then
  begin
 FindFiles(FilesList,dir+'\','*.*',true);
 end else
  if includesubfolder1.Checked=false then
 begin
   FindFiles(FilesList,dir+'\','*.*',false);
 end;

 L.MultiSelect:=true;
 L.Items.Assign(fileslist);
 FileFilter(L);//filteruj tip fajla
 for j:=0 to L.Count-1 do
  begin
    Lista.Items.Add(L.Items[j]);
   listb.Items.Add(extractfilename(L.Items[j]));
  end;
finally
 fileslist.Free;
 L.Free;
 addnumber;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
end;
end else
 exit;

end;

procedure TForm2.AddFiles1Click(Sender: TObject);
begin
 form1.MPOPen;
 addnumber;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
end;

procedure TForm2.AddClick(Sender: TObject);
begin
 popupmenu4.Popup(mouse.CursorPos.X,mouse.CursorPos.Y-68);
end;

procedure TForm2.ListBMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var j,i:integer;
begin
try
if listb.Count<>0 then
 begin
j:=listb.ItemIndex;
  if (button=mbleft) and ((multisel='false') or (multisel='')) then
   begin
    listb.Items.Move(strtoint(listindex),listb.ItemIndex);
    lista.Items.Move(strtoint(listindex),lista.ItemIndex);
    addnumber;
    listb.Selected[j]:=true;
    lista.Selected[j]:=true;
  end;
 end;
except
 abort;
 end;
end;

procedure TForm2.ListBMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if listb.Count<>0 then
 begin
  sel:=listb.ItemIndex;
  listindex:=inttostr(sel);
  if multisel='true' then
   begin
    lista.MultiSelect:=true;
    listb.MultiSelect:=true;
   end else
  if (multisel='false') or (multisel='') then
   begin
    lista.MultiSelect:=false;
    listb.MultiSelect:=false;
   end;
 end;
end;

procedure TForm2.ListBKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
  VK_CONTROL: MultiSel:='false';
 end; 
end;

procedure TForm2.FormDestroy(Sender: TObject);
var
  P: array [0..255] of Char;
  TempPath: string;
begin
 GetTempPath(255,P);
 TempPath:=StrPas(P);
 ListA.Items.SaveToFile(TempPath+'PlayList.plf');//Sacuvaj trenutku playlist-u u temp dir (privremeni direktorij)
 TempList.Free;
 DragAcceptFiles(ListB.Handle , False);
 FreeMem(FinalName);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form1.SpeedButton3.Font.Style:=[fsstrikeout];
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
 popupmenu7.Popup(mouse.CursorPos.X,mouse.CursorPos.Y-50);
end;

procedure TForm2.Gotofile1Click(Sender: TObject);
begin
 shellexecute(application.Handle,'open',PAnsiChar(extractfilepath(lista.Items[lista.Itemindex])),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm2.Viewfileinfo1Click(Sender: TObject);
begin
 if listb.ItemIndex=-1 then
  begin
  listb.selected[0]:=true;
  lista.selected[0]:=true;
  lista.ItemIndex:=0;
   end;
 if listb.ItemIndex<>-1 then
  begin
 Form4:=Tform4.Create(self);
 form4.Show;
  end;
end;

//Prikazi informacije
procedure TForm2.Memo1DblClick(Sender: TObject);
begin
 memo1.Visible:=false;
 memo1.SendToBack;
end;

procedure TForm2.ClearBadFiles1Click(Sender: TObject);
var l:integer;
begin
 try
 DelBadFile;
 addnumber;
 form2.Caption:='Play List: '+inttostr(form2.ListB.Count)+' items';
  for l:=0 to form2.ListA.Count-1 do
  begin
   if form1.mp.FileName=form2.ListA.Items[l] then
    begin
     listB.Selected[l]:=true;
     break;
    end;
   end;
 except
  exit;
 end;
end;

procedure TForm2.Next1Click(Sender: TObject);
begin
 Form1.MPNExt;
end;

procedure TForm2.Prev1Click(Sender: TObject);
begin
 Form1.MPPrev;
end;

procedure TForm2.ListBClick(Sender: TObject);
begin
 index;
end;

procedure TForm2.Volplus1Click(Sender: TObject);
begin
  form1.Scrollbar1.Position:=form1.Scrollbar1.Position+2;
end;

procedure TForm2.volmin1Click(Sender: TObject);
begin
  form1.Scrollbar1.Position:=form1.Scrollbar1.Position-2;
end;

procedure TForm2.Refresh1Click(Sender: TObject);
var
N: Integer; //Brojac
TL,TT : Integer; //Backup for LEFT and TOP of teh FORM
begin
TL := Left; //Backups Left of the Form
TT := Top;  //Backups Top  of the Form
for N:=1 to 100 do begin  //Counter Time
 Left:= (TL-10) + (Random(20)); {Shake Range in Horizontal Driection}
 Top := (TT-10) + (Random(20)); {Shake Range in Vertical   Driection}
end;
Left := TL; //Restores Left of the Form
Top  := TT; //Restores Top  of the Form
end;

procedure TForm2.Lyric1Click(Sender: TObject);
begin
lirik.BringToFront;
lirikload(lowercase(ListA.Items[lista.ItemIndex]));
end;

procedure TForm2.lirikDblClick(Sender: TObject);
begin
 lirik.SendToBack;
end;

procedure TForm2.Closelyricwindow1Click(Sender: TObject);
begin
lirik.SendToBack;
end;

//ucitaj lyric file
procedure TForm2.Reload1Click(Sender: TObject);
begin
 lirik.Clear;
 lirikload(lowercase(form1.MP.FileName));
end;

//kopiraj lyrics na clipboard
procedure TForm2.Copy1Click(Sender: TObject);
begin
 lirik.CopyToClipboard;
end;

//Pomoc za lyric
procedure TForm2.Help1Click(Sender: TObject);
begin
 Showmessage('Da napravite lyric file, izmijenite vas lyric text koristeci notepad, nazovite  ga isto kao i povezani muzicki file'+#10#13+'onda ga stavite u isti folder');
 showmessage('Npr:'+#10#13+'Muzicki fajl je "C:\Music\MyMusic.mp3"'+#10#13+'Lyric file je "C:\Music\MyMusic.mp3.txt"');
end;

//Otvori notepad da izmijenis/napravis lyric
procedure TForm2.Edit1Click(Sender: TObject);
begin
 if fileexists(ListA.Items[lista.ItemIndex]+'.txt') then
  begin
   ShellExecute(Handle, 'open',PAnsiChar(lowercase(ListA.Items[lista.ItemIndex]+'.txt')),'notepad','notepad',SW_SHOWNORMAL);//pokreni odabrani fajl
  end else
   ShellExecute(Handle, 'open',PAnsiChar('notepad'),nil,nil,SW_SHOWNORMAL);
end;

//Ukljuci podfolder ili ne
procedure TForm2.IncludeSubfolder1Click(Sender: TObject);
begin
 if includesubfolder1.Checked=false then
  begin
   includesubfolder1.Checked:=true;
  end else
   includesubfolder1.Checked:=false;
end;

//otkazi skeniranje losih fajlova
procedure TForm2.Button1Click(Sender: TObject);
begin
 cancel:=true;
end;

//Nastavi "skeniranje losih fajlova box" u centru
procedure TForm2.FormResize(Sender: TObject);
begin
 groupbox1.Left:=(form2.Width div 2)-(groupbox1.Width div 2);
end;

//Zamijeni tajmer odbrojavanje i vrijeme koje je proslo
procedure TForm2.Panel1Click(Sender: TObject);
begin
 if (times = 'odbrojavanje') or (times= '') then  //pokazuje play time pjesme (odbrojavanje)
 begin
  times:='proslo';
   end else
    times:='odbrojavanje';
end;

//Prikazi form3 (form informacije)
procedure TForm2.About1Click(Sender: TObject);
begin
 form3:=TForm3.Create(self);
 form3.ShowModal;
end;

//Prikazi pomoc u memo1
procedure TForm2.Help2Click(Sender: TObject);
begin
if memo1.Visible=false then
begin
 memo1.BringToFront;
 memo1.Visible:=true;
 end else
 if memo1.Visible=true then
 begin
  memo1.SendToBack;
  memo1.Visible:=false;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var i,j:integer;
begin
if lista.Count>1 then
 j:=listb.TopIndex;
 try
  for i:=0 to lista.Count-1 do
   begin
    randomize;
    lista.Items.Exchange(i,random(i));
   end;
 finally
  listb.Clear;
  for i:=0 to lista.Count-1 do
   begin
    listb.Items.Add(extractfilename(lista.Items[i]));
   end;
   addnumber;
   listb.TopIndex:=j;
  end;
end;

procedure TForm2.Shufflelist1Click(Sender: TObject);
var i,j:integer;
begin
if lista.Count>1 then
 j:=listb.TopIndex;
 try
  for i:=0 to lista.Count-1 do
   begin
    randomize;
    lista.Items.Exchange(i,random(i));
   end;
 finally
  listb.Clear;
  for i:=0 to lista.Count-1 do
   begin
    listb.Items.Add(extractfilename(lista.Items[i]));
   end;
   addnumber;
   listb.TopIndex:=j;
  end;

end;

end.

