{
Procedure Usun ( ? tab:Tklaser, nazwa:String );
  usuwa maksymalnie jeden element z tablicy o zadanej nazwie,
procedure Modyfikuj ( tab:TKlaser, indeks:Integer );
  modyfikuje w tablicy jeden element o indeksie zadanym
procedure dodaj2 ( tKlaser )
  dodaje znaczek w pierwsze wolne miejsce
Procedure zapisztxt ( tab tKlaser )
  zapisuje dane do pliku TXT, w postaci
#          nazwa      rok prod      nominal
}
program project1;

uses
  filatel,
  Crt;

const
  sciezka: string = 'baza';
  sciezkaTxt: string = 'baza.txt';
var
  komendy : set of Char = ['U', 'u', 'D', 'd', 'M', 'm', 'Z', 'z', 'T', 't', 'O', 'o', Char(0)];
  klaser1: tKlaser;
  tmpNazwaZnaczka: string;
  tmpIndeksZnaczka: integer;
  sterowanie: char = char(0);
begin
  Randomize();
  klaser1 := DodajZnaczki();

  while sterowanie <> char(27) do
  begin
    if ( sterowanie in komendy ) then
    begin
      ClrScr();
      TextColor(LightBlue);
      writeln('(U)sun / (D)odaj / (M)odyfikuj / (Z)apisz / zapisz(T)xt / (O)dczytaj / (ESC)');
      TextColor(White);
      WypiszKlaser(klaser1);
    end;
    sterowanie := ReadKey();
    case sterowanie of
      'U', 'u':
      begin
        WriteLn();
        Write('Podaj nazwe zaczka, ktorego chcesz usunac: ');
        readln(tmpNazwaZnaczka);
        UsunZnaczek(klaser1, tmpNazwaZnaczka);
      end;
      'D', 'd': DodajZnaczek2(klaser1);
      'M', 'm':
      begin
        WriteLn();
        Write('Indeks znaczka ktorego chcesz modyfikowac');
        ReadLn(tmpIndeksZnaczka);
        ModyfikujZnaczek(klaser1, tmpIndeksZnaczka);
      end;
      'Z', 'z': ZapiszDoPliku(klaser1, sciezka);
      'T', 't': ZapiszDoPlikuTXT(klaser1, sciezkaTxt);
      'O', 'o': OdczytajDane(klaser1, sciezka);
    end;
  end;
end.
