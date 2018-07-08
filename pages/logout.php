<?php
if ($logged_user)
	$logged_user->logout();
header("Location: /" . ((isset($_GET['redirect']))? $_GET['redirect']:''));