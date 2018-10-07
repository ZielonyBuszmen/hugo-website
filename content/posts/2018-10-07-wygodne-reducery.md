---
title: Wygodne Reducery
subtitle: Sposób na pisanie czytelnych Reducerów w Reduxie
author: Krzysiek Komar
type: post
date: 2018-10-07
url: /2018/10/07/wygodne-reducery/
categories:
  - Programowanie
tags:
  - JavaScript
  - React

---

Dokumentacja Reduxa, pokazująca jego podstawy, podaje jeden przepis na pisanie reducerów. Nie jest on skomplikowany, gdyż korzysta z każdemu znanej konstrukcji `switch() case`. 

Wygląda on tak: 
```javascript
function todoApp(state, action) {
  switch (action.type) {
    case SET_VISIBILITY_FILTER:
      const newState = {...state, visibilityFilter: action.filter};
      return newState;
    case SET_PRIVS:
        return setNewPrivs(state);
    default:
      return state
  }
}
```
Gdy zaczniemy dorzucać kolejne akcje, składnia stanie się szybko nieczytelna.

A co, gdyby reducer wyglądał tak:
```javascript
function setNewPrivs(state, action) {
  const newState = {...state, newPrivs: action.privs};
  return newState;
}
// ...
// obiekt z akcjami
{
  [SET_VISIBILITY_FILTER](state, action) {
    const newState = {...state, visibilityFilter: action.filter};
    return newState;
  },
  [SET_PRIVS] : setNewPrivs,
}
```

Składnia jest o wiele czytelniejsza, nie ma problemu z zasięgiem stałych, nie trzeba pamiętać o przypadku `default: return state;`.

Spróbujmy więc zaimplementować funkcję, która będzie przyjmowała taki obiekt z akcjami, i tworzyła na jego podstawie działający reducer. Nazwiemy ją `createReducer`:

```javascript
export const createReducer = (initialState, handlers) => {
  return function reducer(state = initialState, action) {
    if (handlers.hasOwnProperty(action.type)) {
      return handlers[action.type](state, action);
    } else {
      return state;
    }
  }
};
```
Parametr `initialState` to początkowy stan danego reducera, natomiast `handlers` to nasz obiekt z akcjami (ten przykładowy, pokazany wyżej).

Funkcja `createReducer` zwraca inną funkcję, o nazwie `reducer`. Jednak nie trzeba nazywać jej w ogóle, można również zwracać _arrow function_. Funkcja ta, to nic innego, jak inaczej zapisany `switch`. Jej działanie jest następujące. Sprawdza, czy obiekt przekazany do `handlers` zawiera klucz o takiej nazwie, jak akcja, która została przekazana. Jeśli go odszuka, to go zwraca. A z racji tego, że każdy klucz zamiast wartości, ma przypisaną funkcję, to ją wywołuje i przekazuje do niej parametry `state` oraz `action`. Gdy taki klucz nie zostanie odnaleziony, wówczas zwraca domyślny `state`, bez żadnych zmian.

Teraz możemy stworzyć reducer, który będzie wyglądał tak:

```javascript
export const userReducer = createReducer(null, {
  [SET_VISIBILITY_FILTER](state, action) {
    const newState = {...state, visibilityFilter: action.filter};
    return newState;
  },
  [SET_PRIVS] : setNewPrivs,
});
```

Pierwszy parametr, który jest tutaj `nullem`, to domyślny stan tego reducera (parametr `initialState`).

Tak stworzony reducer możemy spokojnie opakować w `combineReducers` w sposób, jaki robiliśmy to normalnie:
```javascript
export const reducer = combineReducers({
    userReducer,
    messageReducer,
});
```