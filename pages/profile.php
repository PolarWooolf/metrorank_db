<?php
$pl = new User($lnk[1], 'SID');
if ($pl->uid() < 1) {
	include ROOT . "pages/404.php";
	exit();
}

Base::TakeClass('comments');

$group_names = array();
$steamid = (isset($lnk[1]))? $lnk[1]: "";
$groups_options = '';
$alert = '';
foreach ($groups as $key => $value)
{
	if ($pl->take_group_info('txtid') == $key) {continue;}
	$groups_options .= "\n\t\t\t\t<div class=\"item\" data-value=\"{$key}\">{$value}</div>";
}
$query = $db->execute("SELECT `tid`, `tname` FROM `tests` ORDER BY `tpriority`");
$tests_options = '';
while ($test = $db->fetch_array($query)) {
	$tests_options .= "\n\t\t\t\t<div class=\"item\" data-value=\"{$test['tid']}\">{$test['tname']}</div>";
}
foreach(Base::$ICONS as $id=>$data) {
	if ($id == 6) {continue;}
	$icons_options .= "\n\t\t\t\t<div class=\"item\" data-value=\"$id\">{$data['name']}</div>";
}

if ($logged_user and isset($lnk[2]) and $logged_user->take_group_info("admin_panel")) {
	$url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=$_STEAMAPI&steamids=" . Base::ToCommunityID($pl->steamid());
	$json_object = file_get_contents($url);
	$json_decoded = json_decode($json_object);

	foreach ($json_decoded->response->players as $player) {
		$status = json_encode(
			array(
				'admin'=>'',
				'nom'=>1,
				'date'=>time()
			)
		);
		$db->execute("INSERT INTO `user_info_cache` (`steamid`, `steam_url`, `avatar_url`, `nickname`) VALUES ('" . $db->safe(Base::ToSteamID($player->steamid)) . "', '" . $db->safe($player->profileurl) . "', '" . $db->safe($player->avatarfull) . "', '" . $db->safe($player->personaname) . "')"
			. "ON DUPLICATE KEY UPDATE `steam_url`='" . $db->safe($player->profileurl) . "', `avatar_url`='" . $db->safe($player->avatarfull) . "', `nickname`='" . $db->safe($player->personaname) . "'") or die($db->error());
		header("Location: /profile/" . $pl->steamid());
	}
}
if ($logged_user and (($logged_user->steamid() == $pl->steamid() and !$logged_user->take_mag_info("mag_reason")) or $logged_user->take_group_info("admin_panel")) and isset($_POST['submit']) and $_POST['submit'] == 'profile' and isset($_POST['vk_id']) and isset($_POST['instagram']) and isset($_POST['about']) and isset($_POST['twitter']) and isset($_POST['youtube']) and isset($_POST['twitch'])) {
	$vk = ((int) $_POST['vk_id'])? ("'" . $db->safe((int) $_POST['vk_id']) . "'"): 'NULL';
	$instagram = (strlen($_POST['instagram']) and preg_match("/^[a-zA-Z0-9._-]+$/", $_POST['instagram']))? ("'" . $db->safe($_POST['instagram']) . "'"): 'NULL';
	$twitter = (strlen($_POST['twitter']) and preg_match("/^[a-zA-Z0-9_-]+$/", $_POST['twitter']))? ("'" . $db->safe($_POST['twitter']) . "'"): 'NULL';
	$youtube = (strlen($_POST['youtube']) and preg_match("/^[a-zA-Z0-9_-]+$/", $_POST['youtube']))? ("'" . $db->safe($_POST['youtube']) . "'"): 'NULL';
	$twitch = (strlen($_POST['twitch']) and preg_match("/^[a-zA-Z0-9_-]+$/", $_POST['twitch']))? ("'" . $db->safe($_POST['twitch']) . "'"): 'NULL';
	$about = (strlen($_POST['about']))? ("'" . $db->safe($_POST['about']) . "'"): 'NULL';
	$db->execute("UPDATE `players` SET `vk_id`=$vk, `instagram`=$instagram, `twitter`=$twitter, `youtube`=$youtube, `twitch`=$twitch, `about`=$about WHERE `SID`='{$pl->steamid()}'") or die($db->error());
	$pl = new User($pl->steamid(), 'SID');
}
if ($logged_user and isset($_POST['submit']) and isset($_POST['reason']) and strlen($_POST['reason']))
{
	switch ($_POST['submit']) {
		case "warn":
			if (!$logged_user->take_group_info("warn"))
				break;
			Logger::Log(5, 0, '', '', $logged_user->steamid(),$pl->steamid());
			$db->execute("INSERT INTO `violations` (`SID`, `date`, `admin`, `server`, `violation`)"
				. " VALUES('{$pl->steamid()}', " . time() . ", '{$logged_user->steamid()}', 'Сайт Метростроя', '{$db->safe($_POST['reason'])}')");
			break;
		case 'add_icon':
			if (!$logged_user->take_group_info("admin_panel") or !isset($_POST['icon']))
				if (!isset(Base::$ICONS[$_POST['icon']]))
					break;
				Logger::Log(9, 0, '', '', $logged_user->steamid(),$pl->steamid());
				$icon = (object) array('id' => $_POST['icon']);
				if (isset($_POST['icon_name']) and strlen($_POST['icon_name']))
					$icon->name = htmlspecialchars($_POST['icon_name']);
				$pl->add_icon($icon);
				break;
			break;
		case 'remove_icon':
			if (!$logged_user->take_group_info("admin_panel") or !isset($_POST['icon']))
				break;
			Logger::Log(10, 0, '', '', $logged_user->steamid(),$pl->steamid());
			$pl->remove_icon((int) $_POST['icon']);
			break;
		case 'rc':
			if(!((int) $pl->take_coupon_info('nom') > 1 and (int) $pl->take_coupon_info('num') <= 3 and $logged_user->take_group_info("give_coupon")))
				break;
			$status = array(
				'date' => time(),
				'nom' => $pl->take_coupon_info('nom') - 1,
				'admin' => $logged_user->steamid(),
			);
			Logger::Log(7, 0, '', array('old'=>$pl->take_coupon_info('nom'),'new'=>$pl->take_coupon_info('nom') - 1), $logged_user->steamid(),$pl->steamid());
			$db->execute("UPDATE `players` SET `status`='{$db->safe(json_encode($status))}' WHERE `id`={$pl->uid()}");
			$pl = new User($pl->steamid(), 'SID');
			break;
		case 'tc':
			if(!((int) $pl->take_coupon_info('nom') >= 1 and (int) $pl->take_coupon_info('num') <= 3 and $logged_user->take_group_info("give_coupon")))
				break;
			$status = array(
				'date' => time(),
				'nom' => ($pl->take_coupon_info('nom')) % 3 + 1,
				'admin' => $logged_user->steamid(),
			);
			Logger::Log(7, 0, '', array('old'=>$pl->take_coupon_info('nom'),'new'=>($pl->take_coupon_info('nom') % 3 + 1)), $logged_user->steamid(),$pl->steamid());
			$add = ($pl->take_coupon_info('nom') == 3)? ", `group`='user'": "";
			$db->execute("UPDATE `players` SET `status`='{$db->safe(json_encode($status))}'$add WHERE `id`={$pl->uid()}");
			$vio = "\nОтобран " . Base::$COUPON_INFO[$pl->take_coupon_info('nom')] . " талон, выдан "  . Base::$COUPON_INFO[($pl->take_coupon_info('nom')) % 3 + 1] . ".";
			$db->execute("INSERT INTO `violations` (`SID`, `date`, `admin`, `server`, `violation`)"
				. " VALUES('{$pl->steamid()}', " . time() . ", '{$logged_user->steamid()}', 'Сайт Метростроя', '{$db->safe($_POST['reason'] . $vio)}')");
			if ($pl->take_coupon_info('nom') == 3) $db->execute("INSERT INTO `examinfo` (`SID`, `date`, `rank`, `examiner`, `note`, `type`, `server`)"
				. " VALUES ('{$pl->steamid()}', " . time() . ", 'user', 'SYSTEM', '{$logged_user->take_steam_info('nickname')}({$logged_user->steamid()}) отобрал красный талон.\n УВОЛЕН!', 2, 'Сайт Метростроя')");
			$pl = new User($pl->steamid(), 'SID');
			break;
		case 'test':
			if (!($logged_user->take_group_info("up_down")))
				break;
			$test = Base::GenerateTest($_POST['reason']);
			if ($test) {
				$db->execute("UPDATE `tests_results` SET `status`=3, `reviewer`='BOT', `passed`=0, `review_date`=NOW() WHERE `status` < 2 AND `student`='{$pl->steamid()}'") or die($db->error());
				$db->execute("INSERT INTO `tests_results` (`status`, `student`, `questions`, `trname`, `recived_date`) "
					. "VALUES (0, '{$pl->steamid()}', '{$db->safe($test[0])}', '{$db->safe($test[1])}', NOW())") or die($db->error());
			}
//			$pl = new User($pl->steamid(), 'SID');
			break;
		case 'up':
			if (!($logged_user->take_group_info("up_down") and in_array($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) and array_search($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) != 4))
				break;
			$new_gr = ($pl->take_group_info('txtid') == 'user' and isset($_POST['up_to_3_class']))? 'driver3class' : Base::$GROUPS_UP_DOWN[array_search($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) + 1];
			Logger::Log(1, 0, '', array('rank'=>$new_gr), $logged_user->steamid(),$pl->steamid());
			$db->execute("UPDATE `players` SET `group`='$new_gr' WHERE `id`={$pl->uid()}");
			$db->execute("INSERT INTO `examinfo` (`SID`, `date`, `rank`, `examiner`, `note`, `type`, `server`)"
				. " VALUES ('{$pl->steamid()}', " . time() . ", '$new_gr', '{$logged_user->steamid()}', '{$db->safe($_POST['reason'])}', 1, 'Сайт Метростроя')");
			Base::SendToSocket('notify',array('what'=>'exam','examiner'=>$db->safe($logged_user->steamid()),'time'=>time()));
			$pl = new User($pl->steamid(), 'SID');
			break;
		case 'down':
			if (!($logged_user->take_group_info("up_down") and in_array($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) and array_search($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) != 0))
				break;
			$new_gr = Base::$GROUPS_UP_DOWN[array_search($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) - 1];
			Logger::Log(2, 0, '', array('rank'=>$new_gr), $logged_user->steamid(),$pl->steamid());
			$db->execute("UPDATE `players` SET `group`='$new_gr' WHERE `id`={$pl->uid()}");
			$db->execute("INSERT INTO `examinfo` (`SID`, `date`, `rank`, `examiner`, `note`, `type`, `server`)"
				. " VALUES ('{$pl->steamid()}', " . time() . ", '$new_gr', '{$logged_user->steamid()}', '{$db->safe($_POST['reason'])}', 2, 'Сайт Метростроя')");
			Base::SendToSocket('notify',array('what'=>'exam','examiner'=>$db->safe($logged_user->steamid()),'time'=>time()));
			$pl = new User($pl->steamid(), 'SID');
			break;
		case "setrank":
			if (!$logged_user->take_group_info("change_group") or !(isset($_POST['group'])) or !array_key_exists($_POST['group'], $groups) or $_POST['group'] == $pl->take_group_info("txtid"))
				break;
			Logger::Log(3, 0, '', array('rank'=>$_POST['group']), $logged_user->steamid(),$pl->steamid());
			$db->execute("UPDATE `players` SET `group`='{$db->safe($_POST['group'])}' WHERE `id`={$pl->uid()}");
			$db->execute("INSERT INTO `examinfo` (`SID`, `date`, `rank`, `examiner`, `note`, `type`, `server`)"
				. "VALUES ('{$db->safe($pl->steamid())}'," . time() . ",'{$db->safe($_POST['group'])}','{$logged_user->steamid()}','{$db->safe($_POST['reason'])}',4,'Сайт Метростроя')");
			Base::SendToSocket('notify',array('what'=>'exam','examiner'=>$db->safe($logged_user->steamid()),'time'=>time()));
			$pl = new User($pl->steamid(), 'SID');
			break;
		case 'report':
			if ($logged_user->steamid() == $pl->steamid() or $logged_user->take_mag_info("mag_reason") or !isset($_POST['server']) or !strlen($_POST['server']))
				break;
			$_POST['server'] = (int) $_POST['server'];
			if (!isset($servers[$_POST['server']]) or !$servers[$_POST['server']]['active'] or !$servers[$_POST['server']]['show_for_everyone'] or $servers[$_POST['server']]['deleted']) break;
			$db->execute("INSERT INTO `mag_reports` (`mag_rserver`,`mag_rserver_id`,`mag_reason`,`mag_reporter`,`mag_badpl`,`mag_rdate`) VALUES ('{$db->safe($servers[$_POST['server']]['name'])}', '{$_POST['server']}', '{$db->safe($_POST['reason'])}', '{$logged_user->steamid()}', '{$pl->steamid()}', NOW())");
//			$pl = new User($pl->steamid(), 'SID');
			break;
	}
	header("Location: /profile/".$lnk[1]);
	exit;
}
$pl_warns = $db->execute("SELECT * FROM `violations` LEFT JOIN `user_info_cache` ON `violations`.`admin`=`user_info_cache`.`steamid` WHERE  `SID`='{$pl->steamid()}' ORDER BY `violations`.`date` DESC") or die ($db->error());
ob_start();
$c = 1;
if (!$db->num_rows($pl_warns)) {
	Base::TakeTPL("profile/no_violations");
} else {
	while ($pl_warn = $db->fetch_array($pl_warns)) {
		include Base::PathTPL("profile/violation");
		$c++;
	}
}
$pl_warns = ob_get_clean();


$marks = array(
	'success' => '<i class="check metrostroi icon" style="color: #3c763d;" data-tippy-theme="translucent" title="'._('Ответ верен').'"></i>',
	'warning' => '<i class="radio metrostroi icon" style="color: #f0ad4e;" data-tippy-theme="translucent" title="'._('Ответ частично верен').'"></i>',
	'error' => '<i class="remove metrostroi icon" style="color: #a94442;" data-tippy-theme="translucent" title="'._('Ответ неверен').'"></i>',
	'copypaste' => '<i class="legal metrostroi icon" data-tippy-theme="translucent" title="'._('Ответ списан').'"></i>'
);

$marks_color = array(
	'success' => '#3c763d',
	'warning' => '#f0ad4e',
	'error' => '#a94442',
	'copypaste' => '#000'
);

$pl_tests = $db->execute("SELECT * FROM `tests_results` LEFT JOIN `user_info_cache` ON `tests_results`.`reviewer`=`user_info_cache`.`steamid` WHERE `student`='{$pl->steamid()}' AND `status`>1 ORDER BY `tests_results`.`recived_date` DESC") or die ($db->error());
ob_start();
$c = 1;
if (!$db->num_rows($pl_tests)) {
	Base::TakeTPL("profile/no_tests");
} else {
	echo "<div class=\"ui styled fluid accordion\">";
	while ($pl_test = $db->fetch_array($pl_tests)) {
		$questions = json_decode($pl_test['questions']);
		$answers = json_decode($pl_test['answers']);
		$answers_marks = json_decode($pl_test['answers_marks']);
		include Base::PathTPL("profile/test");
		$c++;
	}
	echo "</div>";
}
$pl_tests = ob_get_clean();

$pl_exams = $db->execute("SELECT * FROM `groups`, `examinfo` LEFT JOIN `user_info_cache` ON `examinfo`.`examiner`=`user_info_cache`.`steamid` WHERE `examinfo`.`rank`=`groups`.`txtid` AND `SID`='{$pl->steamid()}' ORDER BY `examinfo`.`date` DESC") or die ($db->error());
ob_start();
if (!$db->num_rows($pl_exams)) {
	Base::TakeTPL("profile/no_exams");
} else {
	while ($pl_exam = $db->fetch_array($pl_exams)) {
		switch ($pl_exam['type']) {
			case 1:
				$class = 'green';
				break;
			case 2:
				$class = 'red';
				break;
			case 3:
				$class = 'blue';
				break;
			case 4:
				$class = 'blue';
				break;
			case 5:
				$class = 'red';
				break;
			default:
				$class = '';
				break;
		}
		if ($pl_exam['type'] == 5)
		{
			include Base::PathTPL("profile/exam_practice");
		}
		else
		{
			include Base::PathTPL("profile/exam");
		}
	}
}
$pl_exams = ob_get_clean();

$page_fucking_title = _("Профиль пользователя - ") . $pl->take_steam_info("nickname");
include Base::PathTPL("header");
include Base::PathTPL("left_side");

include Base::PathTPL("profile/profile");

include Base::PathTPL("right_side");
ob_start();
if ($logged_user) {
	if ((($logged_user->steamid() == $pl->steamid()) or $logged_user->take_group_info("admin_panel"))) include Base::PathTPL("profile/edit-modal");
	if (($logged_user->steamid() != $pl->steamid()) and !$logged_user->take_mag_info("mag_reason")) include Base::PathTPL("profile/report-modal");
	if ($logged_user->take_group_info("warn")) include Base::PathTPL("profile/add-violation-modal");
	if ($logged_user->take_group_info("up_down")) include Base::PathTPL("profile/give-test-modal");
	if ($logged_user->take_group_info("up_down") and in_array($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) and array_search($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) != 4) include Base::PathTPL("profile/promote-modal");
	if ($logged_user->take_group_info("up_down") and in_array($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) and array_search($pl->take_group_info('txtid'), Base::$GROUPS_UP_DOWN) != 0) include Base::PathTPL("profile/demote-modal");
	if ((int) $pl->take_coupon_info('nom') > 1 and (int) $pl->take_coupon_info('num') <= 3 and $logged_user->take_group_info("give_coupon")) include Base::PathTPL("profile/return-ticket-modal");
	if ((int) $pl->take_coupon_info('nom') >= 1 and (int) $pl->take_coupon_info('num') <= 3 and $logged_user->take_group_info("give_coupon")) include Base::PathTPL("profile/take-ticket-modal");
	if ($logged_user->take_group_info("change_group")) include Base::PathTPL("profile/set-rank-modal");
	if ($logged_user->take_group_info("admin_panel")) include Base::PathTPL("profile/give-icon-modal");
	if ($logged_user->take_group_info("admin_panel")) include Base::PathTPL("profile/take-icon-modal");
}
echo "
<script>
      $('.ui.accordion').accordion();
      
      $('#admin-dropdown').dropdown({ action: 'nothing' });
      $('#report-modal').modal('attach events', '#report-lnk', 'show');
	  $('#edit-modal').modal('attach events', '#edit-lnk', 'show');
      $('#violation-add-modal').modal('attach events', '#violation-add-lnk', 'show');
      $('#give-test-modal').modal('attach events', '#give-test-lnk', 'show');
      $('#promote-modal').modal('attach events', '#promote-lnk', 'show');
      $('#demote-modal').modal('attach events', '#demote-lnk', 'show');
      $('#return-ticket-modal').modal('attach events', '#return-ticket-lnk', 'show');
      $('#take-ticket-modal').modal('attach events', '#take-ticket-lnk', 'show');
      $('#set-rank-modal').modal('attach events', '#set-rank-lnk', 'show');
      $('#give-icon-modal').modal('attach events', '#give-icon-lnk', 'show');
      $('#take-icon-modal').modal('attach events', '#take-icon-lnk', 'show');
      
      $('#profile-tabs .item').tab({
        onVisible: function(tabPath) {
          $('#comments-name').hide();
          $('#violations-name').hide();
          $('#exams-name').hide();
          $('#tests-name').hide();
          $('#ticket-name').hide();
          $('#stats-name').hide();
          
          $('#' + tabPath + '-name').show();
        }
      });
</script>
";
$show_other = ob_get_contents();
ob_end_clean();
include Base::PathTPL("footer");