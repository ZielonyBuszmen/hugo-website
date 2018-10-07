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

Domyślna dokumentacja Reduxa podaje jeden przepis na pisanie reducerów. A wygląda on tak: 

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

Składnia stanie się szybko nieczytelna, gdy zaczniemy wrzucać coraz więcej akcji i kodu obrabiającego stan aplikacji.

A co, gdyby reducer wyglądał tak:
```javascript
{
  [SET_VISIBILITY_FILTER](state, action) {
    const newState = {...state, visibilityFilter: action.filter};
    return newState;
  },
  [SET_PRIVS]: setNewPrivs,
}
```
Składnia jest o wiele czytelniejsza, nie ma problemu z zasięgiem stałych, nie trzeba pamiętać o przypadku `default: return state;`. `setNewPrivs` jest funkcją o implementacji:

```javascript
function setNewPrivs(state, action) {
  const newState = {...state, newPrivs: action.privs};
  return newState;
}
```

Spróbujmy więc zaimplementować najpierw funkcję, która będzie przyjmowała taki obiekt, i tworzyła na jego podstawie działający reducer.

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
Parametr `initialState` to początkowy stan danego reducera, natomiast `handlers` to nasz obiekt, który stworzyliśmy wyżej.
Ta funkcja (`createReducer`) zwraca inną funkcję, o nazwie `reducer`. Jednak nie trzeba nazywać jej wogóle, można również zwracać _arrow function_. Funkcja ta to zwykły reducer, inaczej zapisany `switch` z pierwszego listingu. Jej działanie jest następujące. Sprawdza, czy obiekt przekazany do `handlers` zawiera klucz o takiej nazwie, jak akcja, która została przekazana. Jeśli go odszuka, to go zwraca. A z racji tego, że każdy klucz ma funkcję zamiast wartości, to ją wywołuje i przekazuje do niej parametry `state` oraz `action`. Gdy taki klucz nie zostanie odnaleziony, wówczas zwracamy domyślny state, bez żadnych zmian.

Teraz możemy stworzyć reducer, który będzie wyglądał tak:

```javascript
export const userReducer = createReducer(null, {
  [SET_VISIBILITY_FILTER](state, action) {
    const newState = {...state, visibilityFilter: action.filter};
    return newState;
  },
  [SET_PRIVS]: setNewPrivs,
});
```

Pierwszy parametr, który jest tutaj `nullem`, to stan domyślny (parametr `initialState`).

Stworzony tak reducer możemy spokojnie opakować w combineReducers, w sposób jaki robiliśmy to normalnie.