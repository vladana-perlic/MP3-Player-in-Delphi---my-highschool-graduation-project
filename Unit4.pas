//Prikazi ID3 Tag information
unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    Genre: TEdit;
    Year: TEdit;
    Album: TEdit;
    Artist: TEdit;
    Title: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Comment: TEdit;
    Edit7: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure FillID3Info;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

type
{ Byte 1-3 = ID 'TAG'
  Byte 4-33 =  Title
  Byte 34-63 = Artist
  Byte 64-93 = Album
  Byte 94-97 =  Year
  Byte 98-127 = Comment
  Byte 128 = Genre }
  TID3Rec = packed record
    vTag     : array[0..2] of Char;
    vTitle   : array[0..29] of Char;
    vArtist  : array[0..29] of Char;
    vAlbum   : array[0..29] of Char;
    vYear    : array[0..3] of Char;
    vComment : array[0..29] of Char;
    Genre   : Byte;
  end;
const
  MaxID3Genre=147;
  ID3Genre: array[0..MaxID3Genre] of string = (
    'Blues', 'Classic Rock', 'Country', 'Dance', 'Disco', 'Funk', 'Grunge',
    'Hip-Hop', 'Jazz', 'Metal', 'New Age', 'Oldies', 'Other', 'Pop', 'R&B',
    'Rap', 'Reggae', 'Rock', 'Techno', 'Industrial', 'Alternative', 'Ska',
    'Death Metal', 'Pranks', 'Soundtrack', 'Euro-Techno', 'Ambient',
    'Trip-Hop', 'Vocal', 'Jazz+Funk', 'Fusion', 'Trance', 'Classical',
    'Instrumental', 'Acid', 'House', 'Game', 'Sound Clip', 'Gospel',
    'Noise', 'AlternRock', 'Bass', 'Soul', 'Punk', 'Space', 'Meditative',
    'Instrumental Pop', 'Instrumental Rock', 'Ethnic', 'Gothic',
    'Darkwave', 'Techno-Industrial', 'Electronic', 'Pop-Folk',
    'Eurodance', 'Dream', 'Southern Rock', 'Comedy', 'Cult', 'Gangsta',
    'Top 40', 'Christian Rap', 'Pop/Funk', 'Jungle', 'Native American',
    'Cabaret', 'New Wave', 'Psychadelic', 'Rave', 'Showtunes', 'Trailer',
    'Lo-Fi', 'Tribal', 'Acid Punk', 'Acid Jazz', 'Polka', 'Retro',
    'Musical', 'Rock & Roll', 'Hard Rock', 'Folk', 'Folk-Rock',
    'National Folk', 'Swing', 'Fast Fusion', 'Bebob', 'Latin', 'Revival',
    'Celtic', 'Bluegrass', 'Avantgarde', 'Gothic Rock', 'Progressive Rock',
    'Psychedelic Rock', 'Symphonic Rock', 'Slow Rock', 'Big Band',
    'Chorus', 'Easy Listening', 'Acoustic', 'Humour', 'Speech', 'Chanson',
    'Opera', 'Chamber Music', 'Sonata', 'Symphony', 'Booty Bass', 'Primus',
    'Porn Groove', 'Satire', 'Slow Jam', 'Club', 'Tango', 'Samba',
    'Folklore', 'Ballad', 'Power Ballad', 'Rhythmic Soul', 'Freestyle',
    'Duet', 'Punk Rock', 'Drum Solo', 'Acapella', 'Euro-House', 'Dance Hall',
    'Goa', 'Drum & Bass', 'Club-House', 'Hardcore', 'Terror', 'Indie',
    'BritPop', 'Negerpunk', 'Polsk Punk', 'Beat', 'Christian Gangsta Rap',
    'Heavy Metal', 'Black Metal', 'Crossover', 'Contemporary Christian',
    'Christian Rock', 'Merengue', 'Salsa', 'Trash Metal', 'Anime', 'Jpop',
    'Synthpop');

implementation
uses unit2,unit1;
{$R *.dfm}

procedure GetID3TagInformation(mp3File:string; Title,Artist,Album,Year,Genre,Comment:TEdit);
var ID3 : TID3Rec;
    //fMP3: file of Byte;
    fmp3: TFileStream;
begin
  fmp3:=TFileStream.Create(mp3File, fmOpenRead);
  try
    fmp3.position:=fmp3.size-128;
    fmp3.Read(ID3,SizeOf(ID3));
  finally
    fmp3.free;
  end;
 if ID3.vTag <> 'TAG' then begin
   Title.Text:='';
   Artist.Text:='';
   Album.Text:='';
   Year.Text:='';
   Genre.Text:='';
   Comment.Text:='';
   end else
 if ID3.vTag = 'TAG' then
 begin
   Title.Text:=ID3.vTitle;
   Artist.Text:=ID3.vArtist;
   Album.Text:=ID3.vAlbum;
   Year.Text:=ID3.vYear;
   Comment.Text:=ID3.vComment;
   if ID3.Genre in [0..MaxID3Genre] then
    begin
     Genre.Text:=ID3Genre[ID3.Genre];
     end else
        if not ID3.Genre in [0..MaxID3Genre] then
        begin
     Genre.Text:='Other';
   end;
 end;
end;

procedure TForm4.FillID3Info;
var S:integer;
begin
 Edit7.Text:=form2.ListA.Items[form2.ListA.ItemIndex];
 if form2.ListA.Items[form2.ListA.ItemIndex]<>form1.MP.FileName then
  begin
    try
     GetID3TagInformation(form2.ListA.Items[form2.ListA.ItemIndex],Title,Artist,Album,Year,Genre,Comment);
    except
     Title.Text:='';
     Artist.Text:='';
     Album.Text:='';
     Year.Text:='';
     Genre.Text:='';
     Comment.Text:='';
     //Messagedlg('"'+form2.ListA.Items[form2.ListA.ItemIndex]+'" is corrupt or invalid *.Mp3 file',mtinformation,[mbok],0);
     form1.Timer1.Enabled:=false;
     exit;
    end;
  end else
 if form2.ListA.Items[form2.ListA.ItemIndex]=form1.MP.FileName then
  begin
   S:=form1.MP.Position;
   form1.MP.Close;
   form1.Timer1.Enabled:=false;
    try
     GetID3TagInformation(form2.ListA.Items[form2.ListA.ItemIndex],Title,Artist,Album,Year,Genre,Comment);
    except
     Title.Text:='';
     Artist.Text:='';
     Album.Text:='';
     Year.Text:='';
     Genre.Text:='';
     Comment.Text:='';
     form1.Timer1.Enabled:=false;
     //Messagedlg('"'+form2.ListA.Items[form2.ListA.ItemIndex]+'" is corrupt or invalid *.Mp3 file',mtinformation,[mbok],0);
     exit;
    end;
   form1.MPPlay(true);
   form1.MP.Position:=S;
   form1.MP.Play;
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 FillID3Info;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
 form4.Close;
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
begin
 form1.MPNExt;
 FillID3Info;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
 form1.MPPrev;
 FillID3Info;
end;

end.
