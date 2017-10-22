(*
Aplikacja wypisująca, zależnie od pierwszego parametru, sumę bądź iloczyn wpisanych parametrów wywolania
*)
program Zadanie1;
uses
  SysUtils;
var
   ilosc, rec_i, wynik : integer;
   operacja : string;
begin
  ilosc := ParamCount();

  if ilosc > 0 then
  begin
    operacja := ParamStr( 1 );
  end;

  if operacja = '*' then
  begin
    wynik := 1;
    for rec_i := 2 to ilosc do
    begin
      wynik := wynik * StrToInt(ParamStr(rec_i));
    end;
    writeln('Iloczyn parametrow wynosi ' , wynik);
  end else if operacja = '+' then
  begin
    wynik := 0;
    for rec_i := 2 to ilosc do
    begin
      wynik := wynik + StrToInt(ParamStr(rec_i));
    end;
    writeln('Suma parametrow wynosi ' , wynik);
  end else
  begin
  writeln('Nie wybrano poprawnej operacji arytmetycznej');
  end;

  readln();
end.

