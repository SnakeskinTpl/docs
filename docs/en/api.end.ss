- namespace docs.en.api['1::Directives']['1::Creating templates']['7::end']

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

Директива декларирует завершение [блочной директивы](#{@@guide}#basics--Блочные_директивы).

## Synopsis

| Declaration      | Shorthand | Directive type         | Interpolation |
|-----------------|--------------------|-----------------------|--------------|
| No limits | `/`                | Inline, logic | Not required |

## Description

Директива используется для завершения блочной директивы в [классическом синтаксисе Snakeskin](#{@@guide}#basics--Синтаксис_управляющих_конструкций)
(в [jade-like](#{@@guide}#jadeLike)) она ставиться автоматически). У директивы есть 4-ре формы использования:

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
