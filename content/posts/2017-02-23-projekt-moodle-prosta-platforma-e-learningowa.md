---
title: Projekt Moodle – platforma e-learningowa
author: Krzysiek Komar
type: post
date: 2017-02-23T14:28:42+00:00
url: /2017/02/23/projekt-moodle-prosta-platforma-e-learningowa/
categories:
  - Zrealizowane projekty
tags:
  - Projekty

---
<pre>git clone https://github.com/bartoszgajda55/projektMoodle.git</pre>

  * <span class="project-info link-github">Github &#8211; </span>[github.com/bartoszgajda55/projektMoodle][1]
  * <span class="project-info">Działający projekt &#8211; </span>[projektmoodle.cba.pl][2] lub [projektmoodle.za.pl][3]
  * <span class="project-info">Technologie &#8211; </span> PHP, MySQL, Bootstrap
  * <span class="project-info">Data &#8211; </span> październik/listopad 2015
  * <span class="project-info">Zespół &#8211; </span> niewielki, bo dwuosobowy. Razem ze mną kodził Bartosh: **[bartoszgajda.com][4]**
  * <span class="project-info">Przeznaczenie projektu &#8211; </span> Projekt został stworzony na potrzeby zaliczenia programowania w ostatniej klasie technikum

[<img class="aligncenter wp-image-214 size-full" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-1.png" width="1246" height="803" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-1.png 1246w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-1-300x193.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-1-768x495.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-1-1024x660.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-1-820x528.png 820w" sizes="(max-width: 1246px) 100vw, 1246px" />][5]

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

[<img class="alignnone wp-image-210 size-full" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-9.png" width="1246" height="890" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-9.png 1246w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-9-300x214.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-9-768x549.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-9-1024x731.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-9-820x586.png 820w" sizes="(max-width: 1246px) 100vw, 1246px" />][6]

Jest to panel użytkownika, gdzie może on przejść do swoich kursów. Warto zauważyć jedną, nader ciekawą rzecz: w systemie jest zawarty kurs &#8222;Programowanie Extremalne&#8221; a także został wyjaśniony odwieczny spór pomiędzy biologami a informatykami pt: &#8222;Co to jest potok i strumień&#8221;! Zachęcam do przejrzenia tychże kursów.

Każdy kurs składa się z wielu lekcji. Przykładowa lekcja z kursu prezentuje się następująco

<img class="aligncenter wp-image-211 size-large" title="" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-10-1024x818.png" width="1024" height="818" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-10-1024x818.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-10-300x240.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-10-768x614.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-10-820x655.png 820w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-10.png 1229w" sizes="(max-width: 1024px) 100vw, 1024px" />

Jest temat i treść od nauczyciela prowadzącego dany kurs. Dodatkowo do każdej lekcji nauczyciel może dodać pliki (dodatkowe materiały) do pobrania przez ucznia. Lekcja może wymagać odpowiedzi zwrotnej od ucznia, takiej jak odesłanie pliku tworzonego na zajęciach albo napisanie odpowiedzi tekstowej.

Do kursu uczeń może dołączyć na dwa sposoby. Pierwszy z nich to dodanie go przez prowadzącego, a drugi to wpisanie odpowiedniego kodu kursu:

[<img class="aligncenter wp-image-213 size-full" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-12.png" width="1246" height="401" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-12.png 1246w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-12-300x97.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-12-768x247.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-12-1024x330.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-12-820x264.png 820w" sizes="(max-width: 1246px) 100vw, 1246px" />][7]

Oprócz uczniów, w aplikacji są jeszcze administratorzy i nauczyciele. Administrator ma największe prawa, może zarządzać wszystkim i wszystkimi. Zobaczmy, jak serwis wygląda od strony władczej.

Nauczyciel i Administrator mają dostęp do panelu zarządzania kursami, który prezentuje się następująco

[<img class="aligncenter size-full wp-image-219" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-6.png" alt="" width="1229" height="895" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-6.png 1229w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-6-300x218.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-6-768x559.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-6-1024x746.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-6-820x597.png 820w" sizes="(max-width: 1229px) 100vw, 1229px" />][8]Dzięki wygodnemu panelowi nauczyciel może przeglądać, edytować i usuwać swoje kursy. Ma też możliwość zarządzania lekcjami w danym kursie, poprzez ich edycję, usuwanie bądź przenoszenie:

[<img class="aligncenter size-full wp-image-218" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-5.png" alt="" width="1229" height="1332" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-5.png 1229w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-5-277x300.png 277w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-5-768x832.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-5-945x1024.png 945w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-5-820x889.png 820w" sizes="(max-width: 1229px) 100vw, 1229px" />][9]Tak jak już było wspomniane, nauczyciel może do lekcji dodawać własne pliki, a także wymagać odpowiedzi przez ucznia (tekstowej albo w formie przesłania pliku). Następnie odpowiedzi można przeglądać w wygodnej formie:

[<img class="aligncenter wp-image-228" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektMoodle-15.jpg" width="870" height="151" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektMoodle-15.jpg 1083w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektMoodle-15-300x52.jpg 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektMoodle-15-768x133.jpg 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektMoodle-15-1024x178.jpg 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektMoodle-15-820x142.jpg 820w" sizes="(max-width: 870px) 100vw, 870px" />][10] [<img class="aligncenter size-full wp-image-220" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-7.png" alt="" width="876" height="176" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-7.png 876w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-7-300x60.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-7-768x154.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-7-820x165.png 820w" sizes="(max-width: 876px) 100vw, 876px" />][11]Nauczyciel ma możliwość dodawania i usuwania użytkowników z kursu:

[<img class="aligncenter size-full wp-image-209" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-8.png" alt="" width="876" height="533" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-8.png 876w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-8-300x183.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-8-768x467.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-8-820x499.png 820w" sizes="(max-width: 876px) 100vw, 876px" />][12]Natomiast administrator może zarządzać wszystkimi użytkownikami: zmieniać ich rangi (z ucznia na nauczyciela), blokować, usuwać konta. Administrator zarządza też wszystkimi kursami. Może zablokować kurs, który porusza nazbyt dwuznaczne tematy

[<img class="aligncenter size-full wp-image-216" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-3.png" alt="" width="883" height="536" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-3.png 883w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-3-300x182.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-3-768x466.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-3-820x498.png 820w" sizes="(max-width: 883px) 100vw, 883px" />][13]Z grubsza to by było na tyle, jeśli chodzi o opis. Zachęcam do samodzielnego przetestowania całej &#8222;aplikacji&#8221;. Opis jak to zrobić znajduje się poniżej.

# Instalacja

Instalacja sama w sobie jest bardzo prosta i szybka. Projekt potrzebuje jedynie serwera z interpreterem PHP oraz bazy danych MySQL.

Na sam początek pobieramy projekt. Możemy to zrobić za pomocą komendy git clone, która jest umieszczona na samym początku tego wpisu, albo pobrać go z paczki ZIP: [github.com/bartoszgajda55/projektMoodle/archive/master.zip][14]

W pliku `baza/polaczenie.php` znajdują się konfiguracja połączenia z serwerem bazy. Domyślnie jest to

<pre class="brush: php; title: ; notranslate" title="">$adres = '127.0.0.1';
    $uzytkownik = 'root';
    $haslo = '';
    $nazwa_bazy = 'projektMoodle';
</pre>

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

 [1]: https://github.com/bartoszgajda55/projektMoodle
 [2]: http://projektmoodle.cba.pl/
 [3]: http://projektmoodle.za.pl/
 [4]: http://bartoszgajda.com/
 [5]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-1.png
 [6]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-9.png ""
 [7]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-12.png
 [8]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-6.png
 [9]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-5.png
 [10]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projektMoodle-15.jpg
 [11]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-7.png
 [12]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-8.png
 [13]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/projekt-moodle-3.png
 [14]: https://github.com/bartoszgajda55/projektMoodle/archive/master.zip