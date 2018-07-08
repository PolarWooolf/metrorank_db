<?php
$maps = array(
    'gm_jar_pll' => 824935150,
    'gm_jar_pll_remastered_v9' => 843936402,
    'gm_metronvl' => 782009017,
    'gm_metrostroi_b46_lite' => 261801217,
    'gm_metrostroi_b50' => 306834272,
    'gm_metrostroi_b51' => 656733704,
    'gm_metrostroi_practice' => 631510717,
    'gm_metro_crossline_c1' => 1100004221,
    'gm_metro_crossline_c3' => 1100004221,
    'gm_metro_crossline_m12' => 1100004221,
    'gm_metro_crossline_p1' => 904525566,
    'gm_metro_ruralline_v29' => 873230929,
    'gm_metro_ruralline_v29_snow' => 873230929,
    'gm_metro_rural_line' => 1107768029,
    'gm_metro_rural_line_2' => 1121706122,
    'gm_metro_u6' => 1213550489,
    'gm_mus_crimson_line_a' => 562813441,
    'gm_mus_crimson_line_b_n' => 562813441,
    'gm_mus_crimson_line_tox_v9_21' => 1223349902,
    'gm_mus_loopline_e' => 1123150860,
    'gm_mus_neoorange_d' => 1122422169,
    'gm_mus_orange_line_c' => 562813441,
    'gm_mus_orange_metro_h' => 562813441,
    'gm_smr_first_line_a' => 1163651619
);

$page_fucking_title = _("Список партнерских серверов");
$menu->set_item_active('servers');
include Base::PathTPL("header");
include Base::PathTPL("left_side");
$where = ($logged_user)?($logged_user->take_group_info("admin_panel"))?"":" AND `active`=1 AND `show_for_everyone`=1 OR `owner`='{$logged_user->steamid()}'":" AND `active`=1 AND `show_for_everyone`=1";
$query = $db->execute("SELECT `server_id`,`name`,`ip`,`port`,`name`,`owner`,`show_for_everyone`,`active`,`deleted`,`status`,`maxplayers`,`wagons`,`maxwagons`,`map`,`mapstats`,`user_info_cache`.* FROM `servers_info` LEFT JOIN `user_info_cache` ON `user_info_cache`.`steamid`=`servers_info`.`owner` WHERE `deleted` = 0 $where ORDER BY `servers_info`.`server_id`") or die($db->error());
Base::TakeTPL("servers/servers_head");
$servers2 = array();
while($server = $db->fetch_array($query)) {
	$players = $db->execute("SELECT * FROM `groups`, `players` LEFT JOIN `user_info_cache` ON `user_info_cache`.`steamid`=`players`.`SID` WHERE `server_id` = '{$server['server_id']}' AND `players`.`group`=`groups`.`txtid` ORDER BY `groups`.`id` ASC, `user_info_cache`.`nickname` ASC");
	$online = ($server['status']);
	$servers2[] = array('server'=>$server,'players'=>$players);
	include Base::PathTPL("servers/server_row");
}
Base::TakeTPL("servers/servers_foot");
include Base::PathTPL("right_side");

ob_start();
foreach ($servers2 as $serverarr) {
	$players = $serverarr['players'];
	$server = $serverarr['server'];
	if ($server['server_id'] <= 1) continue;
	$online = ($server['status']);
    include Base::PathTPL("servers/server_modal");
}
echo '<script>';
foreach ($servers2 as $serverarr) {
	$players = $serverarr['players'];
	$server = $serverarr['server'];
	if ($server['server_id'] <= 1) continue;
	$online = ($server['status']);
    include Base::PathTPL("servers/server_scripts");
}
echo '</script>
';
$show_other = ob_get_contents();
ob_end_clean();
include Base::PathTPL("footer");
?>
