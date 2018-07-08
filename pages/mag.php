<?php

$page_fucking_title = "Metrostroi Anti-Grief System (MAG)";
$menu->set_item_active('MAG');
$query = $db->execute("SELECT `mag_bans`.*, uc.*, (SELECT `nickname` FROM `user_info_cache` WHERE `user_info_cache`.`steamid`=`mag_bans`.`mag_admin_id`) AS `admin_nickname` FROM `mag_bans`,`user_info_cache` uc WHERE `mag_bans`.`mag_steam_id`=uc.`steamid` AND (`mag_bans`.`mag_unban_date` > NOW() OR `mag_bans`.`mag_unban_date` IS NULL) ORDER BY `mag_date` DESC") or die($db->error());
include Base::PathTPL("header");
include Base::PathTPL("left_side");
include Base::PathTPL("mag/index");
		//if ($db->num_rows($query)) {
include Base::PathTPL("right_side");
$show_other = "
<script>$('.ui.accordion').accordion();
tippy('table.ui.compact.table > tbody > tr > td', {
        arrow: true,
        arrowTransform: 'scale(0.75) translateY(-1.5px)',
        animation: 'fade'
      });
</script>
";
include Base::PathTPL("footer");