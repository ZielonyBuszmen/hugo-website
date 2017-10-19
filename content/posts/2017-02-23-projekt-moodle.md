---
title: Projekt Moodle
subtitle: Platforma e-learningowa
author: Krzysiek Komar
type: post
date: 2017-02-23T14:28:42+00:00
url: /2017/02/23/projekt-moodle-prosta-platforma-e-learningowa/
categories:
  - Projekty
tags:
  - Projekty

---
<pre>git clone https://github.com/bartoszgajda55/projektMoodle.git</pre>

  * <span class="project-info link-github">Github &#8211; </span>[github.com/bartoszgajda55/projektMoodle](https://github.com/bartoszgajda55/projektMoodle)
  * <span class="project-info">Działający projekt &#8211; </span>[projektmoodle.cba.pl](http://projektmoodle.cba.pl/) lub [projektmoodle.za.pl](http://projektmoodle.za.pl/)
  * <span class="project-info">Technologie &#8211; </span> PHP, MySQL, Bootstrap
  * <span class="project-info">Data &#8211; </span> październik/listopad 2015
  * <span class="project-info">Zespół &#8211; </span> niewielki, bo dwuosobowy. Razem ze mną kodził Bartosh: **[bartoszgajda.com](http://bartoszgajda.com/)**
  * <span class="project-info">Przeznaczenie projektu &#8211; </span> Projekt został stworzony na potrzeby zaliczenia programowania w ostatniej klasie technikum

![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-1.png)

Od początku zadanie wydawało się całkiem złożone, bo całość miała być dosyć mocno rozbudowanym systemem e-learningowym (mówiąc &#8222;dosyć mocno rozbudowanym&#8221; mam na myśli &#8222;mocno rozbudowanym jak na umiejętności programistyczne uczniaków technikum&#8221;). Projekt miał być podobno do platform takich jak Moodle. Zadanie od pana Grzesia prezentowało się następująco:

> Celem projektu jest stworzenie niezbyt prostego systemu e-lerningowego. Projekt powinien umożliwiać rejestrowanie trzech typów użytkowników:
> 
>   * administrator
>   * nauczyciel
>   * student
> 
> Administrator powinien mieć możliwość zarządzania wszystkimi, kursami i użytkownikami aplikacji.
> 
> Każdy użytkownik, który rejestruje się do aplikacji powinien zostać zarejestrowany jako student. Administrator może zmienić konto studenta na konto nauczyciela.
> 
> Nauczyciel ma możliwość tworzenia kursów. W obrębie własnego kursu nauczyciel ma możliwość zapisywania użytkowników, dodawania plików do lekcji, tworzenia zadań, umożliwiających pobranie pliku od użytkownika lub bezpośredniej treści wpisanej na stronie zadania (podobnie jak w moodle).
> 
> Student powinien mieć możliwość wejścia tylko do kursów, na które jest zapisany. Studenta może zapisać tylko administrator lub student może dokonać tego samodzielnie na podstawie kodu, który otrzyma od nauczyciela.

Pozwoliłem sobie je tutaj &#8222;przekleić&#8221;, bo wyraża ono więcej niż tysiąc słów 😉

# Prezentacja

Po wejściu do serwisu użytkownik jest raczony pięknym ekranem logowanie i nie mniej brzydszym zdjęciem w tle. W systemie istnieją trzy typy użytkowników: administrator, nauczyciel i biedny uczniak. Dane do logowania są zamieszczone poniżej, w sekcji Instalacja.

Po zalogowaniu na ucznia na monitorze ukazują się takie tabelki:

![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-9.png)

Jest to panel użytkownika, gdzie może on przejść do swoich kursów. Warto zauważyć jedną, nader ciekawą rzecz: w systemie jest zawarty kurs &#8222;Programowanie Extremalne&#8221; a także został wyjaśniony odwieczny spór pomiędzy biologami a informatykami pt: &#8222;Co to jest potok i strumień&#8221;! Zachęcam do przejrzenia tychże kursów.

Każdy kurs składa się z wielu lekcji. Przykładowa lekcja z kursu prezentuje się następująco


![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-10.png)

Jest temat i treść od nauczyciela prowadzącego dany kurs. Dodatkowo do każdej lekcji nauczyciel może dodać pliki (dodatkowe materiały) do pobrania przez ucznia. Lekcja może wymagać odpowiedzi zwrotnej od ucznia, takiej jak odesłanie pliku tworzonego na zajęciach albo napisanie odpowiedzi tekstowej.

Do kursu uczeń może dołączyć na dwa sposoby. Pierwszy z nich to dodanie go przez prowadzącego, a drugi to wpisanie odpowiedniego kodu kursu:
![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-12.png)

Oprócz uczniów, w aplikacji są jeszcze administratorzy i nauczyciele. Administrator ma największe prawa, może zarządzać wszystkim i wszystkimi. Zobaczmy, jak serwis wygląda od strony władczej.

Nauczyciel i Administrator mają dostęp do panelu zarządzania kursami, który prezentuje się następująco

![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-6.png)
Dzięki wygodnemu panelowi nauczyciel może przeglądać, edytować i usuwać swoje kursy. Ma też możliwość zarządzania lekcjami w danym kursie, poprzez ich edycję, usuwanie bądź przenoszenie:

![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-5.png)
Tak jak już było wspomniane, nauczyciel może do lekcji dodawać własne pliki, a także wymagać odpowiedzi przez ucznia (tekstowej albo w formie przesłania pliku). Następnie odpowiedzi można przeglądać w wygodnej formie:

 ![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-15.png)

![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-7.png)

Nauczyciel ma możliwość dodawania i usuwania użytkowników z kursu:

![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-8.png)

Natomiast administrator może zarządzać wszystkimi użytkownikami: zmieniać ich rangi (z ucznia na nauczyciela), blokować, usuwać konta. Administrator zarządza też wszystkimi kursami. Może zablokować kurs, który porusza nazbyt dwuznaczne tematy

![foto](/img/posts/projekty/projekt_moodle/projekt-moodle-3.png)

Z grubsza to by było na tyle, jeśli chodzi o opis. Zachęcam do samodzielnego przetestowania całej &#8222;aplikacji&#8221;. Opis jak to zrobić znajduje się poniżej.

# Instalacja

Instalacja sama w sobie jest bardzo prosta i szybka. Projekt potrzebuje jedynie serwera z interpreterem PHP oraz bazy danych MySQL.

Na sam początek pobieramy projekt. Możemy to zrobić za pomocą komendy git clone, która jest umieszczona na samym początku tego wpisu, albo pobrać go z paczki ZIP: [github.com/bartoszgajda55/projektMoodle/archive/master.zip](https://github.com/bartoszgajda55/projektMoodle/archive/master.zip)

W pliku `baza/polaczenie.php` znajdują się konfiguracja połączenia z serwerem bazy. Domyślnie jest to

```php
    $adres = '127.0.0.1';
    $uzytkownik = 'root';
    $haslo = '';
    $nazwa_bazy = 'projektMoodle';
```

W projekcie jest instalator, który sam wykryje, że nie ma zaimportowanych tabel. Wystarczy, aby powyższe dane były wpisane poprawnie, a cały proces &#8222;instalacji&#8221; będzie prowadził użytkownika &#8222;za rączkę&#8221;. Gdyby jednak tak się nie stało, to w folderze `baza/` znajdują się kilka ostatnich zrzutów bazy, które trzeba zaimportować np. poprzez phpMyAdmin.

**Prawa folderów**

Dla folderu `upload/` oraz wszystkich jego podfolderów musimy nadać prawa zapisu (np. nigdy niezawodny chmod 777).

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
      Admin
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
      Nauczyciel
    </td>
    
    <td>
      test2
    </td>
    
    <td>
      test2
    </td>
  </tr>
  
  <tr>
    <td>
      Uczeń
    </td>
    
    <td>
      test3
    </td>
    
    <td>
      test3
    </td>
  </tr>
</table>

To by było na tyle 😀
