<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 6:26 PM
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

class ControllerAccountRegister extends Controller {
	private $error = array();

	public function index() {

		$this->customer->logout();

		if ($_SERVER['HTTP_REFERER'] == 'http://www.hifholding.com' || $_SERVER['HTTP_REFERER'] == 'http://hifholding.com'){
			unset($this->session->data['acv_nc']);
		}

//		if (!$this->customer->isLogged()) {
//			$this->session->data['redirect'] = $this->url->link('account/dashboard', '', 'SSL');
//
//			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
//		}

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

		$this->load->language('account/register');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->session->data['acv_nc'] = $this->request->post;

			$this->response->redirect($this->url->link('account/step2'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_register'),
			'href'      => $this->url->link('account/register', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_currency'] = $this->language->get('entry_currency');
		$data['entry_language'] = $this->language->get('entry_language');
		$data['entry_zone'] = $this->language->get('entry_zone');

		$data['button_continue_2'] = $this->language->get('button_continue_2');
		$data['button_back'] = $this->language->get('button_back');
		$data['button_upload'] = $this->language->get('button_upload');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['company_registration'])) {
			$data['error_company_registration'] = $this->error['company_registration'];
		} else {
			$data['error_company_registration'] = '';
		}

		if (isset($this->error['company'])) {
			$data['error_company'] = $this->error['company'];
		} else {
			$data['error_company'] = '';
		}

//		if (isset($this->error['firstname'])) {
//			$data['error_firstname'] = $this->error['firstname'];
//		} else {
//			$data['error_firstname'] = '';
//		}
//
//		if (isset($this->error['lastname'])) {
//			$data['error_lastname'] = $this->error['lastname'];
//		} else {
//			$data['error_lastname'] = '';
//		}

		if (isset($this->error['address_1'])) {
			$data['error_address_1'] = $this->error['address_1'];
		} else {
			$data['error_address_1'] = '';
		}

//		if (isset($this->error['city'])) {
//			$data['error_city'] = $this->error['city'];
//		} else {
//			$data['error_city'] = '';
//		}

		if (isset($this->error['postcode'])) {
			$data['error_postcode'] = $this->error['postcode'];
		} else {
			$data['error_postcode'] = '';
		}

		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = '';
		}

//		if (isset($this->error['zone'])) {
//			$data['error_zone'] = $this->error['zone'];
//		} else {
//			$data['error_zone'] = '';
//		}

//		if (isset($this->error['language'])) {
//			$data['error_language'] = $this->error['language'];
//		} else {
//			$data['error_language'] = '';
//		}

		$data['action'] = $this->url->link('account/register', '', 'SSL');

		$data['back'] = $this->url->link('account/login', '', 'SSL');

		$data['customer_groups'] = array();

		if (is_array($this->config->get('config_customer_group_display'))) {
			$this->load->model('account/customer_group');

			$customer_groups = $this->model_account_customer_group->getCustomerGroups();

			foreach ($customer_groups as $customer_group) {
				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$data['customer_groups'][] = $customer_group;
				}
			}
		}

//		if (isset($this->request->post['customer_group_id'])) {
//			$data['customer_group_id'] = $this->request->post['customer_group_id'];
//		} elseif (isset($this->session->data['acv_nc'])) {
//			$data['customer_group_id'] = $this->session->data['acv_nc']['customer_group_id'];
//		} else {
//			$data['customer_group_id'] = $this->config->get('config_customer_group_id');
//		}

		if (isset($this->request->post['company'])) {
			$data['company'] = $this->request->post['company'];
		} elseif (isset($this->session->data['acv_nc'])) {
			$data['company'] = $this->session->data['acv_nc']['company'];
		} else {
			$data['company'] = '';
		}

		if (isset($this->request->post['company_registration'])) {
			$data['company_registration'] = $this->request->post['company_registration'];
		} elseif (isset($this->session->data['acv_nc'])) {
			$data['company_registration'] = $this->session->data['acv_nc']['company_registration'];
		} else {
			$data['company_registration'] = '';
		}

//		if (isset($this->request->post['firstname'])) {
//			$data['firstname'] = $this->request->post['firstname'];
//		} elseif (isset($this->session->data['acv_nc'])) {
//			$data['firstname'] = $this->session->data['acv_nc']['firstname'];
//		} else {
//			$data['firstname'] = '';
//		}
//
//		if (isset($this->request->post['lastname'])) {
//			$data['lastname'] = $this->request->post['lastname'];
//		} elseif (isset($this->session->data['acv_nc'])) {
//			$data['lastname'] = $this->session->data['acv_nc']['lastname'];
//		} else {
//			$data['lastname'] = '';
//		}

		if (isset($this->request->post['web'])) {
			$data['web'] = $this->request->post['web'];
		} elseif (isset($this->session->data['acv_nc']['web'])) {
			$data['web'] = $this->session->data['acv_nc']['web'];
		} else {
			$data['web'] = '';
		}


		if (isset($this->request->post['address_1'])) {
			$data['address_1'] = $this->request->post['address_1'];
		} elseif (isset($this->session->data['acv_nc']['address_1'])) {
			$data['address_1'] = $this->session->data['acv_nc']['address_1'];
		} else {
			$data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$data['address_2'] = $this->request->post['address_2'];
		} elseif (isset($this->session->data['acv_nc']['address_2'])) {
			$data['address_2'] = $this->session->data['acv_nc']['address_2'];
		} else {
			$data['address_2'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$data['postcode'] = $this->request->post['postcode'];
		} elseif (isset($this->session->data['shipping_address']['postcode'])) {
			$data['postcode'] = $this->session->data['shipping_address']['postcode'];
		} elseif (isset($this->session->data['acv_nc']['postcode'])) {
			$data['postcode'] = $this->session->data['acv_nc']['postcode'];
		} else {
			$data['postcode'] = '';
		}

//		if (isset($this->request->post['city'])) {
//			$data['city'] = $this->request->post['city'];
//		} elseif (isset($this->session->data['acv_nc'])) {
//			$data['city'] = $this->session->data['acv_nc']['city'];
//		} else {
//			$data['city'] = '';
//		}

		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = $this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} elseif (isset($this->session->data['acv_nc']['country_id'])) {
			$data['country_id'] = $this->session->data['acv_nc']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

//		if (isset($this->request->post['zone_id'])) {
//			$data['zone_id'] = $this->request->post['zone_id'];
//		} elseif (isset($this->session->data['shipping_address']['zone_id'])) {
//			$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
//		} elseif (isset($this->session->data['acv_nc'])) {
//			$data['zone_id'] = $this->session->data['acv_nc']['zone_id'];
//		} else {
//			$data['zone_id'] = '';
//		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		if (isset($this->request->post['currency_id'])) {
			$data['currency_id'] = $this->request->post['currency_id'];
		} elseif (isset($this->session->data['acv_nc']['currency_id'])) {
			$data['currency_id'] = $this->session->data['acv_nc']['currency_id'];
		} else {
			$data['currency_id'] = $this->config->get('config_currency');
		}

		$this->load->model('localisation/currency');

		$data['currencies'] = $this->model_localisation_currency->getCurrencies();

		if (isset($this->request->post['language_id'])) {
			$data['language_id'] = $this->request->post['language_id'];
		} elseif (isset($this->session->data['acv_nc']['language_id'])) {
			$data['language_id'] = $this->session->data['acv_nc']['language_id'];
		} else {
			$data['language_id'] = $this->config->get('config_language_id');
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();


		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/register.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/register.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/register.tpl', $data));
		}
	}

	public function validate() {

		if ((utf8_strlen(trim($this->request->post['company'])) < 2) || (utf8_strlen(trim($this->request->post['company'])) > 32)) {
			$this->error['company'] = $this->language->get('error_company');
		}

		if ((utf8_strlen(trim($this->request->post['company_registration'])) < 2) || (utf8_strlen(trim($this->request->post['company_registration'])) > 32)) {
			$this->error['company_registration'] = $this->language->get('error_company_registration');
		}

//		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
//			$this->error['firstname'] = $this->language->get('error_firstname');
//		}
//
//		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
//			$this->error['lastname'] = $this->language->get('error_lastname');
//		}

		if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}

//		if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
//			$this->error['city'] = $this->language->get('error_city');
//		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

		if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if ($this->request->post['country_id'] == '') {
			$this->error['country'] = $this->language->get('error_country');
		}

//		if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
//			$this->error['zone'] = $this->language->get('error_zone');
//		}

		// Customer Group
//		if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
//			$customer_group_id = $this->request->post['customer_group_id'];
//		} else {
//			$customer_group_id = $this->config->get('config_customer_group_id');
//		}

		return !$this->error;
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
