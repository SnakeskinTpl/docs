- namespace docs.en.api['1::Directives']['4::Scope']['1::with']

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

Директива задаёт область видимости для поиска свойств объекта.

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | Absent        | Block, logic | Not required |

## Description

Директива позволяет задать "виртуальную" область видимости для объекта, чтобы затем обращаться к его свойствам с помощью
специального модификатора контекста `@`, например:

#{+= self.example()}

```jade-like
- var base = {child: {name: 'Moscow'}}

- with base.child
	? console.log(@name) \/// Moscow
```

```classic
{var base = {child: {name: 'Moscow'}}}

{with base.child}
	{? console.log(@name)} \/// Kobezzza
{/}
```

#{/}

С помощью `@` можно как получать, так и устанавливать свойства объекту.

#{+= self.example()}

```jade-like
- var base = {child: {name: 'Moscow'}}

- with base.child
	? @name = 'Washington'
	? @type = 'city'

? console.log(base.child.name) \/// Washington
? console.log(base.child.type) \/// city
```

```classic
{var base = {child: {name: 'Moscow'}}}

{with base.child}
	{? console.log(@name)} \/// Kobezzza
	{? @name = 'Washington'}
{/}

{console.log(base.child.name)} \/// Washington
```

#{/}

Любые входные параметры функциональных директив Snakeskin ([template](#template), [forEach](#forEach) и т.д.)
поддерживают короткую запись декларации *with*.

#{+= self.example()}

```jade-like
- namespace demo
- template index(@params)
	{@name} \/// params.name
```

```classic
{namespace demo}
{template index(@params)}
	{@name} \/// params.name
{/template}
```

#{/}

Такая запись эквивалентна:

#{+= self.example()}

```jade-like
- namespace demo
- template index(params)
	- with params
		{@name}
```

```classic
{namespace demo}
{template index(params)}
	{with params}
		{@name}
	{/}
{/template}
```

#{/}

Можно вкладывать with-блоки друг в друга, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- with params
		{@name} \/// params.name
		- with @data
			{@type} \/// params.data.type
```

```classic
{namespace demo}
{template index(params)}
	{with params}
		{@name} \/// params.name
		{with params}
			{@type} \/// params.data.type
		{/}
	{/}
{/template}
```

#{/}

Директива может использоваться как внутри шаблонов or других директив, так и в глобальной области.

#{/block}
{/template}
