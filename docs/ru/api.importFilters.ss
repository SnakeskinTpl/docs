- namespace docs.ru.api['2::JS API']['1::Общее']['2::importFilters']

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

Метод импортирует заданный объект в пространство имён [фильтров Snakeskin](#{@@guide}#filters).

## Интерфейс

```js
Snakeskin.importFilters(filters, opt_namespace) { return undefined; }
```

### Аргументы

1. `!Object` `filters` - импортируемый объект;
2. `?string=` `opt_params` - пространство имён для сохранения, например, `foo.bar`.

#{/block}
{/template}
