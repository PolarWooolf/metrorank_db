<?php
if (!$logged_user or $logged_user->max_icon_id() < 9) {
	include ROOT . "pages/403.php";
	exit();
}
if (!isset($lnk[1])) {
	include ROOT . "pages/404.php";
	exit();
}

$query = $db->execute("SELECT `news`.*, `user_info_cache`.`nickname`, `news_cats`.`name` FROM `news` LEFT JOIN `news_cats` ON `news_cats`.`id`=`news`.`cat` LEFT JOIN `user_info_cache` ON `user_info_cache`.`steamid`=`news`.`author` WHERE `news`.`id`='{$db->safe($lnk[1])}'");
if ($db->num_rows($query) != 1) {
	include ROOT . "pages/404.php";
	exit();
}

$query = $db->fetch_array($query);
if(isset($_POST['submit'])) {
	Logger::Log(12, 0, '', array('title'=>$query['title'],'id'=>(int) $lnk[1]), $logged_user->steamid());
	$db->execute("DELETE FROM `news` WHERE  `id`='{$db->safe($lnk[1])}'");
	header('Location: /news');
}