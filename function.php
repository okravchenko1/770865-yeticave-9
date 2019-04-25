<?php
/**
 * Функция принимает целое число и
 * возвращает отформатированную сумму со знаком рубля.
 *
 * @param int $price_value
 * @return string
 *
 */
function format_price(int $price_value): string
{
    $price_value = ceil($price_value);
    $num = number_format($price_value, 0, '', ' ');
    $num .= " <b class=\"rub\">&#8381;</b>";
    return $num;
}
/**
 * Функция-шаблонизатор
 *
 * @param string $filename
 * @param array $param
 * @return string
 */
function include_template(string $filename, array $param = []): string
{
    if (!file_exists('templates' . DIRECTORY_SEPARATOR . $filename . '.php')) {
        return print('');
    }
    extract($param);
    ob_start();
    require('templates' . DIRECTORY_SEPARATOR . $filename . '.php');
    return ob_get_clean();
}

/**
 *  Функция для вывода оставшегося времени до окончания ставок на лот
 *
 * @return string
 */
function lot_expire():string {
    date_default_timezone_set('Europe/Moscow');
    $ts_midnight = strtotime('tomorrow');
    $time_till_midnight = $ts_midnight - time();
    $hour = floor($time_till_midnight / 3600);
    $minute = floor(($time_till_midnight % 3600)/ 60);
    $expire = $hour . ':' . $minute;
    return strftime('%R', strtotime($expire));
}

/**
 * Функция для показа оставшегося времени до окончания приема ставок на лот.
 *
 * @param $lot_expire_time
 * @return bool
 */
function lot_expire_alert($lot_expire_time):bool{
    $let = strtotime ($lot_expire_time);
    $expire = $let - time();
    if ($expire <= 3600){
        return true;
    }else{
        return false;
    }
}
?>
