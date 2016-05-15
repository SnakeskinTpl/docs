- namespace docs.en.guide['2::Основы']['7::Параметры трансляции']

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
[compile](api#{@@prfx}.html#compile) и т.д., но также, Snakeskin позволяет декларировать часть таких параметров непосредственно
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

Задачу параметров трансляции выполняет директива [set](api#{@@prfx}.html#set), которая имеет короткий синтаксис декларации `@=`.
Поддерживаются следующие параметры:

* [renderMode](api#{@@prfx}.html#compile--renderMode)
* [renderAs](api#{@@prfx}.html#compile--renderAs)
* [localization](api#{@@prfx}.html#compile--localization)
* [i18nFn](api#{@@prfx}.html#compile--i18nFn)
* [i18nFnOptions](api#{@@prfx}.html#compile--i18nFnOptions)
* [literalBounds](api#{@@prfx}.html#compile--literalBounds)
* [bemFilter](api#{@@prfx}.html#compile--bemFilter)
* [filters](api#{@@prfx}.html#compile--filters)
* [language](api#{@@prfx}.html#compile--language)
* [ignore](api#{@@prfx}.html#compile--ignore)
* [tolerateWhitespaces](api#{@@prfx}.html#compile--tolerateWhitespaces)
* [doctype](api#{@@prfx}.html#compile--doctype)

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
