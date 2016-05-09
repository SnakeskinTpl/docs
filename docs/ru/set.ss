- namespace docs.ru.api['Директивы']['1::Создание шаблона']['6::set']

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

Директива задаёт значение указанному [параметру трансляции](guide.html#introSet).

## Паспорт

| Декларация                  | Короткий синтаксис | Тип директивы         | Интерполяция |
|-----------------------------|--------------------|-----------------------|--------------|
| Только в глобальной области | `@=`               | Строковая, логическая | Не требуется |

## Поддерживаемые параметры

* [renderMode](api.html#compile--renderMode)
* [renderAs](api.html#compile--renderAs)
* [localization](api.html#compile--localization)
* [i18nFn](api.html#compile--i18nFn)
* [i18nFnOptions](api.html#compile--i18nFnOptions)
* [literalBounds](api.html#compile--literalBounds)
* [bemFilter](api.html#compile--bemFilter)
* [filters](api.html#compile--filters)
* [language](api.html#compile--language)
* [ignore](api.html#compile--ignore)
* [tolerateWhitespaces](api.html#compile--tolerateWhitespaces)
* [doctype](api.html#compile--doctype)

#{/block}
{/template}
