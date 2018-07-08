<?php
if (!$logged_user or !$logged_user->take_group_info("up_down")) {
	include ROOT . "pages/403.php";
	exit();
}


$rating = array(
	'<font color="#a94442;"><b>&laquo;'._('Неудовлетворительно').'&raquo;</b></font>',
	'<font color="#f0ad4e;"><b>&laquo;'._('Удовлетворительно').'&raquo;</b></font>',
	'<font color="#3c763d;"><b>&laquo;'._('Отлично').'&raquo;</b></font>'
);

$marks_color = array(
	'success' => '#3c763d',
	'warning' => '#f0ad4e',
	'error' => '#a94442',
	'copypaste' => '#000'
);

$marks_names = array(
	'success','warning','error','copypaste',''
);

$marks_num = array(
	'success' => 0,
	'warning' => 1,
	'error' => 2,
	'copypaste' => 3,
	'' => 4
);

if (!isset($lnk[1]) or $lnk[1]=='') {
	$tests = $db->execute("SELECT *, (SELECT `nickname` FROM `user_info_cache` WHERE `steamid`=`student`) AS `student_nickname` FROM `tests_results` WHERE `status`=2");
} else {
	$test = $db->execute("SELECT *, (SELECT `nickname` FROM `user_info_cache` WHERE `steamid`=`reviewer`) AS `reviewer_nickname`, (SELECT `nickname` FROM `user_info_cache` WHERE `steamid`=`student`) AS `student_nickname` FROM `tests_results` WHERE `trid`='{$db->safe($lnk[1])}' AND `status`>=2");
	if (!$db->num_rows($test)) {
		include ROOT . "pages/404.php";
		exit();
	}
	$test = $db->fetch_array($test);
	$questions = json_decode($test['questions']);
	$answers = json_decode($test['answers']);
	$answers_marks = json_decode($test['answers_marks']);
	if($test['status'] >= 2 and isset($_POST['submit'])) {
		$result = (int) $_POST['submit'];
		$note = isset($_POST['note']) ? $_POST['note'] : '';
		$tmp_marks = array();
		foreach ($questions as $number=>$question) {
			$tmp_marks[$number] = (isset($_POST['mark' . $number]))? $marks_names[$_POST['mark' . $number]]: '';
		}
		$db->execute("UPDATE `tests_results` SET `status`=3, `answers_marks`='{$db->safe(json_encode($tmp_marks))}', `reviewer`='{$logged_user->steamid()}', `review_date`=NOW(), `passed`='{$db->safe($result)}', `note`='{$db->safe($note)}' WHERE `trid`='{$db->safe($test['trid'])}'");
		Logger::Log(($test['status'] == 3 ? 14 : 6), 0, '', array('testname'=>$test['trname'],'trid'=>$test['trid']), $logged_user->steamid(),$test['student']);
		header('Location: /admin_tests');
	}
	if($test['status'] == 0)
		$db->execute("UPDATE `tests_results` SET `status`=1, `recived_date`=NOW() WHERE `trid`='{$db->safe($test['trid'])}'");
}

$menu->set_item_active('admin_tests');
$page_fucking_title = _("Непроверенные тесты");
include Base::PathTPL("header");
include Base::PathTPL("left_side");

if (!isset($lnk[1]) or $lnk[1]=='')
	include Base::PathTPL("tests/admin/main");
else
	include Base::PathTPL("tests/admin/test");

include Base::PathTPL("right_side");
include Base::PathTPL("footer");
