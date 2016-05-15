- namespace docs.ru.api['1::Директивы']['1::Создание шаблона']['7::end']

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

Директива декларирует завершение [блочной директивы](guide#{@@prfx}.html#basics--Блочные_директивы).

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы         | Интерполяция |
|-----------------|--------------------|-----------------------|--------------|
| Без ограничений | `/`                | Строковая, логическая | Не требуется |

## Описание

Директива используется для завершения блочной директивы в [классическом синтаксисе Snakeskin](guide#{@@prfx}.html#basics--Синтаксис_управляющих_конструкций)
(в [jade-like](guide#{@@prfx}.html#jadeLike)) она ставиться автоматически). У директивы есть 4-ре формы использования:

```classic
\/// Полная форма
{if 1 > 2}
	...
{end if}

\/// Сокращённая форма
{if 1 > 2}
	...
{end}

\/// Альтернативная полная форма
{if 1 > 2}
	...
{/if}

\/// Альтернативная сокращённая форма
{if 1 > 2}
	...
{/}
```

Какую форму использовать решает сам разработчик, но следует отметить, что при использовании форм с указанием
имени закрываемой директивы Snakeskin будет проверять правильность, т.е.:

```classic
{if 1 > 2}
	...
{/else} \/// Ошибка
```

#{/block}
{/template}