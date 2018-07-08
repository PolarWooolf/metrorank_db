<?php
ob_clean();
header("HTTP/1.0 500 Internal Server Error");
include Base::PathTPL("500");