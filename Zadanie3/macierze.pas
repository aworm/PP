unit macierze;
interface
const
  n = 2;
  losowosc = 10;

type
  kwadrat = Array [0..n,0..n] of Integer;


procedure wypelnij( var tab:kwadrat );
procedure wyswietl( const tab:kwadrat );
function wyznacznik( tab:kwadrat ):Integer;


implementation
function wyznacznik( tab:kwadrat ):Integer;
var
  rec_a:Integer;
  tmp:Integer;
begin
  writeln();
  tmp := 0;
  if ( high(tab) = 0 ) then
    wyznacznik := tab[1,1]
  else if ( high(tab) = 1 ) then
    wyznacznik := tab[0,0]*tab[1,1] - tab[0,1]*tab[1,0]
  else if ( high(tab) = 2 ) then
  begin
    for rec_a := low(tab) to high(tab) do
    begin
      tmp := tmp + tab[ low(tab) , rec_a ] * tab[ succ(low(tab)) , succ(rec_a) div (n+1) ] * tab[ succ(succ(low(tab))) , succ(succ(rec_a)) div (n+1) ];
    end;
    for rec_a := high(tab) downto low(tab) do
    begin
      tmp := tmp - tab[ low(tab) , rec_a ] * tab[ succ(low(tab)) , pred(rec_a) div (n+1) ] * tab[ succ(succ((low(tab))) , pred(pred(rec_a)) div (n+1) ];
      //writeln(tmp);
    end;
    wyznacznik := tmp;
  end
  else
    wyznacznik := 0;
end;

procedure wypelnij( var tab:kwadrat );
var
  rec_a, rec_b : Integer;
begin
  for rec_a:=low(tab) to high(tab) do
  begin
    for rec_b:=low(tab[rec_a]) to high(tab[rec_a]) do
    begin
      tab[rec_a,rec_b] := Random(losowosc);
    end;
  end;
end;

procedure wyswietl( const tab:kwadrat );
var
  rec_a, rec_b : Integer;
begin
  for rec_a:=low(tab) to high(tab) do
  begin
    for rec_b:=low(tab[rec_a]) to high(tab[rec_a]) do
    begin
      write(tab[rec_a,rec_b]:3);
    end;
    writeln();
  end;
end;

end.
