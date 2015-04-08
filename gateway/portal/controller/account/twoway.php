<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/5/15
 * Time: 11:25 AM
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

class ControllerAccountTwoway extends Controller {

	private $error = array();

	public function index(){

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = HTTP_IMAGE . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = HTTP_IMAGE . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->model('account/customer');

		if ($this->customer->isLogged()) {
			$this->customer->logout();
		}

		$customer_info = $this->model_account_customer->getCustomer($this->request->get['uid']);

		$this->load->helper('uuid');

		$uuid = new UUID();

		$unique_id = $uuid->uniqueId($format = 'nnnnnn',$length = '20');

		$user = "semitellc";
		$password = "ZePFFHQAQQgQIF";
		$api_id = "3497179";
		$baseurl ="http://api.clickatell.com";

		$text = urlencode($unique_id);
		$to = $customer_info['telephone'];

		// auth call
		$url = "$baseurl/http/auth?user=$user&password=$password&api_id=$api_id";

		// do auth call
		$ret = file($url);

		// explode our response. return string is on first line of the data returned
		$sess = explode(":",$ret[0]);
		if ($sess[0] == "OK" && ($customer_info['token'] == 0 || empty($customer_info['token']))) {

			$sess_id = trim($sess[1]); // remove any whitespace
			$url = "$baseurl/http/sendmsg?session_id=$sess_id&to=$to&text=$text";

			// do sendmsg call
			$ret = file($url);
			$send = explode(":",$ret[0]);

			if ($send[0] == "ID") {

				$this->model_account_customer->updateToken($unique_id,$customer_info['customer_id']);

			} else {
//				echo "send message failed";
			}
		} else {
//			echo "Authentication failure: ". $ret[0];
		}

		$this->load->language('account/twoway');

		$this->document->setTitle($this->language->get('heading_title'));


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->customer->login($customer_info['email'], '', true);

			// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
				$this->response->redirect(str_replace('&amp;', '&', $this->request->post['redirect']));
			} else {
				$this->response->redirect($this->url->link('account/dashboard', '', 'SSL'));
			}
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}


		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_2way'] = $this->language->get('text_2way');

		$data['entry_code'] = $this->language->get('entry_code');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_request_code'] = $this->language->get('button_request_code');



		$data['action'] = $this->url->link('account/twoway', 'uid='.$this->request->get['uid'], 'SSL');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/twoway.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/twoway.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/twoway.tpl', $data));
		}
	}

	protected function validate(){

		$this->load->model('account/customer');

		$customer_info = $this->model_account_customer->getCustomer($this->request->get['uid']);

		if ($customer_info['token'] != $this->request->post['code']){
			$this->error['warning'] = $this->language->get('error_code');
		}


		return !$this->error;
	}
} 