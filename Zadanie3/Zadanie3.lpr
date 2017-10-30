program Zadanie3;
{
Procedura która uzupelni nam macierz N x N
Funkcja wyliczajaca wyznacznik macierzy dla N = 3 lub N = 4
}

uses macierze;

var
  tablica : kwadrat;
begin
  Randomize();

  wypelnij(tablica);
  wyswietl(tablica);

  writeln('Wyznacznik wynosi: ' , wyznacznik(tablica):3);
  //writeln(tablica[n,n], tablica[succ(3),succ(3)]);


  readln();

end.

