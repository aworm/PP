unit Kartoteka;

interface

const
  imiona: array [1..20] of string[25] =
    ('Maria', 'Krystyna', 'Anna', 'Barbara', 'Teresa', 'Elzbieta', 'Janina',
    'Zofia', 'Jadwiga', 'Danuta', 'Halina', 'Irena', 'Ewa', 'Malgorzata', 'Helena',
    'Grazyna', 'Bozena', 'Stanislawa', 'Jolanta', 'Marianna');
  nazwiska: array [1..20] of string[25] =
    ('Nowak', 'Kowalski', 'Wisniewski', 'Wojcik', 'Kowalczyk',
    'Kaminski', 'Lewandowski', 'Zielinski', 'Szymanski',
    'Wozniak', 'Dobrowski', 'Kozlowski', 'Jankowski', 'Mazur',
    'Wojciechowski', 'Kwiatkowski', 'Krawczyk',
    'Kaczmarek', 'Piotrowski', 'Grabowski');
  pesele: array [1..20] of longint =
    (31212312, 2312312, 23454, 432423423, 666666666, 4343342,
    31231298, 71978312, 543534533, 19789789, 19784516, 32123456, 3572567, 54253452,
    1297789, 978978, 64526445, 26456548, 5453454, 44326564);

type
  TOsoba = record
    imie: string[25];
    nazwisko: string[25];
    pesel: longint;
  end;

  Pelem = ^Elem;

  Elem = record
    Dane: TOsoba;
    Next: Pelem;
  end;


procedure push(var glowa: Pelem);

procedure push_bck(var glowa: Pelem);

procedure pop(var glowa: Pelem);

procedure pop_bck(var glowa: Pelem);

procedure print(const glowa: Pelem);

implementation

function CreateOsoba(): TOsoba;
var
  tmp: TOsoba;
begin
  tmp.imie := (imiona[random(19) + 1]);
  tmp.nazwisko := nazwiska[random(19) + 1];
  tmp.pesel := pesele[random(19) + 1];
  CreateOsoba := tmp;
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
