---
title: Metody na metody w Ruby
author: Krzysiek Komar
type: post
date: 2018-11-24
url: /2018/11/24/metody-na-metody-ruby
categories:
  - Programowanie
tags:
  - Ruby    

---

Tak jak już wspominałem w poprzednim artykule, Ruby ma _syntax sugar_ na wszystko. Także na deklarowanie i wywoływanie metod. W rozbudowanej składni łatwo się pogubić. W tym artykule przedstawię część składni, na którą można natrafić na początku nauki.

____

Ten wpis jest jednym z serii o _Ruby_, które pojawiły się na blogu:

1. [Ruby - ściągawka](/2018/10/24/ruby-sciagawka/)
2. **Metody na metody w Ruby**
3. [Bloki i moduły w Ruby](/2019/02/17/bloki-i-moduly/)

____


### Domyślne parametry

Tak jak w większości języków programowania, w Ruby istnieją wartości domyślne parametrów metody. Parametry mogą być zwykłym symbolem, liczbą bądź stringiem.

```ruby
def create_machine(type = :press, size = 'very big')
  # ...
end
```

Dodatkowo, domyślny parametr może być warunkiem bądź wynikiem wywołania funkcji:

```ruby
def create_machine(type = :press, size = (type == :press ? :big : :small))
  # ...
end

def create_machine(type = :press, size = calc_size(type))
  # ...
end
```

Jak by tego było mało, domyślne parametry nie muszą być koniecznie na końcu listy. Możemy równie dobrze umieścić je na samym początku:

```ruby
# `name` nie ma wartości domyślnej, jest ostatnie na liście
def create_machine(type = :press, size = :big, name) 
  # ...
end

# przekazujemy jawnie tylko parametr `name`
create_machine('machine') 

# przekazujemy jawnie parametr `type` i `name`
create_machine(:typeB, 'machine') 
```


### Zmienna ilość parametrów

Aby odczytać _wszystkie_ parametry przekazane do funkcji, wystarczy użyć operatora _splat_, czyli gwiazdki (_*_)

```ruby
def produce_machines(days, *types)
  # ...
end

produce_machines(5, :aircraft, :explorer, :android)
```
Zmienna `types` jest tablicą, której wartości to kolejne parametry. W naszym przypadku tablica ta będzie miała postać `[:aircraft, :explorer, :android]`.


### Argumenty nazwane

W Ruby możemy tworzyć _argumenty nazwane_. Przy wywoływaniu funkcji będziemy musieli jawnie podać nazwę argumentu wraz z wartością:

```ruby
# definicja funkcji z argumentami nazwanymi
def create_machine(type:, size:, name:, weight:)
  # ...
end

# zauważmy, że przy wywołaniu parametry mogą być podawane w dowolnej kolejności
create_machine(name: 'clever',type: :champ, size: 'm', weight: 200)
```

_Argumenty nazwane_ mogą posiadać także swoje domyślne wartości:

```ruby
def create_machine(type: 'something', size: :big, name: 'noname', weight: 100)
  # ...
end

create_machine(type: :champ, size: 'm')
```

Tak jak w przypadku zwykłych argumentów, funkcja może przyjmować zmienną ilość _argumentów nazwanych_. Użyjemy do tego _double splat operator_ (czyli `**`):

```ruby
def create_machine(type: :press, **elements)
  # ...
end

create_machine(type: :champ, size: 'm', weight: 200, name: 'clever')
```

Zmienna `elements` będzie zawierała hash o postaci: `{:size=>"m", :weight=>200, :name=>"clever"}`


### Aliasy metod

_Ruby_ umożliwia stosowanie tzw. _monkey patching_, czyli nadpisywanie domyślnych metod, które są zawarte we wbudowanych klasach. I tak oto możemy w klasie `String` nadpisać metodę `size()` swoją własną implementacją. Jednakże wówczas tracimy dostęp do oryginalnej metody. Receptą na to jest stosowanie aliasów metod:

```ruby
class String
  # przypisanie oryginalnej metodzie `size()` nowej nazwy - `original_size()`
  alias_method :original_size, :size

  def size
  # wywołanie oryginalnej metody `size()`, która istnieje pod nazwą `original_size()`
    original_size * 2 - 1 
  end
end

puts 'test'.size # zwróci 7, bo 4 * 2 - 1
```

### Przeciążanie operatorów

Każda klasa może implementować własne zachowania operatorów. Poniżej kilka przykładów:

```ruby
class Ship
  attr_reader :name, :speed

  def initialize(name)
    @name = name
    @cargo = []
    @speed = 0
    @passangers = Hash.new {[]}
  end

  def [](type) # użycie: jackdaw['cos']
    @passangers[type]
  end

  def []=(type, name) # użycie: jackdaw['cos'] = ['wartosc', 'itd']
    @passangers[type] = name
  end

  def <<(cargo) # użycie: jackdaw << 'ladunek'
    @cargo << cargo
  end

  def +@ # użycie: +jackdaw
    @speed += 15
  end

  def -@ # użycie: -jackdaw
    @speed -= 15
  end

  def ! # użycie: if !jackdaw ...
    puts 'obiekt tej klasy możemy używać jako warunek'
  end
end

jackdaw = Ship.new('Jackdaw')

jackdaw[:professors] = ['Duncan Walpole', 'Adam Smith'] 
# @passangers={:professors=>["Duncan Walpole", "Adam Smith"]}

jackdaw << 'carbon' # @cargo=["carbon"]
+jackdaw # @speed=15
```


### Wywoływanie funkcji przez wiadomości

Wywoływanie metod w `Ruby` odbywa się poprzez wysyłanie wiadomości do obiektu. Wiadomość taka posiada nazwę metody oraz parametry. Obiekt, po odebraniu wiadomości, wyszukuje odpowiednią metodę, i jeśli ją znajdzie, wywołuje ją. 

Możemy użyć tego mechanizmu ręcznie za pomocą metody `send()`:
    
```ruby
# wywoła metodę `dock()` z obiektu `ship`
ship.send('dock') # równoznaczne z `ship.dock()`
```

Mechanizm ten został zapożyczony z języka `Smalltalk`.

Powstaje pytanie, co z metodami, które nie zostały zadeklarowane w żadnej klasie? Wywołania metod wymagają obiektu, który te wywołanie odbierze. Każdy program w _Ruby_ posiada domyślny obiekt `main`. I to ten obiekt odbierze wszystkie wiadomości. Warto dodać, że wywołanie `self` bez kontekstu będzie odwoływało się właśnie do obiektu `main`.

### Zagubione metody - `method_missing`

Gdy spróbujemy wywołać metodę, która nie istnieje w klasie, to zostanie wyrzucony błąd `NoMethodError`. Możemy jednak zadeklarować w klasie metodę `method_missing()`, która przechwyci takie wywołania i odpowiednio je obsłuży.

```ruby
class Ship
  def method_missing(name, *args)
    p name, args
  end
end

jackdaw = Ship.new
jackdaw.weight_and_balance # wyświetli: weight_and_balance []
jackdaw.with_parameter(123, 'asd') # wyświetli: with_parameter [123, "asd"]
```

### Podsumowując
Ruby posiada wiele _magii_, które mogą przytłaczać. Ważne jest, abyśmy ich nie nadużywali w swoich projektach, ponieważ skutecznie zaciemniają kod. Utrzymanie projektu opartego o magiczne metody, lub przeciążone operatory, nie należy do najprzyjemniejszych. Ruby nie posiada także statycznego typowania, więc na poziomie czytania kodu nie jest łatwo określić, czym właściwie dana zmienna jest, co jeszcze bardziej utrudnia zrozumienie.

