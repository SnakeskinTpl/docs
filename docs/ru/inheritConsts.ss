- namespace docs.ru.guide['3::Наследование']['6::Наследование констант']

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

Константы - это специальный вид переменных, которые могут явно переопределяться в дочернем шаблоне и имеют глобальную область
видимости в рамках своего шаблона. В шаблоне не может быть двух констант с одинаковым именем, а также переменных, имя которых
совпадает с именем константы (за исключением входных параметров вложенных функций).

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	- title = 'Заголовок'
	< title
		{title}

- template sub() extends base
	- title = 'Новый заголовок'
```

```classic
{namespace demo}

{template base()}
	{title = 'Заголовок'}
	{< title}
		{title}
	{/}
{/template}

{template sub() extends base}
	{title = 'Новый заголовок'}
{/template}
```

#{/}

Допускается вводить новые константы в дочернем шаблоне - они вставятся сразу после родительских.

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	- title = 'Заголовок'
	< title
		{title}

- template sub() extends @base
	- title = 'Новый заголовок'
	- bar = 'foo'
```

```classic
{namespace demo}

{template base()}
	{title = 'Заголовок'}
	{< title}
		{title}
	{/}
{/template}

{template sub() extends @base}
	{title = 'Новый заголовок'}
	{bar = 'foo'}
{/template}
```

#{/}

Если константа была вызываемой, то это поведение также наследуется.

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	< title
		- title = 'Заголовок' ?

- template sub() extends @base
	- title = 'Новый заголовок'
```

```classic
{namespace demo}

{template base()}
	{< title}
		{title = 'Заголовок' ?}
	{/}
{/template}

{template sub() extends @base}
	{title = 'Новый заголовок'}
{/template}
```

#{/}

#{/block}
{/template}
