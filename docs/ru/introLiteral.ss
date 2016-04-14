- namespace docs.ru.guide['2::Основы']['7::Интеграция с другими шаблонами']

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

Snakeskin поддерживает бесшовную интеграцию с другими шаблонными движками с помощью специальной директивы [literal](api.html#literal).
Как правило такой кейз возникает при интеграции Snakeskin c MVVM фреймворками, например, с Vue. Директива *literal* имеет
специальный синтаксис `{{ ... }}`, который скомпилируется согласно параметру [literalBounds](api.html#compile--literalBounds)
(по умолчанию используется `{{ ... }}`), например:

#{+= self.example()}

```jade-like
- namespace demo
- template index() @= literalBounds ['<?php', '?>']
	{{ Hello }}
```

```classic
{namespace demo}
{template index() @= literalBounds ['<?php', '?>']}
	{{ Hello }}
{/template}
```

#{/}

Отрендерится как:

```html
<?php Hello ?>
```

Для передачи значений Snakeskin внутрь директивы используется стандартный механизм интерполяции, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	{{ bar${1 + 2} }}
```

```classic
{namespace demo}
{template index()}
	{{ bar${1 + 2} }}
{/template}
```

#{/}

Отрендерится как:

```html
{{ bar3 }}
```

#{/block}
{/template}
