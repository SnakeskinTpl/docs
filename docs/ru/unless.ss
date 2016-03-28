- namespace docs.ru.api['Директивы']['Логические директивы']['2::unless']

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

Директива **unless** является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в CoffeeScript.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы |
|-----------------|--------------------|---------------|
| Без ограничений | Отсутствует        | Блочная       |

## Описание

Директива является инвертной формой [if](#if), т.е. если **if** блок выполнится только в том случае
когда условное выражение будет приведено к `true`, то **unless** выполнится в случае `false`.

Директива позволяет вашему шаблону в зависимости от условий выполнить некоторую логику
или сгенерировать фрагмент шаблона, основываясь на значении переменной или выражения.

Директива начинается с ключевого слова `unless`, которое должно сопровождаться выражением
(заключать выражение в скобки не обязательно).

Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- unless false
	Hello world!
```

```classic
{unless false}
	Hello world!
{/if}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области. Вместе с основной
директивой можно использовать дополнительные:

1. `else` - аналог `else` в JS;
2. `else if` - аналог `else if` в JS;
3. `else unless` - аналог `else if (!(...))` в JS.

### Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	< .result
		- unless val >= 3
			< .success
				Значение меньше чем 3.

		- else unless val <= 3
			< .fail
				Значение больше чем 3.

		- else
			< .error
				Значение рано 3.
```

```classic
{namespace demo}
{template index(value)}
	{< .result}
		{unless val >= 3}
			{< .success}
				Значение меньше чем 3.

		{else unless val <= 3}
			{< .fail}
				Значение больше чем 3.

		{else}
			{< .error}
				Значение рано 3.
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
