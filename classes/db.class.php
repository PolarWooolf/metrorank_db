<?php

Class DB {
	private $link;
	private $host;
	private $database;
	private $port;
	private $login;
	private $password;
	private $method;
	private $sql_config;

	/**
	 * DB constructor. Only variables definition
	 * @param string $database - database name
	 * @param string $host - hostname
	 * @param string $user - database user
	 * @param string $password - database user password
	 * @param int $port - database server port
	 * @param string $method - connect method; only 'mysql' or 'mysqli'
	 */
	public function DB($database, $host, $user, $password = '', $port = 3306, $method = 'mysqli') {
		$this->database = $database;
		$this->host = $host;
		$this->login = $user;
		$this->password = $password;
		$this->port = $port;
		$this->method = $method;
	}

	/**
	 * Connects to MySQL server, selects DB, sets basic parameters
	 * @param bool|true $die - die when unable to connect
	 * @return int
	 */

	public function connect(/*$log_script, */$die = true) {
		switch ($this->method) {
			case 'mysql':
				$this->link = mysql_connect($this->host.':'.$this->port, $this->login, $this->password);
				if (!$this->link) {
					if ($die)
						die("Не могу авторизацоваться в БД"); else return 1;
				}
				if (!mysql_select_db($this->database, $this->link)) {
					if ($die)
						die("Не могу выбрать базу данных"); else return 2;
				}
				break;
			case 'mysqli':
			default:
			$this->link = mysqli_connect($this->host, $this->login, $this->password, '', $this->port);

				if (!$this->link) {
					if ($die)
						die("Не могу авторизацоваться в БД"); else return 1;
				}
				if (!mysqli_select_db($this->link, $this->database)) {
					if ($die)
						die("Не могу выбрать базу данных"); else return 2;
				}
		}
		$this->execute("SET time_zone = '".date('P')."'");
		$this->execute("SET character_set_client='utf8mb4'");
		$this->execute("SET character_set_results='utf8mb4'");
		$this->execute("SET collation_connection='utf8mb4_unicode_ci'");
//		if ($die)
//			CanAccess(2);
		return 0;
	}

	/**
	 * Like mysqli_query()
	 * @param $query - MySQL order
	 * @return bool|mysqli_result|resource
	 */

	public function execute($query) {
		global $queries;
		$queries++;
		switch ($this->method) {
			case 'mysql':
				$result = mysql_query($query, $this->link);
				break;
			case 'mysqli':
			default:
				$result = mysqli_query($this->link, $query);
				break;
		}
//		if ($log and is_bool($result) and $result == false and function_exists("vtxtlog"))
//			vtxtlog('SQLError: '.$this->error().' in query ['.$query.']');
		return $result;
	}

	/**
	 * Like mysqli_real_escape_string()
	 * @param $text - text
	 * @return string
	 */

	public function safe($text) {
		switch ($this->method) {
			case 'mysql':
				return mysql_real_escape_string($text, $this->link);
				break;
			case 'mysqli':
			default:
				return mysqli_real_escape_string($this->link, $text);
				break;
		}
	}

	/**
	 * Like mysqli_fetch_assoc()
	 * @param $query - Result after order execution
	 * @return array|null
	 */

	public function fetch_assoc($query) {
		switch ($this->method) {
			case 'mysql':
				return mysql_fetch_assoc($query);
				break;
			case 'mysqli':
			default:
				return mysqli_fetch_assoc($query);
				break;
		}
	}

	/**
	 * Like mysqli_fetch_array()
	 * @param $query - Result after order execution
	 * @param int $result_type
	 * @return array|null
	 */

	public function fetch_array($query, $result_type = MYSQLI_BOTH) {
		switch ($this->method) {
			case 'mysql':
				return mysql_fetch_array($query, $result_type);
				break;
			case 'mysqli':
			default:
				return mysqli_fetch_array($query, $result_type);
				break;
		}
	}

	/**
	 * Like mysqli_num_rows()
	 * @param $query - Result after order execution
	 * @return int
	 */

	public function num_rows($query) {
		switch ($this->method) {
			case 'mysql':
				return mysql_num_rows($query);
				break;
			case 'mysqli':
			default:
				return mysqli_num_rows($query);
				break;
		}
	}

	/**
	 * Like mysqli_error()
	 * @return string
	 */

	public function error() {
		switch ($this->method) {
			case 'mysql':
				return mysql_error($this->link);
				break;
			case 'mysqli':
			default:
				return mysqli_error($this->link);
				break;
		}
	}

	/**
	 * Like mysqli_insert_id()
	 * @return int|string
	 */

	public function insert_id() {
		switch ($this->method) {
			case 'mysql':
				return mysql_insert_id($this->link);
				break;
			case 'mysqli':
			default:
				return mysqli_insert_id($this->link);
				break;
		}
	}

	/**
	 * Like mysqli_affected_rows()
	 * @return int
	 */

	public function affected_rows() {
		switch ($this->method) {
			case 'mysql':
				return mysql_affected_rows($this->link);
				break;
			case 'mysqli':
			default:
				return mysqli_affected_rows($this->link);
				break;
		}
	}

	/**
	 * Like mysqli_fetch_array()
	 * @param $query - Result after order execution
	 * @return array|null
	 */

	public function fetch_row($query) {
		switch ($this->method) {
			case 'mysql':
				return mysql_fetch_row($query);
				break;
			case 'mysqli':
			default:
				return mysqli_fetch_row($query);
				break;
		}
	}
}
