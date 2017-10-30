program funkcje;

uses
  unit1,
  funk;

var
  tab : tab10;

begin
  Generuj( tab );
  //wyswietl(GenerujUn(10));
  tab := GenerujUn(10);
  Wyswietl(tab);
  Sort(tab);
  Wyswietl(tab);


  //writeln( Max( tab));



  readln();
end.

