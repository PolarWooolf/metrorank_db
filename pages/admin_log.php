<?php
if (!$logged_user or !$logged_user->take_group_info("log")) {
	include MITRASTROI_ROOT . "pages/403.php";
	exit();
}
$amount_by_page = 25;
$page_fucking_title = _("Журнал действий");
$menu->set_item_active('admin_log');
include Base::PathTPL("header");
include Base::PathTPL("left_side");
$page = (!isset($lnk[1]) or $lnk[1] <= 0)? 1: (int) $lnk[1];
$first = ($page - 1) * $amount_by_page;
$query = $db->execute("SELECT *  FROM `log` LEFT JOIN `log_types` ON `log_types`.`id`=`log`.`type` ORDER BY `log`.`id` DESC LIMIT $first, $amount_by_page") or die($db->error());
Base::TakeTPL("log/logs_head");
for($c = $first + 1; $log = $db->fetch_array($query); $c++) {
	$text = $log['format'];
	$q = $db->execute("SELECT * FROM `players` LEFT JOIN `user_info_cache` ON `user_info_cache`.`steamid`=`players`.`SID`  WHERE  `SID`='{$db->safe($log['player'])}'");$q = $db->fetch_array($q);
	$text = str_replace("%player%", "<a href='/profile/".$q['SID']."'>".($q['nickname'] != '' ? $q['nickname'] : $log['player'])."</a>", $text);
	$q = $db->execute("SELECT * FROM `players` LEFT JOIN `user_info_cache` ON `user_info_cache`.`steamid`=`players`.`SID`  WHERE  `SID`='{$db->safe($log['target'])}'");$q = $db->fetch_array($q);
	$text = str_replace("%target%", "<a href='/profile/".$q['SID']."'>".($q['nickname'] != '' ? $q['nickname'] : $log['target'])."</a>", $text);
	if ($log['args'] != '')
	{
		$args = json_decode($log['args'],true);
		foreach ($args as $key => $value) {
			if ($key == 'rank') {$value = $groups[$value] ? $groups[$value] : $value;}
			$text = str_replace("%".$key."%", $value, $text);
		}
	}
	include Base::PathTPL("log/log_row");
}
Base::TakeTPL("log/logs_foot");
$query = $db->execute("SELECT COUNT(*) FROM `log`");
$query = $db->fetch_array($query);
echo Base::GeneratePagination($page, $amount_by_page, $query[0], "/admin_log/");
include Base::PathTPL("right_side");

$show_other = "<script>
tippy('#server-tippy', {
	arrow: true,
	arrowTransform: 'scale(0.75) translateY(-1.5px)',
	animation: 'fade'
});
</script>";
include Base::PathTPL("footer");