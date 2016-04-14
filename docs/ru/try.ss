- namespace docs.ru.api['Директивы']['Работа с исключениями']['1::try']

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

Директива **try** является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы       |
|-----------------|--------------------|---------------------|
| Без ограничений | Отсутствует        | Блочная, логическая |

## Описание

Директива позволяет вашему шаблону отлавливать и обрабатывать исключения, которые могут возникать по ходу выполнения
программы на Snakeskin.

Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- try
	? 1 2
```

```classic
{try}
	{1 2}
{/try}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области. Вместе с основной
директивой можно использовать дополнительные:

1. `catch` - аналог `catch` в JS;
2. `finally` - аналог `finally` в JS.

### Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	< .result
		- try
			? value = JSON.parse(value)

		- catch err
			? console.error(err)

		- finally
			Hello world!
```

```classic
{namespace demo}
{template index(value)}
	{< .result}
		{try}
			{? value = JSON.parse(value)}

		{catch err}
			{? console.error(err)}

		{finally}
			Hello world!
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
