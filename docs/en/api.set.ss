- namespace docs.en.api['1::Directives']['1::Создание шаблона']['6::set']

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

Директива задаёт значение указанному [параметру трансляции](guide#{@@prfx}.html#introSet).

## Паспорт

| Декларация                  | Короткий синтаксис | Тип директивы         | Интерполяция |
|-----------------------------|--------------------|-----------------------|--------------|
| Только в глобальной области | `@=`               | Строковая, логическая | Не требуется |

## Поддерживаемые параметры

* [renderMode](api#{@@prfx}.html#compile--renderMode)
* [renderAs](api#{@@prfx}.html#compile--renderAs)
* [localization](api#{@@prfx}.html#compile--localization)
* [i18nFn](api#{@@prfx}.html#compile--i18nFn)
* [i18nFnOptions](api#{@@prfx}.html#compile--i18nFnOptions)
* [literalBounds](api#{@@prfx}.html#compile--literalBounds)
* [bemFilter](api#{@@prfx}.html#compile--bemFilter)
* [filters](api#{@@prfx}.html#compile--filters)
* [language](api#{@@prfx}.html#compile--language)
* [ignore](api#{@@prfx}.html#compile--ignore)
* [tolerateWhitespaces](api#{@@prfx}.html#compile--tolerateWhitespaces)
* [doctype](api#{@@prfx}.html#compile--doctype)

#{/block}
{/template}
