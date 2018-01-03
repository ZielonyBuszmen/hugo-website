---
title: Adresacja IP cz. 2
subtitle: Podział na podsieci
author: Krzysiek Komar
type: post
date: 2017-02-18T15:01:40+00:00
url: /2017/02/18/adresacja-ip-cz-2-podzial-na-podsieci/
categories:
  - Internet
tags:
  - Sieci

---
Jest to druga część poradnika. Będą opisane w niej trochę bardziej zaawansowane zagadnienia z tematów podziału sieci na podsieci. Jeśli nie widziałeś części pierwszej, odnajdziesz ją pod tym adresem: [Adresacja IP cz. 1 – Z czym to się je?](/2017/02/17/adresacja-ip-cz-1-z-czym-to-sie-je/)

## Ilość hostów w sieci oraz adres broadcast

Czasem nastaje taki dzień, gdzie musimy zasiąść i sprawdzić ile w danej sieci mieści się hostów. Nie jest to zajęcie trudne, jednakże wymaga trochę pomyślunku. A więc aby wyznaczyć liczbę hostów, jaka może mieścić się w danej podsieci, musimy znać adres tejże sieci oraz jego maskę. Jako pierwszy przykład weźmy adres 192.168.54.11 z maską /24. Maska po zamianie wygląda tak:

<pre><big><big>11111111.11111111.11111111.00000000</big></big></pre>

Widzimy, że przełamanie występuje pomiędzy trzecim a czwartym oktetem, więc adres sieci to 192.168.54.0.
  
Jak już było wspominane w pierwszej części, tam gdzie w masce są jedynki, tam mamy adres sieci. Tam gdzie są zera jest adres hosta. A więc wszystkie hosty mogą być zapisane tylko tam, gdzie są zera. W naszym przypadku jest osiem zer. Jaką liczbę możemy zapisać na ośmiu bitach? Aby to obliczyć, musimy podnieść dwójkę do ósmej potęgi, co da nam liczbę 256. Jednakże liczba hostów będzie mniejsza. Musimy odliczyć zawsze dwa adresy. Dlaczego dwa? Jeden z nich do adres sieci, (192.168.54.0). Drugim adresem jest adres rozgłoszeniowy, zwany także broadcast (192.168.54.255). Adres broadcast jest tym ostatnim, jaki można zapisać w danej podsieci. Dlatego też 256 – 2 = 254. Tyle też hostów da się zapisać w tejże sieci.

Weźmy drugi przykład. Mamy adres 192.160.20.200 z maską /27. Maska w systemie binarnym wygląda więc tak:

<pre><big><big> 11111111.11111111.11111111.11100000</big></big></pre>

Spójrzmy na ilość zer. Jest ich pięć, więc na hosty zostało 5 bitów. Na pięciu bitach możemy zapisać 2 do potęgi 5 informacji, co daje nam liczbę 32. Jednakże tak jak już wspominaliśmy, trzeba odjąć dwa adresy na adres sieci i adres broadcast, więc 32-2 = 30 hostów.

## Podział sieci na podsieci ze względu na ilość podsieci

Zajmijmy się teraz podziałem sieci na podsieci. Mamy adres sieci 192.168.25.0 z maską /24. Musimy podzielić ją na 3 podsieci.
  
Rozpiszmy więc maskę na bity:

<pre><big><big> /24 = 11111111.11111111.11111111.00000000</big></big></pre>

Zastanówmy się teraz, na ilu bitach da się zapisać 3 podsieci. Jeden bit to za mało, gdyż zapiszemy na nim raptem 2 sieci. Nasze trzy podsieci zmieszczą się na dwóch bitach, a nawet zostanie jedna podsieć wolna (2 do potęgi 2 = 4). A więc te dwa bity musimy dodać do maski. Czyli 24+2 = 26.

<pre><big><big> nowa maska - 11111111.11111111.11111111.11000000 = /26</big></big></pre>

Jak widzimy przełamanie, jak i „zawieruchy” związane z dodaniem dwóch bitów do maski występują w ostatnim, czwartym oktecie. Więc ułatwienia obliczeń będziemy operować tylko na nim.

Naszym adresem sieci było 192.168.25.0. Dla większej czytelności i ułatwienia obliczeń pierwsze trzy oktety będę zapisywał „iksami”, czyli x.x.x.0, gdyż tak jak mówiłem, całość obliczeń jest wyłącznie na czwartym oktecie.

Zamieńmy ostatni oktet na postać binarną:

<pre><big><big>.00 000000 - adres sieci
.11 000000 - aders nowej maski
</big></big></pre>

Dodana maska składa się z dwóch bitów, dlatego też na tych dwóch bitach operujemy. Pierwsza sieć będzie miała bity 00, druga 01 natomiast trzecia 10. Gdybyśmy chciali dać czwartą, miała by ona postać 11. Skąd te liczby? Wystarczy zamienić 0, 1, 2 oraz 3 na system binarny. Pierwsza sieć to sieć 0, druga sieć to sieć 1, trzecia sieć to sieć 2. Takie rozbieżności występują, gdyż „zliczamy” numer sieci od zera, a nie od jedynki. Podstawmy po kolei bity do adresu podsieci:

<pre><big><big>.00 000000 - adres podsieci 1. Daje to nam 192.168.25.0
.11 000000 - aders nowej maski</big></big></pre>

Pierwsza podsieć ma w bitach 00, więc nic się nie zmienia.

<pre><big><big> .01 000000 - adres podsieci 2. Daje to nam 192.168.25.64</big></big></pre>

Druga podsieć ma w bitach 01, co daje nam po podstawieniu liczbę 01000000. Po zamianie liczby na system binarny mamy 64, więc w ostatnim oktecie będzie 64.

<pre><big><big>.10 000000 - adres podsieci 3. Daje to nam 192.168.25.128</big></big></pre>

Trzecia podsieć ma w bitach 10, więc liczba 10000000 daje nam 128.

> Jak teraz obliczyć pierwszy adres hosta? Wystarczy do adresu sieci dodać 1, czyli .0 +1 = 1. Pierwszym hostem podsieci 00 jest 192.168.25.1. Tak samo robimy z drugą podsiecią, co daje nam 192.168.25.65. Pierwszym adresem trzeciej podsieci jest 192.168.25.129.

Aby obliczyć adres broadcast, musimy w części adresu hosta podstawić jedynki. Czyli:

<pre><big><big>.00 111111 - adres podsieci 1.
.11 000000 - maska</big></big></pre>

`00111111` daje nam 63, czyli adres broadcast pierwszej podsieci to 192.168.25.63.

Z drugą podsiecią postępujemy identycznie

<pre><big><big>.01 111111 - adres podsieci 2.
.11 000000 - maska</big></big></pre>

Liczba `01111111` daje nam 127, czyli adres broadcast pierwszej podsieci to 192.168.25.127.

W trzeciej podsieci jest identycznie:

<pre><big><big>.10 111111 - adres podsieci 3.
.11 000000 - maska</big></big></pre>

`10111111` daje nam liczbę 191, czyli adres broadcast pierwszej podsieci to 192.168.25.191.

## Przykład nr 2:

Weźmy sobie teraz przykład trudniejszy.
  
Mamy adres sieci 120.130.144.0 z maską /23. Musimy podzielić go na 4 podsieci. Cztery podsieci da się zapiać na dwóch bitach (gdyż 2 do potęgi 2 = 4). Zamieńmy maskę na bity i dodajmy do niej te dwa dodatkowe bity, na których zapiszemy naszą podsieć.

<pre><big><big>11111111.11111111.1111111 <strong>1.1</strong> 0000000 - maska</big></big></pre>

Jak widzimy, przełamanie występuje w oktecie trzecim oraz czwartym. Dlatego też będziemy musieli zajmować się nimi dwoma na raz.
  
A więc zamieńmy dwa ostatnie oktety adresu na postać binarną:

<pre><big><big>.144.0 - 10010000.00000000</big></big></pre>

Podstawmy pod adres pod maskę:

<pre><big><big>1111111 <strong>1.1</strong>0000000 - maska
1001000 0.00000000 - adres</big></big></pre>

A więc pierwsza podsieć ma bity **`00`**:

<pre><big><big>1111111 <strong>1.1</strong>0000000 - maska
1001000 <strong>0.0</strong>0000000 - adres pierwszej podsieci</big></big></pre>

Po zamianie obu oktetów na liczby dziesiętne mamy 144.0, więc adres pierwszej podsieci to 120.130.144.0

Druga podsieć ma bity **`01`**. Podstawiamy to:

<pre><big><big>1111111 <strong>1.1</strong>0000000 - maska
1001000 <strong>0.1</strong>0000000 - adres drugiej podsieci</big></big></pre>

Po zamianie wychodzi nam 144.128, co daje nam adres 120.130.144.128

Trzecia podsieć ma bity **`10`**:

<pre><big><big>1111111 <strong>1.1</strong>0000000 - maska
1001000 <strong>1.0</strong>0000000 - adres trzeciej podsieci</big></big></pre>

Daje nam to po zamianie 145.0, więc adres trzeciej podsieci to 120.130.145.0

&nbsp;

Ostatnia, czwarta podsieć ma bity **`11`**:

<pre><big><big>1111111 <strong>1.1</strong>0000000 - maska
1001000 <strong>1.1</strong>0000000 - adres czwartej podsieci</big></big></pre>

Daje nam to 145.128, więc adresem czwartej podsieci jest 120.130.145.128

Obliczmy teraz pierwszy adres podsieci. do każdej wystarczy dodać 1.
  
1) 120.130.144.0 do adresu sieci +1 = 120.130.144.**1**
  
2) 120.130.144.128 do adresu sieci +1 = 120.130.144.**129**
  
3) 120.130.145.0 do adresu sieci +1 = 120.130.145.**1**
  
4) 120.130.145.128 do adresu sieci +1 = 120.130.145.**129**

Teraz obliczymy adres broad cast dla poszczególnych podsieci. Tak jak już było wspominane, adres ten jest ostatnim możliwym w danej podsieci
  
1) 1001000 0.01**1111111** – daje nam to liczbę 144.127, więc adres broadcast  to 120.130.144.**127**
  
2) 1001000 0.11**1111111** – daje nam to liczbę 144.255, więc adres broadcast  to 120.130.144.**255**
  
3) 1001000 1.01**1111111** – daje nam to liczbę 145.127, więc adres broadcast  to 120.130.145.**127**
  
4) 1001000 1.11**1111111** – daje nam to liczbę 145.255, więc adres broadcast  to 120.130.145.**255**

>   Aby obliczyć adres ostatniego hosta wystarczy że od adresu broadcast odejmiemy jedynkę. A więc dla przykładu ostatnim adresem w pierwszej podsieci będzie 120.130.144.126, gdyż adres broadcast to 120.130.144.127.

## Informacje na koniec

Pierwotnie oba artykuły zostały umieszczone na stronie pcfaq.pl. Z racji tego że są całkiem niezłe i w dodatku mogę pochwalić się, że to ja jestem ich autorem, umieściłem je tutaj. 😉 Linki do pierwotnych artykułów:

  * [Adresacja IP cz. 1 – Z czym to się je?](http://pcfaq.pl/internet/adresacja-ip-z-czym-to-sie-je-cz-1/)
  * [Adresacja IP cz. 2 – podział na podsieci](http://pcfaq.pl/internet/adresacja-ip-cz-2-podzial-na-podsieci/)

&nbsp;
