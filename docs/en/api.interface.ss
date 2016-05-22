- namespace docs.en.api['1::Directives']['1::Creating templates']['3::interface']

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

Директива декларирует шаблон-интерфейс c заданным именем и входными параметрами.

## Synopsis

| Declaration                                                                                 | Shorthand | Directive type                       | Interpolation |
|--------------------------------------------------------------------------------------------|--------------------|-------------------------------------|--------------|
| Only in the global scope, require pre-declaration of [namespace] (# namespace) | Absent        | Block, logic, function | Not required |

## Description

Шаблон-интерфейс отличается от простого шаблона тем, что после трансляции в JS будет получена пустая функция с входными параметрами,
например:

#{+= self.example()}

```jade-like
- namespace demo
- interface index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{interface index(name = 'world')}
	Hello {name}!
{/interface}
```

#{/}

Превратится в:

```js
exports.demo.index = function index(name) {};
```

В остальном механика таких шаблонов полностью идентичная [template](#template).

#{/block}
{/template}
