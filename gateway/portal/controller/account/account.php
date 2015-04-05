<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 11:54 PM
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

class ControllerAccountAccount extends Controller {

	private $error = array();

	public function index(){

		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
//			$this->session->data['acv_nc'] = $this->request->post;
//
//			$this->response->redirect($this->url->link('account/step2'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('account/dashboard'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_language'] = $this->language->get('text_language');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_security'] = $this->language->get('text_security');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_2way'] = $this->language->get('text_2way');

		$data['entry_language'] = $this->language->get('entry_language');
		$data['entry_current_password'] = $this->language->get('entry_current_password');
		$data['entry_new_password'] = $this->language->get('entry_new_password');
		$data['entry_retype_password'] = $this->language->get('entry_retype_password');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_newsletter'] = sprintf($this->language->get('entry_newsletter'), $this->config->get('config_name'));

		$customer_data = array();

		$this->load->model('account/customer');

		$customer_data = $this->model_account_customer->getCustomer($this->customer->getId());

		$this->load->model('localisation/language');
		$language_data = $this->model_localisation_language->getLanguage($customer_data['language_id']);

		$data['current_language'] = $language_data['name'];
		$data['language_id'] = $customer_data['language_id'];
		$data['auth'] = $customer_data['two_way'];
		$data['telephone'] = $customer_data['telephone'];
		$data['newsletter'] = $customer_data['newsletter'];
		$data['approved'] = $customer_data['approved'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();


		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/account.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/account.tpl', $data));
		}
	}

	public function updateLanguage(){

		$json = array();
		$language_id = $this->request->post['language_id'];

		$this->load->model('localisation/language');
		$this->load->model('account/customer');

		$this->model_localisation_language->updateCustomerLanguage($language_id);

		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

		if ($customer_info) {

			$json = array(
					'redirect'=>$this->url->link('account/account','','SSL'),
					'language'=> $this->model_localisation_language->getLanguage($customer_info['language_id']),
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updatePassword(){

		$json = array();
		$error = false;

		$current = $this->request->post['current'];
		$new = $this->request->post['new'];
		$confirm = $this->request->post['confirm'];

		if (empty($current) || empty($new) || empty($confirm)){
			$error = true;
			$json['error'] = array(
				'message'=>'Please fill the required fields',
			);
		}

		$this->load->model('account/customer');

		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

		if (!$this->customer->login($customer_info['email'],$current, false)){
			$error = true;
			$json['error'] = array(
				'message'=>'Your current password does not match with the one associated!',
			);
		}

		if ((utf8_strlen($new) < 4) || (utf8_strlen($new) > 20)) {
			$error = true;
			$json['error'] = array(
				'message'=>'Password must be between 4 and 20 characters!',
			);
		}

		if (empty($new) != empty($confirm)){
			$error = true;
			$json['error'] = array(
				'message'=>'Password confirmation does not match password!',
			);
		}

		if (!$error) {
			$this->model_account_customer->editPassword($customer_info['email'], $new);

			$json = array(
				'redirect' => $this->url->link('account/account', '', 'SSL'),
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updateTwoway(){

		$json = array();
		$error = false;
		$auth = $this->request->post['auth'];

		$this->load->model('account/customer');

		$this->model_account_customer->updateAuth($auth);

		if ($auth && empty($this->request->post['telephone'])){
			$error = true;
			$json['error'] = array(
				'message'=>'To activate your 2-Way-auth. You must enter your mobile phone number!',
			);
		}

		if (!$error) {
			$this->model_account_customer->updateTelephone($this->request->post['telephone']);
			$json = array(
				'redirect' => $this->url->link('account/account', '', 'SSL'),
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updateNewsletter(){

		$json = array();
		$subscribe = $this->request->post['subscribe'];

		$this->load->model('account/customer');

		$this->model_account_customer->editNewsletter($subscribe);

			$json = array(
				'redirect' => $this->url->link('account/account', '', 'SSL'),
			);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
} 