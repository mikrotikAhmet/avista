<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 11:13 PM
 */

/**
 * Smatsa Question Bank
 *
 * @category   PhpStorm
 * @package    smatsa
 * @copyright  Copyright 2009-2014 Semite d.o.o. Developments
 * @license    http://www.semitepayment.com/license/
 * @version    home.php 10/22/14 ahmet $
 * @author     Ahmet GOUDENOGLU <ahmet.gudenoglu@semitepayment.com>
 */

/**
 * @category   PhpStorm
 * @package    smatsa
 * @copyright  Copyright 2009-2014 Semite d.o.o. Developments
 * @license    http://www.semitepayment.com/license/
 */

class ControllerCommonMenu extends Controller {
	public function index() {
		$this->load->language('common/menu');

		$data['text_dashboard'] = $this->language->get('text_dashboard');
		$data['text_operation'] = $this->language->get('text_operation');
		$data['text_request'] = $this->language->get('text_request');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_report'] = $this->language->get('text_report');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_setting'] = $this->language->get('text_setting');

		$data['unique'] = $this->customer->getUniqueId();


		$data['home'] = $this->url->link('account/dashboard', '', 'SSL');
		$data['order'] = $this->url->link('sale/order', '', 'SSL');
		$data['order_report'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('sale/transaction', '', 'SSL');
		$data['setting'] = $this->url->link('account/account', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/menu.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/menu.tpl', $data);
		} else {
			return $this->load->view('default/template/common/menu.tpl', $data);
		}

	}
}