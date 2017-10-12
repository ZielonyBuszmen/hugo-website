---
title: OnePage Hafty
author: Krzysiek Komar
type: post
date: 2017-02-23T13:07:00+00:00
url: /2017/02/23/onepage-hafty/
categories:
  - Zrealizowane projekty
tags:
  - Projekty

---
<pre>git clone https://github.com/ZielonyBuszmen/onePage-hafty.git</pre>

  * <span class="project-info link-github">Github &#8211; </span>[github.com/ZielonyBuszmen/onePage-hafty](https://github.com/ZielonyBuszmen/onePage-hafty)
  * <span class="project-info">Działający projekt &#8211; </span>[hafty-kasi.cba.pl](http://hafty-kasi.cba.pl/)
  * <span class="project-info">Technologie &#8211; </span>Larevel 5.3, Bootstrap, Angular2
  * <span class="project-info">Data &#8211; </span> styczeń 2017
  * <span class="project-info">Przeznaczenie projektu &#8211; </span> Projekt na zlecenie. Na stronie znajduje się galeria zdjęć, księga gości i kilka informacji. Wszystko wykonane jako &#8222;OnePage&#8221;, bez przeładowywania witryny. Strona korzysta z ViewComposerów oraz została &#8222;zlokalizowana&#8221; w 3 językach

![foto](/img/posts/projekty/onepage_hafty/hafty-1.png)

## Kilka spraw technicznych

Layout został podzielony na elementy, które dowolnie można usuwać lub zmieniać ich kolejność:

<pre class="brush: php; title: resources/views/default.blade.php; notranslate" title="resources/views/default.blade.php">&lt;!DOCTYPE html&gt;
&lt;html lang="pl"&gt;

&lt;head&gt;
    @include('includes.head')
&lt;/head&gt;

&lt;body&gt;

    &lt;!-- Navigation --&gt;
    @include('includes.navigation')

    &lt;!-- Header --&gt;
    @include('includes.header')

    &lt;!-- About --&gt;
    @include('includes.about')

    &lt;!-- Blueimp gallery LightBox -&gt;
    @include('includes.gallery_blueimp')

    &lt;!-- Guest Book --&gt;
    @include('includes.guest_book')

    &lt;!-- Footer --&gt;
    @include('includes.footer')

    &lt;!-- Bottom scripts --&gt;
    @include('includes.bottom_scripts')

&lt;/body&gt;
&lt;/html&gt;
</pre>

W kodzie zaimplementowałem możliwość zmiany języka serwisu. Jest to brzydki kod, bo napisany w roucie zamiast w kontrolerze (lub jakiejś innej stosownej do tego klasie).

<pre class="brush: php; title: routes/web.php; notranslate" title="routes/web.php">Route::get('/locale/{locale}', function ($locale, \Illuminate\Http\Request $request) {
    App::setLocale($locale);
    $request-&gt;session()-&gt;put('lang', $locale);
    return redirect("/");
})-&gt;where("locale", "(pl|en|es)");
</pre>

## Dodawanie nowych zdjęć:

  * Duże zdjęcia znajdują się w `public/img/hafty`. Na podstawie tego katalogu skrypt tworzy array&#8217;a z odnośnikami do zdjęć.
  * Miniaturki są przechowywane w folderze `public/img/miniaturki`. Miniaturka musi nazywać się tak samo jak duże zdjęcie. Powinna mieć wymiary `400px x 300px`.
  * Ustawienia odnośnie lokalizacji folderu ze zdjęciami oraz cały skrypt który przeszukuje te foldery znajdziemy w pliku `app/Repositories/PhotoRepository.php`. Metoda `getAll()` zwraca gotowego array&#8217;a z linkami do zdjęć i miniaturek. Wynik tej funkcji jest zwracany do widoku `resources/views/includes/gallery_blueimp.blade.php`. Nie jest to robione standardowo przez kontroler lub router, tylko poprzez tzw. &#8222;ViewComposer&#8221; o nazwie `PhotoComposer` (lokalizacja `app/Console/Http/ViewComposers/PhotoComposer.php`). Te dane są zwracane do zmiennej `$photos`, którą możemy używać w widoku.
  * Repozytorium do ViewComposera jest &#8222;wstrzykiwane&#8221; dzięki mechanizmowi Dependency Injection

Sam ViewComposer prezentuje się następująco. Jak widzimy, repozytorium z fotografiami jest &#8222;wstrzykiwane&#8221; dzięki mechanizmowi Dependency Injection.

<pre class="brush: php; title: ; notranslate" title="">&lt;?php namespace App\Http\ViewComposers; 

use App\Repositories\PhotoRepository; 
use Illuminate\View\View; 

class PhotoComposer 
{ 
    protected $photos; 
    public function __construct(PhotoRepository $photos) 
    { 
        $this-&gt;photos = $photos;
    }

    public function compose(View $view)
    {
        $view-&gt;with('photos', $this-&gt;photos-&gt;getAll());
    }
}
</pre>

ViewComposer jest wykonywany dzięki ServiceProviderowi:

<pre class="brush: php; highlight: [18,19,20]; title: ; notranslate" title="">&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Register bindings in the container.
     *
     * @return void
     */
    public function boot()
    {
        // Using class based composers...
        View::composer(
            'includes.gallery_blueimp', 'App\Http\ViewComposers\PhotoComposer'
        );

    }

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}</pre>

## Instalacja

Standardowo -> pobieramy projekt do folderu `htdocs` Xamppa, albo do `www` Wampa (lampa, trampa, itp). Następnie otwieramy terminal (konsolę) w folderze z projektem i wpisujemy `composer install`, a potem `npm install`. Tak, projekt wymaga zainstalowanego Composera oraz Node.js.

Być może będzie wymagane odblokowanie `php_intl.dll` w pliku `php.ini` w konfiguracji naszego serwera, ale to już jest spowodowane przez wymagania samego Laravela.

Następnie musimy przejść do pliku `node_modules/elixir-typescript/index.js` i zakomentować w nim linijkę: `//.pipe($.concat(paths.output.name))`.

Na koniec wpisujemy komendę `gulp` by skompilować assety (pliki TypeScript) Angulara 2.

