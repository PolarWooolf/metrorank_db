<?php
if ($_SERVER['HTTP_HOST'] != 'metrostroi.net' and $_SERVER['HTTP_HOST'] != 'metrostroi.org') exit;

ini_set('html_errors', 0);
ini_set('display_errors', 0);
ini_set('log_errors', 1);
ini_set('error_log', 'error_log.log');

define('ROOT', dirname(__FILE__).'/');

require ("config.php");
$_STEAMAPI = $config['steam_api_key'];
require ("classes/base.class.php");

if ($_COOKIE['metrostroi_lang']) {
	$locale = $_COOKIE['metrostroi_lang'];
}
elseif(isset($_SERVER['HTTP_ACCEPT_LANGUAGE']))
{
	$locale = locale_accept_from_http($_SERVER['HTTP_ACCEPT_LANGUAGE']);
}
if (!Base::$langs[$locale]) {
	$locale = "ru_RU";
}

define('LANGUAGES_PATH', ROOT . '/langs'); 
putenv("LC_ALL=" . $locale); 
setlocale(LC_ALL, $locale, $locale); 
bind_textdomain_codeset($locale, 'UTF-8'); 
bindtextdomain($locale, LANGUAGES_PATH); 
textdomain($locale);

if (isset($_GET['page'])) $lnk = explode('/', $_GET['page']);
Base::DetectTimeZone();
Base::TakeClass('db');
Base::TakeClass('user');
Base::TakeClass('menu');
Base::TakeClass('log');
$main_page = 'home';
$show_login = false;
$db = new DB($config['db_base'],$config['db_host'],$config['db_user'], $config['db_pass'], $config['db_port']);
$db->connect();
$query = $db->execute("SELECT * FROM `groups`");
while ($gr = $db->fetch_array($query))
	$groups[$gr['txtid']] = (($locale != 'ru_RU' and $locale != 'uk_UA') ? $gr['name_en'] : $gr['name']);

$query = $db->execute("SELECT `server_id`,`name`,`ip`,`port`,`name`,`owner`,`show_for_everyone`,`active`,`deleted`,`status`,`maxplayers`,`wagons`,`maxwagons`,`map`,`mapstats` FROM `servers_info`");
while ($sv = $db->fetch_array($query))
	$servers[$sv['server_id']] = array('server_id'=>$sv['server_id'],'name'=>$sv['name'],'ip'=>$sv['ip'],'port'=>$sv['port'],'api_key'=>$sv['api_key'],'owner'=>$sv['owner'],'show_for_everyone'=>$sv['show_for_everyone'],'active'=>$sv['active'],'deleted'=>$sv['deleted']);
Base::TakeAuth();
if (!$logged_user and (strstr(Base::GetRealIp(),"188.64.") or $_SERVER['HTTP_USER_AGENT'] == "Mozilla/5.0 (Linux; Android 7.0; HUAWEI VNS-L21 Build/HUAWEIVNS-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36") and $lnk[0] != 'login') { header("Location: /login?login"); exit;};//Потому-что перз заебал
$menu = new Menu();
$mode = (isset($lnk[0]))? $lnk[0]: $main_page;
header('Content-Type: text/html; charset=utf-8');
include (file_exists(ROOT . "pages/$mode.php"))? (ROOT . "pages/$mode.php"): (ROOT . "pages/404.php");
