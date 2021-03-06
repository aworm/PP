program pliki;
(*Operacja na plikach
assign
rewrite    otwiera i kasuje albo tworzy
reset      otwiera istniejący plik i idzie na początek ( tylko do odczytu )
append     otwiera plik i ustawia się na koniec
close
*)
var
  plik : Text;       // zmienna plikowa która jest dedykowana dla operacji na plikach
  rec_i, rec_j : integer;
  linia : string;
begin
  assign(plik, 'sumowaie.txt');
(* Otworzenie pliku w trybie do modyfikacji, może go ewentualnie utworzyc*)
  rewrite(plik);
  rec_i := 1;
  rec_j := 1;
  while rec_i <= 10 do
  begin
    repeat
      write(plik, rec_i*rec_j:4);
      rec_j := rec_j + 1;
    until rec_j > 10;
    rec_j := 1;
    writeln(plik);
    rec_i := rec_i + 1;
  end;
  writeln(plik);

(* Reset na początek pliku w trybie do odczytu, wypisujemy wszystkie linie *)
  reset(plik);
  while not(eof(plik) ) do
  begin
    readln(plik, linia );
    writeln(linia);
  end;



  close(plik);
  readln;

end.

