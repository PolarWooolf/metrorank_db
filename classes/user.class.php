<?php
class User {
	private $SID;
	private $SessionID;
	private $rights;
	private $id;
	private $coupon_info;
	private $server_id;
	private $steam_info;
	private $ban;
	private $mag;
	private $icon;
	private $violations;
	private $new_tickets;
	private $social_info;
	private $old_group;

	/**
	 * User constructor.
	 * @param $arg - Some parameter by which we can find only one user
	 * @param string $type - which parameter we send
	 * @return User
	 */
	public function User($arg, $type = 'id') {
		global $db;
		global $servers;
		$arg = $db->safe($arg);
		$query = $db->execute("SELECT *  FROM `groups`, `players` LEFT JOIN `user_info_cache` ON `user_info_cache`.`steamid`=`players`.`SID` LEFT JOIN `sessions` ON `sessions`.`session_steamid`=`players`.`SID` LEFT JOIN `blacklist` ON `blacklist`.`steam_id`=`players`.`SID` LEFT JOIN `mag_bans` ON `mag_bans`.`mag_steam_id`=`players`.`SID` AND (`mag_unban_date` IS NULL OR `mag_unban_date` > NOW()) WHERE `players`.`group`=`groups`.`txtid` AND `$type`='$arg' ORDER BY `mag_date` DESC ") or die($db->error());
		if (!$query and $db->num_rows($query) != 1) {
			print $db->error();
			$this->id = -1;
			return;
		}
		$user = $db->fetch_array($query);
		$this->id = $user['id'];
		$this->SID = $user['SID'];
		$this->SessionID = $user['session_id'];
		$this->icon = (is_array(json_decode($user['icon'])))? json_decode($user['icon']): array((object) array('id' => $user['icon']));
		foreach ($servers as $key => $sv)
		{
			if ($sv['owner'] == $user['SID'] and $sv['active'] and $sv['show_for_everyone'] and !$sv['deleted'])
			{
				$this->icon[] = (object) array('id'=>'6');
			}
		}
		$this->coupon_info = json_decode($user['status']);
		$this->server_id = $user['server_id'];
		$this->old_group = $user['old_group'];
		foreach (Base::$RIGHTS as $right)
			$this->rights[$right] = $user[$right];
		foreach (Base::$MAG_INFO as $mag)
			$this->mag[$mag] = $user[$mag];
		foreach (Base::$BAN_INFO as $ban)
			$this->ban[$ban] = $user[$ban];
		foreach (Base::$STEAM_INFO as $INFO)
			$this->steam_info[$INFO] = $user[$INFO];
		foreach (Base::$SOCIAL_INFO as $INFO)
			$this->social_info[$INFO] = $user[$INFO];
	}

	/**
	 * Returns user's id
	 * @return int
	 */
	public function uid() {
		return $this->id;
	}

	/**
	 * Shows icon by provided id
	 * @param $id - ID of icon
	 * @return string
	 */
	public static function ShowIconById($id) {
		if (!isset(Base::$ICONS[$id])) return '';
		return "<i class=\"metrostroi small " . Base::$ICONS[$id]['icon'] . " icon fix\" style=\"color: white !important; background-color: " . Base::$ICONS[$id]['color'] . ";\" title=\"" . Base::$ICONS[$id]['name'] . "\"></i>";
	}

	/**
	 * Shows icon
	 * @param $icon - array icon
	 * @return string
	 */
	public static function ShowIcon($icon) {
		if (!isset(Base::$ICONS[$icon->id])) return '';
		return "<i class=\"metrostroi small " . ((isset($icon->icon))? $icon->icon: Base::$ICONS[$icon->id]['icon']) . " icon fix\" style=\"color: white !important; background-color: " . Base::$ICONS[$icon->id]['color'] . ";\" title=\"" . ((isset($icon->name))? $icon->name: Base::$ICONS[$icon->id]['name']) . "\"></i>";
	}

	/**
	 * Shows icons
	 * @param $icons - array icons
	 * @return string
	 */
	public static function ShowIcons($icons) {
		$result = '';
		foreach($icons as $icon)
			$result .= self::ShowIcon($icon);
		return $result;
	}


	/**
	 * Shows user's icons
	 * @return string
	 */
	public function show_icon() {
		$result = '';
		foreach($this->icon as $icon)
			$result .= self::ShowIcon($icon);
		return $result;
	}

	/**
	 * Shows rank icon
	 * @param $icon - string rank
	 * @return string
	 */
	public static function ShowRankIcon($icon) {
		$path = (date('dm') == 104)? "tpl/img/ranks/" . $icon . ".png" : "tpl/img/ranks/" . $icon . ".png";
		return (file_exists(ROOT . $path)) ? ("/" . $path): false;
	}

	/**
	 * Shows user's rank icon
	 * @return string
	 */
	public function show_rank_icon() {
		return self::ShowRankIcon($this->take_group_infoold('txtid'));
	}

	/**
	 * Shows user's icons
	 * @return string
	 */
	public function show_full_icon() {
		$result = '';
		foreach($this->icon as $icon)
		{
			$fullicon = self::ShowFullIcon($icon);
			if ($fullicon != '')
			{
				if ($result != '') {$result .= '<br>';}
				$result .= $fullicon;
			}
		}
		return $result;
	}

	/**
	 * Returns user's SteamID
	 * @return string
	 */
	public function steamid() {
		return $this->SID;
	}
	
	public function old_group() {
		return $this->old_group;
	}

	
	public function server_id() {
		return $this->server_id;
	}

	/**
	 * Returns user's icons array
	 * @return int
	 */
	public function icons() {
		return $this->icon;
	}

	/**
	 * Returns user's icon ID
	 * @return int
	 */
	public function max_icon_id() {
		$result = -100;
		foreach($this->icon as $icon)
			$result = max($result, $icon->id);
		return $result;
	}

	/**
	 * Adds user's icon
	 * @return int
	 */
	public function add_icon($icon) {
		global $db;
		array_push($this->icon, $icon);
		$db->execute("UPDATE `players` SET `icon`='{$db->safe(json_encode($this->icon))}' WHERE `id`='{$db->safe($this->id)}'");
	}

	/**
	 * Adds user's icon
	 * @return int
	 */
	public function remove_icon($icon) {
		global $db;
		if(!isset($this->icon[$icon]))
			return;
		unset($this->icon[$icon]);
		$db->execute("UPDATE `players` SET `icon`='{$db->safe(json_encode($this->icon))}' WHERE `id`='{$db->safe($this->id)}'")or die($db->error());
	}

	/**
	 * Returns some info about user's group
	 * @param $name - Name of parameter
	 * @return string
	 * @throws BadParameterException
	 */
	public function take_group_infoold($name) {
		global $locale;
		if ($name == 'name')
		{
			if ($locale != 'ru_RU')
			{
				$name = 'name_en';
			}
		}
		if (!in_array($name, Base::$RIGHTS))
			throw new BadParameterException();
		return $this->rights[$name];
	}
	
	public function take_group_info($name) {
		if ($name == 'txtid')
		{
			return $this->take_group_infoold($name);
		}
		elseif ($name == 'name')
		{
			return $this->take_group_infoold($name);
		}
		$pl_rights = array();
		foreach(Base::$RIGHTS as $RIGHT)
			if ($this->take_group_infoold($RIGHT) AND $RIGHT != 'txtid' AND $RIGHT != 'name')
				array_push($pl_rights, $RIGHT);
			
		
		if (!in_array("up_down",$pl_rights) and !in_array("up_to_driver",$pl_rights) and $this->take_group_infoold('txtid') != 'user' and $this->take_group_infoold('txtid') != 'driver' and $this->take_group_infoold('txtid') != 'driver3class' and (int) $this->max_icon_id() >= 5) {
			$pl_rights[] = "up_to_driver";
		}
		return in_array($name,$pl_rights);
	}

	/**
	 * Returns some info about user's Steam account
	 * @param $name - Name of parameter
	 * @return string
	 * @throws BadParameterException
	 */
	public function take_steam_info($name) {
		if (!in_array($name, Base::$STEAM_INFO))
			throw new BadParameterException();
		return $this->steam_info[$name];
	}

	/**
	 * Returns some info about user's social accounts and description
	 * @param $name - Name of parameter
	 * @return string
	 * @throws BadParameterException
	 */
	public function take_social_info($name) {
		if (!in_array($name, Base::$SOCIAL_INFO))
			throw new BadParameterException();
		return $this->social_info[$name];
	}

	/**
	 * Returns some info about user's coupon
	 * @param $name - Name of parameter
	 * @return string
	 */
	public function take_coupon_info($name) {
		if (!isset($this->coupon_info->$name))
			return '';
		return $this->coupon_info->$name;
	}

	/**
	 * Returns number of violations
	 * @return string
	 */
	public function count_violations() {
		global $db;
		if (isset($this->violations)) return $this->violations;
		$query = $db->execute("SELECT COUNT(*) FROM `violations` WHERE `SID`='{$this->SID}'");
		$query = $db->fetch_array($query);
		$this->violations = $query[0];
		return $query[0];
	}

	/**
	 * Returns how many tickets are unread
	 * @return string
	 */
	public function count_new_tickets() {
		global $db;
		if (isset($this->new_tickets)) return ($this->new_tickets);
		$query = $db->execute("SELECT COUNT(*) FROM `tickets` WHERE `owner`='{$this->SID}' and `viewed`=0");
		$query = $db->fetch_array($query);
		$this->new_tickets = $query[0];
		return ($this->new_tickets);
	}

	/**
	 * Returns how many tickets are unread
	 * @return string
	 */
	public function count_new_tickets_full() {
		global $db;
		if (isset($this->new_tickets)) return ($this->new_tickets == 0)? "": ($this->new_tickets . (($this->new_tickets % 10 == 1)? " новый тикет": " новых тикетов"));
		$query = $db->execute("SELECT COUNT(*) FROM `tickets` WHERE `owner`='{$this->SID}' and `viewed`=0");
		$query = $db->fetch_array($query);
		$this->new_tickets = $query[0];
		return ($this->new_tickets == 0)? "": ($this->new_tickets . (($this->new_tickets % 10 == 1 and $this->new_tickets != 11)? " новый тикет": " новых тикетов"));
	}

	/**
	 * Returns number of unread heavy MAG reports
	 * @return string
	 */
	public function count_mag_heavy_unread_reports() {
		global $db;
		if (isset($this->mag['num_heavy_unread_reports'])) return $this->mag['num_heavy_unread_reports'];
		$query = $db->execute("SELECT COUNT(*) FROM `mag_reports` WHERE `mag_reporter`='{$this->SID}' and `mag_heavy`>0 and `mag_sender_heavy_read`=0");
		$query = $db->fetch_array($query);
		$this->mag['num_heavy_unread_reports'] = $query[0];
		return $this->mag['num_heavy_unread_reports'];
	}

	/**
	 * Returns number of new tickets
	 * @return string
	 */
	public function count_mag_reports() {
		global $db;
		if (isset($this->mag['num_reports'])) return $this->mag['num_reports'];
		$query = $db->execute("SELECT COUNT(*) FROM `mag_reports` WHERE `mag_badpl`='{$this->SID}' and `mag_heavy`>0");
		$query = $db->fetch_array($query);
		$this->mag['num_reports'] = $query[0];
		return $this->mag['num_reports'];
	}

	/**
	 * Returns some info about user's ban
	 * @param $name - Name of parameter
	 * @return string
	 */
	public function take_ban_info($name) {
		if (!in_array($name, Base::$BAN_INFO))
			return '';
		return ($this->ban[$name] != null)? $this->ban[$name]: false;
	}

	/**
	 * Returns some info about user's MAG ban
	 * @param $name - Name of parameter
	 * @return string
	 */
	public function take_mag_info($name) {
		if (!in_array($name, Base::$MAG_INFO))
			return '';
		return ($this->mag[$name] != null)? $this->mag[$name]: false;
	}

	/**
	 * User logout
	 */
	public function logout() {
		global $db;
		$db->execute("DELETE FROM `sessions` WHERE `session_id`='{$db->safe($_COOKIE['mitrastroi_sid'])}'");
		setcookie("mitrastroi_sid", 'null', time(), '/', $_SERVER['HTTP_HOST']);
	}
}
class BadParameterException extends Exception {
	protected $message = 'This function got bad parameter';
}
