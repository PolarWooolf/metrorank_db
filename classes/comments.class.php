<?php

class Comments
{
	public static function ShowComments($type, $id, $hold_place = false)
	{
		global $db, $logged_user;
		$access = ($logged_user and !$logged_user->take_ban_info('reason')) ? ($logged_user->take_group_info("delete_comment")) ? 2 : 1 : 0;
		if ($access and isset($_POST['message']) and mb_strlen($message = $db->safe($_POST['message']), 'utf8') and mb_strlen($message, 'utf8') < 256) {
			$db->execute("INSERT INTO `comments` (`type`, `item_id`, `author`, `text`) VALUES ($type, '$id', '{$logged_user->steamid()}', '$message')") or die($db->error());
		}
		if ($access == 2 and isset($_POST['delete'])) {
			$query = $db->execute("SELECT *  FROM `comments` WHERE `cid`='{$db->safe($_POST['delete'])}'") or die($db->error());
			if (!$query and $db->num_rows($query) != 1) {
				return;
			}
			$query = $db->fetch_array($query);
			Logger::Log(8, 0, '', array('text'=>$query['text'],'item_id'=>$query['item_id'],'type'=>$query['type']), $logged_user->steamid(),$query['author']);
			$db->execute("DELETE FROM `comments` WHERE  `cid`='{$db->safe($_POST['delete'])}'") or die($db->error());
		}
		$comments = $db->execute("SELECT `comments`.*, `user_info_cache`.*, `players`.`icon` FROM `comments` LEFT JOIN `user_info_cache` ON `comments`.`author`=`user_info_cache`.`steamid` LEFT JOIN `players` ON `comments`.`author`=`players`.`SID` WHERE `type`='{$db->safe($type)}' AND `item_id`='{$db->safe($id)}' ORDER BY `comments`.`date` DESC");
		if ($access > 0) include Base::PathTPL("comments/comment_add");
		if ($db->num_rows($comments))
			while ($comment = $db->fetch_array($comments)) {
				include Base::PathTPL("comments/comment");
			}
	}
}
