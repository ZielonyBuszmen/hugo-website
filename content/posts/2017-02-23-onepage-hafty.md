---
title: OnePage Hafty
author: Krzysiek Komar
type: post
date: 2017-02-23T13:07:00+00:00
url: /2017/02/23/onepage-hafty/
categories:
  - Projekty
tags:
  - Projekty

---

Projekt na zlecenie. Z założenia miała być to strona do auto-prezentacji, na której klient może pokazywać swoje dzieła. Dlatego też głównym miejscem na stronie jest galeria zdjęć uzupełniona dodatkowo o krótką notkę biograficzną. Wszystko wykonane jako 'OnePage'. Strona korzysta z ViewComposerów oraz została "zlokalizowana" w trzech językach.

___   

# Info
```git 
git clone https://github.com/ZielonyBuszmen/onePage-hafty.git
``` 
* <span class="project-info link-github">Github - </span>[github.com/ZielonyBuszmen/onePage-hafty](https://github.com/ZielonyBuszmen/onePage-hafty)
* <span class="project-info">Działający projekt - </span>[hafty-kasi.cba.pl](http://hafty-kasi.cba.pl/)
* <span class="project-info">Użyte technologie - </span> Larevel 5.3, Bootstrap, Angular2
* <span class="project-info">Kiedy - </span>  styczeń 2017
* <span class="project-info">Przeznaczenie projektu - </span>  Projekt na zlecenie. Na stronie znajduje się galeria zdjęć, księga gości i kilka informacji. Wszystko wykonane jako 'OnePage', bez przeładowywania witryny. Strona korzysta z ViewComposerów oraz została 'zlokalizowana' w trzech językach



![foto](/img/posts/projekty/onepage_hafty/hafty-1.png)

## Kilka spraw technicznych

Layout został podzielony na elementy, które dowolnie można usuwać lub zmieniać ich kolejność:

**resources/views/default.blade.php**
```html
<!DOCTYPE html>
<html lang="pl">
 
<head>
    @include('includes.head')
</head>
 
<body>
 
    <!-- Navigation -->
    @include('includes.navigation')
 
    <!-- Header -->
    @include('includes.header')
 
    <!-- About -->
    @include('includes.about')
 
    <!-- Blueimp gallery LightBox ->
    @include('includes.gallery_blueimp')
 
    <!-- Guest Book -->
    @include('includes.guest_book')
 
    <!-- Footer -->
    @include('includes.footer')
 
    <!-- Bottom scripts -->
    @include('includes.bottom_scripts')
 
</body>
</html>
```

W kodzie zaimplementowałem możliwość zmiany języka serwisu. Jest to brzydki kod, bo napisany w roucie zamiast w kontrolerze (lub jakiejś innej stosownej do tego klasie).

**routes/web.php**
```php
Route::get('/locale/{locale}', function ($locale, \Illuminate\Http\Request $request) {
    App::setLocale($locale);
    $request->session()->put('lang', $locale);
    return redirect("/");
})->where("locale", "(pl|en|es)");
```

## Dodawanie nowych zdjęć:

  * Duże zdjęcia znajdują się w `public/img/hafty`. Na podstawie tego katalogu skrypt tworzy array'a z odnośnikami do zdjęć.
  * Miniaturki są przechowywane w folderze `public/img/miniaturki`. Miniaturka musi nazywać się tak samo jak duże zdjęcie. Powinna mieć wymiary `400px x 300px`.
  * Ustawienia odnośnie lokalizacji folderu ze zdjęciami oraz cały skrypt który przeszukuje te foldery znajdziemy w pliku `app/Repositories/PhotoRepository.php`. Metoda `getAll()` zwraca gotowego array'a z linkami do zdjęć i miniaturek. Wynik tej funkcji jest zwracany do widoku `resources/views/includes/gallery_blueimp.blade.php`. Nie jest to robione standardowo przez kontroler lub router, tylko poprzez tzw. *ViewComposer* o nazwie `PhotoComposer` (lokalizacja `app/Console/Http/ViewComposers/PhotoComposer.php`). Te dane są zwracane z kolei do zmiennej `$photos`, którą możemy używać w widoku.
  * Repozytorium do ViewComposera jest *wstrzykiwane* dzięki mechanizmowi Dependency Injection

Sam ViewComposer prezentuje się następująco. Jak widzimy, repozytorium z fotografiami jest &#8222;wstrzykiwane&#8221; dzięki mechanizmowi Dependency Injection.

```php
<?php 
namespace App\Http\ViewComposers; 
 
use App\Repositories\PhotoRepository; 
use Illuminate\View\View; 
 
class PhotoComposer 
{ 
    protected $photos; 
    public function __construct(PhotoRepository $photos) 
    { 
        $this->photos = $photos;
    }
 
    public function compose(View $view)
    {
        $view->with('photos', $this->photos->getAll());
    }
}
```

ViewComposer jest wykonywany dzięki ServiceProviderowi:
*linie 18-20*
```php
<?php
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
}
```
## Instalacja

Standardowo -> pobieramy projekt do folderu `htdocs` Xamppa, albo do `www` Wampa (lampa, itp). Następnie otwieramy terminal (konsolę) w folderze z projektem i wpisujemy `composer install`, a potem `npm install`. Tak, projekt wymaga zainstalowanego Composera oraz Node.js.

Być może będzie wymagane odblokowanie `php_intl.dll` w pliku `php.ini` w konfiguracji naszego serwera, ale to już jest spowodowane przez wymagania samego Laravela.

Następnie musimy przejść do pliku `node_modules/elixir-typescript/index.js` i zakomentować w nim linijkę: `//.pipe($.concat(paths.output.name))`.

Na koniec wpisujemy komendę `gulp` by skompilować assety (pliki TypeScript) Angulara 2.

