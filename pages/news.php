<?php
$menu->set_item_active('news');
$admin_mode = ($logged_user and $logged_user->max_icon_id() >= 9);
if (!isset($lnk[1])) $lnk[1] = 1;
switch ($lnk[1]) {
	case 'view':
		if (!isset($lnk[2])) {
			include ROOT . "pages/404.php";
			exit();
		}

		$query = $db->execute("SELECT `news`.*, `user_info_cache`.`nickname`, `news_cats`.`name` FROM `news` LEFT JOIN `news_cats` ON `news_cats`.`id`=`news`.`cat` LEFT JOIN `user_info_cache` ON `user_info_cache`.`steamid`=`news`.`author` WHERE `news`.`id`='{$db->safe($lnk[2])}'");
		if ($db->num_rows($query) != 1) {
			include ROOT . "pages/404.php";
			exit();
		}
		$query = $db->fetch_array($query);

		Base::TakeClass('comments');
		$page_fucking_title = $query['title'] . _(" - Новости Метростроя");
		include Base::PathTPL("header");
		include Base::PathTPL("left_side");

		// Убираем &lt;cut&gt; и прочую срань
		$query['text'] = str_replace(array('<cut>', '</cut>', '&lt;cut&gt;'), '', $query['text']);

		include Base::PathTPL("news/news_view");

		include Base::PathTPL("right_side");
		if ($admin_mode)
		{
			ob_start();
			include Base::PathTPL("news/news_modal");
			echo '<script>';
			include Base::PathTPL("news/news_scripts");
			echo '</script>
			';
			$show_other = ob_get_contents();
			ob_end_clean();
		}
		
		include Base::PathTPL("footer");
		break;
	case 'cat':
		$lnk_index = 3;
		$where = " WHERE `cat`='{$db->safe($lnk[2])}'";
		$url = "/news/cat/". htmlspecialchars((int)$lnk[2]) . '/';
	default:
		$num_by_page = 8;
		if (!isset($lnk_index)) $lnk_index = 1;
		if (!isset($where)) $where = " WHERE `news_cats`.`lang` = '{$locale}'";
		if (!isset($url)) $url = '/news/';
		$page = (isset($lnk[$lnk_index]) and ((int) $lnk[$lnk_index]) > 0)? ((int) $lnk[$lnk_index]): 1;
		$first = ($page - 1) * $num_by_page;
		$news = $db->execute("SELECT `news`.*, `user_info_cache`.`nickname`, `news_cats`.`name` FROM `news` LEFT JOIN `news_cats` ON `news_cats`.`id`=`news`.`cat` LEFT JOIN `user_info_cache` ON `user_info_cache`.`steamid`=`news`.`author`$where ORDER BY `date` DESC LIMIT $first, $num_by_page");
		if (!$db->num_rows($news)) {
			include ROOT . "pages/404.php";
			exit();
		}
		if ($page <= 1)
		{
			$page_fucking_title = _("Новости");
		}
		else
		{
			$page_fucking_title = _("Новости - Страница ") . $page;
		}
		include Base::PathTPL("header");
		include Base::PathTPL("left_side");
		$newsarr = array();
		while ($query = $db->fetch_array($news)) {
			$query['text'] = str_replace(stristr(str_replace(stristr($query['text'], '<cut>'), '', $query['text']), '&lt;cut&gt;'), '', $query['text']);
			$newsarr[] = $query;
			include Base::PathTPL("news/news_preview");
		}

		$query = $db->execute("SELECT COUNT(*) FROM `news` LEFT JOIN `news_cats` ON `news_cats`.`id`=`news`.`cat`$where");
		$query = $db->fetch_array($query);
		echo Base::GeneratePagination($page, $num_by_page, $query[0], $url);

		include Base::PathTPL("right_side");
		
		if ($admin_mode)
		{
			ob_start();
			foreach ($newsarr as $query) {
				include Base::PathTPL("news/news_modal");
			}
			echo '<script>';
			foreach ($newsarr as $query) {
				include Base::PathTPL("news/news_scripts");
			}
			echo '</script>
			';
			$show_other = ob_get_contents();
			ob_end_clean();
		}
		
		include Base::PathTPL("footer");
		break;
}