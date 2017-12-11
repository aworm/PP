unit Biblioteka;

interface

uses Dane, Crt;

type
  PKsiazka = ^TKsiazka;
  PStudent = ^TStudent;

  TKsiazka = record
    autor, tytul: NazwaDluga;
    id: integer;
    Next: PKsiazka;
  end;

  TStudent = record
    imie, nazwisko: Nazwa;
    pesel: int64;
    Next: PStudent;
    ksiazki: PKsiazka;
  end;

//Dodajemy ksiazke do zbioru glownego biblioteki
procedure DodajKsiazke(var Pierwsza: PKsiazka; Nowa: PKsiazka = nil);
////Wyswietla liste ksiazek w danej liscie
procedure WyswietlListeKsiazek(const Pierwsza: PKsiazka);
//Dodaje studenta do wskazanej listy w sposob posortowany
procedure DodajStudenta(var Pierwszy: PStudent);
//Wyswietla liste studentow oraz ich wypozyczone ksiazki
procedure WyswietlStudentow(const Pierwszy: PStudent);
//Przepiepiecie ksiazki z jednej listy pod druga, na podsatwie danego ID
function PrzeniesKsiazke(var Przypiecie, Odpiecie: PKsiazka; const ID: integer):Boolean;
//Przekazuje ksiazke ze wskazanej listy do listy ksiazek konkretnego studenta
procedure WypozyczKsiazke(const PierwszyStudent: PStudent;
  var PierwszaKsiazka: PKsiazka; const id: integer; const pesel: int64);
//WYszukuje ksiazke na listach wszystkich studentow i oddaje ja do zbioru biblioteki
procedure OddajKsiazke(const PierwszyStudent: PStudent;
  var PierwszaKsiazka: PKsiazka; const id: integer);


implementation

//Wewnetrzna funkcja - tworzy nowa ksiazke i zwraca do niej wskaznik
function TworzKsiazke(): PKsiazka;
var
  tmp: PKsiazka;
begin
  new(tmp);
  tmp^.autor := DajAutora();
  tmp^.tytul := DajTytul();
  tmp^.id := Random(100);
  tmp^.Next := nil;
  Result := tmp;
end;

procedure DodajKsiazke(var Pierwsza: PKsiazka; Nowa: PKsiazka = nil);
var
  tmp: PKsiazka;
begin
  if (Nowa = nil) then
    Nowa := TworzKsiazke();

  if (Pierwsza = nil) then
  begin
    Pierwsza := nowa;
  end
  else
  begin
    tmp := Pierwsza;
    while tmp^.Next <> nil do
      tmp := tmp^.Next;
    tmp^.Next := nowa;
  end;
end;

procedure WyswietlListeKsiazek(const Pierwsza: PKsiazka);
var
  tmp: PKsiazka;
begin
  TextColor(1);
  tmp := Pierwsza;
  while (tmp <> nil) do
  begin
    WriteLn(tmp^.autor: (high(NazwaDluga) + 1), tmp^.tytul: (high(NazwaDluga) + 1),
      tmp^.id: 5);
    tmp := tmp^.Next;
  end;
  TextColor(8);
end;

//Wewnetrzna funkcja - tworzy nowego studenta i zwraca do niego wskaznik
function TworzStudenta(): PStudent;
var
  tmp: PStudent;
begin
  new(tmp);
  tmp^.imie := DajImie();
  tmp^.nazwisko := DajNazwisko();
  tmp^.pesel := Random(100);
  tmp^.Next := nil;
  tmp^.ksiazki := nil;
  Result := tmp;
end;

procedure DodajStudenta(var Pierwszy: PStudent);
var
  tmp, nowy: PStudent;
begin
  nowy := TworzStudenta();

  tmp := Pierwszy;
  if (tmp = nil) or (tmp^.pesel > nowy^.pesel) then
  begin
    nowy^.Next := Pierwszy;
    Pierwszy := nowy;
  end
  else
  begin
    while (tmp^.Next <> nil) and (tmp^.Next^.pesel < nowy^.pesel) do
      tmp := tmp^.Next;
    nowy^.Next := tmp^.Next;
    tmp^.Next := nowy;
  end;
end;

procedure WyswietlStudentow(const Pierwszy: PStudent);
var
  tmp: PStudent;
begin
  tmp := Pierwszy;
  while tmp <> nil do
  begin
    WriteLn(tmp^.imie: high(Nazwa) + 1, tmp^.nazwisko: high(Nazwa) + 1, tmp^.pesel: 12);
    WyswietlListeKsiazek(tmp^.ksiazki);
    tmp := tmp^.Next;
  end;
end;

function PrzeniesKsiazke(var Przypiecie, Odpiecie: PKsiazka; const ID: integer):Boolean;
var
  tmp, tmp2: PKsiazka;
begin
  tmp := Odpiecie;

  if (tmp = nil) then
    Result:=false
  else if (tmp^.id = id) then
  begin
    Odpiecie := tmp^.Next;
    tmp^.Next := nil;
    DodajKsiazke(Przypiecie, tmp);
    Result:=true;
  end
  else
  begin
    while (tmp^.Next <> nil) and (tmp^.Next^.id <> id) do
      tmp := tmp^.Next;
    if (tmp^.Next <> nil) then
    begin
      tmp2 := tmp^.Next;
      tmp^.Next := tmp2^.Next;
      tmp2^.Next := nil;
      DodajKsiazke(Przypiecie, tmp2);
      Result:=true;
    end;
  end;
  Result:=false;
end;

procedure WypozyczKsiazke(const PierwszyStudent: PStudent;
  var PierwszaKsiazka: PKsiazka; const id: integer; const pesel: int64);
var
  tmpS: PStudent;
begin
  tmpS := PierwszyStudent;

  while (tmpS <> nil) do
  begin
    if (tmpS^.pesel = pesel) then
      break;
    tmpS := tmpS^.Next;
  end;

  if (tmpS <> nil) then
  begin
    PrzeniesKsiazke(tmpS^.ksiazki, PierwszaKsiazka, id);
  end;
end;

procedure OddajKsiazke(const PierwszyStudent: PStudent;
  var PierwszaKsiazka: PKsiazka; const id: integer);
var
  tmpS: PStudent;
  Oddana:Boolean;
begin
  tmpS:=PierwszyStudent;
  Oddana:=false;
  if (tmpS<>nil)
  then begin
    while ( tmpS^.next <> nil ) and (Oddana = false) do
    begin
      Oddana:=PrzeniesKsiazke(PierwszaKsiazka,tmpS^.ksiazki,id);
      tmpS:=tmpS^.next;
    end;
  end;
end;

end.
