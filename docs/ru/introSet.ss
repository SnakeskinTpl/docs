- namespace docs.ru.guide['2::Основы']['7::Параметры трансляции']

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

Транслятор Snakeskin поддерживает множество дополнительных режимов работы, которые можно задавать через метод
[compile](api.html#compile) и т.д., но также, Snakeskin позволяет декларировать часть таких параметров непосредственно
в тексте программы, например:

#{+= self.example()}

```jade-like
@= tolerateWhitespaces true
@= literalBounds ['<?php', '?>']
```

```classic
{@= tolerateWhitespaces true}
{@= literalBounds ['<?php', '?>']}
```

#{/}

Задачу параметров трансляции выполняет директива [set](api.html#set), которая имеет короткий синтаксис декларации `@=`.
Поддерживаются следующие параметры:

* [renderMode](api.html#compile--renderMode)
* [renderAs](api.html#compile--renderAs)
* [localization](api.html#compile--localization)
* [i18nFn](api.html#compile--i18nFn)
* [i18nFnOptions](api.html#compile--i18nFnOptions)
* [literalBounds](api.html#compile--literalBounds)
* [bemFilter](api.html#compile--bemFilter)
* [filters](api.html#compile--filters)
* [language](api.html#compile--language)
* [ignore](api.html#compile--ignore)
* [tolerateWhitespaces](api.html#compile--tolerateWhitespaces)
* [doctype](api.html#compile--doctype)

Параметры заданные таким способом распространяются на все шаблоны в файле, а также на все подключаемые файлы, если
они там явно не переопределяются.

## Локальные параметры

Параметр трансляции можно задать локально для конкретного шаблона, причём можно совмещать оба способа декларации,
например:

#{+= self.example()}

```jade-like
@= tolerateWhitespaces true
- namespace demo

- template index() @= literalBounds ['<?php', '?>']
	{{ Hello }}
```

```classic
{@= tolerateWhitespaces true}
{namespace demo}

{template index() @= literalBounds ['<?php', '?>']}
	{{ Hello }}
{/template}
```

#{/}

#{/block}
{/template}
