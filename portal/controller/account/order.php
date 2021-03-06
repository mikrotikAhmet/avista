<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/12/15
 * Time: 5:42 PM
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

class ControllerAccountOrder extends Controller {

	private $error = array();

	public function index(){

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->model('account/order');

		$this->load->language('account/order');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

			if ($this->request->post['unique'] != $this->customer->getId()){

				$this->response->redirect($this->url->link('account/order/error', '', 'SSL'));
			}

			$this->load->helper('uuid');

			$uuid = new UUID();

			$unique_id = date('s') . $uuid->uniqueId($format = 'nnnnnn', $length = '20');
			$other_unique_id = $uuid->uniqueId($format = 'nn', $length = '20') . date('s');
			$this->uuid = $unique_id;

			$ip = $_SERVER['REMOTE_ADDR'];
			$forwarded_ip = $_SERVER['REMOTE_ADDR'];
			$user_agent = $_SERVER['HTTP_USER_AGENT'];
			$accept_language = $_SERVER['HTTP_ACCEPT_LANGUAGE'];

			$data = array(
				'invoice_prefix' => $this->config->get('config_invoice_prefix'),
				'application_id' => $this->config->get('config_application_id'),
				'application_name' => $this->config->get('config_name'),
				'application_url' => $this->config->get('config_url'),
				'customer_id' => $this->customer->getId(),
				'customer_group_id' => $this->customer->getGroupId(),
				'firstname' => $this->customer->getFirstName(),
				'lastname' => $this->customer->getLastName(),
				'email' => $this->customer->getEmail(),
				'telephone' => ($this->customer->getTelephone() ? $this->customer->getTelephone() : $this->customer->getMobile()),
				'request' => $this->request->post['amount'],
				'language_id' => $this->customer->getLanguage(),
				'currency_id' => $this->currency->getId($this->request->post['currency_code']),
				'currency_code' => $this->request->post['currency_code'],
				'currency_value' => $this->currency->getValue($this->request->post['currency_code']),
				'bank_id' => $this->request->post['bank_id'],
				'settlement' => $this->request->post['settlement'],
				'product_name' => (!empty($this->request->post['other']) ? $this->request->post['other'] : $this->request->post['instrument']),
				'ip' => $ip,
				'forwarded_ip' => $forwarded_ip,
				'user_agent' => $user_agent,
				'accept_language' => $accept_language,
				'product_id' => (isset($this->request->post['other']) ? $other_unique_id : $this->request->post['instrument']),
				'product_name' => $this->request->post['product_name'],
				'other' => $this->request->post['other'],
				'issuer_name' => (!empty($this->request->post['issuer_name']) ? $this->request->post['issuer_name'] : $this->customer->getFirstName() . ' ' . strtoupper($this->customer->getLastName())),
			);

			$this->model_account_order->addOrder($data, $unique_id);

			// Add to activity log
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			);

			$this->model_account_activity->addActivity('order', $activity_data);

			$this->response->redirect($this->url->link('report/order', '', 'SSL'));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$this->load->model('account/customer');
		$data['customer'] = $this->model_account_customer->getCustomer($this->customer->getId());

		$data['insts'] = array(
			'1'=>'[BG] - Bank guarantee',
			'2'=>'[SBLC] - Standby Letter of Credit',
			'3'=>'[MTN] - Medium Term Note',
			'4'=>'[LTN] - Long-term Notes',
			'5'=>'BOND',
		);

		$data['complete_status'] = $this->config->get('config_complete_status');

		$this->load->model('account/bank');
		$this->load->model('localisation/currency');

		$data['banks'] = $this->model_account_bank->getBanks();
		$data['currencies'] = $this->model_localisation_currency->getCurrencies();

		$data['heading_title'] = $this->language->get('heading_title');

		$data['action'] = $this->url->link('account/order', '', 'SSL');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/order.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/order.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/order.tpl', $data));
		}
	}

	public function error(){

		$data['back'] = $this->url->link('account/order','','SSL');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/error.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/error.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/error.tpl', $data));
		}
	}

	protected function validate(){

		if (!$this->request->post['product_name']){
			$this->error['warning'] = 'Error on request.';
		}

		if ($this->request->post['bank_id']){
			$this->error['warning'] = 'Select your Payment Bank.';
		}

		return !$this->error;
	}
} 