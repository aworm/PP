unit Dane;

interface
type
  Nazwa = string[25];
  NazwaDluga = string[50];

const
  losowosc = 19;
  imiona: array [0..losowosc] of Nazwa =
    ('Maria', 'Krystyna', 'Anna', 'Barbara', 'Teresa', 'Elzbieta',
    'Janina', 'Zofia', 'Jadwiga', 'Danuta', 'Halina', 'Irena', 'Ewa',
    'Malgorzata', 'Helena',
    'Grazyna', 'Bozena', 'Stanislawa', 'Jolanta', 'Marianna');
  nazwiska: array [0..losowosc] of Nazwa =
    ('Nowak', 'Kowalski', 'Wisniewski', 'Wojcik', 'Kowalczyk',
    'Kaminski', 'Lewandowski', 'Zielinski', 'Szymanski',
    'Wozniak', 'Dobrowski', 'Kozlowski', 'Jankowski', 'Mazur',
    'Wojciechowski', 'Kwiatkowski', 'Krawczyk',
    'Kaczmarek', 'Piotrowski', 'Grabowski');
  pesele: array [0..losowosc] of int64 =
    (14230903737, 10213019310, 43012703831, 22031407450, 37042004415, 84052016538,
    80071304652, 45040605330, 61010817930, 73610201478, 18081203030,
    59031817259, 51033014252, 10301313951,
    76021318176, 40061901951, 40313009703, 42853109169, 55120119561, 82091804509);
  tytuly: array [0..losowosc] of NazwaDluga =
    ('Algorytmika praktyczna', 'Algorytmy genetyczne.',
    'Algorytmy genetyczne. Kompendium, t. 2',
    'AutoCAD 2013/LT2013/WS+',
    'Bezpieczenstwo informacji i uslug',
    'Bezpiecze,stwo teleinformatyczne panstwa',
    'Copywriting internetowy', 'Cyfrowa rewolucja', 'Domeny internetowe', 'Hakerstwo',
    'Handel elektroniczny',
    'Homo players',
    'Informacja w internecie',
    'Informatyka@przyszlosci',
    'Inzynieria oprogramowania',
    'Jak stworzyc najlepszy blog. WordPress 2.0',
    'Kurs kadry i place',
    'Kurs ksiegowosci komputerowej',
    'Marketing z Google',
    'Spoleczenstwo informacyjne');
  autorzy: array [0..losowosc] of NazwaDluga =
    ('Piotr Stanczyk',
    'Tomasz Dominik Gwiazda',
    'Tomasz Dominik Gwiazda',
    'Andrzej Jaskulski',
    'Andrzej Bialas',
    'Redakcja: Marek Madej, Marcin Terlikowski',
    'Maciej Dutko',
    'Piotr Gawrysiak',
    'Maciej Dutko',
    'Tim Jordan',
    'Krzysztof Dobosz',
    'Dominika Urbańska-Galanciak',
    'Maciej Dutko, Magdalena Karciarz',
    'Witold Chmielarz, Jerzy Kisoelnicki, Tomasz Parys',
    'Krzysztof Sacha',
    'Lukasz Sosna, Pawel Lipiec',
    'Magdalena Chomuszko',
    'Magdalena Chomuszko, Natalia Sikorska',
    'Pawel Kobis',
    'Redakcja: Joanna Papinska-Kacperek');


function DajImie(): Nazwa;
function DajNazwisko(): Nazwa;
function DajPESEL(): int64;
function DajAutora(): NazwaDluga;
function DajTytul(): NazwaDluga;

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

function DajAutora: NazwaDluga;
begin
  DajAutora := autorzy[Random(losowosc) + 1];
end;

function DajTytul: NazwaDluga;
begin
  DajTYtul := tytuly[Random(losowosc) + 1];
end;

end.
