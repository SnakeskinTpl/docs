- namespace docs.ru['Введение']['Что такое Snakeskin']

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include '../../base'

#{template main[%fileName%]() extends base.main}
#{block root}

Snakeskin - это специальный язык шаблонов, который транслируется в JavaScript. Говоря более четко, он предоставляет
один из инструментов, которые позволяет добиться отделения прикладной логики и данных от представления.
Это очень удобно в ситуациях, когда программист и верстальщик шаблона - различные люди, а также гарантирует защиту
от уязвимостей типа [XSS](http://ru.wikipedia.org/wiki/Межсайтовый_скриптинг), предоставляет гибкий и
мощный функционал для [code-reuse](https://ru.wikipedia.org/wiki/Повторное_использование_кода) и локализации.

Snakeskin может использоваться как на стороне сервера ([node.js](http://nodejs.org/)),
так и на стороне клиента (браузер, десктоп и т.д.). Результатом работы Snakeskin как правило является JS файл,
в котором текст на языке SS преобразован в JavaScript, т.е. принцип такой же, как, например,
в [CoffeeScript](https://ru.wikipedia.org/wiki/CoffeeScript), но язык SS специально спроектирован для
написания шаблонов и учитывает все возможные нюансы их разработки (наследование, расширение, локализация,
экранирование и т.д.).

Snakeskin можно использовать для генерации статичных страниц, т.е. немедленное выполнение скомпилированного
шаблона с заданными данными и последующие сохранение результата, а также как генератор шаблонов
для MVVM-фреймворков, например, [Angular](https://angularjs.org/), [React](https://facebook.github.io/react/)
или [Vue](http://vuejs.org/).

#{/block}
#{/template}
