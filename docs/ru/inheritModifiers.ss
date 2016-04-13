- namespace docs.ru.guide['3::Наследование']['4::Наследование модификаторов шаблона']

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

Модификаторы вида [async](#introTemplates--Асинхронный_шаблон) и [генератор](#introTemplates--Шаблон-генератор) наследуются
дочерними шаблонами без возможности переопределения этого поведения.

#{+= self.example()}

```jade-like
- namespace demo

- async template base()
	- var data = await db.getData()

\/// Тоже самое, что и
\/// async template sub() extends @base
- template sub() extends @base
```

```classic
{namespace demo}

{async template base()}
	{var data await db.getData() /}
{/template}

\/// Тоже самое, что и
\/// async template sub() extends @base
{template sub() extends @base}
{/template}
```

#{/}

[Декораторы шаблонов](#introTemplates--Декораторы) также наследуются, а дочерний шаблон может добавить новые,
которые применятся после родительских.

#{+= self.example()}

```jade-like
- namespace demo

- myDecorator1
- myDecorator2
- template base()

- myDecorator3
- template sub() extends @base
```

```classic
{namespace demo}

{myDecorator1}
{myDecorator2}
{template base()}
{/template}

{myDecorator3}
{template sub() extends @base}
{/template}
```

#{/}

#{/block}
{/template}
