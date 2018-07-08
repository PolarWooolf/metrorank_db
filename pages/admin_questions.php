<?php
if (!$logged_user or !$logged_user->take_group_info("edit_tests")) {
	include ROOT . "pages/403.php";
	exit();
}

$menu->set_item_active('admin_questions');
$page_fucking_title = _("Управление тестами");
include Base::PathTPL("header");
include Base::PathTPL("left_side");

if (!isset($lnk[1]) or $lnk[1] == '')
	$lnk[1] = 'main';

switch ($lnk[1]) {
	case 'main':
		if (isset($_GET['deltest']))
		{
			$q = $db->execute("SELECT * FROM `tests` WHERE `tid`='{$db->safe($_GET['deltest'])}'");
			if ($db->num_rows($q)!=1) {
				include Base::PathTPL("404");
				include Base::PathTPL("footer");
				exit();
			}
			$q = $db->fetch_array($q);
			Logger::Log(17, 0, '', array('name'=>$q['name'],'id'=>$db->safe($_GET['deltest'])), $logged_user->steamid());
			$db->execute("DELETE FROM `tests` WHERE  `tid`='{$db->safe($_GET['deltest'])}'");
		}
		$cats = $db->execute("SELECT * FROM `questions_cats`");
		$tests = $db->execute("SELECT * FROM `tests` ORDER BY `tpriority` DESC ");
		include Base::PathTPL("tests/admin/qmain");
		break;
	case 'test':
		if (!isset($lnk[2])) {
			include Base::PathTPL("404");
			include Base::PathTPL("footer");
			exit();
		}
		if (isset($_POST['name']) and isset($_POST['priority']) and isset($_POST['qcats'])) {
			$qcats = json_encode(explode(';',$_POST['qcats']));
			$db->execute("UPDATE `tests` SET `tname`='{$db->safe($_POST['name'])}', "
										  . "`tpriority`='{$db->safe($_POST['priority'])}', "
										  . "`questions_cats`='{$db->safe($qcats)}' WHERE `tid`='{$db->safe($lnk[2])}'") or die($db->error());
		}
		$test = $db->execute("SELECT * FROM `tests` WHERE `tid`='{$db->safe($lnk[2])}'");
		$cats = $db->execute("SELECT * FROM `questions_cats`");
		if ($db->num_rows($test)!=1) {
			include Base::PathTPL("404");
			include Base::PathTPL("footer");
			exit();
		}
		if (!$db->num_rows($cats)) {
			include Base::PathTPL("tests/admin/qnocats");
			include Base::PathTPL("right_side");
			include Base::PathTPL("footer");
			exit();
		}
		$test = $db->fetch_array($test);
		$testcats = '';
		foreach (json_decode($test['questions_cats']) as $cat)
			$testcats .= ';' . $cat;
		$testcats = mb_substr($testcats, 1);
		include Base::PathTPL("tests/admin/qtest");
		break;
	case 'add_test':
		if (isset($_POST['name']) and isset($_POST['priority']) and isset($_POST['qcats'])) {
			$qcats = json_encode(explode(';',$_POST['qcats']));
			$db->execute("INSERT INTO `tests` (`tname`, `tpriority`, `questions_cats`)"
					   . "VALUES ('{$db->safe($_POST['name'])}','{$db->safe($_POST['priority'])}','{$db->safe($qcats)}')") or die($db->error());
			Logger::Log(16, 0, '', array('name'=>$db->safe($_POST['name']),'id'=>$db->insert_id()), $logged_user->steamid());
//			header("Location /admin_questions/");
		}
		$cats = $db->execute("SELECT * FROM `questions_cats`");
		if (!$db->num_rows($cats)) {
			include Base::PathTPL("tests/admin/qnocats");
			include Base::PathTPL("right_side");
			include Base::PathTPL("footer");
			exit();
		}
		include Base::PathTPL("tests/admin/qaddtest");
		break;
	case 'add_cat':
		if (isset($_POST['name']))
		{
			$db->execute("INSERT INTO `questions_cats` (`qcname`) VALUES ('{$db->safe($_POST['name'])}')") or die($db->error());
			Logger::Log(15, 0, '', array('name'=>$db->safe($_POST['name']),'id'=>$db->insert_id()), $logged_user->steamid());
		}
		header('Location: /admin_tests');
		//include Base::PathTPL("tests/admin/qaddcat");
		break;
	default:
		if (isset($_POST['qcname']))
		{
			$q = $db->execute("SELECT * FROM `questions_cats` WHERE `qcid`='{$db->safe($lnk[1])}'");
			if ($db->num_rows($q)!=1) {
				include Base::PathTPL("404");
				include Base::PathTPL("footer");
				exit();
			}
			$q = $db->fetch_array($q);
			Logger::Log(21, 0, '', array('old'=>$q['qcname'],'new'=>$db->safe($_POST['qcname']),'qcid'=>(int) $lnk[1]), $logged_user->steamid());
			$db->execute("UPDATE `questions_cats` SET `qcname`='{$db->safe($_POST['qcname'])}' WHERE `qcid`='{$db->safe($lnk[1])}'");
		}
		$cat = $db->execute("SELECT * FROM `questions_cats` WHERE `qcid`='{$db->safe($lnk[1])}'");
		if ($db->num_rows($cat)!=1) {
			include Base::PathTPL("404");
			include Base::PathTPL("footer");
			exit();
		}
		$cat = $db->fetch_array($cat);
		$c = 1;
		if (isset($_POST['add']) and isset($_POST['question']))
		{
			Logger::Log(19, 0, '', array('name'=>$db->safe($_POST['question'])), $logged_user->steamid());
			$db->execute("INSERT INTO `questions` (`question`, `cat`) VALUES ('{$db->safe($_POST['question'])}','{$db->safe($lnk[1])}')");
		}
		if (isset($_POST['edit']) and isset($_POST['qid']) and isset($_POST['question']))
		{
			$q = $db->execute("SELECT * FROM `questions` WHERE `qid`='{$db->safe($_POST['qid'])}'");
			if ($db->num_rows($q)!=1) {
				include Base::PathTPL("404");
				include Base::PathTPL("footer");
				exit();
			}
			$q = $db->fetch_array($q);
			Logger::Log(20, 0, '', array('old'=>$q['question'],'new'=>$db->safe($_POST['question'])), $logged_user->steamid());
			$db->execute("UPDATE `questions` SET `question`='{$db->safe($_POST['question'])}' WHERE `qid`='{$db->safe($_POST['qid'])}'");
		}
		if (isset($_POST['delete']) and isset($_POST['qid']))
		{
			$q = $db->execute("SELECT * FROM `questions` WHERE `qid`='{$db->safe($_POST['qid'])}'");
			if ($db->num_rows($q)!=1) {
				include Base::PathTPL("404");
				include Base::PathTPL("footer");
				exit();
			}
			$q = $db->fetch_array($q);
			Logger::Log(18, 0, '', array('name'=>$q['question']), $logged_user->steamid());
			$db->execute("DELETE FROM `questions` WHERE `qid`='{$db->safe($_POST['qid'])}'");
		}
		$questions = $db->execute("SELECT * FROM `questions` WHERE `cat`='{$db->safe($cat['qcid'])}'");
		include Base::PathTPL("tests/admin/qcat");
		break;
}

include Base::PathTPL("right_side");
include Base::PathTPL("footer");
