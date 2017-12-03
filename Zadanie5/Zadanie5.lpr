{ dynamiczna tablica dwówymiarowa, wypelnij tabliczka mnozenia }
program Zadanie5;
uses
  Crt;
const
  max=10;
type
  PReal=^Integer;
  PPReal=^D1Tablica;

  D1Tablica=Record
    glowa:PReal;
    rozmiar:Integer;
  end;

  D2Tablica=Record
    glowa:PPReal;
    rozmiar:Integer;
  end;

var
  tablica:D2Tablica;
  rec_a,rec_b:Integer;
  komenda:Char='0';

begin

  tablica.rozmiar:=max;
  GetMem(tablica.glowa, SizeOf(tablica.glowa^)*tablica.rozmiar);
  for rec_a:=0 to tablica.rozmiar-1 do
  begin
    tablica.glowa[rec_a].rozmiar:=max;
    GetMem(tablica.glowa[rec_a].glowa, SizeOf(tablica.glowa[rec_a].glowa^)*tablica.glowa[rec_a].rozmiar);
  end;

  for rec_a:=0 to tablica.rozmiar-1 do
    for rec_b:=0 to tablica.glowa[rec_a].rozmiar-1 do
       tablica.glowa[rec_a].glowa[rec_b]:=(rec_a+1)*(rec_b+1);

  for rec_a:=0 to tablica.rozmiar-1 do
  begin
    for rec_b:=0 to tablica.glowa[rec_a].rozmiar-1 do
       Write(tablica.glowa[rec_a].glowa[rec_b]:4);
    WriteLn();
  end;

  for rec_a:=0 to tablica.rozmiar-1 do
  begin
    FreeMem(tablica.glowa[rec_a].glowa,SizeOf(tablica.glowa[rec_a].glowa^)*tablica.glowa[rec_a].rozmiar);
    tablica.glowa[rec_a].rozmiar:=0;
    tablica.glowa[rec_a].glowa:=nil;
  end;
  FreeMem(tablica.glowa,SizeOf(tablica.glowa^)*tablica.rozmiar);
  tablica.rozmiar:=0;
  tablica.glowa:=nil;

  komenda:=Char(0);
  while komenda <> Char(27) do
  begin
    komenda:=ReadKey();
  end;

end.

