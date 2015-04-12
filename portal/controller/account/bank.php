<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/12/15
 * Time: 4:06 PM
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

class ControllerAccountBank extends Controller {

	public function index(){

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/bank');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('account/dashboard'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_bank'),
			'href'      => $this->url->link('account/bank', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['info_bank_account'] = $this->language->get('info_bank_account');

		$data['button_add_bank'] = $this->language->get('button_add_bank');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/bank.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/bank.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/bank.tpl', $data));
		}
	}

	public function bankForm(){

		$this->load->language('account/bank');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_number'] = $this->language->get('entry_number');
		$data['entry_currency'] = $this->language->get('entry_currency');
		$data['entry_iban'] = $this->language->get('entry_iban');
		$data['entry_swift'] = $this->language->get('entry_swift');
		$data['entry_routing'] = $this->language->get('entry_routing');
		$data['entry_sort_code'] = $this->language->get('entry_sort_code');
		$data['entry_officer_name'] = $this->language->get('entry_officer_name');
		$data['entry_officer_telephone'] = $this->language->get('entry_officer_telephone');
		$data['entry_officer_email'] = $this->language->get('entry_officer_email');

		$this->load->model('localisation/country');
		$this->load->model('localisation/currency');

		$data['currencies'] = $this->model_localisation_currency->getCurrencies();
		$data['countries'] = $this->model_localisation_country->getCountries();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/bank.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/bank.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/bank.tpl', $data));
		}

	}

	public function bankList(){

		$this->load->model('localisation/order_status');
		$this->load->model('account/bank');

		$data['banks'] = array();

		$banks = $this->model_account_bank->getBanks();

		$data['complete_status'] = $this->config->get('config_complete_status');

		foreach ($banks as $bank) {
			$status_data = $this->model_localisation_order_status->getOrderStatus($bank['status']);
			$data['banks'][] = array(
				'bank_id'=>$bank['bank_id'],
				'bank'=>$bank['bank'],
				'account_number'=>$bank['account_number'],
				'status'=>$status_data['name'],
				'status_id'=>$bank['status']
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/bank_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/bank_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/bank_list.tpl', $data));
		}

	}

	public function editBank(){

		$this->load->language('account/bank');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_number'] = $this->language->get('entry_number');
		$data['entry_currency'] = $this->language->get('entry_currency');
		$data['entry_iban'] = $this->language->get('entry_iban');
		$data['entry_swift'] = $this->language->get('entry_swift');
		$data['entry_routing'] = $this->language->get('entry_routing');
		$data['entry_sort_code'] = $this->language->get('entry_sort_code');
		$data['entry_officer_name'] = $this->language->get('entry_officer_name');
		$data['entry_officer_telephone'] = $this->language->get('entry_officer_telephone');
		$data['entry_officer_email'] = $this->language->get('entry_officer_email');

		$bank_id = $this->request->post['bank_id'];

		$this->load->model('account/bank');
		$this->load->model('localisation/country');
		$this->load->model('localisation/currency');

		$data['currencies'] = $this->model_localisation_currency->getCurrencies();
		$data['countries'] = $this->model_localisation_country->getCountries();

		$bank = $this->model_account_bank->getBank($bank_id);

		$data['complete_status'] = $this->config->get('config_complete_status');

		$data['bank'] = array(
			'bank_id'=>$bank['bank_id'],
			'bank'=>$bank['bank'],
			'country_id'=>$bank['country_id'],
			'account_number'=>$bank['account_number'],
			'currency_code'=>$bank['currency_code'],
			'iban'=>$bank['iban'],
			'swift'=>$bank['swift'],
			'routing'=>$bank['routing'],
			'sort_code'=>$bank['sort_code'],
			'officer_name'=>$bank['officer_name'],
			'officer_telephone'=>$bank['officer_telephone'],
			'officer_email'=>$bank['officer_email'],
			'status'=>$bank['status']
		);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/bank_edit.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/bank_edit.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/bank_edit.tpl', $data));
		}

	}

	public function bankDetail(){

		$bank_id = $this->request->get['bank_id'];

		$this->load->model('account/bank');
		$this->load->model('localisation/country');

		$bank = $this->model_account_bank->getBank($bank_id);

		$country_data = $this->model_localisation_country->getCountry($bank['country_id']);

		$data['complete_status'] = $this->config->get('config_complete_status');

		$data['bank'] = array(
			'bank_id'=>$bank['bank_id'],
			'bank'=>$bank['bank'],
			'country'=>$country_data['name'],
			'account_number'=>$bank['account_number'],
			'currency_code'=>$bank['currency_code'],
			'iban'=>$bank['iban'],
			'swift'=>$bank['swift'],
			'routing'=>$bank['routing'],
			'sort_code'=>$bank['sort_code'],
			'status'=>$bank['status']
		);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/bank_detail.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/bank_detail.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/bank_detail.tpl', $data));
		}

	}

	public function insertBank(){

		$json = array();
		$error = false;

		$data = $this->request->post;

		$this->load->model('localisation/country');

		if (empty($data['name'])) {
			$error=true;
			$json['error'] = array(
				'message' => 'Name of Bank is required!'
			);
		}

		if (empty($data['account'])) {
			$error=true;
			$json['error'] = array(
				'message' => 'Account number is required!'
			);
		}

		if (empty($data['iban'])) {
			$error=true;
			$json['error'] = array(
				'message' => 'IBAN is required!'
			);
		}

		if (empty($data['swift'])) {
			$error=true;
			$json['error'] = array(
				'message' => 'SWIFT code is required!'
			);
		}

		if (!$error){

			$this->load->model('account/bank');

			if (!isset($data['bank_id'])) {

				// Add to activity log
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

				$this->model_account_activity->addActivity('new bank', $activity_data);

				$this->model_account_bank->addBank($data);
			} else {

				// Add to activity log
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

				$this->model_account_activity->addActivity('modify bank', $activity_data);

				$this->model_account_bank->updateBank($data,$data['bank_id']);
			}

			$json = array(
				'message' => 'Your bank information has been saved!'
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function removeBank(){

		$json = array();
		$error = false;

		$bank_id = $this->request->post['bank_id'];

		$this->load->model('account/bank');

		$this->model_account_bank->delete($bank_id);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
} 