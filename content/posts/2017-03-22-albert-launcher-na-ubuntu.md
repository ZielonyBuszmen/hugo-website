---
title: Albert launcher na Ubuntu
author: Krzysiek Komar
type: post
date: 2017-03-22T20:09:51+00:00
url: /2017/03/22/albert-launcher-na-ubuntu/
categories:
  - Produktywność
tags:
  - Linux
---
Pracując na Windowsie korzystałem z małego programiku o nazwie Launchy. Było to naprawdę ogromne usprawnienie podczas korzystania z komputera. Szybkie obliczenie, wyszukanie czegoś na necie albo uruchomienie dowolnego programu bez odrywania rąk od klawiatury było bardzo wygodne. Niestety, Launchy niezbyt dobrze działa na Ubuntu 16, więc zostałem zmuszony do poszukania alternatywy. Znalazłem coś, co nazywa się Albert Launcher, i uwierzcie, jest to o wiele lepsze rozwiązanie od starego już Launchy'ego.

![foto](/img/posts/Albert-launcher-ubuntu-4.png)


## Instalacja

W terminalu wpisujemy
```bash
sudo apt-add-repository ppa:flexiondotorg/albert
sudo apt-get update
sudo apt-get install albert
```
Przy pierwszym uruchomieniu musimy wybrać skrót, którym będziemy odpalać Alberta. Najwygodniejszy `Alt + Space` jest niestety zajęty przez Ubuntu (i bardzo ciężko go &#8222;uwolnić&#8221;), stąd też wybrałem `Ctrl + Space`
  
![foto](/img/posts/F1nXp.png)


## Funkcjonalności

Wywołane okno launchera prezentuje się następująco. Poniżej przykładowe &#8222;funkcjonalności&#8221;.

![foto](/img/posts/Albert-launcher-ubuntu-1.png)

  * Obliczenia
    
![foto](/img/posts/Albert-launcher-ubuntu-3.png)
    
  * Uruchamianie zainstalowanych programów
  
![foto](/img/posts/Albert-launcher-ubuntu-4.png)

  * Przeszukiwanie plików
  
![foto](/img/posts/Albert-launcher-ubuntu-5.png)

  * Przesyłanie zapytań do Googla, Githuba, stacka, Youtube, itd

![foto](/img/posts/Albert-launcher-ubuntu-6.png)

  * Odpalanie komend w konsoli
  
![foto](/img/posts/Albert-launcher-ubuntu-7.png)

  * Przekazywanie zadań do Wolframa

![foto](/img/posts/Albert-launcher-ubuntu-8.png)
    
  * I wiele, wiele innych 😉

&nbsp;

## Skrót Alt + Spacja

Jednak możliwe jest ustawienie skrótu Alberta na Alt + Spacja. Alberta można uruchomić komendami

```bash
albert show
albert toggle
```
stąd też możemy wygodnie 'zbindować' skrót w ustawieniach Ubuntu.
