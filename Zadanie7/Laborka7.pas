{
Wypozyczanie - przepina ksiązki z bibioteki do studenta
Oddaj - przepina ksiązke od studenta i biblioteki
}
program Zadanie7;
uses
  Biblioteka,
  Crt,
  Dane;

const
  Operacje: set of Char = ['D', 'd', 'K', 'k', 'W', 'w', 'O', 'o'];
var
  KsiegoZbior: PKsiazka;
  Kartoteka: PStudent;

  operacja: Char = char(0);
  PESEL:Int64;
  ID: Integer;

begin
  Randomize;
  KsiegoZbior := nil;
  Kartoteka := nil;

  while (operacja <> char(27)) do
  begin
    if operacja in Operacje then
    begin
      ClrScr();
      WyswietlStudentow(Kartoteka);
      WriteLn();
      WyswietlListeKsiazek(KsiegoZbior);
    end;
    operacja:=ReadKey();

    case operacja of
      'D', 'd': DodajStudenta(Kartoteka);
      'K', 'k': DodajKsiazke(KsiegoZbior);
      'W', 'w':
        begin
          TextColor(3);
          Write('Podaj PESEL: ');
          {$I-}
          Readln(PESEL);
          Write('Podaj ID: ');
          ReadLn(ID);
          {$I+}
          TextColor(8);
          if (IOResult=0) then
            WypozyczKsiazke(Kartoteka, KsiegoZbior, ID, PESEL);
          end;
      'O', 'o':
        begin
          TextColor(3);
          Write('Podaj ID: ');
          {$I-}
          ReadLn(ID);
          {$I+}
          TextColor(8);
          if (IOResult=0) then
            OddajKsiazke(Kartoteka, KsiegoZbior, ID);
          end;
    end;
  end;
end.
