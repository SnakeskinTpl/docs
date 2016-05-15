- namespace docs.ru.api['1::Директивы']['17::Разное']['1::op']

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

Директива создаёт логический блок Snakeskin без "побочного эффекта".

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы       | Интерполяция |
|-----------------|--------------------|---------------------|--------------|
| Без ограничений | Отсутствует        | Блочная, логическая | Не требуется |

## Описание

Директива используется для перехода в [расширенный синтаксис](guide.html#basics--Расширенный_синтаксис) без
"побочных эффектов" других директив, т.е. сама директива ничего не делает. Директива может использоваться как внутри
шаблонов или других директив, так и в глобальной области.

### Примеры

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	# op
		{name: 'world'}
```

```classic
{namespace demo}
{template index()}
	\#{op}
		{name: 'world'}
	\#{/}
{/template}
```

#{/}

#{/block}
{/template}
