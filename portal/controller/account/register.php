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

		if ($_SERVER['HTTP_REFERER'] == 'http://www.hifholding.com/' || $_SERVER['HTTP_REFERER'] == 'http://hifholding.com/'){
			unset($this->session->data['acv_nc']);
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

		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_company_registration'] = $this->language->get('entry_company_registration');
		$data['entry_company_url'] = $this->language->get('entry_company_url');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_company_country'] = $this->language->get('entry_company_country');

		$data['button_cancel_register'] = $this->language->get('button_cancel_register');
		$data['button_step_2'] = $this->language->get('button_step_2');
		$data['button_back_login'] = $this->language->get('button_back_login');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['registration_number'])) {
			$data['error_registration_number'] = $this->error['registration_number'];
		} else {
			$data['error_registration_number'] = '';
		}

		if (isset($this->error['legal_name'])) {
			$data['error_legal_name'] = $this->error['legal_name'];
		} else {
			$data['error_legal_name'] = '';
		}


		if (isset($this->error['address_1'])) {
			$data['error_address_1'] = $this->error['address_1'];
		} else {
			$data['error_address_1'] = '';
		}

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

		$data['action'] = $this->url->link('account/register', '', 'SSL');

		$data['back'] = $this->url->link('account/login', '', 'SSL');


		if (isset($this->request->post['legal_name'])) {
			$data['legal_name'] = $this->request->post['legal_name'];
		} elseif (isset($this->session->data['acv_nc']['legal_name'])) {
			$data['legal_name'] = $this->session->data['acv_nc']['legal_name'];
		} else {
			$data['legal_name'] = '';
		}

		if (isset($this->request->post['registration_number'])) {
			$data['registration_number'] = $this->request->post['registration_number'];
		} elseif (isset($this->session->data['acv_nc']['registration_number'])) {
			$data['registration_number'] = $this->session->data['acv_nc']['registration_number'];
		} else {
			$data['registration_number'] = '';
		}

		if (isset($this->request->post['url'])) {
			$data['url'] = $this->request->post['url'];
		} elseif (isset($this->session->data['acv_nc']['url'])) {
			$data['url'] = $this->session->data['acv_nc']['url'];
		} else {
			$data['url'] = '';
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

		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = $this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} elseif (isset($this->session->data['acv_nc']['country_id'])) {
			$data['country_id'] = $this->session->data['acv_nc']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();


		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/register.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/register.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/register.tpl', $data));
		}
	}

	public function validate() {

		if ((utf8_strlen(trim($this->request->post['legal_name'])) < 2) || (utf8_strlen(trim($this->request->post['legal_name'])) > 32)) {
			$this->error['legal_name'] = $this->language->get('error_legal_name');
		}

		if ((utf8_strlen(trim($this->request->post['registration_number'])) < 2) || (utf8_strlen(trim($this->request->post['registration_number'])) > 32)) {
			$this->error['registration_number'] = $this->language->get('error_registration_number');
		}


		if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

		if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if ($this->request->post['country_id'] == '') {
			$this->error['country'] = $this->language->get('error_country');
		}

		return !$this->error;
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
