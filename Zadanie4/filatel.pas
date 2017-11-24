unit Filatel;

interface

uses
  Classes, SysUtils;

const
  tLosowosc = 10;

type

  tZnaczek = record
    rokpr: integer;
    nazwa: string[30];
    nominal: real;
    //istnieje : Boolean;
  end;

  tKlaser = array [0..9] of Tznaczek;

//function FileExist(nazwa: string): boolean;
//function DodajZnaczek():tZnaczek;
//procedure ZerujDane( var znaczek:tZnaczek );
procedure UsunZnaczek(var klaser: tKlaser; nazwa: string);
//procedure WypiszDane( const znaczek:tZnaczek );
procedure ModyfikujZnaczek(var klaser: tKlaser; indeks: integer);
procedure DodajZnaczek2(var klaser: tKlaser);

function DodajZnaczki(): tKlaser;
procedure WypiszKlaser(const klaser: tKlaser);

procedure ZapiszDoPliku(const klaser: tKlaser; nazwa: string);
procedure ZapiszDoPlikuTXT(const klaser: tKlaser; nazwa: string);
procedure OdczytajDane(var klaser: tKlaser; nazwa: string);

implementation

const
  cNazwy: array [1..tLosowosc] of string =
    ('Samolot#1', 'Samolot#2', 'Samolot#3', 'Samochod#1', 'Samochod#2',
    'Samochod#3', 'Papiez#1', 'Papiez#2', 'Papiez#4', 'Unikat');
  cRok: array [1..tLosowosc] of integer =
    (1900, 1921, 1933, 1940, 1943, 1950, 1964, 1970, 1982, 1990);
  cNominal: array [1..tLosowosc] of real =
    (0.50, 1.20, 2.60, 3.20, 3.70, 4.50, 4.75, 5.10, 7.10, 10.90);

function FileExist(nazwa: string): boolean;
var
  plik: file of TZnaczek;
begin
    {$i-}
  Assign(plik, nazwa);
  Reset(plik);
  Close(plik);
    {$i+}
  FileExist := (IOResult = 0);
end;

function DodajZnaczek(): TZnaczek;
var
  tmpZnaczek: TZnaczek;
begin
  with tmpZnaczek do
  begin
    nazwa := cNazwy[random(tLosowosc) + 1];
    rokpr := cRok[random(tLosowosc) + 1];
    nominal := cNominal[random(tLosowosc) + 1];
  end;
  dodajZnaczek := tmpZnaczek;
end;

function DodajZnaczki(): tKlaser;
var
  tmpKlaser: TKlaser;
  rec_a: integer;
begin
  for rec_a := 0 to high(tmpKlaser) do
  begin
    tmpKlaser[rec_a] := DodajZnaczek();
  end;
  DodajZnaczki := tmpKlaser;
end;

function CzyIstnieje(const znaczek: TZnaczek): boolean;
begin
  with znaczek do
    if (nazwa = '') and (rokpr = 0) and (nominal = 0.0) then
      CzyIstnieje := False
    else
      CzyIstnieje := True;
end;

procedure ZerujDane(var znaczek: TZnaczek);
begin
  with znaczek do
  begin
    nazwa := '';
    rokpr := 0;
    nominal := 0.0;
  end;
end;

procedure UsunZnaczek(var klaser: tKlaser; nazwa: string);
var
  rec_a: integer = 0;
  usuniete: boolean = False;
begin
  while (rec_a <= high(klaser)) and (usuniete = False) do
  begin
    if (klaser[rec_a].nazwa = nazwa) then
    begin
      ZerujDane(klaser[rec_a]);
      usuniete := True;
    end;
    Inc(rec_a);
  end;

end;

procedure ModyfikujZnaczek(var klaser: TKlaser; indeks: integer);
begin
  if (indeks >= 0) and (indeks <= high(klaser)) then
    klaser[indeks] := DodajZnaczek();
end;

procedure DodajZnaczek2(var klaser: TKlaser);
var
  rec_a: integer = 0;
  dodano: boolean = False;
begin
  while (rec_a <= high(klaser)) and (dodano = False) do
  begin
    if (not CzyIstnieje(klaser[rec_a])) then
    begin
      klaser[rec_a] := DodajZnaczek();
      dodano := True;
    end;
    Inc(rec_a);
  end;
end;

procedure WypiszDane(const znaczek: TZnaczek);
begin
  with znaczek do
    WriteLn(nazwa: 20, rokpr: 7, nominal: 6: 2);
end;

procedure WypiszKlaser(const klaser: TKlaser);
var
  rec_a: integer;
begin
  for rec_a := 0 to high(klaser) do
  begin
    Write(rec_a+1:2,'#');
    WypiszDane(klaser[rec_a]);
  end;
end;

procedure ZapiszDoPliku(const klaser: tKlaser; nazwa: string);
var
  plik: file of tZnaczek;
  rec_a: integer;
begin
  Assign(plik, nazwa);
  Rewrite(plik);
  for rec_a := 0 to high(klaser) do
  begin
    Write(plik, klaser[rec_a]);
  end;
  Close(plik);
end;

procedure ZapiszDoPlikuTXT(const klaser: tKlaser; nazwa: string);
var
  plik: Text;
  rec_a: integer;
begin
  Assign(plik, nazwa);
  Rewrite(plik);
  for rec_a := 0 to high(klaser) do
  begin
    with (klaser[rec_a]) do
      writeln(plik, rec_a: 2, '#', nazwa: 30, rokpr: 5, nominal: 7: 2);
  end;
  Close(plik);
end;

procedure OdczytajDane(var klaser: tKlaser; nazwa: string);
var
  plik: file of tZnaczek;
  rec_a: integer = 0;
begin
  if (FileExist(nazwa)) then
  begin
    Assign(plik, nazwa);
    Reset(plik);
    while (rec_a <= high(klaser)) and (not EOF(plik)) do
    begin
      Read(plik, klaser[rec_a]);
      Inc(rec_a);
    end;
    Close(plik);
  end;
end;

end.
