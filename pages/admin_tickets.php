<?php
if (!$logged_user or !$logged_user->take_group_info("tickets")) {
	include ROOT . "pages/403.php";
	exit();
}

$page_fucking_title = _("Управление тикетами");
$menu->set_item_active('admin_tickets');
include Base::PathTPL("header");
include Base::PathTPL("left_side");

if (isset($lnk[1])) {
	$pl = new User($lnk[1], 'SID');
	if ($pl->uid() < 1) {
		include Base::PathTPL("404");
		include Base::PathTPL("footer");
		exit();
	}
	//include Base::PathTPL("tickets/adm_info");
	include Base::PathTPL("tickets/adm_ticket_add");
	if (isset($_POST['message'])) {
		$db->execute("INSERT INTO `tickets` (`written`,`owner`,`text`,`date`,`type`,`viewed`) VALUES ('{$logged_user->steamid()}','{$pl->steamid()}','{$db->safe($_POST['message'])}',NOW(),4,0)");
		Logger::Log(22, 0, '', array('id'=>$pl->steamid()), $logged_user->steamid(), $pl->steamid());
	}

	if (isset($_POST['status']) and isset($_POST['id'])) {
		$db->execute("UPDATE `tickets` SET `type`='{$db->safe($_POST['status'])}' WHERE `tid`='{$db->safe($_POST['id'])}'");
		Logger::Log(23, 0, '', array('id'=>(int) $_POST['id'],'type'=>$db->safe($_POST['status']),'sid'=>$pl->steamid()), $logged_user->steamid(), $pl->steamid());
	}

	if (isset($_POST['delete']) and isset($_POST['id'])) {
		$db->execute("DELETE FROM `tickets` WHERE  `tid`='{$db->safe($_POST['id'])}'");
		Logger::Log(24, 0, '', array('id'=>(int) $_POST['id'],'sid'=>$pl->steamid()), $logged_user->steamid(), $pl->steamid());
	}
	$query = $db->execute("SELECT * FROM `tickets` LEFT JOIN `user_info_cache` ON `written`=`steamid` WHERE `owner`='{$pl->steamid()}' ORDER BY `date` DESC");
	while($ticket = $db->fetch_array($query)) {
		switch ($ticket['type']) {
			case 0: $status = "<i>"._("(Новый)")."</i>"; break;
			case 1: $status = "<i>"._("(Просмотрен)")."</i>"; break;
			case 2: $status = "<i>"._("(Закрыт)")."</i>"; break;
			case 3: $status = "<i>"._("(Отклонен)")."</i>"; break;
			case 4: $status = "<div class=\"ui small red horizontal label\">"._('Администратор')."</div>"; break;
			default: $status = '';
		}
		include Base::PathTPL("tickets/adm_ticket");
	}
} else {
	include Base::PathTPL("tickets/adm_ticket_head");
	$query = $db->execute("SELECT * FROM `user_info_cache`, `tickets` WHERE `written`=`steamid` AND `tid`=(SELECT `tid` FROM `tickets` WHERE `written`=`steamid` AND `type`<2 ORDER BY `date` DESC LIMIT 1) ORDER BY (SELECT `date` FROM `tickets` WHERE `written`=`steamid` AND `type`<2 ORDER BY `date` DESC LIMIT 1) ASC") or die($db->error());
	while($ticket = $db->fetch_array($query)) {
		switch ($ticket['type']) {
			case 0: $status = "<i class=\"metrostroi small star icon fix\" style=\"color: white !important; background-color: #21ba45 !important;\"></i>"; break;
			case 1: $status = "<i class=\"metrostroi small eye icon fix\" style=\"color: white !important; background-color: #fbbd08 !important;\"></i>"; break;
			default: $status = '';
		}
		include Base::PathTPL("tickets/adm_ticket_preview");
	}

}

include Base::PathTPL("right_side");
include Base::PathTPL("footer");