unit Kartoteka;

interface

uses sysutils;

const
  losowosc=19;
  imiona: array [0..losowosc] of string[25] =
    ('Maria', 'Krystyna', 'Anna', 'Barbara', 'Teresa', 'Elzbieta', 'Janina',
    'Zofia', 'Jadwiga', 'Danuta', 'Halina', 'Irena', 'Ewa', 'Malgorzata', 'Helena',
    'Grazyna', 'Bozena', 'Stanislawa', 'Jolanta', 'Marianna');
  nazwiska: array [0..losowosc] of string[25] =
    ('Nowak', 'Kowalski', 'Wisniewski', 'Wojcik', 'Kowalczyk',
    'Kaminski', 'Lewandowski', 'Zielinski', 'Szymanski',
    'Wozniak', 'Dobrowski', 'Kozlowski', 'Jankowski', 'Mazur',
    'Wojciechowski', 'Kwiatkowski', 'Krawczyk',
    'Kaczmarek', 'Piotrowski', 'Grabowski');
  pesele: array [0..losowosc] of string[11] =
    ('04230903737', '00213019310', '43012703831', '22031407450', '37042004415', '84052016538',
    '80071304652', '45040605330', '61010817930', '73610201478', '18081203030', '59031817259', '51033014252', '00301313951',
    '76021318176', '40061901951', '40313009703', '42853109169', '55120119561', '82091804509');

type
  TPesel=string[11];
  TOsoba = record
    imie: string[25];
    nazwisko: string[25];
    pesel: TPesel;
    urodziny:TDateTime;
  end;

  Pelem = ^Elem;

  Elem = record
    Dane: TOsoba;
    Next: PElem;
  end;


procedure push(var glowa: Pelem);
procedure push_bck(var glowa: Pelem);
procedure push_sort(var glowa: Pelem; const nowy: Pelem);

procedure pop(var glowa: Pelem);
procedure pop_bck(var glowa: PElem);
procedure usun(var glowa:PElem; const Pesel:TPesel);

procedure print(const glowa: Pelem);
function CreateOsoba(): TOsoba;

implementation

function ZwrocDate(const tmp:PElem):TDateTime;
var
  miesiac, rok, dzien:Word;
begin
  dzien:=StrToInt(tmp^.dane.pesel[5..6]);
  miesiac:=StrToInt(tmp^.dane.pesel[3..4]);
  rok:=StrToInt(tmp^.dane.pesel[1..2]);
  Case tmp^.dane.pesel[3] of
    '0','1' : begin
      rok:=rok+1900;
    end;
    '2','3' : begin
      miesiac:=miesiac mod 20;
      rok:=rok+2000;
    end;
    '4','5' : begin
      miesiac:=miesiac mod 40;
      rok:=rok+2100;
    end;
    '6','7' : begin
      miesiac:=miesiac mod 60;
      rok:=rok+2200;
    end;
    '8','9' : begin
      miesiac:=miesiac mod 80;
      rok:=rok+1800;
    end;
  end;
  ZwrocDate:=EncodeDate(rok,miesiac,dzien);
end;

function CreateOsoba(): TOsoba;
var
  tmp: TOsoba;
begin
  tmp.imie := (imiona[random(losowosc) + 1]);
  tmp.nazwisko := nazwiska[random(losowosc) + 1];
  tmp.pesel := pesele[random(losowosc) + 1];
  CreateOsoba := tmp;
end;

function CzyPrawyStarszy(const prawy, lewy : PElem): Boolean;
begin
  if (ZwrocDate(lewy) > ZwrocDate(prawy) )then
    CzyPrawyStarszy:=True
  else CzyPrawyStarszy:=False;
end;

procedure push(var glowa: Pelem);
var
  nowy: PElem;
begin
  new(nowy);
  nowy^.dane := CreateOsoba();
  nowy^.Next := glowa;
  glowa := nowy;
end;

procedure push_bck(var glowa: Pelem);
var
  tmp: Pelem;
begin
  if (glowa = nil) then
  begin
    new(glowa);
    glowa^.dane := CreateOsoba();
    glowa^.Next := nil;
  end
  else
  begin
    tmp := glowa;
    while (tmp^.Next <> nil) do
      tmp := tmp^.Next;
    new(tmp^.Next);
    tmp^.Next^.dane := CreateOsoba();
    tmp^.Next^.Next := nil;
  end;
end;

procedure push_sort(var glowa: Pelem; const nowy:PElem);
begin
  if (glowa = nil) then
  begin
    glowa:=nowy
  end else if ( CzyPrawyStarszy(glowa,nowy) ) then
  begin
    nowy^.Next:=glowa;
    glowa:=nowy;
  end else
  begin
    if ( ( glowa<>nil ) and (CzyPrawyStarszy(glowa,nowy)=False) ) then
    begin
      push_sort(glowa^.Next,nowy);
    end;
  end;
end;

procedure pop(var glowa: Pelem);
var
  tmp: Pelem;
begin
  if (glowa <> nil) then
  begin
    tmp := glowa;
    glowa := glowa^.Next;
    dispose(tmp);
  end
  else
    WriteLn('Lista jest pusta');
end;

procedure pop_bck(var glowa: Pelem);
var
  tmp: Pelem;
begin
  if (glowa=nil) then
    WriteLn('Lista jest pusta')
  else if (glowa^.next=nil) then
  begin
    dispose(glowa);
    glowa:=nil;
  end else
  begin
    tmp:=glowa;
    while(tmp^.next^.next<>nil) do
      tmp:=tmp^.next;

    dispose(tmp^.next);
    tmp^.next:=nil;
  end;
end;

procedure usun(var glowa: PElem; const Pesel: TPesel);
var
  tmp:PElem;
begin
  if ( glowa = nil ) then
  begin
    WriteLn('Podany PESEL nie istnieje');
  end else if ( glowa^.Dane.Pesel = Pesel ) then
  begin
    tmp:=glowa;
    glowa:=glowa^.Next;
    dispose(tmp);
  end else if ( glowa^.next = nil ) then
  begin
    WriteLn('Podany PESEL nie istnieje');
  end else if ( glowa^.Next^.Dane.Pesel = Pesel ) then
  begin
    tmp:=glowa^.Next;
    glowa^.Next:=glowa^.Next^.Next;
    dispose(tmp);
  end else
    usun(glowa^.Next, Pesel);
end;


procedure print(const glowa: Pelem);
var
  tmp: Pelem;
  rec_a: integer;
begin
  tmp := glowa;
  rec_a := 1;
  while (tmp <> nil) do
  begin
    WriteLn(rec_a: 3, tmp^.dane.imie: 26, tmp^.dane.nazwisko: 26, tmp^.dane.pesel: 20);
    Inc(rec_a);
    tmp := tmp^.Next;
  end;
end;

end.
