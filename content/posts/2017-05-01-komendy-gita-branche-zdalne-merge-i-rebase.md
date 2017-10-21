---
title: Komendy GITa – Branche zdalne, merge i rebase
author: Krzysiek Komar
type: post
date: 2017-05-01T18:55:30+00:00
url: /2017/05/01/komendy-gita-branche-zdalne-merge-i-rebase/
categories:
  - Programowanie
tags:
  - GIT

---
## Operowanie branchami
<pre class= "line-numbers"><code class="language-css">/* http://prismjs.com/download.html?themes=prism&languages=markup+css+clike+javascript+c+cpp+csharp+git+java+php+python+sql */
    /**
     * prism.js default theme for JavaScript, CSS and HTML
     * Based on dabblet (http://dabblet.com)
     * @author Lea Verou
     */
    
    code[class*="language-"],
    pre[class*="language-"] {</code></pre>

Sprawdzanie bieżącego brancha:

<pre><code class="language-git">git branch</code></pre>

<pre><code class="language-git">git status -sb</code></pre>

Tworzenie nowego brancha wskazującej na bieżącego commita (lub SHA-1)

<pre>git branch NAZWA [SHA-1]</pre>

Przełączanie branchy

<pre>git checkout NAZWA</pre>

Stworzenie nowego brancha i przełączenie na niego

<pre>git checkout -b NAZWA</pre>

Branche zawarte w aktualnym branchu

<pre>git branch --merged</pre>

Branche rozłączne z aktualnym branchem

<pre>git branch --no-merged</pre>

Usuwanie gałęzi (tylko gdy jest zmergowana)

<pre>git branch -d NAZWA</pre>

Usuwanie gałęzi (wymuszone)

<pre>git branch -D NAZWA</pre>

Zmiana nazwy brancha

<pre>git branch -m STARA-NAZWA NOWA-NAZWA</pre>

Różnice pomiędzy branchami

<pre>git diff --name-status</pre>

## Merge

Łączenie gałęzi NAZWA z obecną

<pre>git merge NAZWA</pre>

Usuwanie merga

<pre>git reset --hard HEAD~</pre>

## Rebase

&#8222;Zaaplikowanie&#8221; (zastosowanie) zmian z bieżącego brancha do brancha NAZWA

<pre>git rebase NAZWA</pre>

Anulowanie rebase (gdyby po opracji był stan detached HEAD)

<pre>git rebase --abort</pre>

# Zdalne repozytoria

Klonowanie repo

<pre>git clone URL</pre>

Dodanie adresu repozytorium zdalnego

<pre>git remote add NAZWA ADRES</pre>

Możemy dołączać kilka repozytoriów zdalnych do jednego lokalnego

Listowanie adresów zdalnych

<pre>git remote -v</pre>

## Śledzenie branchy

Sprawdzenie śledzonego brancha dla brancha X

<pre>git config --get branch.X.remote
git config --get branch.X.merge
</pre>

Ustawianie śledzonego brancha

<pre>git branch --set-upstream branch-lokalny repo/branch-zdalny</pre>

<pre>git branch --set-upstream master origin/master</pre>

## Lista branchy

Branche lokalne

<pre>git branch</pre>

Branche zdalne

<pre>git branch -r</pre>

Wszystkie branche

<pre>git branch -a</pre>

## Synchronizacja gałęzi

Pobranie śledzonego brancha

<pre>git fetch</pre>

Pobranie zdalnego brancha, łączenie z bieżącym branchem i przywrócenie obszaru roboczego

<pre>git pull</pre>

Przesylanie bieżącego brancha do brancha śledzonego

<pre>git push</pre>

Przesłanie z nadpisaniem całego brancha (nadpisaniem historii)

<pre>git push -f</pre>

Przełączenie na gałąź zdalną

<pre>git checkout NAZWA</pre>

## Optymalizacja + stare commity

Usuwanie zgubionych rewizji

<pre>git prune</pre>

Optymalizacja repo

<pre>git gc</pre>