unit funk;

interface
uses Unit1;


function Max(const tab:Tab10):Integer;

function GenerujUn(n:Integer):Tab10;

procedure Sort(var tab:Tab10);

//procedure Sortujaca( tab:Tab10 )
//function Mediana(tab:Tab10):Integer;


implementation

procedure Sort(var tab:Tab10);
var
  rec_a, rec_b : Integer;
  tmp : Integer;

begin
  for rec_a := low(tab) to high(tab) do
  begin
    for rec_b := low(tab) to high(tab)-rec_a-1 do
    begin
      if( tab[rec_b] > tab[rec_b+1] )then
      begin
        tmp := tab[rec_b+1];
        tab[rec_b+1] := tab[rec_b];
        tab[rec_b] := tmp;
      end;
    end;
  end;



end;

function Max(const tab:Tab10):Integer;
var
  rec_a : Integer;
  temp : Integer;
begin
  temp := tab[1];
  for rec_a := low(tab)+1 to high(tab) do
  begin
    if ( temp > tab[rec_a] ) then
    begin
      temp := tab[rec_a];
    end;
  end;
  result:=temp;
end;

//procedure Sortujaca( tab:Tab10 )
//begin
//  for
//end;

function GenerujUn(n:Integer):Tab10;
var
  rec_a, rec_b:Integer;
  tablica:Tab10;
  tmp, licznik:integer;
  unikat:boolean;
begin
  for rec_a := low( tablica ) to high( tablica ) do
  begin
    licznik:=0;
    repeat
      licznik:=licznik+1;
      unikat:= true;
      tmp:=random(n);
      for rec_b:=low(tablica) to rec_a do
      begin
        if (tablica[rec_b] = tmp ) then unikat := false
      end;
    until (unikat = true ) or ( licznik = 1000 ) ;
    tablica[rec_a] := tmp;
  end;
  GenerujUn := tablica;
end;

end.

