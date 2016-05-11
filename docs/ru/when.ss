- namespace docs.ru.api['1::Директивы']['15::Директивы для асинхронной работы']['4::when']

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

Директива является фасадом для [ECMAScript2015 Promise.then](http://www.html5rocks.com/en/tutorials/es6/promises/).

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы       | Интерполяция |
|-----------------|--------------------|---------------------|--------------|
| Без ограничений | Отсутствует        | Блочная, логическая | Не требуется |

## Описание

Директива является обёрткой над функцией Promise.then и позволяет создавать удобные цепочки
асинхронных вызовов. Директива начинается с ключевого слова `when`, которое должно сопровождаться выражением
(заключать выражение в скобки не обязательно). Вместе с директивой *when* должна использоваться
директива [callback](#callback), например:

#{+= self.example()}

```jade-like
- namespace demo

- template index(db)
	- when db.getData()
		() => data
			...

		() => err
			...
```

```classic
{namespace demo}

{template index()}
	{when db.getData()}
		{() => data}
			...
		{/}

		{() => err}
			...
		{/}
	{/}
{/template}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области.

#{/block}
{/template}
