program Zadanie3;
{
Procedura która uzupelni nam macierz N x N
Funkcja wyliczajaca wyznacznik macierzy dla N = 4
}
uses macierze, unit1;
var
  tablica : kwadrat;
begin
  Randomize();

  wypelnij(tablica);
  //wyswietl(tablica);

  writeln('Wyznacznik wynosi: ' , wyznacznik(tablica):3);

  readln();
end.

