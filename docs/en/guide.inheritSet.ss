- namespace docs.en.guide['3::Наследование']['3::Наследование параметров трансляции']

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

При наследовании шаблона также наследуются те параметры трансляции, которые были ассоциированы с родительским шаблоном.

#{+= self.example()}

```jade-like
- namespace demo

- template base(data) @= renderMode 'dom'

\/// @= renderMode 'dom'
- template child(data) extends @base
```

```classic
{namespace demo}

{template base(data) @= inlineIterators true @= renderMode 'dom'}
{/template}

\/// @= renderMode 'dom'
{template child(data) extends @base}
{/template}
```

#{/}

Допускается переопределение или доопределение параметров трансляции в дочернем шаблоне.

#{+= self.example()}

```jade-like
- namespace demo

- template base(data) @= renderMode 'stringConcat'

- template child(data) extends @base @= renderMode 'dom' @= tolerateWhitespaces true
```

```classic
{namespace demo}

{template base(data) @= inlineIterators true @= renderMode 'stringConcat'}
{/template}

{template child(data) extends @base @= renderMode 'dom' @= tolerateWhitespaces true}
{/template}
```

#{/}

#{/block}
{/template}
