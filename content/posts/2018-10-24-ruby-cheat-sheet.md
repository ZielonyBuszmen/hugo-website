---
title: Ruby - ściągawka
author: Krzysiek Komar
type: post
date: 2018-10-24
url: /2018/10/24/ruby-sciagawka/
categories:
  - Programowanie
tags:
  - Ruby

---

Ruby jest dosyć rozbudowanym językiem pod względem semantyki. Sam język ma lukier składniowy (_syntax sugar_) prawie na każdy element. Dlatego poniżej wrzucam małą ściągawkę ze składni. Post jest dosyć rozbudowany, dlatego polecam go przeszukiwać, a nie czytać w całości.

### _Spis treści_
    
 - [Typy wbudowane](#typy-wbudowane)
    - [Tablice](#tablice)
    - [Hashe](#hashe)
    - [Zakresy (Range)](#zakresy-range)
    - [Splat Operator](#splat-operator)
 - [Klasy i obiekty](#klasy-i-obiekty)
     - [Akcesory](#akcesory)
     - [Konstruktory](#konstruktory)
     - [Dziedziczenie](#dziedziczenie)
     - [Zmienne i metody klasy](#zmienne-i-metody-klasy)
     - [Inne](#inne)
          - [Konstrola dostępu](#konstrola-dostępu-private-public)
          - [Monkey patching & Open classes](#monkey-patching-open-classes)
 - [Sterowanie przepływem](#sterowanie-przepływem)
     - [Warunki](#warunki)
     - [Przypisywanie warunkowe](#przypisywanie-warunkowe)
     - [Konstrukcja `case`](#konstrukcja-case)
     - [Pętle](#pętle)
     - [Iteratory i bloki](#iteratory-i-bloki)
     - [Kontrola wykonywania pętli](#kontrola-wykonywania-pętli)
     - [Wyjątki](#wyjątki)
          - [Obsługiwanie wyjątków](#obsługiwanie-wyjątków)
          - [Rzucanie wyjątków](#rzucanie-wyjątków)
          - [`ensure` & `else`](#ensure-else)
          - [Ponawianie prób](#ponawianie-prob)

Warto zaznaczyć, że w Ruby wielkość znaków ma znaczenie. Nazwy zmiennych `Ble` oraz `ble` są rozróżniane i wykrywane jako dwie różne. Nazwy zmiennych, metod i symboli piszemy `snake_casem`. Klasy i moduły nazywamy `CamelCasem`. Jako `tab` używamy dwóch spacji.
Więcej o konwencji nazwniczej [można znaleźć tutaj](https://github.com/rubocop-hq/ruby-style-guide#naming)

- **`puts 'tekst'`** - wyświetlenie tekstu w konsoli
- **`name = gets`** - pobranie danych z konsoli do zmiennej `name`
- **`test.class`** - zwróci nazwę klasy zmiennej `test`
- **`test.methods`** - lista wszystkich metod zmiennej `test`
- **`test.public_methods`** - lista tylko metod publicznych
- **`String.superclass`** - klasa nadrzędna danej klasy
- `"test " * 4` zwróci `"test test test test"`
- `[1, 2] * 2` zwróci `[1, 2, 1, 2]`
- `a = a.strip` można zapisać jako `a.strip!` - wywołanie funkcji z wykrzyknikiem nadpisuje wartość
- Liczby binarne  zapisuje się jako `0b101010`, szesnastkowe jako `0xFA5B`.
- W liczbach można używać podkreślników, Ruby je ignoruje, np `564_8758_98` da nam wynik `564875898`
- Komentarze zaczyna się od hasha (znak #)
- **`b = a.clone`** - klonuje zmienną lub obiekt. Zwykłe przypisanie tylko kopiuje referencję
- **`p obiekt`** - wyświetla wszystkie wartości zmiennych danego obiektu. Jest to skrót od `object.inspect`

```ruby
#<Spaceship:0x02a2f7e0 @name="serenity", @cargo=12, @weight=222.22>
```

<style>
p {
    margin-top: 10px;
}

h1 {
  margin-top: 30px;
}

h4 {
    margin-top: 20px;
}
</style>
#### Zmienne
- `zmienna = 10`, `b = 'test'`, `c = false` - zadeklarowanie zmiennych i przypisanie wartości
- `tablica = [1, 2, 3, 4]` - zwykła tablica
- `$zmienna_globalna` - zaczyna się od znaku dolara

#### Metody
Metody zawsze zwracają to, co jest w ostatniej linijce. Nie używa się słowa return.
```ruby
def metoda(argument)
  argument * 2
end
```


# Typy wbudowane
- `true` to obiekt klasy `TrueClass`. `false` to obiekt klasy `FalseClass`
- Po `Integer` dziedziczą dwie klasy: `Fixnum` (mniejsze liczby) oraz `Bignum` (duże liczby).
- Liczbę`Float` zapisujemy jako `2.0`
- Obiekty reprezentujące liczby są **read only**! Dlatego nie ma operatora `++` ani `--`
- Wyświetlanie znaków specjalnych w stringach za pomocą `%q`:

```ruby
%q('Zielony' buszmen) # => 'Zielony' buszmen
%q<'Zielony' buszmen>
%q{'Zielony' buszmen}
```

- Podwójne cudzysłowy `"` umożliwiają _interpolację_:

```ruby
counter = 20
qty = 2
puts "Licznik: #{counter}" # interpolacja
puts "Ilość: #{counter * qty}"
```

- Metody i operatory klasy `String`:

```ruby
puts "Hello world"[1] # => "e"
puts "Hello world"[1, 4] # => "ello"

a = "Hello world"
a["world"] = "sky"
puts a # => "Hello sky"

puts "ble " * 3 # => "ble ble ble "

puts "%05d" % 321 # => "00321"
puts "%.4g" % 3.14151692653 # => "3.142"

puts "aa" + "bbb" # => "aabbb"
```

### Tablice
```ruby
arr = [] # pusta tablica
arr = Array.new(3) # [nil, nil, nil]
arr = Array.new(3, "abc") # ["abc", "abc", "abc"], każdy element to ten sam obiekt
arr = Array.new(3) { "abc" } # ["abc", "abc", "abc"], każdy element to inny obiekt
arr[-1] # ostatni element tablicy
arr[1..3] # zwróci elementy od 1 do 3 włącznie
```

### Hashe
```ruby
h = {} # pusty hash
h = {"min" => 0, "max" => 10}
h["max"]

z = {:min => 0, :max => 10}
z = {min: 0, max: 10}
z[:max]

z.each { |k, v| puts "#{k}: #{v}" } # wyświetlenie wszystkich wartości hasha
```

### Zakresy (Range)
```ruby
(1..7)  # [1, 7]
(1...7) # [1, 7)
```

### Splat Operator
```ruby
a, *b = get_values  # a == 1, b == [2, 3, 4]
a, *b, c = get_values  # a == 1, b == [2, 3], c == 4
```


# Klasy i obiekty
```ruby
class Spaceship
  def launch(destination)
    @destination = destination
  end
end

ship = Spaceship.new
ship.launch 'Andromeda'
```

Jest to klasa `Spaceship`, która zawiera metodę `launch`. Metoda ta przyjmuje jeden parametr - `destination`. Konstrukcja `@destination` to odwołanie się do stanu obiektu (odpowiednik `this.zmienna` z C#)

Na samym dole tworzymy obiekt tej klasy poprzez wywołanie metody `new`. Następnie wywołujemy metodę `launch` przekazując do niej string `'Andromeda'`.

Metody w klasie są domyślnie publiczne, zmienne są domyślnie prywatne.

### Akcesory

```ruby
class Person
  def name
    @name
  end

  def name=(str)
    @name = str
  end
end

pablo = Person.new
pablo.name = 'Pablo' # Przypisanie wartości
p pablo.name # wyświetlenie wartości => "Pablo"
```

Pierwsza funkcja to getter, zwraca zmienną `name`, natomiast druga to stter - ustawia jej wartość.

Powyższy kod można skrócić - Ruby oferuje tzw **akcesory**. Zobaczmy:

```ruby
class Person
  attr_accessor :name
end

pablo = Person.new
pablo.name = 'Pablo'
p pablo.name # => "Pablo"
```

Powyższa konstrukcja (`attr_accessor`) umożliwia odczyt i zapis zmiennej. Aby umożliwić sam odczyt, możemy skorzystać z **`attr_reader`**. Istnieje analogiczny sposób na umożliwienie samego zapisu - **`attr_writer`**


### Konstruktory - `initialize`

```ruby
class Person
  def initialize(name, age, height)
    @name = name
    @age = age
    @height = height
  end
end

zielony = Person.new('Zielony', 128, 12.5)
```

Konstruktor tworzymy za pomocą metody `initialize`. Tworząc nowy obiekt, wywołanie metody `new` wywołuje także metodę `initialize` z naszej klasy.


### Dziedziczenie - **`<`**

```ruby
class Probe
  def deploy
    # wypuszcza próbnik
  end

  def take_sample
    # pobiera ogólną próbkę
  end
end


class MineralProbe < Probe
  def take_sample
    # pobiera próbkę minerałów
    super() # wywołanie przesłoniętej metody z klasy rodzica
  end
end


class SpaceProbe < Probe
  def take_sample
    # pobiera próbkę z przestrzeni kosmicznej
    super # wywołanie przesłoniętej metody z klasy rodzica
  end
end
```

Dziedziczenie jest realizowane operatorem `<`. Aby odwołać się do metody z klasy nadrzędnej, wywołujemy metodę `super()` (możliwa notacja bez nawiasów - `super`).


### Zmienne i metody klasy

```ruby
class Car
  @@amount = 0 # zmienna klasowa

  def initialize
    @@amount += 1
  end

  def self.count # metoda klasy
    @@amount
  end

  def count_normally # metoda instancji
    @@amount
  end
end

Car.new
Car.new
bla = Car.new

p bla.count_normally # => 3
p Car.count # => 3
```

Zmienna `amount` jest taka sama we wszystkich klasach, które by dziedziczyły po klasie `Car`

### Inne:

#### Konstrola dostępu (private, public)

```ruby
class Probe
  private # wszystkie metody będą prywatne

  def deploy 
    # ...
  end

  public # wszystkie metody będą publiczne

  def take_sample
    # ...
  end

  def turn_off
    # ...
  end
end
```

Identyczne działanie zapewnia konstrukcja:

```ruby
class Probe
  def deploy
  end

  def take_sample
  end

  def turn_off
  end

  private :deploy # wpisujemy metody, które mają być prywatne
  public :take_sample, :turn_off # to jest nadmiarowe, bo domyślnie wszystkie metody są publiczne
end
```


#### Monkey patching & Open classes
Termin __Open classes__ oznacza, że możemy deklarować jedną klasę w wielu miejscach, dodając jej po jednej metodzie. Możemy też dowolnie nadpisywać jakieś metody innymi. Dzięki temu, Ruby umożliwia tzw __Monkey Patching__, czyli np dodawanie do wbudowanej klasy String nowych metod. Możliwe też jest ich nadpisywanie:

```ruby
class String
  def cos_tam
    'nic konkretnego'
  end
end

a = 'abcdef'
p a.length # => 6 - wbudowana metoda w string
p a.cos_tam # => "nic konkretnego" - nasza nowa metoda
```


# Sterowanie przepływem

### Warunki

```ruby
if can_run?
  run
else
  wait
end

message = if counter > 10 then 'Go out' else 'Wait' end

run if can_run?

if fuel_level > 50
  set_fuel_light('green')
elsif fuel_level > 24
  set_fuel_light('yellow')
end
```

- `false` i `nil` są traktowane jako **`false`**
- reszta, czyli `true`, `0`, `''` (pusty string), `[]` (pusta tablica) - są traktowane jako **`true`**
- konwertowanie do boola można dokonać operatorem `!!`, np `!![]`

```ruby
# if not == unless

unless fuel_level < 25
  launch
end

launch unless fuel_level < 25


# Ternary operator ?: (operator trójargumentowy)
can_launch ? launch : stop
```

### Przypisywanie warunkowe

```ruby
# przypisze się tylko wtedy, gdy ship nie ma wartości
ship ||= Spaceship.new
ship = Spaceship.new unless ship
```

### Konstrukcja `case`

```ruby
case distance_from_here
when 'far away'
  go_close
when 'close to'
  dock
else
  alarm 'error'
end

# case zwraca także wartości
result = case distance_from_here
         when 'far away'
           100
         when 'close to'
           50
         end
         
# bardziej zwięzła forma ze słówkiem then
result = case distance_from_here
         when 'far away' then 100
         when 'close to' then 50
         end
```


### Pętle
- **pętla `while`** - trzy sposoby zapisu:

```ruby
while hight_alert?
  sound_system.alarm
end

while hight_alert? do sound_system.alarm end

sound_system.alarm while hight_alert?
```

- **pętla `until`**, czyli while not (dopóki nie):

```ruby 
until no_fuel?
  accelerate
end

until no_fuel? do accelerate end

accelerate until no_fuel?
```

- **`begin/end`** - wykona się przynajmniej raz, nawet jeśli warunek jest od początku fałszywy:

```ruby
begin
  light.start_falshing
  sound.play_siren
end while alarm?
```

- **`for`**:

```ruby
for i in [3, 2, 1]
  puts i
end

# wyświetli liczby od 1 do 15 (z zakresu - rage)
for i in (1..15)
  puts i
end
```

### Iteratory i bloki

Blok zaczyna się od `do`, kończy na `end`. Jest to _specjalny_ argument przekazywany do funkcji. Konstrukcja `|element|` to parametr
```ruby
[1, 2, 3].each do |element|
  puts element
end

# równoznaczne z wcześniejszym
[1, 2, 3].each {|element| puts element}


# nieskończona pętla
loop do
  puts 'Infinity loop'
end
```

### Kontrola wykonywania pętli

- **`next`**  przechodzi do kolejnej iteracji:

```ruby
while message = stream.get_message
  next if message.type == 'sync'
  message.process
end
```

- **`break`**  wychodzi z pętli:

```ruby
while message = stream.get_message
  message.process
  break if message.type == 'undefined'
end

# instrukcja break może zwrócić wartość z pętli ('result')
result = while message = stream.get_message
           message.process
           break 'result' if message.type == 'undefined'
         end
```

- **`redo`**  powtarza iterację bez ponownego sprawdzania warunku:

```ruby
i = 0
while i < 3
  print 'Podaj liczbę: '
  input = gets.to_i
  redo if input <= 0
  i += 1
end
```


### Wyjątki

#### Obsługiwanie wyjątków

`begin` oraz `end` to _blok obsługi_ wyjątków. Łapanie ich odbywa się w sekcji `rescue`:

```ruby
def launch
  begin
    not_implemented_method # ta metoda nie istnieje
  rescue 
    puts 'Nie mozna wykonac'
    return false
  end
end

# to samo co wyżej, tylko blok (begin ... end) obejmuje całą funkcję
def launch
  not_implemented_method
  turn_on_lights
  true
rescue
  puts 'Nie mozna wykonac'
  false 
end
```

Możliwe jest łapanie wyjątków określonego typu i przechwytywanie ich właściwości. (`RuntimeError` dziedziczy po `StandardError`, a `StandardError` dziedziczy po `Exception`)
```ruby
def launch
  not_implemented_method
  turn_on_lights
rescue StandardError => e
  puts e.message
  puts e.backtrace
  false
end

# łapanie kilku wyjątków
def launch
  not_implemented_method
  turn_on_lights
rescue LightsError
  puts 'Lights error'
  true
rescue StandardError => e
  puts e.backtrace
  false
end
```

#### Rzucanie wyjątków

```ruby
# Wyrzucenie wyjątku z wiadomością
def turn_on_lights
  # ...
  raise 'No energy' # ==> RuntimeError
  # ...
end

# Wyrzucenie własnego wyjątku z wiadomością
def turn_on_lights
  # ...
  raise LightError, 'No energy'
  # ...
end
```

#### `ensure` & `else`
Kilka możliwych wyjść z metod utrudnia np. zamknięcie pliku. Z pomocą przychodzi blok `ensure`, który wykona się zawsze, nie ważne czy został złapany wyjątek, czy też nie.
Sekcja `else` wykona się tylko wtedy, gdy funkcja nie rzuci żadnego wyjątku (`ensure` wykona się zaraz po `else`).

```ruby
def read_book
  book = File.open('book.txt')
  # ...
  raise BookError, 'Bad book' if review.bad? # wyjście z metody
  # ...
  true # wyjście z metody
rescue
  # łapiemy błędy z funkcji
  false # wyjście z metody
else
  puts 'Brak wyjątków, wszystko poszło jak trzeba'
ensure
  book.close if book # zamykamy plik
end
```

#### Ponawianie prób 

```ruby
def fetch_book
  book = API.request('/book/1')
  # ...
rescue RuntimeError => e
  attempts ||= 0
  attempts += 1
  if attempts < 3 # próbujemy 3 razy połączyć się z API
    puts e.message + '. Ponawiam próbę'
    retry # przenosi wykonywanie na początek metody (bloku begin..end)
  else
    puts 'Niepowodzenie.'
    raise
  end
end
```
