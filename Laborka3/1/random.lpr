program random1;
var
  plik : text;
  tab : Array[0..9] of integer;
  i : integer;
begin
  randomize();
  for i := low(tab) to high(tab) do
  begin
    tab[i] := Random(10) + 1;
  end;

  for i := low(tab) to high(tab) do
    write(tab[i]);
  writeln();
  readln();
end.

