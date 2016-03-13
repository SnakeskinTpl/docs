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

const
	rollup = require('gulp-rollup'),
	babel = require('rollup-plugin-babel');

function error() {
	return (err) => {
		console.error(err.message);
	};
}

gulp.task('templates', (cb) => {
	gulp.src('./tpls/*.ss')
		.pipe(watch(['./tpls/**/*.ss', './docs/**/*.ss']))
		.pipe(snakeskin({exec: true, prettyPrint: true, vars: {lang: 'ru'}}))
		.on('error', error())
		.pipe(gulp.dest('./build'))
		.on('end', cb);
});

gulp.task('styles', (cb) => {
	gulp.src('./styles/*.styl')
		.pipe(watch('./styles/**/*.styl'))
		.pipe(stylus({use: nib()}))
		.on('error', error())
		.pipe(autoprefixer())
		.pipe(gulp.dest('./build/css'))
		.on('end', cb);
});

gulp.task('scripts', (cb) => {
	gulp.src('./scripts/index.js')
		.pipe(watch('./scripts/**/*.js'))
		.pipe(rollup({format: 'iife', plugins: [babel()]}))
		.on('error', error())
		.pipe(gulp.dest('./build/js'))
		.on('end', cb);
});

gulp.task('default', ['templates', 'styles', 'scripts']);
