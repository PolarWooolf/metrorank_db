<?php
Base::TakeClass('openid');
if($logged_user) {
	include ROOT . "pages/404.php";
	return;
}
try {
	$redirect = (isset($_GET['rdrct']))? $_GET['rdrct']: '';
	$openid = new LightOpenID('https://' . $_SERVER['SERVER_NAME'] . '/login?rdrct='.$redirect);
	if (!$openid->mode) {
		if (isset($_GET['login'])) {
			$openid->identity = 'http://steamcommunity.com/openid/?l=english';
			header('Location: ' . $openid->authUrl());
		}
//		include (ROOT."pages/404.php");
	} elseif ($openid->mode == 'cancel') {
		echo 'User has canceled authentication!';
	} else {
		if ($openid->validate()) {
			$id = $openid->identity;
			// identity is something like: http://steamcommunity.com/openid/id/76561197960435530
			// we only care about the unique account ID at the end of the URL.
			$ptn = "/^https:\/\/steamcommunity\.com\/openid\/id\/(7[0-9]{15,25}+)$/";
			preg_match($ptn, $id, $matches);
//			echo "User is logged in (steamID: $matches[1])\n";

			$url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=$_STEAMAPI&steamids=$matches[1]";
			$json_object = file_get_contents($url);
			$json_decoded = json_decode($json_object);

			foreach ($json_decoded->response->players as $player) {
				/*echo "
                    <br/>Player ID: $player->steamid
                    <br/>Player Name: $player->personaname
                    <br/>Profile URL: $player->profileurl
                    <br/>SmallAvatar: <img src='$player->avatar'/>
                    <br/>MediumAvatar: <img src='$player->avatarmedium'/>
                    <br/>LargeAvatar: <img src='$player->avatarfull'/>
                    ";*/
				$status = json_encode(
					array(
						'admin'=>'',
						'nom'=>1,
						'date'=>time()
					)
				);
				$sessionID = $player->steamid . "_". Base::randString(100);
				$db->execute("DELETE FROM `sessions` WHERE `session_date` < NOW() - INTERVAL 1 MONTH ");
				$db->execute("INSERT INTO `players` (`SID`, `group`, `status`) VALUES ('" . $db->safe(Base::ToSteamID($player->steamid)) . "', 'user', '$status')");
				$db->execute("INSERT INTO `sessions` (`session_id`, `session_steamid`, `session_date`) VALUES ('$sessionID', '" . $db->safe(Base::ToSteamID($player->steamid)) . "', NOW())");
				$db->execute("INSERT INTO `user_info_cache` (`steamid`, `steam_url`, `avatar_url`, `nickname`) VALUES ('" . $db->safe(Base::ToSteamID($player->steamid)) . "', '" . $db->safe($player->profileurl) . "', '" . $db->safe($player->avatarfull) . "', '" . $db->safe($player->personaname) . "')"
					. "ON DUPLICATE KEY UPDATE `steam_url`='" . $db->safe($player->profileurl) . "', `avatar_url`='" . $db->safe($player->avatarfull) . "', `nickname`='" . $db->safe($player->personaname) . "'") or die($db->error());
				setcookie("mitrastroi_sid", $sessionID, time() + 3600 * 24 * 30, '/', $_SERVER['HTTP_HOST']);
				$db->execute("INSERT INTO `login_log` (`SID`, `ip`) VALUES ('" . $db->safe(Base::ToSteamID($player->steamid)) . "', '".Base::GetRealIp()."')");
				header("Location: /$redirect");
			}

		} else {
			header("Location: /$redirect");
		}
	}
} catch (ErrorException $e) {
	echo $e->getMessage();
}
