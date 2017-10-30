unit Unit1;

{definicje procedur i funkcji}
interface
const
  n = 9;
type
  Tab10 = Array[0..n] of Integer;

{pierwsza procka zewnetrzna}
procedure Hello();

{przekazywanie do procedury zmiennej:
- bez znacznika przekazywana jset kopia
- VAR - przekazuje oryginalne dane
- CONST - przekazuje oryginal ale nie pozwala na jego modyfikowac
          daje nam to oszczednosc czasu i pamieci}
procedure Kwadrat ( var liczba:Integer );

{dwie procedury do inicjalizowania tablicy zdefiniowanej w typach
oraz druga wyswietlajaca tablice tego samego typu}
procedure Generuj ( var tab:Tab10 );
procedure Wyswietl( const tab:Tab10 );

procedure MedianaW ( const tab:Tab10 );





{deklarcacje procedur i funkcji }
implementation
///////////////////////////////////////////////////////////////////////////////
procedure Hello();
begin
  writeln('Hello');
end;
///////////////////////////////////////////////////////////////////////////////
procedure Kwadrat ( var liczba:Integer );
begin
  liczba := liczba * liczba;
end;
///////////////////////////////////////////////////////////////////////////////
procedure Generuj ( var tab:Tab10 );
var
  rec_a:Integer;
begin
  for rec_a:=low(tab) to high(tab) do
    tab[rec_a] := random(100);
end;
///////////////////////////////////////////////////////////////////////////////
procedure Wyswietl( const tab:Tab10 );
var
  rec_a : integer;
begin
  for rec_a:=low(tab) to high(tab) do
    write(tab[rec_a]:3);
  writeln();
end;


procedure MedianaW ( const tab:Tab10 );
var
  rec_a:Integer;
  suma:Integer;
begin
  suma:=0;
  for rec_a := low(tab) to high(tab) do
    inc(suma, tab[rec_a]);

  writeln(suma);
end;

end.

