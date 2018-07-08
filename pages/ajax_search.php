<?php
	header('Access-Control-Allow-Origin: *');
	$SID = isset($lnk[1]) ? $lnk[1] : '';
	$pls_array = array('results'=>array());
	$query = $db->execute("SELECT `players`.`id` FROM `groups`, `players` LEFT JOIN `user_info_cache` ON `SID`=`steamid` WHERE `group`=`txtid` AND (`SID`='{$db->safe($SID)}' OR `nickname` LIKE '%{$db->safe($SID)}%') ORDER BY `groups`.`id` ASC LIMIT 7");
	$query or die($db->error());
	header('Content-Type: application/json');
	while ($plid = $db->fetch_array($query)) {
		$pl = new User($plid['id'], 'players`.`id');
		if ($pl->uid() < 1) continue;
		$pl_array = array(
			'nick' => $pl->take_steam_info('nickname'),
			'steamid' => $pl->steamid(),
			'rank_name' => $pl->take_group_infoold('name'),
			'avatar_url' => $pl->take_steam_info('avatar_url'),
		);
		array_push($pls_array['results'], $pl_array);
	}
	$query = $db->execute("SELECT COUNT(*) FROM `players` LEFT JOIN `user_info_cache` ON `SID`=`steamid` WHERE `SID`='{$db->safe($SID)}' OR `nickname` LIKE '%{$db->safe($SID)}%'");
	$query = $db->fetch_array($query);
	$pls_array['totalResults'] = (int) $query[0];
	$pls_array['query'] = $SID;
	echo(json_encode($pls_array, JSON_UNESCAPED_UNICODE));
?>