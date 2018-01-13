---
title: Podwójna tożsamość na GitHubie
subtitle: Wrzutki z drugiego konta w innych projektach
author: Krzysiek Komar
type: post
date: 2018-01-11
url: /2018/01/11/podwojna-tozsamosc-github/
categories:
  - Git
tags:
  - Git
  - Github

---

Czasami zdarza się tak, że chcemy w danym projekcie wrzucać zmiany jako ktoś inny. Prostym przykładem jest osoba mająca dwa konta na Githubie - jedno prywatne, a drugie pracowe. Wówczas możemy nie chcieć wrzucać zmian do własnych *pet projectów* z konta pracowego i na odwrót. Jest na to sposób, który tutaj prezentuję.

Trzeba rozdzielić dwie kwestie wrzucania kodu na GitHuba:

1. **Jako kto będziesz zalogowany** - czyli z kogo uprawnieniami będziesz wrzucał kod. Jest to ustalane za pomocą używanego aktualnie *klucza prywatnego*.
2. **Jako kto wrzucisz kod** - czyli jaki username i jaki email wyświetli się w historii commitów. Jest to określane za pomocą *git identity*.

## Generowanie kluczy RSA
Aby przedstawiony sposób zadziałał, musimy zacząć łączyć się do GitHuba za pomocą SSH zamiast HTTPS.
Na początku wygenerujemy dwa klucze RSA, do pierwszego i do drugiego konta.

Klucz SSH można wygenerować wpisując w terminalu poniższą komendę (na Windowsie najlepiej odpalić Git Bash):
```git
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Na pytanie o `file in which to save the key` wpisujemy np. `first`

Drugi klucz generujemy w identyczny sposób, wpisując inną nazwę pliku, np. `second`

## Tworzenie pliku config
W katalogu `~/.ssh/` tworzymy plik `config`. W Windowsie lokalizację tą znajdziemy w `%userprofile%/.ssh/`, tj. `C:/Users/Buszmen/.ssh/`. Warto mieć na uwadze to, że katalog `.ssh` jest domyślnie ukryty. Do stworzonego pliku `config` wrzucamy poniższy kod:

```git
#Pierwsze konto
Host first
  HostName github.com
  User git
  IdentityFile ~/.ssh/first
#Drugie konto
Host second
  HostName github.com
  User git
  IdentityFile ~/.ssh/second
```
W Windowsie *Indentity File* znajdziemy pod adresem `%userprofile%/.ssh/plik`, czyli np.ta linijka będzie wyglądać tak: `IdentityFile C:/Users/Buszmen/.ssh/first`.

## Dodawanie kluczy RSA do kont
Musimy teraz dodać odpowiednie klucze do odpowiednich kont na GitHubie. Logujemy się na pierwsze konto, przechodzimy do **Settings** i dodajemy pierwszy klucz, tak jak na poniższym screenie.

![screen dodawania rsa do githuba](/img/posts/podwojna-tozsamosc-github1.png)

Tak samo postępujemy z drugim kontem, dodając do niego drugi klucz.

## Konfigurowanie repozytorium
Musimy ponownie sklonować swoje repozytorium w taki sposób:
```git
git clone git@first:ZielonyBuszmen/moje_repo.git
```
(zamiast standardowego `git clone git@github.com:ZielonyBuszmen/moje_repo.git`).


Gdzie:

-  **`first`** - `Host` z pliku pliku `config`
- **`ZielonyBuszmen/moje_repo`** - nazwa użytkownika i repozytorium na GitHubie

Zamiast ponownego klonowania możemy użyć komendy do zmiany 'origin'

Tak samo robimy z drugim repozytorium i z drugim kontem:
```git
git clone git@second:Company/projekt_firmowy.git
```

## Zmiana *git identity*

Przechodzimy do wybranego repozytorium i sprawdzamy, *jako kto wrzucimy kod*. Możemy to zrobić za pomocą poleceń:
```git
git config user.name
git config user.email
```

Jeśli chcemy zmienić dane na inne konto w ramach tego repozytorium, to wówczas wpisujemy:
```git
git config user.name "Nowe Imie"
git config user.email "Nowy@email.pl"
```

Zmiany możemy przetestować, tworząc w obu repozytoriach przykładowego `commita` i wpisując komendę
```git
git log
```


