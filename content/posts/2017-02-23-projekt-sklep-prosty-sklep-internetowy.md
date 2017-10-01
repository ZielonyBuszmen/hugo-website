---
title: Projekt Sklep – prosty sklep internetowy
author: Krzysiek Komar
type: post
date: 2017-02-23T08:43:52+00:00
url: /2017/02/23/projekt-sklep-prosty-sklep-internetowy/
categories:
  - Zrealizowane projekty
tags:
  - Projekty

---
<pre>git clone https://github.com/ZielonyBuszmen/projektSklep.git</pre>

  * <span class="project-info link-github">Github &#8211; </span>[github.com/ZielonyBuszmen/projektSklep][1]
  * <span class="project-info">Działający projekt &#8211; </span>[projektsklep.cba.pl][2] lub [projektsklep.za.pl][3]
  * <span class="project-info">Technologie &#8211; </span> PHP, MySQL, Bootstrap
  * <span class="project-info">Data &#8211; </span> listopad/grudzień 2015
  * <span class="project-info">Zespół &#8211; </span> niewielki, bo dwuosobowy. Razem ze mną kodził Bartosh: **[bartoszgajda.com][4]**
  * <span class="project-info">Przeznaczenie projektu &#8211; </span> Projekt został stworzony na potrzeby zaliczenia programowania w ostatniej klasie technikum

<a style="outline: 1px dashed red;" title="" href="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-sklep-1.png"><img class="aligncenter wp-image-240 " title="" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-sklep-1-300x265.png" width="691" height="610" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-sklep-1-300x265.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-sklep-1-768x679.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-sklep-1-1024x905.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-sklep-1-820x725.png 820w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-sklep-1.png 1519w" sizes="(max-width: 691px) 100vw, 691px" /></a>

&nbsp;

Przedstawiany tutaj projekt to sklep internetowy. Nie jest wyszukany, wygląd to czysty Bootstrap. Kod jest napisany w czystym PHP oraz korzysta z bazy danych MySQL. Mimo wszystko nauczył nas, jakie zalety daje kontrola wersji GIT podczas projektów grupowych, jak rozdzielać zadania, oraz jak pisać kod, który działa.

# Prezentacja

Na stronie głównej wświetlają się produkty. Możemy je filtrować po cenie, zmieniać ilość wyświetlanych na stronie oraz przeglądać je ze względu na kategorie. Dodatkowo jest zaimplementowana w pełni działająca paginacja

[<img class="aligncenter size-full wp-image-264" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-2.png" alt="" width="1197" height="826" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-2.png 1197w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-2-300x207.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-2-768x530.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-2-1024x707.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-2-820x566.png 820w" sizes="(max-width: 1197px) 100vw, 1197px" />][5]

Produkty możemy dodawać do koszyka, którego podgląd możemy zobaczyć w drop-downie na górnym pasku. Każdy produkt posiada własną stronę, a na niej opis oraz cenę.[<img class="aligncenter size-full wp-image-265" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-3.png" alt="" width="1247" height="662" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-3.png 1247w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-3-300x159.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-3-768x408.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-3-1024x544.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-3-820x435.png 820w" sizes="(max-width: 1247px) 100vw, 1247px" />][6]

Tak prezentuje się widok całego koszyka. Możemy zarządzać zamieszonymi w nim produktami &#8211; zmieniać ich ilość, usuwać. Warto dodać, że do koszyka nie można dodać większej ilości danego produktu, niż jest na stanie w magazynie.

[<img class="aligncenter size-full wp-image-266" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-4.png" alt="" width="1283" height="723" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-4.png 1283w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-4-300x169.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-4-768x433.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-4-1024x577.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-4-820x462.png 820w" sizes="(max-width: 1283px) 100vw, 1283px" />][7]Klient po zalogowaniu może złożyć zamówienie na towary, które umieścił w koszyku.

[<img class="aligncenter size-full wp-image-267" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-5.png" alt="" width="1214" height="726" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-5.png 1214w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-5-300x179.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-5-768x459.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-5-1024x612.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-5-820x490.png 820w" sizes="(max-width: 1214px) 100vw, 1214px" />][8]

W każdej chwili klient może podejrzeć swoje zamówienia oraz sprawdzić, na jakim etapie dostarczenia się znajdują.

[<img class="aligncenter size-full wp-image-268" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-6.png" alt="" width="1058" height="465" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-6.png 1058w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-6-300x132.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-6-768x338.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-6-1024x450.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-6-820x360.png 820w" sizes="(max-width: 1058px) 100vw, 1058px" />][9]

### Panel pracownika

W sklepie został dodatkowo zaimplementowany panel pracownika

[<img class="aligncenter size-full wp-image-270" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-8.png" alt="" width="1266" height="710" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-8.png 1266w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-8-300x168.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-8-768x431.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-8-1024x574.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-8-820x460.png 820w" sizes="(max-width: 1266px) 100vw, 1266px" />][10]

Dany pracownik może wziąć na &#8222;swoje barki&#8221; dane zamówienie i zacząć je przetwarzać. Wówczas dostęp do danego zamówienia jest zablokowany dla innych pracowników. Można dowolnie zmieniać ilość produktów, usuwać je. Każde zamówienie da się zaakceptować albo odrzucić.[<img class="aligncenter size-full wp-image-274" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-12.png" alt="" width="1248" height="892" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-12.png 1248w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-12-300x214.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-12-768x549.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-12-1024x732.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-12-820x586.png 820w" sizes="(max-width: 1248px) 100vw, 1248px" />][11]

Dostępny jest panel &#8222;Zarządzania produktami&#8221;, gdzie można dodawać nowe produkty oraz edytować  usuwać już istniejące.

[<img class="aligncenter size-full wp-image-271" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-9.png" alt="" width="1314" height="601" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-9.png 1314w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-9-300x137.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-9-768x351.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-9-1024x468.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-9-820x375.png 820w" sizes="(max-width: 1314px) 100vw, 1314px" />][12]

# Instalacja

Instalacja sama w sobie jest bardzo prosta. Projekt potrzebuje jedynie serwera z interpreterem PHP 5 oraz bazy danych MySQL.

Na sam początek pobieramy projekt. Możemy to zrobić za pomocą komendy git clone, która jest umieszczona na samym początku tego wpisu, albo pobrać go z paczki ZIP: <https://github.com/ZielonyBuszmen/projektSklep/archive/master.zip>

W pliku `baza/polaczenie.php` znajdują się konfiguracja połączenia z serwerem bazy. Domyślnie jest to

<pre class="brush: php; title: ; notranslate" title="">$adres = '127.0.0.1';
    $uzytkownik = 'root';
    $haslo = '';
    $nazwa_bazy = 'projektsklep';
</pre>

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

&nbsp;

&nbsp;

 [1]: https://github.com/ZielonyBuszmen/projektSklep
 [2]: http://projektsklep.cba.pl/
 [3]: http://projektsklep.za.pl/
 [4]: http://bartoszgajda.com/
 [5]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-2.png
 [6]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-3.png
 [7]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-4.png
 [8]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-5.png
 [9]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-6.png
 [10]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-8.png
 [11]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-12.png
 [12]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektSklep-9.png