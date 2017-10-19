---
title: Adresacja IP cz. 1 – Z czym to się je?
author: Krzysiek Komar
type: post
date: 2017-02-17T15:02:06+00:00
url: /2017/02/17/adresacja-ip-cz-1-z-czym-to-sie-je/
categories:
  - Internet
tags:
  - Sieci

---
Niniejszy poradnik został stworzony dla osób, którym obce jest dzielenie sieci na podsieci. W tym poradniku pokażę obliczanie adresów sieci oraz jak ugryźć maskę, by sobie zębów nie połamać. Poradnik składa się z dwóch części. Druga jest dostępna tutaj: [Adresacja IP cz. 2 – podział na podsieci][1].

> Pierwotnie poradnik został wrzucony na stronę Pcfaq.pl Z racji tego, że ma wysoką wartość _edukacyjną_ oraz że jest on mojego autorstwa, postanowiłem go przenieść także i tutaj.

## **Adres IP i jego maska
  
**

A więc, aby zrozumieć zaawansowane „techniki”, musimy przypomnieć sobie podstawy. Co to jest adres IP i do czego służy nie wytłumaczę, gdyż Wiki nie kot, nie ugryzie. Na „warsztat” rzucimy sobie przykładowy adres IP:

<pre><strong><big><big>190.168.15.10</big></big></strong></pre>

Adres IP składa się z czterech oktetów bitów. W zapisie dziesiętnym są to cztery liczby oddzielone kropkami (w zapisie binarnym to cztery liczby po osiem bitów, czyli cztery oktety). Dlaczego cztery, a nie pięć? Bo łatwo skojarzyć to np. z „czteropakiem” Złocistej Ambrozji Radochy (która daje +5 do radochy, -10 do inteligencji, +50 do gadatliwości).

Każdy adres IP ma swoją maskę. Maska ta zakrywa tylko część adresu. Maska zazwyczaj jest podawana wraz z adresem w treści zadania. Jednakże czasem musimy „domyślić” się sami, jaką maskę ubrał dany adres. Sprawa jest bardzo prosta. Można się co prawda uczyć zakresów IP na pamięć, ale jest to słabe. Drugim sposobem (o wiele łatwiejszym) jest sprawdzenie, od jakich bitów rozpoczyna się pierwszy oktet. A więc, na początek musimy zamienić tenże pierwszy oktet na postać binarną.

<pre><big><big><strong>190 = 10111110</strong></big></big></pre>

> <div class="wpz-sc-box info ">
>   Warto nadmienić, że każda z czterech części adresu IP (a także maski) składa się z ośmiu bitów. Jeśli po zamianie liczby na system binarny wychodzi nam mniej bitów niż 8, dopisujemy zera przed liczbę, czyli np. 17 = 10001. Liczba binarna ma 5 cyfr, więc z początku dopisujemy trzy zera. Końcowa liczba powinna wyglądać tak: 00010001
> </div>

Po zamianie pierwszego oktetu na liczbę binarną musimy sprawdzić pierwsze cyfry (te od lewej). W naszym przypadku jest to 10, więc adres należy do klasy B. Poniżej tabelka ukazująca te zasady:

<table style="height: 119px;" width="454">
  <tr>
    <td width="46">
      <strong>Klasa</strong>
    </td>
    
    <td width="197">
      <strong>Początek pierwszego oktetu</strong>
    </td>
    
    <td width="57">
      <strong>Maska</strong>
    </td>
  </tr>
  
  <tr>
    <td width="46">
      A
    </td>
    
    <td width="197">
    </td>
    
    <td width="57">
      /8
    </td>
  </tr>
  
  <tr>
    <td width="46">
      B
    </td>
    
    <td width="197">
      10
    </td>
    
    <td width="57">
      /16
    </td>
  </tr>
  
  <tr>
    <td width="46">
      C
    </td>
    
    <td width="197">
      110
    </td>
    
    <td width="57">
      /24
    </td>
  </tr>
</table>

&nbsp;

Gdy znamy klasę naszego adresu, pozostaje nam napisać maskę. Maski zapisuje się w dwóch formatach. Pierwszy z nich to ten, podobny do adresu ip, np. 255.255.0.0. Drugi sposób to liczba po ukośniku, np. /16.

O co w tym chodzi? Aby to zrozumieć, musimy rozpisać cały adres maski na system binarny:

<pre><big><big>255.255.0.0 = 11111111.11111111.00000000.00000000</big></big></pre>

Jak widzimy, z lewej strony mamy same jedynki, które ciągną się długo. W połowie nastąpiło „załamanie” i zamiast jedynek dalej mamy same zera. Po prawej stronie, po zerach, nie ma już żadnej jedynki. To właśnie jest cecha maski – jak jedynki, to jedna za drugą. Gdy rozpoczną się zera, są aż do końca.

Drugi sposób zapisania maski to liczba po ukośniku, np. /16. O co tutaj biega? Otóż to liczba jedynek w masce. Policzmy, ile jedynek jest w masce 255.255.0.0. Jest ich szesnaście. Z racji tego, że wygodniej jest zapisać mniej, wystarczy że zapiszemy samą liczbę jedynek. A więc /16.

Po cóż więc ta maska jest? Jak to prawią mądre księgi: „Maska oddziela część adresu sieci od części hosta”. Mądre to słowa. A teraz prościej. Mamy jakiś IP i znamy jego maskę (czy to z obliczeń, czy to z treści zadania). Ten adres IP może być adresem jakiegoś konkretnego komputera. A my chcemy znać np. adres sieci tego komputera, albo chcemy wiedzieć ile komputerów jest w tej sieci. Musimy wtedy dokonać pewnego obliczenia. Adres i maska muszą rozpisane być blisko siebie, jeden nad drugim. Pamiętajmy, że najlepiej wszystko widać na adresach i maskach zapisanych w formie binarnej, więc do takiego stanu musimy doprowadzić nasze „obiekty testowe”.

<pre><big><big>190.168.15.10 = 11000000. 10101000.00001111.00001010
255.255.0.0 = 11111111.11111111.00000000.00000000</big></big></pre>

Teraz musimy zrobić coś niebywale precyzyjnego. Chirurg na oddziale ma już lżejsze zadanie. Otóż cała sztuka polega na tym, by każda cyfra adresu IP była pod daną cyfra maski.

<pre><big><big><strong>10111110.10101000.</strong>00001111.00001010 – adres IP
<strong>11111111.11111111.</strong>00000000.00000000 – oraz jego maska</big></big></pre>

No, udało się. Ale co dalej? Co dalej panie kierowniku? – ktoś może zapytać. Dalej to już z górki – im szybciej tym niebezpieczniej. Zobaczmy, jak odczytać adres sieci.

Patrzymy na maskę i na adres i porównujemy po kolei oktety. Na początek pierwszy oktet:

<pre><big><big>10111110. - adres IP
11111111. - maska</big></big></pre>

Jak widzimy, maska cały czas ma jedynki. To tak jakby jedynki przysłaniały adres sieci. Więc tam gdzie maska ma jedynki, przepisujemy adres bez żadnych zmian. A więc pierwszy oktet pozostawiamy bez szwanku.

W drugim oktecie sytuacja wygląda identycznie. Same jedynki w masce, więc drugi oktet adresu przepisujemy bez zmian.

W trzecim oktecie jedynki się skończyły. Są same zera

<pre><big><big><strong>.</strong>00001111. - adres IP
<strong>.</strong>00000000. - maska</big></big></pre>

_Tam gdzie w masce zera, adres IP sieci się kończy_ – mówi staropolskie przysłowie, powtarzane tak często przez nasze prababcie. W czwartym oktecie też muszą być zera w masce, gdyż jak wiemy, gdy zera się zaczynają, są aż do końca maski.

Dlatego też, tam gdzie mamy jedynki w masce, to tam znajduje się adres IP sieci. Tam gdzie mamy zera w masce, tam nie ma nic. Tamto jest nieważne. Dlatego tam gdzie są zera w masce wpisujemy także zera w adresie. Czyli poprawny adres sieci powinien wyglądać tak:

<pre><big><big><strong>10111110.10101000.</strong>00000000.00000000 – adres IP sieci
<strong>11111111.11111111.</strong>00000000.00000000 – oraz jego maska</big></big></pre>

Teraz wystarczy każdy oktet adresu sieci zamienić na liczbę dziesiętna. Wyjdzie nam 190.168.0.0. Jest to nasz adres sieci.

* * *

&nbsp;

## **Maski trochę mniej standardowe**

Maski klas adresów A, B oraz C są, co by tu dużo nie gadać, standardowe. Gdybyśmy się uparli, to nie musielibyśmy zamieniać całego adresu IP na system binarny. Wystarczyłby pierwszy oktet do określenia maski i tyle. Potem moglibyśmy działać na liczbach dziesiętnych. Powyższe zadanie moglibyśmy rozwiązać tak:

<pre><big><big><strong>190.168.</strong>15.10
<strong>255.255</strong>.0 .0</big></big></pre>

Jak widzimy, nawet na liczbach dziesiętnych widać, gdzie następuje te „przełamanie” maski, i dzięki temu wiemy, gdzie oddzielić adres IP sieci.

Jest to proste, aż za proste. Dlatego też, by uczynić sieci trudniejszymi, mamy do dyspozycji maski trochę mniej standardowe, niż te z klas A, B oraz C.

<pre><big><big>Mamy taki adres IP: 10.20.30.40.
Maska tego adresu to: /20</big></big></pre>

Na pierwszy rzut oka nie wyczuwamy tutaj żadnego niebezpieczeństwa. Jednakże rozpiszmy maskę na bity:

<pre><big><big><strong>11111111.11111111.1111</strong>0000.00000000</big></big></pre>

Jak widać, „przełamanie” występuje w połowie trzeciego oktetu. Aby obliczyć adres sieci, następna czynność jaką musimy wykonać to zamiana adresu IP na postać binarną. Jednakże nie musimy zamieniać całego adresu. Jak już zauważyliśmy, „przełamanie” maski następuje w trzecim oktecie (.**1111**0000.). Wystarczy więc zamienić tylko 3-ci oktet adresu IP na system binarny. Pierwsze dwa oktety przepisujemy bez zmian, bo maska tam ma jedynki. Trzeci oktet zamieniamy na system binarny:

<pre><big><big>30 – 00011110</big></big></pre>

Następnie podstawiamy 3-ci oktet maski pod 3-ci oktet IP:

<pre><big><big>.00011110. – adres IP
<strong>.1111</strong>0000. – maska</big></big></pre>

Tak jak pamiętamy, tam gdzie maska ma zera, to i w adresie IP sieci też są zera. Tam gdzie jedynki w masce, adres IP pozostawiamy bez zmian. A więc trzeci oktet powinien wyglądać tak:

<pre><big><big>.00010000.</big></big></pre>

Daje nam to liczbę 16, więc cały adres sieci wygląda tak: 10.20.16.0

* * *

&nbsp;

Jako drugi przykład weźmy adres IP 192.168.75.220 wraz z maską /29.

Na początek zamieniamy maskę na system binarny:

<pre><big><big><strong>11111111.11111111.11111111.11111</strong>000</big></big></pre>

Jak widać, „przełamanie” występuje w ostatnim, czwartym oktecie (.**11111**000). Wystarczy więc zamienić ostatni oktet adresu IP na postać binarną:

<pre><big><big>220 – 11011100</big></big></pre>

Teraz musimy podstawić 4 oktet adresu IP pod czwarty oktet maski:

<pre><big><big>.11011100 – adres IP
<strong>.11111</strong>000 – maska</big></big></pre>

Tam gdzie zera w masce, tam i zera w adresie. A więc ostatni oktet powinien wyglądać tak: .11011000, co daje nam liczbę 216. Pozostałe 3 oktety przepisujemy bez zmian, a więc adres sieci wygląda tak:

<pre><big><big>192.168.75.216

</big></big></pre>

* * *

# Część druga:

W drugiej części poradnika pokażę, jak podzielić sieć na podsieci oraz pod-podsieci ze względu na ilość sieci lub ilość hostów. Zobaczymy również, jak obliczyć ilość hostów w danej podsieci i adres broadcast.


[ >> Przejdź do części drugiej <<](/2017/02/18/adresacja-ip-cz-2-podzial-na-podsieci/)


