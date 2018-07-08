<?php
	if ($lnk[1] and Base::$langs[$lnk[1]])
	{
		setcookie("metrostroi_lang", $lnk[1], time() + 60*60*24*365*10, '/', $_SERVER['HTTP_HOST']);
		//echo $langs[$lnk[1]];
		header("Location: /" . ((isset($_GET['redirect']))? $_GET['redirect']:''));
	}
?>
