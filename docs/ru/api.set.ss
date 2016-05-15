- namespace docs.ru.api['1::Директивы']['1::Создание шаблона']['6::set']

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

Директива задаёт значение указанному [параметру трансляции](#{@@guide}#introSet).

## Паспорт

| Декларация                  | Короткий синтаксис | Тип директивы         | Интерполяция |
|-----------------------------|--------------------|-----------------------|--------------|
| Только в глобальной области | `@=`               | Строковая, логическая | Не требуется |

## Поддерживаемые параметры

* [renderMode](#{@@api}#compile--renderMode)
* [renderAs](#{@@api}#compile--renderAs)
* [localization](#{@@api}#compile--localization)
* [i18nFn](#{@@api}#compile--i18nFn)
* [i18nFnOptions](#{@@api}#compile--i18nFnOptions)
* [literalBounds](#{@@api}#compile--literalBounds)
* [bemFilter](#{@@api}#compile--bemFilter)
* [filters](#{@@api}#compile--filters)
* [language](#{@@api}#compile--language)
* [ignore](#{@@api}#compile--ignore)
* [tolerateWhitespaces](#{@@api}#compile--tolerateWhitespaces)
* [doctype](#{@@api}#compile--doctype)

#{/block}
{/template}
