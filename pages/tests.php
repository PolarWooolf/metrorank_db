<?php
if (!$logged_user) {
	include ROOT . "pages/403.php";
	exit();
}

$statuses = array(
	_('Не начат'),
	_('Начат'),
	_('На проверке'),
	_('Проверен')
);

$rating = array(
	'<font color="#a94442;"><b>&laquo;'._('Неудовлетворительно').'&raquo;</b></font>',
	'<font color="#f0ad4e;"><b>&laquo;'._('Удовлетворительно').'&raquo;</b></font>',
	'<font color="#3c763d;"><b>&laquo;'._('Отлично').'&raquo;</b></font>'
);

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

if (!isset($lnk[1]) or $lnk[1]=='') {
	if(isset($_GET['take'])) {
		$query = $db->execute("SELECT * FROM `tests_results` WHERE `student`='{$logged_user->steamid()}' AND (`recived_date` > NOW() - INTERVAL 1 DAY OR `status`<2)");
		if(!$db->num_rows($query)) {
			$test = Base::GenerateTest($_GET['take']);
			if ($test) {
				$db->execute("INSERT INTO `tests_results` (`status`, `student`, `questions`, `trname`, `recived_date`) "
					. "VALUES (0, '{$logged_user->steamid()}', '{$db->safe($test[0])}', '{$db->safe($test[1])}', NOW())") or die($db->error());
			} else $error = _('Не получилось сгенерировать тест');
		} else $error = _('Сегодня ты уже писал тест!');
	}
	$tests = $db->execute("SELECT *, (SELECT `nickname` FROM `user_info_cache` WHERE `steamid`=`reviewer`) AS `reviewer_nickname` FROM `tests_results` WHERE `student`='{$logged_user->steamid()}' ORDER BY `recived_date` DESC ");
	$tests_take = $db->execute("SELECT * FROM `tests` ORDER BY `tpriority` DESC ");
} else {
	$test = $db->execute("SELECT *, (SELECT `nickname` FROM `user_info_cache` WHERE `steamid`=`reviewer`) AS `reviewer_nickname` FROM `tests_results` WHERE `student`='{$logged_user->steamid()}' AND `trid`='{$db->safe($lnk[1])}'");
	if (!$db->num_rows($test)) {
		include ROOT . "pages/404.php";
		exit();
	}
	$test = $db->fetch_array($test);
	$questions = json_decode($test['questions']);
	$answers = json_decode($test['answers']);
	$answers_marks = json_decode($test['answers_marks']);
	if($test['status'] == 1 and isset($_POST['submit'])) {
		$tmp_answers = array();
		foreach ($questions as $number=>$question) {
			$tmp_answers[$number] = (isset($_POST['answer' . $number]))? $_POST['answer' . $number]: '';
		}
		$db->execute("UPDATE `tests_results` SET `status`=2, `completed_date`=NOW(), `answers`='{$db->safe(json_encode($tmp_answers))}' WHERE `trid`='{$db->safe($test['trid'])}'");
		header('Location: /tests');
	}
	if($test['status'] == 0)
		$db->execute("UPDATE `tests_results` SET `status`=1, `recived_date`=NOW() WHERE `trid`='{$db->safe($test['trid'])}'");
}

$page_fucking_title = _("Мои тесты");
include Base::PathTPL("header");
include Base::PathTPL("left_side");

if (!isset($lnk[1]) or $lnk[1]=='')
	include Base::PathTPL("tests/user/main");
else
	include Base::PathTPL("tests/user/test");

include Base::PathTPL("right_side");
include Base::PathTPL("footer");
