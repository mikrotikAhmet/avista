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
		$data['text_heading_my_account'] = $this->language->get('text_heading_my_account');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_bank'] = $this->language->get('text_bank');
		$data['text_security'] = $this->language->get('text_security');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_myorder'] = $this->language->get('text_myorder');
		$data['text_myinvoice'] = $this->language->get('text_myinvoice');
		$data['text_mycontract'] = $this->language->get('text_mycontract');
		$data['text_document'] = $this->language->get('text_document');
		$data['text_logout'] = $this->language->get('text_logout');

		$data['home'] = $this->url->link('account/dashboard', '', 'SSL');
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['bank'] = $this->url->link('account/bank', '', 'SSL');
		$data['security'] = $this->url->link('account/security', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['myorder'] = $this->url->link('report/order', '', 'SSL');
		$data['myinvoice'] = $this->url->link('report/invoice', '', 'SSL');
		$data['mycontract'] = $this->url->link('report/contract', '', 'SSL');
		$data['document'] = $this->url->link('account/document', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');

		$data['unique'] = $this->customer->getId();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/menu.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/menu.tpl', $data);
		} else {
			return $this->load->view('default/template/common/menu.tpl', $data);
		}

	}
}