<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 12:09 PM
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
		$data['text_certificate'] = $this->language->get('text_certificate');
		$data['text_system'] = $this->language->get('text_system');
		$data['text_setting'] = $this->language->get('text_setting');
		$data['text_api'] = $this->language->get('text_api');
		$data['text_user'] = $this->language->get('text_user');
		$data['text_user_group'] = $this->language->get('text_user_group');
		$data['text_users'] = $this->language->get('text_users');
		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_customer'] = $this->language->get('text_customer');
		$data['text_customer_group'] = $this->language->get('text_customer_group');
		$data['text_customer_ban_ip'] = $this->language->get('text_customer_ban_ip');
        $data['text_order'] = $this->language->get('text_order');


		$data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');
		$data['certificate'] = $this->url->link('customer/certificate', 'token=' . $this->session->data['token'], 'SSL');
		$data['setting'] = $this->url->link('setting/application', 'token=' . $this->session->data['token'], 'SSL');
		$data['api'] = $this->url->link('user/api', 'token=' . $this->session->data['token'], 'SSL');
		$data['user'] = $this->url->link('user/user', 'token=' . $this->session->data['token'], 'SSL');
		$data['user_group'] = $this->url->link('user/user_permission', 'token=' . $this->session->data['token'], 'SSL');
		$data['customer'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'], 'SSL');
		$data['customer_fields'] = $this->url->link('sale/customer_field', 'token=' . $this->session->data['token'], 'SSL');
		$data['customer_group'] = $this->url->link('sale/customer_group', 'token=' . $this->session->data['token'], 'SSL');
		$data['customer_ban_ip'] = $this->url->link('sale/customer_ban_ip', 'token=' . $this->session->data['token'], 'SSL');
        $data['order'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL');
		$data['contract'] = $this->url->link('contract/contract', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('common/menu.tpl', $data);
	}
}