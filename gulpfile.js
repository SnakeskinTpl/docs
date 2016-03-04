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
	snakeskin = require('gulp-snakeskin'),
	stylus = require('gulp-stylus'),
	autoprefixer = require('gulp-autoprefixer'),
	nib = require('nib'),
	watch = require('gulp-watch');

function error() {
	return (err) => {
		console.error(err.message);
	};
}

gulp.task('snakeskin', (cb) => {
	gulp.src('./tpls/*.ss')
		.pipe(watch(['./tpls/**/*.ss', './docs/**/*.ss']))
		.pipe(snakeskin({exec: true, prettyPrint: true, vars: {lang: 'ru'}}))
		.on('error', error())
		.pipe(gulp.dest('./build'))
		.on('end', cb);
});

gulp.task('stylus', (cb) => {
	gulp.src('./styles/*.styl')
		.pipe(watch('./styles/**/*.styl'))
		.pipe(stylus({use: nib()}))
		.on('error', error())
		.pipe(autoprefixer())
		.pipe(gulp.dest('./build/css'))
		.on('end', cb);
});

gulp.task('default', ['snakeskin', 'stylus']);
