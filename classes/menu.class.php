<?php
class Menu {
	private $menu;
	public function Menu() {
		$this->menu = array(
			'news' => array(
				'url'=>'/news',
				'title'=>_('Новости'),
				'active'=>false,
				'place' => 0,
				'parent' => false,
			),
			'wiki' => array(
				'url'=>'https://wiki.metrostroi.net" target="_blank',
				'title'=>'Wiki',
				'active'=>false,
				'place' => 0,
				'parent' => false,
			),
			'players' => array(
				'url'=>'/players',
				'title'=>_('Игроки'),
				'active'=>false,
				'place' => 0,
				'parent' => false,
			),
			'servers' => array(
				'url'=>'/servers',
				'title'=>_('Сервера'),
				'active'=>false,
				'place' => 0,
				'parent' => false,
			),
			'mag' => array(
				'url'=>'/mag',
				'title'=>'MAG',
				'active'=>false,
				'place' => 0,
				'parent' => false,
			),
			'admin' => array(
				'title' => _('ПУ'),
				'active' => false,
				'place' => 1,
				'parent' => false,
				'right' => 'adm',
				'icon' => 9,
			),
			'news_add' => array(
				'url'=>'/news_add',
				'title'=>_('Добавить новость'),
				'active'=>false,
				'place' => 0,
				'parent' => 'admin',
				'icon' => 9,
				'show_icon' => 'plus icon',
			),
			'admin_mag' => array(
				'title' => _('MAG: Жалобы'),
				'url'=>'/admin_mag',
				'active' => false,
				'place' => 1,
				'parent' => 'admin',
				'right' => 'mag_reports',
				'show_icon' => 'warning icon',
			),
			'admin_tickets' => array(
				'title' => _('Тикеты'),
				'url'=>'/admin_tickets',
				'active' => false,
				'place' => 1,
				'parent' => 'admin',
				'right' => 'tickets',
				'show_icon' => 'cube icon',
			),
			'admin_tests' => array(
				'title' => _('Тесты'),
				'url'=>'/admin_tests',
				'active' => false,
				'place' => 1,
				'parent' => 'admin',
				'right' => 'up_down',
				'show_icon' => 'check square icon',
			),
			'admin_log' => array(
				'title' => _('Журнал действий'),
				'url'=>'/admin_log',
				'active' => false,
				'place' => 1,
				'parent' => 'admin',
				'right' => 'log',
				'show_icon' => 'book icon',
			),
			'admin_questions' => array(
				'title' => _('Вопросы к тестам'),
				'url'=>'/admin_questions',
				'active' => false,
				'place' => 1,
				'parent' => 'admin',
				'right' => 'edit_tests',
				'show_icon' => 'table icon',
			),
		);
	}
	public function set_item_active ($id) {
		$this->menu[$id]['active'] = true;
		if ($this->menu[$id]['parent']) $this->set_item_active($this->menu[$id]['parent']);
	}
	private function show_item ($id, &$item, $kid = false) {
		global $logged_user;
		global $locale;
		$c = 0; $sub = '';
		if (isset($item['right']) and !($logged_user and $logged_user->take_group_info($item['right']) or (isset($item['icon']) and $logged_user and $logged_user->max_icon_id() >= $item['icon']))) {
			if (isset($item['icon']) and !($logged_user and $logged_user->max_icon_id() >= $item['icon']))
				return '';
			elseif (!isset($item['icon']))
				return '';
		}
		foreach ($this->menu as $tmp_id => $tmp_item)
			if ($tmp_item['parent'] and $tmp_item['parent'] == $id) {
				$sub .= $this->show_item($tmp_id, $tmp_item, true);
				if ($tmp_item['active'])
					$item ['active'] = true;
				$c++;
			}
		ob_start();
		include Base::PathTPL(($c)?($kid)?'menu/item_subdropdown':'menu/item_dropdown':'menu/item');
		return ob_get_clean();
	}
	public function show($tpl, $error = false) {
		global $logged_user;
		global $locale;
		$menu = array('','');
		foreach ($this->menu as $id => $item)
			if (!$item['parent'])
				$menu[$item['place']] .= $this->show_item($id, $item);
		ob_start();
		include Base::PathTPL('menu/'. $tpl);
		return ob_get_clean();
	}
}