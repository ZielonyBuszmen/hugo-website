---
title: Projekt Sklep
subtitle: Prosty sklep internetowy
author: Krzysiek Komar
type: post
date: 2017-02-23T08:43:52+00:00
url: /2017/02/23/projekt-sklep-prosty-sklep-internetowy/
categories:
  - Projekty
tags:
  - Projekty

---
```git 
git clone https://github.com/ZielonyBuszmen/projektSklep.git
``` 
* <span class="project-info link-github">Github - </span>[github.com/ZielonyBuszmen/projektSklep](https://github.com/ZielonyBuszmen/projektSklep)
* <span class="project-info">Działający projekt - </span>[projektsklep.cba.pl](http://projektsklep.cba.pl/)
* <span class="project-info">Użyte technologie - </span> PHP, MySQL, Bootstrap
* <span class="project-info">Kiedy - </span> listopad/grudzień 2015
* <span class="project-info">Zespół - </span> niewielki, bo dwuosobowy. Razem ze mną kodził Bartosh: **[bartoszgajda.com](http://bartoszgajda.com)**
* <span class="project-info">Przeznaczenie projektu - </span> Projekt został stworzony na potrzeby zaliczenia programowania w ostatniej klasie technikum

![foto](/img/posts/projekty/projekt_sklep/projektSklep-1.png)

Przedstawiany tutaj projekt to sklep internetowy. Nie jest wyszukany, wygląd to czysty Bootstrap. Kod jest napisany w czystym PHP oraz korzysta z bazy danych MySQL. Mimo wszystko nauczył nas, jakie zalety daje kontrola wersji GIT podczas projektów grupowych, jak rozdzielać zadania, oraz jak pisać kod, który działa.

# Prezentacja

Na stronie głównej wświetlają się produkty. Możemy je filtrować po cenie, zmieniać ilość wyświetlanych na stronie oraz przeglądać je ze względu na kategorie. Dodatkowo jest zaimplementowana w pełni działająca paginacja

![foto](/img/posts/projekty/projekt_sklep/projektSklep-2.png)

Produkty możemy dodawać do koszyka, którego podgląd możemy zobaczyć w drop-downie na górnym pasku. Każdy produkt posiada własną stronę, a na niej opis oraz cenę.

![foto](/img/posts/projekty/projekt_sklep/projektSklep-3.png)

Tak prezentuje się widok całego koszyka. Możemy zarządzać zamieszonymi w nim produktami &#8211; zmieniać ich ilość, usuwać. Warto dodać, że do koszyka nie można dodać większej ilości danego produktu, niż jest na stanie w magazynie.

![foto](/img/posts/projekty/projekt_sklep/projektSklep-4.png)

Klient po zalogowaniu może złożyć zamówienie na towary, które umieścił w koszyku.

![foto](/img/posts/projekty/projekt_sklep/projektSklep-5.png)

W każdej chwili klient może podejrzeć swoje zamówienia oraz sprawdzić, na jakim etapie dostarczenia się znajdują.

![foto](/img/posts/projekty/projekt_sklep/projektSklep-6.png)]

### Panel pracownika

W sklepie został dodatkowo zaimplementowany panel pracownika
![foto](/img/posts/projekty/projekt_sklep/projektSklep-8.png)

Dany pracownik może wziąć na &#8222;swoje barki&#8221; dane zamówienie i zacząć je przetwarzać. Wówczas dostęp do danego zamówienia jest zablokowany dla innych pracowników. Można dowolnie zmieniać ilość produktów, usuwać je. Każde zamówienie da się zaakceptować albo odrzucić.

![foto](/img/posts/projekty/projekt_sklep/projektSklep-12.png)

Dostępny jest panel &#8222;Zarządzania produktami&#8221;, gdzie można dodawać nowe produkty oraz edytować  usuwać już istniejące.

![foto](/img/posts/projekty/projekt_sklep/projektSklep-9.png)

# Instalacja

Instalacja sama w sobie jest bardzo prosta. Projekt potrzebuje jedynie serwera z interpreterem PHP 5 oraz bazy danych MySQL.

Na sam początek pobieramy projekt. Możemy to zrobić za pomocą komendy git clone, która jest umieszczona na samym początku tego wpisu, albo pobrać go z paczki ZIP: <https://github.com/ZielonyBuszmen/projektSklep/archive/master.zip>

W pliku `baza/polaczenie.php` znajdują się konfiguracja połączenia z serwerem bazy. Domyślnie jest to

```php
    $adres = '127.0.0.1';
    $uzytkownik = 'root';
    $haslo = '';
    $nazwa_bazy = 'projektsklep';
```

W projekcie jest instalator, który sam wykryje, że nie ma zaimportowanych tabel. Wystarczy, aby powyższe dane były wpisane poprawnie, a cały proces &#8222;instalacji&#8221; będzie prowadził użytkownika &#8222;za rączkę&#8221;. Gdyby jednak tak się nie stało, to w folderze `baza/` znajduje się kilka ostatnich zrzutów bazy, które trzeba zaimportować np. poprzez phpMyAdmin.

**Prawa folderów**

Dla folderu `img/` oraz wszystkich jego podfolderów musimy nadać prawa zapisu (np. nigdy niezawodny chmod 777).

## Przykładowe dane logowania

Przykładowe dane logowania wyglądają następująco

<table style="height: 119px;" width="356">
  <tr>
    <td width="80">
      <strong>Typ</strong>
    </td>
    
    <td width="80">
      <strong>Login</strong>
    </td>
    
    <td width="80">
      <strong>Hasło</strong>
    </td>
  </tr>
  
  <tr>
    <td>
      Pracownik
    </td>
    
    <td>
      test
    </td>
    
    <td>
      test
    </td>
  </tr>
  
  <tr>
    <td>
      Klient
    </td>
    
    <td>
      test2
    </td>
    
    <td>
      test2
    </td>
  </tr>
</table>

