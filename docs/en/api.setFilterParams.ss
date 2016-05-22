- namespace docs.en.api['2::JS API']['1::Общее']['3::setFilterParams']

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

Метод задаёт заданному фильтру [дополнительные параметры](#{@@guide}#filters--Дополнительные_параметры_фильтров).

## Интерфейс

```js
Snakeskin.setFilterParams(filter, params) { return Function; }
```

### Аргументы

1. `(string|!Function)` `filter` - название фильтра or функция-фильтр;
2. `!Object` `params` - параметры фильтра.

#{/block}
{/template}
