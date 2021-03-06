<?php
$categories = ["Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"];
$products = [
    [
        'name' => '2014 Rossignol District Snowboard',
        'cat' => 'Доски и лыжи',
        'price' => '10999',
        'url' => 'img/lot-1.jpg'
    ],
    [
        'name' => 'DC Ply Mens 2016/2017 Snowboard',
        'cat' => 'Доски и лыжи',
        'price' => '159999',
        'url' => 'img/lot-2.jpg'
    ],
    [
        'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'cat' => 'Крепления',
        'price' => '8000',
        'url' => 'img/lot-3.jpg'
    ],
    [
        'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'cat' => 'Ботинки',
        'price' => '10999',
        'url' => 'img/lot-4.jpg'
    ],
    [
        'name' => 'Куртка для сноуборда DC Mutiny Charocal',
        'cat' => 'Одежда',
        'price' => '7500',
        'url' => 'img/lot-5.jpg'
    ],
    [
        'name' => 'Маска Oakley Canopy',
        'cat' => 'Разное',
        'price' => '5400',
        'url' => 'img/lot-6.jpg'
    ]];

require_once('function.php');
//require_once('templates' . DIRECTORY_SEPARATOR . 'common_data.php');
$pageContent = include_template('index', ['products' => $products]);
$layout_content = include_template('layout', [
   'pageContent' => $pageContent,
   'categories' => $categories,
   'title' => 'YetiCave - Главная']);
echo $layout_content;
?>


