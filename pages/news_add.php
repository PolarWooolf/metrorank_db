<?php
if (!$logged_user or $logged_user->max_icon_id() < 9) {
	include ROOT . "pages/403.php";
	exit();
}

$add = !(isset($lnk[1]) and (int) $lnk[1]);

if (!$add) {
	$query = $db->execute("SELECT * FROM `news` WHERE `id`='{$db->safe($lnk[1])}'");
	if ($db->num_rows($query) != 1) {
		include ROOT . "pages/404.php";
		exit();
	}
	$query = $db->fetch_array($query);
}

$title = (isset($_POST['title']))? $_POST['title'] : (($add)?'':$query['title']);
$text = (isset($_POST['text']))? $_POST['text'] : (($add)?'':$query['text']);
$cat = (isset($_POST['cat']))? (int) $_POST['cat'] : (($add)?0:(int)$query['cat']);

if (isset($_POST['submit']) and strlen($title) and strlen($text) and strlen($title) <= 250) {
	$update_time = (isset($_POST['renew_date']) and $_POST['renew_date'])? ', `date`=NOW()':'';
	$db->execute(
		($add)? "INSERT INTO `news` (`title`,`text`,`cat`,`date`,`author`) VALUES ('{$db->safe($title)}','{$db->safe($text)}','{$db->safe($cat)}',NOW(),'{$db->safe($logged_user->steamid())}')":
			"UPDATE `news` SET `title`='{$db->safe($title)}', `text`='{$db->safe($text)}', `cat`='{$db->safe($cat)}'$update_time WHERE `id`='{$db->safe($lnk[1])}'"
	);
	$id = (($add)?$db->insert_id():$lnk[1]);
	if ($add) 
	{
		Base::SendToSocket('news',array('news_id'=>$id));
		Logger::Log(11, 0, '', array('title'=>$title,'id'=>$id), $logged_user->steamid());
	}
	else
	{
		Logger::Log(13, 0, '', array('title'=>$title,'id'=>$id), $logged_user->steamid());
	}
	header ('Location: /news/view/' . $id);
} elseif (isset($_POST['submit']))
	$status = "<div class=\"alert alert-danger\">"._('Заголовок должен быть заполнен и быть не длиннее 250 символов, текст новости тоже должен быть.')."</div>";

$query = $db->execute("SELECT * FROM `news_cats` ORDER BY `priority` DESC");
$cats_select = '';
while ($tmp_cat = $db->fetch_array($query)) {
	if ($cat == $tmp_cat['id']) $cat_name = $tmp_cat['name'];
	$cats_select .= "<div class=\"item".(($cat == $tmp_cat['id'])?' selected item':'')."\" data-value=\"{$tmp_cat['id']}\">{$tmp_cat['name']}</div>";
}

$page_fucking_title = ($add)? _('Добавление новости'):_('Редактирование новости');
$menu->set_item_active('news_add');
include Base::PathTPL("header");
include Base::PathTPL("left_side");

include Base::PathTPL("news/news_add");

include Base::PathTPL("right_side");
include Base::PathTPL("footer");
