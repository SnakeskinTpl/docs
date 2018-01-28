'use strict';

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

global.i18n = (str) => str;

const
	gulp = require('gulp'),
	$ = require('gulp-load-plugins')();

const
	fs = require('fs-extra'),
	path = require('path'),
	hljs = require('highlight.js');

hljs.registerLanguage('classic', require('./highlight/classic'));
hljs.registerLanguage('jade-like', require('./highlight/jade-like'));

const
	buildFolder = './';

gulp.task('templates', () => {
	const
		through = require('through2'),
		merge = require('merge2');

	const doc = (lang, locale = lang) => {
		let cluster;
		return gulp.src('./tpls/*.ss')
			.pipe($.plumber())
			.pipe(through.obj((file, enc, cb) => {
				cluster = path.basename(file.path, '.ss');
				return cb(null, file);
			}))

			.pipe($.snakeskin({
				exec: true,
				prettyPrint: true,
				language: fs.existsSync(`./${lang}.json`) ? fs.readJSONSync(`./${lang}.json`) : undefined,
				vars: {
					lang,
					locale,
					file: () => cluster
				}
			}))

			.pipe($.rename({suffix: lang !== 'en' ? `-${lang}` : ''}))
			.pipe(gulp.dest(buildFolder));
	};

	return merge([doc('en', 'en-US'), doc('ru')]);
});

gulp.task('styles', () =>
	gulp.src('./styles/*.styl')
		.pipe($.plumber())
		.pipe($.stylus({use: require('nib')()}))
		.pipe($.autoprefixer())
		.pipe($.csso())
		.pipe(gulp.dest(path.join(buildFolder, 'css')))
);

gulp.task('dependencies:css', () =>
	gulp.src([
		'./node_modules/highlight.js/styles/default.css'
	])

		.pipe($.plumber())
		.pipe($.csso())
		.pipe(gulp.dest(path.join(buildFolder, 'css/highlight')))
);

gulp.task('dependencies:js', () =>
	gulp.src([
		'./node_modules/jquery.scrollto/jquery.scrollTo.min.js'
	])
		.pipe(gulp.dest(path.join(buildFolder, 'js')))
);

gulp.task('dependencies', gulp.parallel([
	'dependencies:css',
	'dependencies:js'
]));

gulp.task('scripts', () =>
	gulp.src('./scripts/index.js')
		.pipe($.plumber())
		.pipe($.rollup({
			allowRealFiles: true,
			input: './scripts/index.js',
			format: 'iife',
			plugins: [require('rollup-plugin-babel')()]
		}))

		.pipe($.uglify())
		.pipe(gulp.dest(path.join(buildFolder, 'js')))
);

gulp.task('yaspeller', () => $.run('yaspeller ./ --ignore-uppercase').exec().on('error', console.error));
gulp.task('default', gulp.parallel([
	'templates',
	'styles',
	'scripts',
	'dependencies'
]));

gulp.task('watch', gulp.series(['default', () => {
	gulp.watch(['./tpls/**/*.ss', './docs/**/*.ss'], gulp.series(['templates']));
	gulp.watch('./docs/**/*.ss', gulp.series(['yaspeller']));
	gulp.watch('./styles/**/*.styl', gulp.series(['styles']));
	gulp.watch('./scripts/**/*.js', gulp.series(['scripts']));
}]));
