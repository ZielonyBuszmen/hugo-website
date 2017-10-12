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

Przechodzimy do **Settings** _(Ctrl + Alt + S)_, klikamy **Languages & Frameworks**, następnie **PHP** i wybieramy **PHPUnit**.

W nowo otwartym oknie wybieramy **Use Composer autoloader** i jako ścieżkę podajemy plik `/vendor/autoload.php`, który znajduje się w naszym projekcie.
  

![foto](/img/posts/laravel-phpStorm-testy-tdd-1.png)

## Testowanie

Przechodzimy do `/tests/ExampleTest.php` i piszemy przykładowy test:

```php

class ExampleTest extends TestCase
{
    public function testTrueTest()
    {
        $this-&gt;assertTrue(true);
    }
}

```

Aby uruchomić test, ustawiamy kursor w funkcji `testTrueTest` oraz wciskamy kombinacje klawiszy **Ctrl + Shift + F10**. Gotowe! 🙂 Test powinien się uruchomić i &#8222;się zaliczyć&#8221;.
  
![foto](/img/posts/laravel-phpStorm-testy-tdd-2.png)