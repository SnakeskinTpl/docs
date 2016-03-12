- namespace docs.ru.guide['Введение']['Что такое Snakeskin']

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include '../../tpls/modules/base'

#{template main[%fileName%]() extends base.main}
#{block root}

Snakeskin - это язык шаблонов и движок для их трансляции в JavaScript.
Мощный набор возможностей и развитая зашита от уязвимостей типа [XSS](http://ru.wikipedia.org/wiki/Межсайтовый_скриптинг) позволяют полностью сосредоточиться на представлении данных, делая его независимым от бизнес-логики.
Таким образом, Snakeskin идеально подходит для ситуаций, когда бэкенд и фронтенд разработчики работают параллельно.

Благодаря тому, что шаблоны Snakeskin транслируются в JS-код стандарта ECMAScript 5, независимый от окружения, он одинаково хорошо подходит для использования как на стороне сервера, так и на клиенте.
Это можно сравнить с принципом работы [CoffeeScript](https://ru.wikipedia.org/wiki/CoffeeScript), но если CoffeeScript спроектирован для упрощения разработки сложных проектов непосредственно на JS, то Snakeskin предназначен для шаблонизации HTML/XML-подобных структур и упрощения их код-реюза, предоставляя из коробки наследование, расширение, локализацию, экранирование и прочее.

Также Snakeskin удобно использовать для генерации статичных страниц -- транслятор скопмилирует шаблон и немедленно выполнит её в этом случае будет не JS-код, а  немедленное выполнение скомпилированного
шаблона с заданными данными и последующие сохранение результата, а также как генератор шаблонов
для MVVM-фреймворков, например, [Angular](https://angularjs.org/), [React](https://facebook.github.io/react/)
или [Vue](http://vuejs.org/).

#{/block}
#{/template}
