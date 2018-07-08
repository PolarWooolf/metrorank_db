<?php
if (!$logged_user) {
	include ROOT . "pages/403.php";
	exit();
}

$page_fucking_title = _("Тикеты");
include Base::PathTPL("header");
include Base::PathTPL("left_side");

include Base::PathTPL("tickets/ticket_add");

if (isset($_POST['message'])) {
	$db->execute("INSERT INTO `tickets` (`written`,`owner`,`text`,`date`,`type`,`viewed`) VALUES ('{$logged_user->steamid()}','{$logged_user->steamid()}','{$db->safe($_POST['message'])}',NOW(),0,1)");
}

$query = $db->execute("SELECT * FROM `tickets` LEFT JOIN `user_info_cache` ON `written`=`steamid` WHERE `owner`='{$logged_user->steamid()}' ORDER BY `date` DESC");

while($ticket = $db->fetch_array($query)) {
	switch ($ticket['type']) {
		case 0: $status = "<i>"._("(Новый)")."</i>"; break;
		case 1: $status = "<i>"._("(Просмотрен)")."</i>"; break;
		case 2: $status = "<i>"._("(Закрыт)")."</i>"; break;
		case 3: $status = "<i>"._("(Отклонен)")."</i>"; break;
		case 4: $status = "<div class=\"ui small red horizontal label\">".('Администратор')."</div>"; break;
		default: $status = '';
	}
	include Base::PathTPL("tickets/ticket");
}

//$db->execute("UPDATE `tickets` SET `viewed`=1 WHERE `owner`='{$logged_user->steamid()}'");

include Base::PathTPL("right_side");
include Base::PathTPL("footer");