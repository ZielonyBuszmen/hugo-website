---
title: Laravel – testy jednostkowe w PHPStormie
author: Krzysiek Komar
type: post
date: 2017-02-26T17:06:36+00:00
url: /2017/02/26/laravel-testy-jednostkowe-w-phpstormie/
categories:
  - Programowanie
tags:
  - Laravel
  - PHPStorm
  - Testy

---
Krótki wpis, szybka porada &#8211; jak uruchomić testy jednostkowe Laravela w PHPStorm?

Przechodzimy do **Settings **_(Ctrl + Alt + S)_, klikamy **Languages & Frameworks**, następnie **PHP **i wybieramy **PHPUnit**.

W nowo otwartym oknie wybieramy **Use Composer autoloader **i jako ścieżkę podajemy plik `/vendor/autoload.php`, który znajduje się w naszym projekcie.
  
[<img class="aligncenter size-full wp-image-298" src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-1.png" alt="" width="1230" height="765" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-1.png 1230w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-1-300x187.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-1-768x478.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-1-1024x637.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-1-820x510.png 820w" sizes="(max-width: 1230px) 100vw, 1230px" />][1]

## Testowanie

Przechodzimy do `/tests/ExampleTest.php` i piszemy przykładowy test:

<pre class="brush: php; title: ; notranslate" title="">&lt;?php

class ExampleTest extends TestCase
{
    public function testTrueTest()
    {
        $this-&gt;assertTrue(true);
    }
}

</pre>

Aby uruchomić test, ustawiamy kursor w funkcji `testTrueTest` oraz wciskamy kombinacje klawiszy **Ctrl + Shift + F10**. Gotowe! 🙂 Test powinien się uruchomić i &#8222;się zaliczyć&#8221;.
  
[<img src="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-2.png" alt="" width="1055" height="378" class="aligncenter size-full wp-image-297" srcset="http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-2.png 1055w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-2-300x107.png 300w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-2-768x275.png 768w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-2-1024x367.png 1024w, http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-2-820x294.png 820w" sizes="(max-width: 1055px) 100vw, 1055px" />][2]

 [1]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-1.png
 [2]: http://zielonybuszmen.cba.pl/wp-content/uploads/2017/02/laravel-phpStorm-testy-tdd-2.png