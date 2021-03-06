{
 Zadanie6: Dwie procedury
 Dodanie w srodek listy od najmlodszej do najstarszej osoby

 Usuwanie osoby o wskazanym numerze pesel

}
program Zadanie6;

uses
  Kartoteka,
  Crt,
  SysUtils;

const
  Komendy: set of char = ['A', 'a', 'S', 's', 'D', 'd', 'Q', 'q', 'W', 'w', 'E', 'e'];
var
  komenda: char = char(0);
  glowa: Pelem = nil;
  nowy: Pelem = nil;
  pesel:TPesel;

begin
  Randomize;
  glowa := nil;
  while komenda <> char(27) do
  begin

    if (komenda in Komendy) then
    begin
      clrscr();
      print(glowa);
    end;
    komenda := ReadKey();
    case komenda of
      'A', 'a': push(glowa);
      'S', 's': push_bck(glowa);
      'D', 'd':
      begin
        new(nowy);
        nowy^.Dane := CreateOsoba();
        nowy^.Next := nil;
        push_sort(glowa, nowy);
      end;
      'Q', 'q': pop(glowa);
      'W', 'w': pop_bck(glowa);
      'E', 'e': begin
        ReadLn(pesel);
        usun(glowa, pesel);
      end;
    end;

  end;

end.
