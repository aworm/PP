{
Wypozyczanie - przepina ksiązki z bibioteki do studenta
Oddaj - przepina ksiązke od studenta i biblioteki
}
program Laborka7;

uses
  Biblioteka,
  Crt,
  Dane;

const
  Operacje: set of char = ['D', 'd', 'K', 'k', 'W', 'w'];
var
  KsiegoZbior: PKsiazka;
  Kartoteka: PStudent;

  operacja: char = char(0);
  PESEL:Int64;
  id:string;

begin
  Randomize;
  KsiegoZbior := nil;
  Kartoteka := nil;

  while (operacja <> char(27)) do
  begin

    operacja := ReadKey();
    if operacja in Operacje then
    begin
      ClrScr();
      WyswietlStudentow(Kartoteka);
      WriteLn();
      WyswietlListeKsiazek(KsiegoZbior);

      case operacja of
        'D', 'd': DodajStudenta(Kartoteka, DajImie(), DajNazwisko(), DajPESEL());
        'K', 'k': DodajKsiazke(KsiegoZbior, 'Boleslaw Prust', Char(Random(20)+Int('a')), Random(100));
        'W', 'w':
          begin
            Readln(PESEL);
            ReadLn(ID);
            WypozyczKsiazke(Kartoteka, KsiegoZbior, ID, PESEL);

          end;
      end;
    end;

  end;
end.
