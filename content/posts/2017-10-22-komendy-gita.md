---
title: Komendy GITa (cheat-sheet)
author: Krzysiek Komar
type: post
date: 2017-10-22
url: /2017/10/22/git/
categories:
  - Programowanie
tags:
  - GIT

---

Mały cheat sheet z komendami **GITa**. Trochę tego się nazbierało, dlatego najlepszym wyjściem będzie Ctrl + F. Wszystkie komendy gita są szczegółowo opisane na stronie dokumentacji [git-scm.com/docs](https://git-scm.com/docs). 

Natomiast samego **GITa** można pobrać stąd: [git-scm.com/downloads](https://git-scm.com/downloads)

## Konfiguracja

Lista wszystkich opcji konfiguracyjnych
```git
git config -l
```

Ustalenie opcji 
```git
git config --global user.name "Imie Nazwisko"
git config --global user.email mail@cos.pl
```

Ustalenie opcji dla projektu
```git
git config user.name "Imie Nazwisko"
git config user.email mail@cos.pl
```

Globalne ustawienia gita są w pliku:
```git
C:\Users\nazwa-usera\.gitconfig
```

Plik konfiguracyjny danego repozytorium
```git
.git\config
```

## Inicjalizacja repozytorium

```git
git init
```

## Klonowanie repo
```git
git clone adres-repo [sciezka/docelowa/opcjonalnie]
```

## Informacje o repo

Uczestnicy projektu
```git
git shortlog -s -n
```

## Historia
```git
git log
git log --pretty=oneline
git log --oneline
```

Zminimalizowane indetyfikatory
```git
git log --abbrev-commit --abbrev=4 --pretty=oneline
```

3 Ostatnie rewizje
```git
git log -3
```

Historia użytkownika
```git
git log --author=buszmen
```

Historia zawierająca commity z przedziału czasu
```git
git log--since="2016-06-07" --until="2017-01-15"
```

Lista ostatnich 15 rewizji w skróconym formacie graficznym
```git
git log --pretty=oneline --abbrev-commit --abbrev=4 -15 --graph
```

## Przywracanie obszaru roboczego

(Nie usuwa nowych plików)
```git
git reset --hard
git checkout -f
```

Powrócenie do określonego commita (późniejsze commity zostają **usunięte** z historii projektu!)
```git
git reset --hard [SHA-1]
```

Powrócenie do określonego commita (repo znajduje się w stanie detached head)
```git
git checkout -f [SHA-1]
```

## Stan repo

```git
git status
git status -s
```

## Tworzenie commita

```git
git add -A
git commit -m "ble ble ble..."
```

Automatyczna indeksacja plików zmodyfikowanch lub usuniętych
```git
git commit -a
```

## Branche (gałęzie)

Sprawdzenie brancha

```git
git branch
```

Przejście na wybranego brancha
```git
git checkout [nazwa-brancha]
git checkout develop
```

## Stan plików

Indeksacja pliku
```git
git add [nazwa-pliku]
```

Indeksacja wszystkich plików
```git
git add --all
git add -A
```

Indeksacja plików zmodyfikowanych i usuniętych
```git
git add --updated
git add -u
```

Usunięcie pliku
```git
git rm [nazwa-pliku]
```

Zmiana nazwy
```git
git mv stara-nazwa nowa-nazwa
```

## Ignorowanie plików

Lista plików do ignorowania znajduje się w pliku `.gitignore`
```git
/folder
folder
*.exe
plik.txt
```

## Znaczniki

Znacznik opisany do ostatniego commita
```git
git tag -a NAZWA -m KOMENTARZ [SHA-1, by stworzyc do danego commita]
```

Znacznik lekki do ostatniej rewizji
```git
git tag NAZWA [SHA-1 opcjonaln]
```

Lista znaczników opisanych
```git
git describe
```

Lista wszystkich znaczników
```git
git describe --tags
```

## Dziennik reflog

```git
git reflog [branch]
```

## Modyfikacja historii projektu

Usuwanie ostatnich commitów do X

```git
git reset --hard SHA
```

Edycja ostatniego commita
```git
git commit --amend -a -m "..."
```

Łączenie commitów, ale dopiero następujących po podanym
```git
git rebase -i SHA
```

Stworzenie commita usuwającego zmiany z innego commita
```git
git revert --no-edit SHA
```

Odzyskanie pliku z konkretnego commita
```git
git checkout -f SHA nazwa-pliku
```



## Operacje na branchach

Sprawdzanie bieżącego brancha:
```git 
git branch

git status -sb
```

Tworzenie nowego brancha wskazującej na bieżącego commita (lub SHA-1):
```git
git branch NAZWA [SHA-1]
```

Przełączanie branchy:
```git
git checkout NAZWA
```

Stworzenie nowego brancha i przełączenie na niego:
```git
git checkout -b NAZWA
```

Branche zawarte w aktualnym branchu:
```git
git branch --merged
```

Branche rozłączne z aktualnym branchem:
```git
git branch --no-merged
```

Usuwanie gałęzi (tylko gdy jest zmergowana)"
```git
git branch -d NAZWA
```

Usuwanie gałęzi (wymuszone)
```git
git branch -D NAZWA
```

Zmiana nazwy brancha
```git
git branch -m STARA-NAZWA NOWA-NAZWA
```

Różnice pomiędzy branchami
```git
git diff --name-status
```

## Merge

Łączenie gałęzi NAZWA z obecną
```git
git merge NAZWA
```

Usuwanie merga
```git
git reset --hard HEAD~
```

## Rebase

'Zaaplikowanie' (zastosowanie) zmian z bieżącego brancha do brancha NAZWA
```git
git rebase NAZWA
```

Anulowanie rebase (gdyby po opracji był stan detached HEAD)
```git
git rebase --abort
```

# Zdalne repozytoria

Klonowanie repo
```git
git clone URL
```

Dodanie adresu repozytorium zdalnego (możemy dołączać kilka repozytoriów zdalnych do jednego lokalnego)
```git
git remote add NAZWA ADRES
```

Listowanie adresów zdalnych
```git
git remote -v
```

## Śledzenie branchy

Sprawdzenie śledzonego brancha dla brancha X
```git
git config --get branch.X.remote
git config --get branch.X.merge

```

Ustawianie śledzonego brancha
```git
git branch --set-upstream branch-lokalny repo/branch-zdalny
git branch --set-upstream master origin/master
```

## Lista branchy

Branche lokalne
```git
git branch
```

Branche zdalne
```git
git branch -r
```

Wszystkie branche
```git
git branch -a
```

## Synchronizacja gałęzi

Pobranie śledzonego brancha
```git
git fetch
```

Pobranie zdalnego brancha, łączenie z bieżącym branchem i przywrócenie obszaru roboczego
```git
git pull
```

Przesylanie bieżącego brancha do brancha śledzonego
```git
git push
```

Przesłanie z nadpisaniem całego brancha (nadpisaniem historii)
```git
git push -f
```

Przełączenie na gałąź zdalną
```git
git checkout NAZWA
```

## Optymalizacja + stare commity

Usuwanie zgubionych rewizji
```git
git prune
```

Optymalizacja repo
```git
git gc
```

Wersja oprogramowania

```git
git --version
```

## Dokumentacja (pomoc)

```git
git add --help
git branch -- help
git config --help
git init --help

git help add
git help branch
git help config
git help init
```

<style>
p {
    margin-bottom: 0px;
}
h2 {
    margin-top: 40px;
}
</style>