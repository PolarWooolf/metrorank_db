<?php
if (!isset($lnk[1])) {
	include ROOT . "pages/404.php";
	exit();
}
$page = (isset($lnk[2]) and 0 < (int) $lnk[2])? (int) $lnk[2]: 1;
$amount_by_page = 25;
$first = ($page - 1) * $amount_by_page;
$query = $db->execute("SELECT * FROM `groups`, `players` LEFT JOIN `user_info_cache` ON `SID`=`steamid` WHERE `group`=`txtid` AND (`SID`='{$db->safe($lnk[1])}' OR `nickname` LIKE '%{$db->safe($lnk[1])}%') ORDER BY `groups`.`id` ASC LIMIT $first, $amount_by_page");
$query or die($db->error());
if (!$db->num_rows($query)) {
	header("Location: /404");
	exit();
};
if ($db->num_rows($query) == 1) {
	$query = $db->fetch_array($query);
	header("Location: /profile/" . $query['SID']);
	exit();
}

$page_fucking_title = _("Результаты поиска");
include Base::PathTPL("header");
include Base::PathTPL("left_side");
Base::TakeTPL("players/players_head");
for($c = $first + 1; $typical_ple = $db->fetch_array($query); $c++) {
	include Base::PathTPL("players/player_row");
}
Base::TakeTPL("players/players_foot");
$query = $db->execute("SELECT COUNT(*) FROM `players` LEFT JOIN `user_info_cache` ON `SID`=`steamid` WHERE `SID`='{$db->safe($lnk[1])}' OR `nickname` LIKE '%{$db->safe($lnk[1])}%'");
$query = $db->fetch_array($query);
echo Base::GeneratePagination($page, $amount_by_page, $query[0], "/search/".$lnk[1]."/");
include Base::PathTPL("right_side");

include Base::PathTPL("footer");