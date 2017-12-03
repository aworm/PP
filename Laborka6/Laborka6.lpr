program Laborka6;

uses Kartoteka, Crt;

const
  Komendy : set of Char = [ 'D', 'd', 'K', 'k', 'U' , 'u' ];
var
  komenda:char=char(0);
  glowa:Pelem;

begin
  Randomize;
  glowa:=nil;

  while komenda<>char(27) do
  begin
    if (komenda in Komendy) then
    begin
      clrscr();
      print(glowa);
    end;
    komenda:=ReadKey();

    case komenda of
      'D','d' : push(glowa);
      'K','k' : push_bck(glowa);
      'U','u' : pop(glowa);
    end;

  end;


end.

