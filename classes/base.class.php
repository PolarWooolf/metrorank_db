<?php
class Base {
	public static $RIGHTS = array(
		'txtid', 'name', 'name_en', 'change_group', 'warn', 'news_add', 'delete_comment', 'blacklist_edit', 'tests_edit', 'give_coupon', 'up_down', 'admin_panel', 'tickets', 'mag_bans', 'edit_tests', 'mag_reports', 'statistics', 'up_to_driver', 'log', 'adm'
	);
	public static $STEAM_INFO = array(
		'steamid', 'nickname', 'steam_url', 'avatar_url'
	);
	public static $BAN_INFO = array(
		'steam_id', 'admin', 'reason'
	);
	public static $SOCIAL_INFO = array(
		'vk_id', 'about', 'instagram', 'twitter', 'youtube', 'twitch', 'site'
	);
	public static $MAG_INFO = array(
		'mag_steam_id', 'mag_admin_id', 'mag_date', 'mag_unban_date', 'mag_reason'
	);
	public static $COUPON_INFO = array(
		'розовый', 'зеленый', 'желтый', 'красный'
	);
	public static $GROUPS_UP_DOWN = array(
		'user', 'driver', 'driver3class', 'driver2class', 'driver1class'
	);
	public static $ICONS = array(
		-1 => array(
			'name'=>'Недоверенный игрок',
			'color'=>'#d9534f',
			'icon'=>'ban',
		),
		1 => array(
			'name'=>'Заслуженный игрок',
			'color'=>'#f0ad4e',
			'icon'=>'star',
		),
		2 => array(
			'name'=>'Доверенный игрок',
			'color'=>'#5cb85c',
			'icon'=>'checkmark',
		),
		3 => array(
			'name'=>'Сотрудник реального метрополитена',
			'color'=>'#d9534f',
			'icon'=>'subway',
		),
		4 => array(
			'name'=>'Че-то там на каком-то турнире отметился',
			'color'=>'warning',
			'icon'=>'trophy',
		),
		5 => array(
			'name'=>'Админ партнерского сервера',
			'color'=>'#337ab7',
			'icon'=>'server',
		),
		6 => array(
			'name'=>'Владелец партнерских серверов',
			'color'=>'#5bc0de',
			'icon'=>'sitemap',
		),
		9 => array(
			'name'=>'Пресс-служба',
			'color'=>'#f0ad4e',
			'icon'=>'newspaper',
		),
		10 => array(
			'name'=>'Модератор системы',
			'color'=>'#d9534f',
			'icon'=>'comments outline',
		),
		11 => array(
			'name'=>'Разработчик системы',
			'color'=>'#337ab7',
			'icon'=>'wizard',
		),
		12 => array(
			'name'=>'Разработчик мода',
			'color'=>'#5cb85c',
			'icon'=>'wrench',
		),
	);
	public static $langs = array(
		'ru_RU' => array('Русский язык','ru'),
		'uk_UA' => array('Українська мова','ua'),
		'en_US' => array('English language','us')
	);
	public static function ToCommunityID($id) {
		if (preg_match('/^STEAM_/', $id)) {
			$parts = explode(':', $id);
			return bcadd(bcadd(bcmul($parts[2], '2'), '76561197960265728'), $parts[1]);
		} elseif (is_numeric($id) && strlen($id) < 16) {
			return bcadd($id, '76561197960265728');
		} else {
			return $id; // We have no idea what this is, so just return it.
		}
	}

	public static function ToSteamID($id) {
		if (is_numeric($id) && strlen($id) >= 16) {
			$z = bcdiv(bcsub($id, '76561197960265728'), '2');
		} elseif (is_numeric($id)) {
			$z = bcdiv($id, '2'); // Actually new User ID format
		} else {
			return $id; // We have no idea what this is, so just return it.
		}
		$y = bcmod($id, '2');
		return 'STEAM_0:' . $y . ':' . floor($z);
	}

	public static function randString($pass_len = 50) {
		$allchars = "ABCDEFGHIJKLMNOPQRSYUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		$string = "";

		mt_srand((double)microtime() * 1000000);

		for ($i = 0; $i < $pass_len; $i++)
			$string .= $allchars{mt_rand(0, strlen($allchars) - 1)};

		return $string;
	}

	public static function DetectTimeZone() {
		global $lnk;
		if (isset ($_COOKIE['mitrastroi_timezone']) and in_array($timezone = urldecode($_COOKIE['mitrastroi_timezone']), timezone_identifiers_list())) {
			date_default_timezone_set($timezone);
			return;
		}
		date_default_timezone_set('Europe/Moscow');
	}

	public static function GenerateTest ($id) {
		global $db;
		$test = $db->execute("SELECT * FROM `tests` WHERE `tid`='{$db->safe($id)}'");
		if ($db->num_rows($test) != 1)
			return false;
		$test = $db->fetch_array($test);
		$tname = $test['tname'];
		$test = json_decode($test['questions_cats']);
		$mscats = $db->execute("SELECT * FROM `questions_cats`");
		$cats = array();
		while ($cat = $db->fetch_array($mscats))
			array_push($cats, $cat['qcid']);
		$result = array();
		$where = array();
		foreach ($test as $question)
			$where[$question] = '';
		foreach ($test as $question) {
			$tmpquestion = $db->execute(
				(in_array($question, $cats))?
					"SELECT * FROM `questions` WHERE `cat`='{$db->safe($question)}'{$where[$question]} ORDER BY RAND()":
					"SELECT * FROM `questions` WHERE `cat`='0'{$where[$question]} ORDER BY RAND()"
			);
			if (!$db->num_rows($tmpquestion))
				continue;
			$tmpquestion = $db->fetch_array($tmpquestion);
			$where[$question] .= " AND NOT (`qid`='{$tmpquestion['qid']}')";
			array_push($result, $tmpquestion['question']);
		}
		return array (json_encode($result), $tname);
	}

	public static function TakeAuth() {
		global $logged_user, $db;
		if(!isset($_COOKIE['mitrastroi_sid'])) {
			$logged_user = false;
			return;
		}
//		$db->execute("DELETE FROM `sessions` WHERE `session_date` < NOW() - INTERVAL 1 MONTH ");
		$user = new User($_COOKIE['mitrastroi_sid'], 'session_id');
		if($user->uid() <= 0) {
			$logged_user = false;
			return;
		}
		$logged_user = $user;
		$sessionID = Base::randString(128);
		$db->execute("UPDATE `sessions` SET `session_date`=NOW() WHERE `session_id`='{$db->safe($_COOKIE['mitrastroi_sid'])}'");
	}

	public static function TakeClass ($class) {
		if (file_exists(ROOT . "classes/$class.class.php")) {
			require_once (ROOT . "classes/$class.class.php");
			return true;
		}
		return false;
	}

	public static function TakeTPL ($tpl) {
		if (file_exists(ROOT . "tpl/$tpl.html")) {
			include(ROOT . "tpl/$tpl.html");
			return true;
		}
		return false;
	}

	public static function PathTPL ($tpl) {
		if (file_exists(ROOT . "tpl/$tpl.html")) {
			return (ROOT . "tpl/$tpl.html");
		}
		return false;
	}

	public static function GeneratePagination($page, $amount_by_page, $total_amount, $link) {
		if ($amount_by_page >= $total_amount) return '';
		ob_start();
		self::TakeTPL("pagination/pagin_start");
		$pages_count = (int) ($total_amount / $amount_by_page + 1);
		if ($page <= 5){
			for ($p = 1; $p < $page; $p++){
				$l = $link . $p;
				include Base::PathTPL("pagination/pagin_item_inactive");
			}
		} else {
			$p = "&laquo;";
			$l = $link . 1;
			include Base::PathTPL("pagination/pagin_item_inactive");
			for ($p = $page - 3; $p < $page; $p++){
				$l = $link . $p;
				include Base::PathTPL("pagination/pagin_item_inactive");
			}
		}
		$p = $page;
		$l = $link . $page;
		include Base::PathTPL("pagination/pagin_item_active");
		if ($pages_count - $page <= 5){
			for ($p = $page + 1; $p <= $pages_count; $p++){
				$l = $link . $p;
				include Base::PathTPL("pagination/pagin_item_inactive");
			}
		} else {
			for ($p = $page + 1; $p <= $page + 3; $p++){
				$l = $link . $p;
				include Base::PathTPL("pagination/pagin_item_inactive");
			}
			$p = "&raquo;";
			$l = $link . $pages_count;
			include Base::PathTPL("pagination/pagin_item_inactive");
		}
		self::TakeTPL("pagination/pagin_end");
		return ob_get_clean();
	}
	
	
	public static function SendToSocket($method,$data) {
		global $db;
		if ($socket = stream_socket_client( 'tls://socket.metrostroi.net:7777', $errno, $errstr, 10, STREAM_CLIENT_CONNECT) ) {
			$input = array();
			$input['method'] = $method;
			$input['data'] = $data;
			fwrite($socket, json_encode($input, JSON_UNESCAPED_UNICODE));
			fclose($socket);
		}
	}
	
	
	public static function GetRealIP()
	{
		return $_SERVER['HTTP_X_REAL_IP']; //Ну вот так надо
	}
}
Base::$ICONS[-1]['name'] = _('Недоверенный игрок');
Base::$ICONS[1]['name'] = _('Заслуженный игрок');
Base::$ICONS[2]['name'] = _('Доверенный игрок');
Base::$ICONS[3]['name'] = _('Сотрудник реального метрополитена');
Base::$ICONS[5]['name'] = _('Админ партнерского сервера');
Base::$ICONS[6]['name'] = _('Владелец партнерских серверов');
Base::$ICONS[9]['name'] = _('Пресс-служба');
Base::$ICONS[10]['name'] = _('Модератор системы');
Base::$ICONS[11]['name'] = _('Разработчик системы');
Base::$ICONS[12]['name'] = _('Разработчик мода');
