---
title: Komendy GITa
author: Krzysiek Komar
type: post
date: 2017-03-23T16:25:00+00:00
url: /2017/03/23/komendy-gita/
categories:
  - Programowanie
tags:
  - GIT

---
Wersja oprogramowania

<pre>git --version</pre>

## Dokumentacja (pomoc)

<pre>git add --help
git branch -- help
git config --help
git init --help

git help add
git help branch
git help config
git help init</pre>

## Konfiguracja

Lista wszystkich opcji konfiguracyjnych

<pre>git config -l</pre>

Ustalenie opcji

<pre>git config --global user.name "Imie Nazwisko"
git config --global user.email mail@cos.pl</pre>

Globalne ustawienia gita są w pliku:

<pre>C:\Users\nazwa-usera\.gitconfig</pre>

Plik konfiguracyjny danego repozytorium

<pre>.git\config</pre>

## Inicjalizacja repozytorium

<pre>git init</pre>

## Klonowanie repo

<pre>git clone adres-repo [sciezka/docelowa/opcjonalnie]</pre>

## Informacje o repo

Uczestnicy projektu

<pre>git shortlog -s -n</pre>

## Historia

<pre>git log</pre>

<pre>git log --pretty=oneline</pre>

<pre>git log --oneline</pre>

Zminimalizowane indetyfikatory

<pre>git log --abbrev-commit --abbrev=4 --pretty=oneline</pre>

3 Ostatnie rewizje

<pre>git log -3</pre>

Historia użytkownika

<pre>git log --author=buszmen</pre>

Historia zawierająca commity z przedziału czasu

<pre>git log--since="2016-06-07" --until="2017-01-15"</pre>

Lista ostatnich 15 rewizji w skróconym formacie graficznym

<pre>git log --pretty=oneline --abbrev-commit --abbrev=4 -15 --graph</pre>

## Przywracanie obszaru roboczego

(Nie usuwa nowych plików)

<pre>git reset --hard
git checkout -f</pre>

Powrócenie do określonego commita (późniejsze commity zostają **usunięte** z historii projektu!)

<pre>git reset --hard [SHA-1]</pre>

Powrocenie do określonego commita (repo znajduje się w stanie detached head)

<pre>git checkout -f [SHA-1]</pre>

## Stan repo

<pre>git status
git status -s</pre>

## Tworzenie commita

<pre>git add -A
git commit -m "ble ble ble..."</pre>

Automatyczna indeksacja plików zmodyfikowanch lub usuniętych

<pre>git commit -a</pre>

## Branche &#8211; gałęzie

Sprawdzenie gałęzi

<pre>git branch</pre>

Przejście na wybranego brancha

<pre>git checkout [nazwa-brancha]
git checkout develop</pre>

## Stan plików

Indeksacja pliku

<pre>git add [nazwa-pliku]</pre>

Indeksacja wszystkich plików

<pre>git add --all
git add -A</pre>

Indeksacja plików zmodyfikowanych i usuniętych

<pre>git add --updated
git add -u</pre>

Usunięcie pliku

<pre>git rm [nazwa-pliku]</pre>

Zmiana nazwy

<pre>git mv stara-nazwa nowa-nazwa</pre>

## Ignorowanie plików

Lista plików do ignorowania znajduje się w pliku `.gitignore`

<pre>/folder
folder
*.exe</pre>

## Znaczniki

Znacznik opisany do ostatniego commita

<pre>git tag -a NAZWA -m KOMENTARZ [SHA-1, by stworzyc do danego commita]</pre>

Znacznik lekki do ostatniej rewizji

<pre>git tag NAZWA [SHA-1 opcjonaln]</pre>

Lista znaczników opisanych

<pre>git describe</pre>

Lista wszystkich znaczników

<pre>git describe --tags</pre>

## Dziennik reflog

<pre>git reflog [branch]</pre>

## Modyfikacja historii projektu

Usuwanie ostatnich commitów do X

<pre>git reset --hard SHA</pre>

Edycja ostatniego commita

<pre>git commit --amend -a -m "..."</pre>

Łączenie commitów, ale dopiero następujących po podanym

<pre>git rebase -i SHA</pre>

Stworzenie commita usuwającego zmiany z innego commita

<pre>git revert --no-edit SHA</pre>

Odzyskanie pliku z konkretnego commita

<pre>git checkout -f SHA nazwa-pliku</pre>

## Różności

Tworzenie pliku

<pre>echo a &gt; a.txt
echo "Bla bla bla" &gt; plik.txt</pre>