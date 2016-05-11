- namespace docs.ru.api['2::JS API']['2::node.js']['3::execFile']

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

Метод скомпилирует заданный файл и вернёт ссылку на главный шаблон.

Главный шаблон определяется по правилу: `название файла без расширения` или `main` или `index` или `Object.keys().sort()[0]`.

## Интерфейс

```js
Snakeskin.execFile(src, opt_params, opt_tplName) { return Function; }
```

### Аргументы

1. `string` `src` - путь к файлу шаблонов;
2. `Object=` `opt_params` - [дополнительные параметры запуска](#compile);
3. `?string=` `opt_tplName` - имя главного шаблона.

#{/block}
{/template}
