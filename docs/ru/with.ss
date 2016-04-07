- namespace docs.ru.api['Директивы']['with']

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

Директива **with** задаёт область видимости для поиска свойств объекта.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | Отсутствует        | Блочная       |

## Описание

Директива позволяет задать "виртуальную" область видимости для объекта, чтобы затем обращаться к его свойствам с помощью
специального модификатора контекста `@`, например:

#{+= self.example()}

```jade-like
- var base = {child: {name: 'Moscow'}}

- with base.child
	? console.log(@name) \/// Kobezzza
	? @name = 'Washington'

? console.log(base.child.name) \/// Washington

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

Любые входные параметры "функциональных" директив Snakeskin ([template](#template), [forEach](#forEach) и т.д.)
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

Такая запись эквивалентна

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

#{/block}
{/template}
