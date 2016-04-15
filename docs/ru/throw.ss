- namespace docs.ru.api['Директивы']['8::Работа с исключениями']['2::throw']

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

Директива **throw** является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы         | Интерполяция |
|-----------------|--------------------|-----------------------|--------------|
| Без ограничений | Отсутствует        | Строковая, логическая | Не требуется |

## Описание

Директива генерирует заданное исключение и начинается с ключевого слова `throw`, которое должно сопровождаться выражением.
Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- throw new Error('Ошибка')
```

```classic
{throw new Error('Ошибка')}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области.

### Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	< .result
		- if value > 1
			- throw new Error('Invalid value')
```

```classic
{namespace demo}
{template index(value)}
	{< .result}
		{if value > 1}
			{throw new Error('Invalid value')}
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
