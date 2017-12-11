unit Dane;


interface

type
  Nazwa = string[25];

const
  losowosc = 19;
  imiona: array [0..losowosc] of Nazwa =
    ('Maria', 'Krystyna', 'Anna', 'Barbara', 'Teresa', 'Elzbieta', 'Janina',
    'Zofia', 'Jadwiga', 'Danuta', 'Halina', 'Irena', 'Ewa', 'Malgorzata', 'Helena',
    'Grazyna', 'Bozena', 'Stanislawa', 'Jolanta', 'Marianna');
  nazwiska: array [0..losowosc] of Nazwa =
    ('Nowak', 'Kowalski', 'Wisniewski', 'Wojcik', 'Kowalczyk',
    'Kaminski', 'Lewandowski', 'Zielinski', 'Szymanski',
    'Wozniak', 'Dobrowski', 'Kozlowski', 'Jankowski', 'Mazur',
    'Wojciechowski', 'Kwiatkowski', 'Krawczyk',
    'Kaczmarek', 'Piotrowski', 'Grabowski');
  pesele: array [0..losowosc] of int64 =
    (04230903737, 00213019310, 43012703831, 22031407450, 37042004415, 84052016538,
    80071304652, 45040605330, 61010817930, 73610201478, 18081203030,
    59031817259, 51033014252, 00301313951,
    76021318176, 40061901951, 40313009703, 42853109169, 55120119561, 82091804509);

  autor: array [0..losowosc] of Nazwa =
    ('Algorytmika praktyczna',
'Algorytmy genetyczne. Kompendium, t. 1',
'Algorytmy genetyczne. Kompendium, t. 2',
'AutoCAD 2013/LT2013/WS+. Kurs projektowania parametrycznego i nieparametrycznego 2D i 3D',
'Bezpieczeństwo informacji i usług w nowoczesnej instytucji i firmie',
'Bezpieczeństwo teleinformatyczne państwa',
'Copywriting internetowy',
'Cyfrowa rewolucja',
'Domeny internetowe',
'Hakerstwo',
'Handel elektroniczny',
'Homo players',
'Informacja w internecie',
'Informatyka@przyszłości',
'Inżynieria oprogramowania',
'Jak stworzyć najlepszy blog. WordPress 2.0',
'Kurs kadry i płace',
'Kurs księgowości komputerowej',
'Marketing z Google',
'Społeczeństwo informacyjne')


function DajImie(): Nazwa;
function DajNazwisko(): Nazwa;
function DajPESEL(): int64;

implementation

function DajImie(): Nazwa;
begin
  DajImie := imiona[Random(losowosc) + 1];
end;

function DajNazwisko: Nazwa;
begin
  DajNazwisko := nazwiska[Random(losowosc) + 1];
end;

function DajPESEL: int64;
begin
  DajPESEL := pesele[Random(losowosc) + 1];
end;

end.
