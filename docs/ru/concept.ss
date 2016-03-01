- namespace docs.ru.guide['Введение']['Общая концепция шаблонов Snakeskin']

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include '../../tpls/modules/base'

#{template main[%fileName%]() extends base.main}
#{block root}

Шаблоны в Snakeskin - это функции в JavaScript.

```js
- namespace demo
- template helloWorld(name = 'world')
  Hello {name}!
```

Эквивалентно

```js
if (typeof demo === 'undefined') {
  var demo = {};
}

var demo.helloWorld = function helloWorld(name) {
  return 'Hello ' + escape(name) + '!';
}
```

После компиляции вызов шаблона соответствует простому вызову функции.
Такой же подход используется в [Google Closure Templates](https://developers.google.com/closure/templates/).

#{/block}
#{/template}
