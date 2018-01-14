---
title: Laravel i Angular w jednym stali domku
subtitle: Instalacja Angulara 2 w projekcie Laravela 5
author: Krzysiek Komar
type: post
date: 2017-03-01T21:47:42+00:00
url: /2017/03/01/instalacja-angulara2-do-laravela5-do-wspoldzialania/
categories:
  - Programowanie
tags:
  - Angular
  - Laravel

---
Na necie jest cała masa poradników, jak zainstalować Angulara2. Tylko wszystkie mają pewien problem – Angular instaluje się jako „stand-alone”. Jak więc go dodać do Laravela? Jest jeden prosty sposób – korzystać z Laravela jako API, a cała aplikacja (front) powinna być zrobiona w Angularze2. Takie rozwiązanie mnie nie satysfakcjonowało, więc spróbowałem **zainstalować Angulara razem z Laravelem**, tak aby korzystać z odpowiedniej struktury katalogów oraz nie zaburzyć porządku w aplikacji Laravela.

Na samym początku uprzedzam, że roboty jest sporo, coś zawsze może pójść nie tak, więc trzeba przygotować spory zapas czasu na poniższą *zabawę*

# Zaczynamy

  1. W głównym katalogu szukamy pliku `package.json` i podmieniamy w nim kod na poniższy: 
```javascript
{
  "private": true,
  "scripts": {
    "prod": "gulp --production",
    "dev": "gulp watch",
    "start": "tsc && concurrently \"npm run tsc:w\" \"npm run lite\" ",
    "lite": "lite-server",
    "postinstall": "typings install",
    "tsc": "tsc",
    "tsc:w": "tsc -w",
    "typings": "typings"
  },
  "dependencies": {
    "@angular/common": "2.0.0",
    "@angular/compiler": "2.0.0",
    "@angular/core": "2.0.0",
    "@angular/forms": "2.0.0",
    "@angular/http": "2.0.0",
    "@angular/platform-browser": "2.0.0",
    "@angular/platform-browser-dynamic": "2.0.0",
    "@angular/router": "3.0.0",
    "@angular/upgrade": "2.0.0",
    "core-js": "^2.4.1",
    "reflect-metadata": "^0.1.3",
    "rxjs": "5.0.0-beta.12",
    "systemjs": "0.19.27",
    "zone.js": "^0.6.23",
    "angular2-in-memory-web-api": "0.0.20",
    "bootstrap": "^3.3.6"
  },
  "devDependencies": {
    "bootstrap-sass": "^3.3.7",
    "concurrently": "^2.2.0",
    "elixir-typescript": "2.0.0",
    "gulp": "^3.9.1",
    "jquery": "^3.1.0",
    "laravel-elixir": "^6.0.0-9",
    "laravel-elixir-browsersync-official": "^1.0.0",
    "laravel-elixir-vue": "^0.1.4",
    "laravel-elixir-webpack-official": "^1.0.2",
    "lite-server": "^2.2.2",
    "lodash": "^4.14.0",
    "typescript": "^2.0.2",
    "typings": "^1.3.2",
    "vue": "^1.0.26",
    "vue-resource": "^0.9.3"
  }
}
```
Jest to plik, który "zarządza" pakietami Node.js. Dzięki niemu w łatwy sposób w dalszej części ściągniemy wszystkie wymagane biblioteki.
 

  2. W głównym katalogu tworzymy plik `tsconfig.json`
```javascript
  {
    "compilerOptions": {
      "target": "es5",
      "module": "commonjs",
      "moduleResolution": "node",
      "sourceMap": true,
      "emitDecoratorMetadata": true,
      "experimentalDecorators": true,
      "removeComments": false,
      "noImplicitAny": false
    }
  }
```
Plik konfiguracyjny dla skryptu kompilującego typescript do JSa


  3. Tworzymy plik `typings.json` również w głównym katalogu
```javascript
{
  "globalDependencies": {
    "core-js": "registry:dt/core-js#0.0.0+20160725163759",
    "jasmine": "registry:dt/jasmine#2.2.0+20160621224255",
    "node": "registry:dt/node#6.0.0+20160909174046"
  }
}
```
  4. Uruchamiamy terminal i wpisujemy w nim komendę: 
```cmd
    npm install
```
Może to trochę potrwać, bo właśnie teraz do katalogu  _node_modules_ pobierają się wszystkie paczki wymienione w pliku _package.json_
    
5. Po tym przechodzimy do `node_modules/elixir-typescript/index.js` i komentujemy poniższą linijkę: (nr 45)
```javascript
//.pipe($.concat(paths.output.name))
```
Jak by nie patrzeć to edytujemy plik "systemowy", nie powinno się tak robić. Niestety, w tym wypadku musimy. Bo gdy nie zakomentujemy tej linijki, skrypt kompilujący TS do JS wrzuci wszystko do jednego pliku app.js. A nie o to nam chodzi. Chcemy przecież, by kompilator TSa skompilował każdy plik oddzielnie. Stąd też taka mała zmiana w kodzie źródłowym. 

6. Przechodzimy do `resources/assets/typescript` i tworzymy w nim 3 pliki: `app.component.ts`, `app.module.ts`, `main.ts`. (Gdyby folder _typescript_ nie istniał, to go oczywiście tworzymy 😉 ).    <br />   
Będą to pliki naszej aplikacji Angularowej. Tutaj będziemy rozszerzać jej funkcjonalność o nowe komponenty.

 
**app.module.ts**
```typescript
///<reference path="../../../typings/index.d.ts"/>
import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent }   from './app.component';
@NgModule({
    imports:      [ BrowserModule ],
    declarations: [ AppComponent ],
    bootstrap:    [ AppComponent ]
})
export class AppModule { }
```

**app.component.ts**    
```typescript
import { Component } from '@angular/core';
@Component({
    selector: 'my-app',
    template: '
 
<h1>Moja angularowa aplikacja działa! Jak trzeba</h1>
 
 
'
})
export class AppComponent { }
```

**main.ts**
```typescript
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app.module';
const platform = platformBrowserDynamic();
platform.bootstrapModule(AppModule);
```
        
7.&nbsp;Przechodzimy do głównego katalogu i do pliku `gulpfile.js` wklejamy poniższy kod 
```javascript
const elixir = require('laravel-elixir');
 
require('laravel-elixir-vue');
require('elixir-typescript');
 
/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */
 
elixir(function(mix){
 
    /* Copy angular2 JS vendor files */
    mix
    .copy('node_modules/@angular', 'public/js/angular2_vendor/@angular')
    .copy('node_modules/anular2-in-memory-web-api', 'public/js/angular2_vendor/anular2-in-memory-web-api')
    .copy('node_modules/core-js', 'public/js/angular2_vendor/core-js')
    .copy('node_modules/reflect-metadata', 'public/js/angular2_vendor/reflect-metadata')
    .copy('node_modules/systemjs', 'public/js/angular2_vendor/systemjs')
    .copy('node_modules/rxjs', 'public/js/angular2_vendor/rxjs')
    .copy('node_modules/zone.js', 'public/js/angular2_vendor/zone.js');
    
    /* Angular2 Scripts */
    mix.typescript(
        [
            'app.component.ts',
            'app.module.ts',
            'main.ts'
        ],
        'public/app_angular2',
        {
            "target": "es5",
            "module": "system",
            "moduleResolution": "node",
            "sourceMap": true,
            "emitDecoratorMetadata": true,
            "experimentalDecorators": true,
            "removeComments": false,
            "noImplicitAny": false
        }
    );
});
```
            
Wykorzystujemy tutaj dobrodziejstwo Laravela i jego  _Elixir Mix_. Więcej do poczytania w dokumentacji wersji 5.3: [laravel.com/docs/5.3/elixir](https://laravel.com/docs/5.3/elixir)


8.&nbsp;Tworzymy folder w `public/app_angular2` i wpisujemy komendę w _terminalu_ 
```html
gulp
```
   
9.&nbsp;W katalogu `/public` tworzymy plik **systemjs.config.js** 
```javascript
/**
 * System configuration for Angular samples
 * Adjust as necessary for your application needs.
 */
(function (global) {
    System.config({
 
        // map tells the System loader where to look for things
        map: {
            // our app is within the app folder
            app: 'app_angular2',
            // angular bundles
            '@angular/core': 'js/angular2_vendor/@angular/core/bundles/core.umd.js',
            '@angular/common': 'js/angular2_vendor/@angular/common/bundles/common.umd.js',
            '@angular/compiler': 'js/angular2_vendor/@angular/compiler/bundles/compiler.umd.js',
            '@angular/platform-browser': 'js/angular2_vendor/@angular/platform-browser/bundles/platform-browser.umd.js',
            '@angular/platform-browser-dynamic': 'js/angular2_vendor/@angular/platform-browser-dynamic/bundles/platform-browser-dynamic.umd.js',
            '@angular/http': 'js/angular2_vendor/@angular/http/bundles/http.umd.js',
            '@angular/router': 'js/angular2_vendor/@angular/router/bundles/router.umd.js',
            '@angular/forms': 'js/angular2_vendor/@angular/forms/bundles/forms.umd.js',
            // other libraries
            'rxjs':                       'js/angular2_vendor/rxjs',
            'angular2-in-memory-web-api': 'js/angular2_vendor/angular2-in-memory-web-api',
        },
        // packages tells the System loader how to load when no filename and/or no extension
        packages: {
            app: {
                main: './main.js',
                defaultExtension: 'js'
            },
            rxjs: {
                defaultExtension: 'js'
            },
            'angular2-in-memory-web-api': {
                main: './index.js',
                defaultExtension: 'js'
            }
        }
    });
})(this);
```

10.&nbsp;Na koniec tworzymy widok, w którym wklejamy skrypt inicjalizujący aplikację Angulara2. Nie zapomnijmy go wywołać w kontrolerze, albo dodać do routa 🙂 
```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
 
        <title>Laravel 5.3 - Angular 2</title>
 
        <!-- 1. Load libraries -->
        <!-- Polyfill(s) for older browsers -->
        {{ Html::script('core-js/client/shim.min.js') }}
        {{ Html::script('zone.js/dist/zone.js') }}
        {{ Html::script('reflect-metadata/Reflect.js') }}
        {{ Html::script('systemjs/dist/system.src.js') }}
        {{ Html::script('systemjs.config.js') }}
 
    
    <script>
        System.import('app_angular2').catch(function(err){ console.error(err); });
    </script>
 
    </head>
    <!-- 3. Display the application -->
    <body>
    <my-app>Loading...</my-app>
    </body>
</html>
```
                    
11.&nbsp;Vua La! Po uruchomieniu aplikacji powinniśmy zobaczyć napis **_Moja angularowa aplikacja działa! Jak trzeba</b>_. Nie pozostaje nam nic innego, jak rozpoczęcie tworzenia kodu. Warto dodać, że po każdej zmianie pliku w folderze typescripts musimy wpisać komendę `gulp`, która zaktualizuje nam pliki js. Aby proces ten zautomatyzować, możemy wpisać komendę  `gulp watch`, która rozwiąże problem
