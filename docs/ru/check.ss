- namespace docs.ru.api['2::JS API']['2::node.js']['1::check']

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include '../../tpls/modules/base'

{template main[%fileName%]() extends base.main}
#{block root}

Метод вернёт `true`, если заданный файл шаблонов соответствует скомпилированному по временной метке.

## Интерфейс

```js
Snakeskin.check(source, result) { return boolean; }
```

### Аргументы

1. `string` `source` - путь к исходному файлу;
2. `string` `result` - путь к скомпилированному файлу.

#{/block}
{/template}
