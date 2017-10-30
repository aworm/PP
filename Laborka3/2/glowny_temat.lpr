program glowny_temat;
uses Unit1;
var
  i : integer;
  tab : Tab10;

begin
  Randomize();
  //Hello();
  //Kwadrat( i );

  Generuj(tab);
  Wyswietl(tab);

  MedianaW(tab);


  readln;
end.

