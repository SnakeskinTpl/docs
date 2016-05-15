- namespace docs.ru.api['1::Директивы']['1::Создание шаблона']['2::template']

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

Директива декларирует шаблон c заданным именем и входными параметрами.

## Паспорт

| Декларация                                                                                 | Короткий синтаксис | Тип директивы                       | Интерполяция |
|--------------------------------------------------------------------------------------------|--------------------|-------------------------------------|--------------|
| Только в глобальной области, необходима предварительная декларация [namespace](#namespace) | Отсутствует        | Блочная, логическая, функциональная | Не требуется |

## Описание

Шаблон Snakeskin - это синоним функции в JavaScript, т. е. после трансляции все шаблоны будут представлены как JS функции,
которые можно использовать вместе с любым другим JS кодом. По умолчанию шаблоны возвращают строки, однако это поведение
можно поменять задав специальный [renderMode](#compile--renderMode) или явно вернув значение через директиву [return](#return).

Название шаблона соответствует названию функции в JavaScript, поэтому оно подчиняется тем же правилам.
Начать декларацию шаблона можно только после декларации пространства имён, причём в рамках одного пространства имён
не может быть 2-х шаблонов с одинаковым именем, а размещаться шаблон может только в глобальной области декларации, т.е.
шаблон не может включать в себя другой шаблон - для этого есть подшаблоны, например, [блоки](#block).

Декларация шаблона очень похожа на декларацию функции в JavaScript, только вместо ключевого слова `function` используется
`template`, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{template index(name = 'world')}
	Hello {name}!
{/template}
```

#{/}

Параметров у шаблона может быть неограниченное количество, а т.к. директива *template* является функциональной, то она
реализует [стандартный механизм декларации параметров](guide#{@@prfx}.html#introParams).

## Вложенные пространства имён

При декларации шаблона можно использовать пространства имён, подобно тому, как это делается в [namespace](#namespace),
например:

**foo/index.ss**

#{+= self.example()}

```jade-like
- namespace demo
- template %fileName%.index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{template %fileName%.index(name = 'world')}
	Hello {name}!
{/template}
```

#{/}

Механика здесь точно такая же, как и у *namespace*, поэтому рассматриваться отдельно не будет, однако, есть небольшой
дополнительный нюанс: если последняя часть имени декларируется без квадратных скобок, то она будет установлена как свойство
`name` полученной функции JavaScript, т.е.

#{+= self.example()}

```jade-like
- namespace demo
- template index(name = 'world')
	Hello {name}!
```

```classic
{namespace demo}
{template index(name = 'world')}
	Hello {name}!
{/template}
```

#{/}

Превратится в:

```js
exports.demo.index = function index(name) {
	name = name != null ? name : 'world';
	return 'Hello ' + name + '!';
};
```

### Стандартные переменные шаблона

Каждый шаблон определяет ряд констант и функций, которые можно использовать в нём:

`TPL_NAME` - строка, которая содержит полное имя шаблона вместе с пространством имён, причём именно в том виде,
как оно было задано при декларации шаблона;

`PARENT_TPL_NAME` - строка, которая содержит полное имя родительского шаблона вместе с пространством имён,
причём именно в том виде, как оно было задано при декларации шаблона;

`callee` - ссылка на исходную функцию-шаблон;

`self` - ссылка на объект `callee.Blocks`, в котором хранятся вызываемые блоки (методы) исходного шаблона;

`$0` - ссылка на активный DOM узел (если `renderMode == 'dom'`);

`$class` - значение [липкой ссылки]()#tag--Ссылки_на_родительский_класс;

`getTplResult` - функция, которая возвращает результат работы шаблона, также может принимать один логический входной
параметр, при задании которого после вызова функции результат работы шаблона будет обнуляться;

`clearTplResult` - функция, которая обнуляет результат работы шаблона.

### Модификаторы шаблона

Шаблоны Snakeskin поддерживают специальные модификаторы декларации.

#### Шаблон-генератор

Шаблон будет транслироваться в JS как функция-генератор (для поддержки в старых браузерах необходимо использовать полифил).

#{+= self.example()}

```jade-like
- namespace demo
- template *hello()
	- yield
		Hello world!
```

```classic
{namespace demo}
{template *hello()}
	{yield}
		Hello world!
	{/}
{/template}
```

#{/}

#### Асинхронный шаблон

Шаблон будет транслироваться в JS как *async* функция (для поддержки в браузерах необходимо использовать полифил).

#{+= self.example()}

```jade-like
- namespace demo
- async template hello()
	- var data = await db.getData()
	Hello {data.name}!
```

```classic
{namespace demo}
{async template hello()}
	{var data = await db.getData() /}
	Hello {data.name}!
{/template}
```

#{/}

#### Декораторы

К любому шаблону может быть добавлено неограниченное количество функций-декораторов (которые также могу быть шаблонами).
Функция-декоратор принимает на вход ссылку на исходную функцию и обязана вернуть в качестве ответа функцию.

#{+= self.example()}

```jade-like
- namespace demo
- import Typograf from 'typograf'

- template typograf(params)
	- return
		() => target
			- return
				() =>
					- return new Typograf(params).execute(target.apply(this, arguments))

- @typograf({lang: 'ru'})
- template index()
	Спорт - это правильно!
```

```classic
{namespace demo}
{import Typograf from 'typograf'}

{template typograf(params)}
	{return}
		{() => target}
			{return}
				{() =>}
					{return new Typograf(params).execute(target.apply(this, arguments)) /}
				{/}
			{/}
		{/}
	{/}
{/template}

{@typograf({lang: 'ru'})}
{template index()}
	Спорт - это правильно!
{/template}
```

#{/}

### Локальные параметры трансляции

При декларации шаблона ему можно задать определённые [параметры трансляции](guide#{@@prfx}.html#introSet), для этого используется
специальный оператор `@=`, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index() @= literalBounds ['<?php', '?>']
	{{ Hello }}
```

```classic
{namespace demo}
{template index() @= literalBounds ['<?php', '?>']}
	{{ Hello }}
{/template}
```

#{/}

### Наследование шаблонов

Шаблоны Snakeskin подобны классам в других языках программирования, т.е. у них могут быть методы и свойства, и они
могут наследоваться от других шаблонов. Чтобы указать, что шаблон наследуется от другого, необходимо использовать ключевое слово
**extends**, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index() extends anotherTemplate
	...
```

```classic
{namespace demo}
{template index() extends anotherTemplate
	...
{/template}
```

#{/}

[Подробнее про наследование](guide#{@@prfx}.html#inheritBasic).

### Явный вызов шаблонов внутри других шаблонов

Т.к. шаблоны Snakeskin являются простыми функциями, то их можно вызывать внутри других шаблонов и для этого удобно использовать
директиву [call](#call).

#{+= self.example()}

```jade-like
- namespace demo

- template hello()
	Hello world!

- template index()
	\/// Т.к. hello находится в одном namespace с index,
	\/// то мы можем использовать короткий вызов,
	\/// но можем написать и полную форму += demo.hello()
	+= @hello()
```

```classic
{namespace demo}

{template hello()}
	Hello world!
{/template}

{template index()}
	\/// Т.к. hello находится в одном namespace с index,
	\/// то мы можем использовать короткий вызов,
	\/// но можем написать и полную форму {+= demo.hello() /}
	{+= @hello() /}
{/template}
```

#{/}

#{/block}
{/template}
