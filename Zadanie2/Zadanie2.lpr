program Zadanie2;
(*
Stworzyć dwie tablice dwówymiarowe tab1 i tab2
Prosimy o uzupelnienie danymi użytkownika             'dev on board'
Przemnozyc macierze a wynik zapisac w pliku
*)
var
  tab1, tab2 : Array [0..9,0..9] of Integer;
  plik : Text;
  rec_i, rec_j, rec_k : integer;
  iloczyn : integer;
begin
  Randomize();
  Assign(plik, 'macierz.txt');
  Rewrite(plik);

  for rec_i := low(tab1) to high(tab1) do
  begin
    for rec_j := low(tab1[rec_i]) to high(tab1[rec_i]) do
    begin
      tab1[rec_i, rec_j] := Random(10);
      tab2[rec_i, rec_j] := Random(10);
    end;
  end;

  for rec_i := low(tab1) to high(tab1) do
  begin
    for rec_j := low(tab1[rec_i]) to high(tab1[rec_i]) do
    begin
      write( plik, tab1[rec_i, rec_j]:4 );
    end;
    write(plik, char(9));
    for rec_j := low(tab2[rec_i]) to high(tab2[rec_i]) do
    begin
      write( plik, tab2[rec_i, rec_j]:4 );
    end;
    writeln(plik);
  end;

  writeln(plik);

  for rec_i := low(tab1) to high(tab1) do
  begin
    for rec_j := low(tab2[rec_i]) to high(tab2[rec_i]) do
    begin
      iloczyn := 0;
      for rec_k := low(tab1[rec_i]) to high(tab1[rec_i]) do
      begin
        iloczyn := iloczyn + (tab1[rec_i,rec_k]*tab2[rec_k,rec_j]);
      end;
      write(plik, iloczyn:4);
    end;
    writeln(plik);
  end;

  close(plik);
end.

