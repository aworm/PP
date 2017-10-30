program project1;
type
  tDniTygodnia = ( pn, wt, sr, cz, pi, so, nd );
var
  liczba : integer;
  i: shortint;
  y: smallint;
  x: integer;
  d : tDniTygodnia;

begin
  //liczba := maxlongint;
  //writeln( liczba , ' popszednik: ' , pred(liczba) , ' nastepnik: ' , succ(liczba) , ' numer: ' , ord(liczba) );
  //dec(liczba, (maxint div 2 ));
  //writeln( high(liczba) , ' ' , maxint );
  //writeln ( high(x), ' ' , high(y) , ' ' , high(i) );
  //writeln ( $10:5 );
  d := tDniTygodnia(0);
  write(d, tDniTygodnia(succ(ord(cz))) );


  readln();
end.

