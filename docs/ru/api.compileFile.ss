- namespace docs.ru.api['2::JS API']['2::node.js']['2::compileFile']

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

Метод скомпилирует заданный файл и вернёт ссылку на объект полученных шаблонов.

## Интерфейс

```js
Snakeskin.compileFile(src, opt_params) { return !Object || false; }
```

### Аргументы

1. `string` `src` — путь к файлу шаблонов;
2. `Object=` `opt_params` — [дополнительные параметры запуска](#compile).

#{/block}
{/template}
