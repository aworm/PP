program tablice;
var
  //tablica : array[0..9] of integer;
  tablica2 : array[0..9,0..9] of integer;
  rec_i, rec_j : integer;
  //tablicaZ1 : array[1..100] of integer;
  //tablicaZ2 : array[1..10] of integer;
  //suma, max, min, tmp : integer;
  //srednia : real;
  plik : Text;
begin
  //for rec_i := 0 to 9 do
  //begin
  //  tablica[rec_i] := rec_i*10; //write(tablica[rec_i], rec_i*10);
  //end;
  //
  //for rec_i := 0 to 9 do
  //begin
  //  write(tablica[rec_i]:3);
  //end;
  //writeln();

  for rec_i := low(tablica2) to high(tablica2) do
  begin
    for rec_j := low(tablica2[rec_i]) to high(tablica2[rec_i]) do
    begin
      tablica2[rec_i][rec_j] := (rec_i+1)*(rec_j+1);
    end;
  end;



  //for rec_i := 0 to 9 do
  //begin
  //  for rec_j := 0 to 9 do
  //  begin
  //    write(tablica2[rec_i][rec_j]:4);
  //  end;
  //  writeln();
  //end;
  assign(plik, 'tabelka.txt');
  rewrite(plik);
  for rec_i := 0 to 9 do
  begin
    for rec_j := 0 to 9 do
    begin
      write(plik,tablica2[rec_i][rec_j]:4);
    end;
    writeln(plik);
  end;
  close(plik);

(* 1. Napisać program, który wypełni 100 elementową tablicę losowymi wartościami, wypiszę ich sumę,
minimalną wartość i maksymalną wartość. *)
  //randomize;
  //for rec_i := 1 to 100 do
  //begin
  //  tablicaZ1[rec_i] := random(1000)+1000;
  //end;
  //
  //suma := 0;
  //max := 0;
  //min := 2000;
  //for rec_i := 1 to 100 do
  //begin
  //  suma := suma + tablicaZ1[rec_i];
  //  if ( max < tablicaZ1[rec_i] ) then max := tablicaZ1[rec_i];
  //  if ( min > tablicaZ1[rec_i] ) then min := tablicaZ1[rec_i];
  //end;
  //srednia := suma / 100;
  //writeln( 'Srednia: ' , srednia:1:3, ' Min ' , min , ' Max ' , max );

(* 2. Wczytaj od użytkownika 10 liczb do tablicy, a następnie odwróć ich kolejność w tablicy *)
  //randomize;
  //for rec_i := 1 to 10 do
  //begin
  //  tablicaZ2[rec_i] := random(100);
  //  write(tablicaZ2[rec_i]:4);
  //end;
  //writeln();
  //
  //for rec_i := 1 to (length(tablicaZ2)div 2) do
  //begin
  //  tmp := tablicaZ2[rec_i];
  //  tablicaZ2[rec_i] := tablicaZ2[length(tablicaZ2)-rec_i + 1];
  //  tablicaZ2[length(tablicaZ2)-rec_i+1] := tmp;
  //end;
  //
  //for rec_i := 1 to length(tablicaZ2) do
  //begin
  //  write(tablicaZ2[rec_i]:4);
  //end;
  //writeln();

  readln;
end.

