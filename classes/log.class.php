<?php

class Logger
{
	public static function Log($type = 0, $server_id = 0, $text, $args = '', $player = NULL, $target = NULL)
	{
		global $db;
		$player = empty($player) ? 'NULL' : "'".$db->safe($player)."'";
		$target = empty($target) ? 'NULL' : "'".$db->safe($target)."'";
		if ($args != '')
		{
			$args = json_encode($args, JSON_UNESCAPED_UNICODE);
		}
		$db->execute("INSERT INTO `log` (`type`, `server_id`, `text`, `args`, `player`, `target`) VALUES (".(int) $type.", ".(int) $server_id.", '{$db->safe($text)}', '{$db->safe($args)}', {$player}, {$target})") or die($db->error());
	}
}