<?php
ob_clean();
header("HTTP/1.0 403 Forbidden");
include Base::PathTPL("403");