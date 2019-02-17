---
title: Bloki i moduły w Ruby
author: Krzysiek Komar
type: post
date: 2019-02-17
url: /2019/02/17/bloki-i-moduly
categories:
  - Programowanie
tags:
  - Ruby

---

Każdy język programowania umożliwia grupowanie kodu w jednostki. Ruby, oprócz tworzenia metod i klas, umożliwia grupowanie kodu w blokach i modułach. Wiąże się z tym wiele zagadnień, takich jak zasięg widoczności zmiennych, przekazywanie parametrów i zwracanie wartości. Z tematem bloków wiąże się także temat obiektów `proc` oraz funkcji lambda.

____

Ten wpis jest jednym z serii o _Ruby_, które pojawiły się na blogu:

1. [Ruby - ściągawka](/2018/10/24/ruby-sciagawka/)
2. [Metody na metody w Ruby](/2018/11/24/metody-na-metody-ruby/)
3. **Bloki i moduły w Ruby**

____


### Bloki, `procs` i lambda

Blok to kawałek kodu, który możemy przekazać do funkcji jako "argument". Jednolinijkowe bloki umieszczamy pomiędzy nawiasami klamrowymi, a wielolinijkowe muszą być otoczone słowami kluczowymi `do` i `end`:


```ruby
[1, 2, 3].each { |i| puts 'element tablicy => ', i}

[1, 2, 3].each do
  puts 'element tablicy => ', i
end
```

Metoda, do której przekazaliśmy blok, może go wykonać dowolną ilość razy. Może też przesłać argument do bloku. Listę argumentów umieszczamy pomiędzy pionowymi kreskami - `|arg1, arg2, test|`.

Powyżej widzimy przykład użycia funkcji `each`. Przyjmuje ona blok, do którego przekazuje argument z aktualną wartością z tablicy. Dzięki temu możemy np. wyświetlić wszystkie elementy tablicy.


Aby wywołać taki blok, korzystamy ze słówka `yield`:

```ruby
def check
  return nil unless block_given?
  puts 'Debugowanie...'
  yield 100
end


check do |speed|
  puts "Speed: #{speed}"
end

```

W powyższym kodzie wywołujemy funkcję `check`, do której przekazujemy blok. Funkcja `check` podczas wywoływania bloku przekazuje do niego parametr `100`, który wyświetlamy w bloku. Dzięki funkcji `block_given` możemy sprawdzić, czy blok został przekazany, i odpowiedni zareagować.

Blok zawsze zwraca wartość do funkcji. Jest to wartość ostatniego wyrażenia w bloku:

```ruby
def check
  return nil unless block_given?
  value = yield 100
  puts "Wartosc zwrocona: ", value
end


check do |speed|
  speed * 20
end

```

Argumenty bloku, tak jak i argumenty funkcji, mogą mieć swoje domyśln wartości. Możemy też używać argumentów nazwanych oraz argumentów przekazywanych jako splat:


```ruby
def creator
  yield :ship, :sedan, :van, size: :s, seats: :leather
end

creator do |category = :car, *types,
    size: :m, engines: 2, **ohter_components|
  puts "Category: #{category}"  # Category: ship
  puts "Types:"
  p types  # [:sedan, :van]
  puts "Size: #{size}"  # Size: s
  puts "Engines: #{engines}"  # Engines: 2
  puts "Other components"
  p ohter_components  # {:seats=>:leather}
end
```

#### Zasięg zmiennych w blokach
 
 
Zmienna przekazana w argumencie do bloku, przykryje zmienną z zewnątrz o takiej samej nazwie:

```ruby
def creator
  yield empty: true
end

def destinator
  attrs = {weight: 10, destination: 'Alpha3'}
  creator do |attrs|
    attrs = {} # czyścimy attrs
    attrs[:cargo] = 'bananas'
  end
  p attrs  # {:weight=>10, :destination=>"Alpha3"} - poprzednia wartość
end

destinator
```
 
Jednakże sam blok ma dostęp do zmiennych z zewnątrz, i może je modyfikować:

```ruby
def destinator
  attrs = {weight: 10, destination: 'Alpha3'}
  creator do |new_attrs|
    attrs = {} # czyścimy attrs
    attrs[:cargo] = 'bananas'
  end
  p attrs  # {:cargo=>"bananas"} - zmienna została nadpisana
end
```
 
Rozwiązaniem tego problemu są zmienne lokalne bloku, które definuje się po średniku na liście parametrów. Wówczas zmienna `attrs` z zewnątrz nie zostanie zmieniona:

```ruby
def destinator
  attrs = {weight: 10, destination: 'Alpha3'}
  creator do |new_attrs; attrs|
    attrs = {}
    attrs[:cargo] = 'bananas'
  end
  p attrs  # {:weight=>10, :destination=>"Alpha3"}
end
```

Bloki mają dwa podstawowe ograniczenia:

 - Można przesłać tylko jeden blok do metody
 - Bloki nie mogą by przekazywane pomiędzy metodami


### Proce

Metoda może informować w sposób jawny, że do działania wymaga bloku. Możemy taki blok umieścić na liście parametrów i go nazwać. Robi się to, dodając prefiks w postaci znaczka `&` oraz umieszczając taki parametr na końcu listy.

```ruby
def creator(param = nil, &block)
  puts block.class # Proc
end
```

Taki jawny blok tak na prawdę nie jest blokiem, a obiektem `Proc`

```ruby
def creator(param = nil, &block)
  puts block.class
end

creator {"sth"} # Proc

p = Proc.new {|param| puts "This is proc with #{param}"}
creator(&p) # Proc
```

Obiekty `Proc` możemy tworzyć i wywoływać w taki sposób:

```ruby
p = Proc.new {|param| puts "This is proc with #{param}"}
p = proc {|param| puts "This is proc with #{param}"}

p.call 'test'
p.yield 'nooo'
p.('sth')
p['summit']
```

#### Różnice pomiędzy obiektami `Proc` a funkcjami lambda:

 - Obiekt `Proc` jest bardziej podobny do bloku, natomiast lambda jest zwykłą funkcją anonimową.
 - Funkcje lambda ściśle przestrzegają argumentów - podanie zbyt małej ilości argumentów (lub zbyt dużej) spowoduje wyrzucenie wyjątku.
 - W obiekcie `Proc` nadmiarowe argumenty zostaną odrzucone, a brakujące przyjmą warość `Nil`
 - `return` i `break` działają inaczej w `Proc` i lambda.
     - W obiekcie `Proc` instrukcja `return` przerywa wykonywanie funkcji, w której `Proc` został wywołany. 
     - W `Procs` słowo break nie jest dozwolone, chyba że w pętli
     - W funkcji lambda `break` i `return` zwracają kontrolę do funkcji wywołującej, nie przerywając jej działania.

### Moduły
Ruby oferuje możliwość tworzenia modułów. Moduły możemy traktować jako przestrzenie nazw, w w których mamy możliwość zadeklarowania klas i metod. Nie posiadają one własnych instancji. Moduły można zagnieżdżać w sobie. Tworzymy je w taki sposób:

```ruby
module API

end
```

### Stałe
Pomimo wielu możliwości, które dają nam symbole w Ruby, stałe też mają swoje zastosowanie. Stałe są bardzo podobne do zmiennych, ponieważ też przechowują referencję do obiektu, tylko z tą różnicą, że nie powinno się zmieniać tej referencji. Mówię "nie powinno", ponieważ Ruby zezwala na taką operację, jednakże wyświetli wtedy warning.

Stała musi rozpoczynać się dużą literą (`LIMIT = 100`). Więc nazwy klas też są stałymi.

W ramach stałej możliwe są operacje na obiekcie. Np. do tablicy możemy dodawać elementy:

```ruby
PLACES = []
PLACES << "moon"
```

Aby to zablokować, możemy zamrozić (**freeze**) obiekt. Przy próbie modyfikacji zostanie wygenerowany błąd:

```ruby
PLACES = []
PLACES.freeze
PLACES << "pluton" # niedozwolona operacja
```

Niestety, nie zapewni nam to pełnej ochrony - pojedyncze elementy tablicy będą podatne na modyfikacje:

```ruby
PLACES = ["earth", "moon", "mars"]
PLACES.freeze
PLACES[0].upcase! # "EARTH"
```

Tworząc stałą poza jakimkolwiek modułem bądź klasą, staje się ona widoczna w całym projekcie. Stałe utworzone w modułach lub w klasach są widoczne tylko w nich. Mamy jednak możliwość odwołania się do nich z dowolnego miejsca poprzed operator `::`

```ruby
class A; LIMIT = 50; end
A::LIMIT
A::NAME = 'test' # stworzenie nowej stałej w klasie, dzięki monkey patching
```




