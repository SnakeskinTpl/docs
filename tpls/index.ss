- namespace index

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include './modules/base'

- base.typograf({lang: @@lang})
- template main()
	- doctype
	< html
		< head
			< meta charset = utf-8
			< title
				{title = `Документация Snakeskin 7` ?}

			- block head
				- link :: https://fonts.googleapis.com/css?family=Open+Sans:400,700,700italic,400italic&subset=latin,cyrillic
				- link :: css/index.css

		< body
			- menu = [ &
				{
					href: 'guide.html',
					label: `Гайд`
				},
				{
					href: 'api.html',
					label: `API`
				},
				{
					href: '#',
					label: `Плагины`
				},
				{
					href: '#',
					label: `Примеры`
				},
				{
					href: 'http://codepen.io/kobezzza/pen/zrJNXx',
					label: `Песочница`,
					target: '_blank'
				}
			] .

			- block nav()
				< nav.b-nav
					< menu
						- forEach menu => @el
							< li
								< a ${el}
									{@label}

			- block body
				< .b-index-wrapper
					< .&__el[.&_align_center]
						+= self.nav()

						< img.b-index-logo src = ../logo.svg | alt = snakeskin template engine
						< .b-index-title
							< h1
								Snakeskin

							< h2
								`Удивительно мощный язык описания шаблонов`

						< a.b-install href = #
							Установить v7.0.0-beta26

						< .b-badges
							< a.github-button href = https://github.com/SnakeskinTpl | &
								aria-label = Follow @SnakeskinTpl on GitHub |
								-count-aria-label = # followers on GitHub |
								-count-api = /users/SnakeskinTpl#followers |
								-count-href = /SnakeskinTpl/followers
							.
								Follow @SnakeskinTpl

							< a.github-button href = https://github.com/SnakeskinTpl/Snakeskin | &
								aria-label = Star SnakeskinTpl/Snakeskin on GitHub |
								-count-aria-label = # stargazers on GitHub |
								-count-api = /repos/SnakeskinTpl/Snakeskin#stargazers_count |
								-count-href = /SnakeskinTpl/Snakeskin/stargazers |
								-icon = octicon-star
							.
								Star

							< a.github-button href = https://github.com/SnakeskinTpl/Snakeskin/fork | &
								aria-label = Fork SnakeskinTpl/Snakeskin on GitHub |
								-count-aria-label = # forks on GitHub |
								-count-api = /repos/SnakeskinTpl/Snakeskin#forks_count |
								-count-href = /SnakeskinTpl/Snakeskin/network |
								-icon = octicon-repo-forked
							.
								Fork

							- script js id = github-bjs | src = https://buttons.github.io/buttons.js | async | defer
