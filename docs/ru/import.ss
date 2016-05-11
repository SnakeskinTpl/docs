- namespace docs.ru.api['Директивы']['13::Модули']['2::import']

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

Директива ипортирует в заданный файл ссылки из указанного JavaScript модуля и по своей семантике
близка к реализации в JavaScript.

## Паспорт

| Декларация                  | Короткий синтаксис | Тип директивы         | Интерполяция |
|-----------------------------|--------------------|-----------------------|--------------|
| Только в глобальной области | Отсутствует        | Строковая, логическая | Не требуется |

## Описание

Директива используется для испортирования JavaScript модулей в шаблон Snakeskin, а тип используемого импортирования зависит
от параметра трансляции [module](#compile--module) (по умолчанию используется require node.js).
Синтаксис директивы идентичен аналогичной конструкции в JavaScript ECMAScript2015. Директива может использоваться
только в глобальной области.

## Примеры

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
