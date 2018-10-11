---
title: Ruby cheat sheet
subtitle: dopisac
author: Krzysiek Komar
type: post
date: 2018-10-10
url: /2018/10/10/ruby-cheat-sheet/
categories:
  - Programowanie
tags:
  - Ruby

---

Jakis tekst. Jakis tekst. Jakis tekst. Jakis tekst. Jakis tekst. Jakis tekst. Jakis tekst. Jakis tekst. Jakis tekst. Jakis tekst. Jakis tekst. 

Opisać w zdaniu, normalnie 
Wielkość znaków ma znaczenie
        
   zmienne_sa_pisane_snaked_casem
   
   tab = 2 spacje



- `a = 12`, `b = 'test'`, `c = false` - deklaracja zmiennych
- `"test " * 4` zwróci `"test test test test"`
- `[1, 2] * 2` zwróci `[1, 2, 1, 2]`
- `a = a.strip` można zapisać jako `a.strip!` - wywołanie funkcji z wykrzyknikiem nadpisuje wartość
- **`puts 'tekst'`** - wyświetlenie czegoś w konsoli
- **`name = gets`** - pobranie danych z konsoli do zmiennej `name`
- **`test.class`** - zwróci nazwę klasy zmiennej `test`
- **`test.methods`** - lista wszystkich metod zmiennej `test`
- **`test.public_methods`** - lista tylko metod publicznych
- **`String.superclass`** - klasa nadrzędna danej klasy
- Liczby binarne  zapisuje się jako `0b101010`, szesnastkowe jako `0xFA5B`.
- W liczbach można używać podkreślników, Ruby je ignoruje, np `564_8758_98` da nam wynik `564875898`
- Komentarze zaczyna się od hasha (znak #)
- **`b = a.clone`** - klonuje zmienną lub obiekt. Zwykłe przypisanie tylko kopiuje referencję
- **`p obiekt`** - wyświetla wszystkie wartości zmiennych danego obiektu. Jest to skrót od `object.inspect`

```ruby
#<Spaceship:0x02a2f7e0 @name="serenity", @cargo=12, @weight=222.22>
```


#### Zmienne
- `zmienna = 10` - przypisanie wartości
- `tablica = [1, 2, 3, 4]` - zwykła tablica
- `$zmienna_globalna` - zaczyna się od znaku dolara

#### Metody
Metody zawsze zwracają to, co jest w ostatniej linijce. Nie używa się słowa return.
```ruby
def metoda(argument)
  argument * 2
end
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


### Metody i zmienne klasy


### Inne
#### Zmiana widzialności metod i zmiennych (private, public)
#### Monkey patching oraz open classes






# Instrukcje warunkowe






