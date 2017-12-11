unit Biblioteka;



interface

type
  PKsiazka = ^TKsiazka;
  PStudent = ^TStudent;

  TKsiazka = record
    autor, tytul: string[25];
    id: integer;
    Next: PKsiazka;
  end;

  TStudent = record
    imie, nazwisko: string[25];
    pesel: int64;
    Next: PStudent;
    ksiazki: PKsiazka;
  end;

procedure DodajKsiazke(var Pierwsza: PKsiazka; autor, tytul: string; id: integer);

procedure WyswietlListeKsiazek(const Pierwsza:PKsiazka);
procedure WyswietlStudentow(const Pierwszy: PStudent);

procedure DodajStudenta(var Pierwszy: PStudent; imie, nazwisko: string; pesel: int64);

procedure WypozyczKsiazke(const PierwszyStudent:PStudent; var PierwszaKsiazka:PKsiazka; tytul:String; pesel:Int64);


implementation

procedure DodajKsiazke(var Pierwsza: PKsiazka; autor, tytul: string; id: integer);
var
  tmp: PKsiazka;
begin
  tmp := Pierwsza;
  if (tmp = nil) then
  begin
    new(tmp);
    tmp^.autor := autor;
    tmp^.tytul := tytul;
    tmp^.id := id;
    tmp^.Next := nil;
    Pierwsza := tmp;
  end
  else
  begin
    while tmp^.Next <> nil do
      tmp := tmp^.Next;
    new(tmp^.Next);
    tmp^.Next^.autor := autor;
    tmp^.Next^.tytul := tytul;
    tmp^.Next^.id := id;
    tmp^.Next^.Next := nil;
  end;
end;

procedure WyswietlListeKsiazek(const Pierwsza: PKsiazka);
var
  tmp: PKsiazka;
begin
  tmp := Pierwsza;
  while tmp <> nil do
  begin
    WriteLn(tmp^.autor: 30, tmp^.tytul: 26, tmp^.id: 5);
    tmp := tmp^.Next;
  end;
end;

procedure WyswietlStudentow(const Pierwszy: PStudent);
var
  tmp: PStudent;
begin
  tmp := Pierwszy;
  while tmp <> nil do
  begin
    WriteLn(tmp^.imie: 26, tmp^.nazwisko: 26, tmp^.pesel: 12);
    WyswietlListeKsiazek(tmp^.ksiazki);
    tmp := tmp^.Next;
  end;
end;

procedure DodajStudenta(var Pierwszy: PStudent; imie, nazwisko: string; pesel: int64);
var
  tmp, nowy: PStudent;
begin
  new(nowy);
  nowy^.imie := imie;
  nowy^.nazwisko := nazwisko;
  nowy^.pesel := pesel;
  nowy^.ksiazki := nil;

  tmp := Pierwszy;
  if (tmp = nil) or (tmp^.pesel > pesel) then
  begin
    nowy^.Next := Pierwszy;
    Pierwszy := nowy;
  end else
  begin
    while ( tmp^.next <> nil) and (tmp^.next^.pesel <  pesel ) do
      tmp:=tmp^.next;
    nowy^.next:=tmp^.Next;
    tmp^.next:=nowy;
  end;
end;

procedure WypozyczKsiazke(const PierwszyStudent: PStudent; var PierwszaKsiazka: PKsiazka; tytul: String; pesel: Int64);
var
  tmpK:PKsiazka;
  tmpS:PStudent;
begin
  tmpK:=PierwszaKsiazka;
  tmpS:=PierwszyStudent;

  while ( tmpK<>nil ) do
  begin
    if (tmpK^.tytul = tytul) then
      break;
    tmpK:=tmpK^.next;
  end;

  while ( tmpS<>nil ) do
  begin
    if (tmpS^.pesel = pesel) then
      break;
    tmpS:=tmpS^.next;
  end;

  if ( tmpK <> nil ) and ( tmpS <> nil )
  then begin
    DodajKsiazke(tmpS^.ksiazki, tmpK^.autor, tmpk^.tytul,tmpk^.id);
  end;



end;

end.
