<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Http\Controllers\PageController;

Route::get('/', function () {
    return view('welcome');
});


Route::get('index', [
    'as'=>'trang-chu',
    'uses'=>'PageController@getIndex'
]);

Route::get('loaisanpham/{type}', [
	'as'=>'loai-san-pham',
	'uses'=>'PageController@getLoaiSp'
]);

Route::get('chitietsanpham/{id_sp}', [
	'as'=>'chi-tiet-san-pham',
	'uses'=>'PageController@getChiTietSp'
]);

Route::get('lienhe', [
	'as'=>'lien-he',
	'uses'=>'PageController@getLienHe'
]);

Route::get('gioithieu',[
	'as'=>'gioi-thieu',
	'uses'=>'PageController@getGioiThieu'
]);

Route::get('themgiohang/{id}', [
	'as'=>'them-gio-hang',
	'uses'=>'PageController@getAddtocart'
]);

Route::get('xoagiohang/{id}', [
	'as'=>'xoa-gio-hang',
	'uses'=>'PageController@getDelItemCart'
]);

Route::get('dathang', [
	'as'=>'dat-hang',
	'uses'=>'PageController@getCheckout'
]);

Route::post('dathang', [
	'as'=>'dat-hang',
	'uses'=>'PageController@postCheckout'
]);


Route::get('dangki', [
	'as'=>'dang-ki',
	'uses'=>'PageController@getSignin'
]);

Route::post('dangki', [
	'as'=>'dang-ki',
	'uses'=>'PageController@postSignin'
]);

Route::get('dangnhap', [
	'as'=>'dang-nhap',
	'uses'=>'PageController@getLogin'
]);

Route::post('dangnhap', [
	'as'=>'dang-nhap',
	'uses'=>'PageController@postLogin'
]);

Route::get('dangxuat', [
	'as'=>'dang-xuat',
	'uses'=>'PageController@getLogout'
]);

Route::get('timkiem', [
	'as'=>'tim-kiem',
	'uses'=>'PageController@getSearch'
]);