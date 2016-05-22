- namespace docs.en.api['1::Directives']['13::Modules']['2::import']

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

Директива импортирует в заданный файл ссылки из указанного JavaScript модуля и по своей семантике
близка к реализации в JavaScript.

## Synopsis

| Declaration                                                         | Shorthand | Directive type         | Interpolation |
|--------------------------------------------------------------------|--------------------|-----------------------|--------------|
| Only in the global scope or on the global level of [head](#head) | Absent        | Inline, logic | Not required |

## Description

Директива используется для импортирования JavaScript модулей в шаблон Snakeskin, а тип используемого импортирования зависит
от параметра трансляции [module](#compile--module) (по умолчанию используется [UMD](https://github.com/umdjs/umd)).
Синтаксис директивы идентичен аналогичной конструкции в JS ES2015. Директива может использоваться
только в глобальной области or на глобальном уровне директивы *head*.

### Examples

#{+= self.example()}

```jade-like
- namespace demo

- import path from 'path'
- import * as os from 'os'
- import { readdirSync } from 'fs'

- template index()
	...
```

```classic
{namespace demo}

{import path from 'path'}
{import * as os from 'os'}
{import { readdirSync } from 'fs'}

{template index()}
	...
{/template}
```

#{/}

#{/block}
{/template}
