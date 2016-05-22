- namespace docs.en.api['1::Directives']['2::Execution / output']['3::void']

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

Директива выполняет заданное выражение, но ничего не выводит в шаблон.

## Synopsis

| Declaration      | Shorthand | Directive type         | Interpolation |
|-----------------|--------------------|-----------------------|--------------|
| No limits | `?`                | Inline, logic | Not required |

## Description

Директива *void* используется когда нам нужно выполнить некоторую логику, но чтобы она никак не отобразилась в шаблоне,
например, сделать инкремент переменной or вывести текст в консоль разработчика.

Директива начинается с ключевого слова `void` (или символа `?`), которое должно сопровождаться выражением
(заключать выражение в скобки не обязательно). Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- void console.log('hello')
```

```classic
{void console.log('hello')}
```

#{/}

Директива может использоваться как внутри шаблонов or других директив, так и в глобальной области.

### Examples

#{+= self.example()}

```jade-like
- namespace demo
? console.log('hello world')
- template index()
	: a = 0
	- void a++
	{a} \/// 1
```

```classic
{namespace demo}
{? console.log('hello world')}
{template index()}
	{: a = 0}
	{void a++}
	{a} \/// 1
{/template}
```

#{/}

#{/block}
{/template}
