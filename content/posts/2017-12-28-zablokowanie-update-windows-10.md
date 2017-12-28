---
title: Zablokowanie Update na Windows 10
author: Krzysiek Komar
type: post
date: 2017-12-28
url: /2017/12/28/disable-update/
categories:
  - Windows
tags:
  - Windows

---

Przedstawiam prosty sposób na zablokowanie Windows Update na Windowsie 10 (działa także na w przypadku wersji Home). Testowałem ten sposób na Fall Creators Update (1709) i wszystko wydaje się być w porządku. Poniżej doklejam linki do źródeł, gdzie można przeczytać o tym więcej.

![sreen pokazujący działanie programu](/img/posts/disable-update1.png)

1. Pobieramy archiwum zip ([Windows 10 Update Disabler 1.0]((/files/Windows10UpdaterDisabler.zip))) i je wypakowujemy

2. Uruchamiamy konsolę w jako administrator, przechodzimy do katalogu z wypakowanym programem i wpisujemy polecenie.
```
UpdaterDisabler.exe -install
```
![sreen pokazujący działanie programu](/img/posts/disable-update2.png)

I tyle. Wystarczy wejść w "Ustawienia", aby sprawdzić, czy rzeczywiście to zadziałało.


## A jak to działa?
Program instaluje w systemie usługę, która sprawdza aktywność Windows Update, a gdy ją wykryje próbuje ją 'ubić'.

Aby przywrócić domyślne działanie Windows Update, należy tą usługę wyłączyć. Najłatwiej jest to zrobić usuwając ją z systemu poleceniem
``` 
UpdaterDisabler.exe -remove
```

Więcej informacji jest dostępne tutaj: [>>KLIK<<](https://www.dobreprogramy.pl/Windows-10-Update-Disabler-czyli-jak-usluga-zablokowac-usluge-niechcianych-aktualizacji,News,77691.html)