<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/12/15
 * Time: 12:38 PM
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

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

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
		$data['personal_title'] = $this->language->get('personal_title');
		$data['identity_title'] = $this->language->get('identity_title');
		$data['company_title'] = $this->language->get('company_title');

		$data['button_modify'] = $this->language->get('button_modify');



		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/account.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/account.tpl', $data));
		}
	}

	public function getPersonalDetails(){

		$this->load->language('account/account');

		$data['text_account_type'] = $this->language->get('text_account_type');
		$data['text_firstname'] = $this->language->get('text_firstname');
		$data['text_lastname'] = $this->language->get('text_lastname');
		$data['text_email'] = $this->language->get('text_email');
		$data['text_mobile'] = $this->language->get('text_mobile');
		$data['text_telephone'] = $this->language->get('text_telephone');
		$data['text_address'] = $this->language->get('text_address');

		$this->load->model('account/customer');
		$this->load->model('account/customer_group');

		$data['customer_group'] = $this->model_account_customer_group->getCustomerGroup($this->customer->getGroupId());
		$data['customer'] = $this->model_account_customer->getCustomer($this->customer->getId());

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/personal.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/personal.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/personal.tpl', $data));
		}
	}

	public function personalForm(){

		$this->load->language('account/account');

		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_mobile'] = $this->language->get('entry_mobile');
		$data['entry_telephone'] = $this->language->get('entry_telephone');

		$data['info_mail_change'] = $this->language->get('info_mail_change');

		$data['help_mobile'] = $this->language->get('help_mobile');

		$this->load->model('account/customer');

		$data['customer'] = $this->model_account_customer->getCustomer($this->customer->getId());


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/personal_form.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/personal_form.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/personal_form.tpl', $data));
		}
	}

	public function getIdentityDetails(){

		$this->load->language('account/account');

		$data['text_nationality'] = $this->language->get('text_nationality');
		$data['text_passport'] = $this->language->get('text_passport');
		$data['text_doi'] = $this->language->get('text_doi');
		$data['text_doe'] = $this->language->get('text_doe');
		$data['text_dob'] = $this->language->get('text_dob');
		$data['text_pob'] = $this->language->get('text_pob');

		$this->load->model('account/customer');
		$this->load->model('localisation/country');

		$data['customer'] = $this->model_account_customer->getCustomer($this->customer->getId());
		$data['country'] = $this->model_localisation_country->getCountry($data['customer']['country_id']);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/identity.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/identity.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/identity.tpl', $data));
		}
	}

	public function identityForm(){

		$this->load->language('account/account');

		$data['entry_nationality'] = $this->language->get('entry_nationality');
		$data['entry_passport'] = $this->language->get('entry_passport');
		$data['entry_doi'] = $this->language->get('entry_doi');
		$data['entry_doe'] = $this->language->get('entry_doe');
		$data['entry_dob'] = $this->language->get('entry_dob');
		$data['entry_pob'] = $this->language->get('entry_pob');

		$data['info_mail_change'] = $this->language->get('info_mail_change');

		$data['help_mobile'] = $this->language->get('help_mobile');

		$this->load->model('account/customer');
		$this->load->model('localisation/country');

		$data['customer'] = $this->model_account_customer->getCustomer($this->customer->getId());
		$data['countries'] = $this->model_localisation_country->getCountries();


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/identity_form.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/identity_form.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/identity_form.tpl', $data));
		}
	}

	public function getCompanyDetails(){

		$this->load->language('account/account');

		$data['text_legal_name'] = $this->language->get('text_legal_name');
		$data['text_inc_date'] = $this->language->get('text_inc_date');
		$data['text_business_type'] = $this->language->get('text_business_type');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_vat'] = $this->language->get('text_vat');
		$data['text_address'] = $this->language->get('text_address');

		$this->load->model('account/customer');
		$this->load->model('localisation/country');

		$data['company'] = $this->model_account_customer->getCustomerCompany($this->customer->getId());
		$data['country'] = $this->model_localisation_country->getCountry($data['company']['country_id']);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/company.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/company.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/company.tpl', $data));
		}
	}

	public function companyForm(){

		$this->load->language('account/account');

		$data['entry_inc_date'] = $this->language->get('entry_inc_date');
		$data['entry_dba'] = $this->language->get('entry_dba');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_vat'] = $this->language->get('entry_vat');

		$data['help_type'] = $this->language->get('help_type');
		$data['help_dba'] = $this->language->get('help_dba');

		$this->load->model('account/customer');
		$this->load->model('localisation/country');

		$data['company'] = $this->model_account_customer->getCustomerCompany($this->customer->getId());
		$data['countries'] = $this->model_localisation_country->getCountries();


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/template/company_form.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/template/company_form.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/template/company_form.tpl', $data));
		}
	}

	public function updateAccount(){

		$json = array();
		$error = false;

		$data = $this->request->post;

		$section = $this->request->get['section'];

		if ($section == 'personal' && empty($data['firstname'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your First Name'
			);
		}

		if ($section == 'personal' && empty($data['lastname'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your Last Name'
			);
		}

		if ($section == 'personal' && empty($data['email'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your E-Mail'
			);
		}

		if ($section == 'personal' && empty($data['mobile'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your Mobile Number'
			);
		}

		if ($section == 'identity' && empty($data['country_id'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your Nationality'
			);
		}

		if ($section == 'identity' && empty($data['passport'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your Passport Number'
			);
		}

		if ($section == 'identity' && empty($data['issue'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your Passport Issued Date'
			);
		}

		if ($section == 'identity' && empty($data['expiration'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your Passport Expiration Date'
			);
		}

		if ($section == 'identity' && empty($data['date_of_birth'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your Date of Birth'
			);
		}

		if ($section == 'identity' && empty($data['place_of_birth'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide your Place of Birth'
			);
		}

		if ($section == 'company' && empty($data['inc_date'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide Incorporation date'
			);
		}

		if ($section == 'company' && empty($data['type'])){
			$error = true;
			$json['error'] = array(
				'message'=>'Please provide Company Business type'
			);
		}


		$action = 'update'.ucfirst($section);
		$model = 'account/'.$section;
		$model_line = 'model_account_'.$section;

		$this->load->model($model);


		if (!$error) {
			$json = array(
				'message' => 'Your Personal Details successfully updated!'
			);

			$this->$model_line->$action($data);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

} 