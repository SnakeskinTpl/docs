- namespace docs.en.api['1::Directives']['17::Other']['1::op']

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

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | Absent        | Block, logic | Not required |

## Description

Директива используется для перехода в [расширенный синтаксис](#{@@guide}#basics--Расширенный_синтаксис) без
"побочных эффектов" других директив, т.е. сама директива ничего не делает. Директива может использоваться как внутри
шаблонов or других директив, так и в глобальной области.

### Examples

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
