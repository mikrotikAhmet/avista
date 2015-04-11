<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/11/15
 * Time: 1:58 AM
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

class ControllerSaleContract extends Controller {

	private $error = array();

	public function add(){

		$this->load->model('contract/contract');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_contract_contract->addContract($this->request->get['order_id'],$this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';


			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('contract/contract', 'token=' . $this->session->data['token']. $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit(){

		$this->load->model('contract/contract');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$this->model_contract_contract->updateContract($this->request->get['order_id'],$this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';


			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('contract/contract', 'token=' . $this->session->data['token']. $url, 'SSL'));
		}

		$this->getForm();
	}

	public function getForm(){


		$data['heading_title'] = 'Create Contract';

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['instrument'])) {
			$data['error_instrument'] = $this->error['instrument'];
		} else {
			$data['error_instrument'] = '';
		}

		if (isset($this->error['issuance_bank'])) {
			$data['error_issuance_bank'] = $this->error['issuance_bank'];
		} else {
			$data['error_issuance_bank'] = '';
		}

		if (isset($this->error['isin_code'])) {
			$data['error_isin_code'] = $this->error['isin_code'];
		} else {
			$data['error_isin_code'] = '';
		}

		if (isset($this->error['face_value'])) {
			$data['error_face_value'] = $this->error['face_value'];
		} else {
			$data['error_face_value'] = '';
		}

		if (isset($this->error['maturity_date'])) {
			$data['error_maturity_date'] = $this->error['maturity_date'];
		} else {
			$data['error_maturity_date'] = '';
		}

		if (isset($this->error['price'])) {
			$data['error_price'] = $this->error['price'];
		} else {
			$data['error_price'] = '';
		}

		if (isset($this->error['company_name'])) {
			$data['error_company_name'] = $this->error['company_name'];
		} else {
			$data['error_company_name'] = '';
		}

		if (isset($this->error['company_address'])) {
			$data['error_company_address'] = $this->error['company_address'];
		} else {
			$data['error_company_address'] = '';
		}

		if (isset($this->error['company_telephone'])) {
			$data['error_company_telephone'] = $this->error['company_telephone'];
		} else {
			$data['error_company_telephone'] = '';
		}

		if (isset($this->error['company_email'])) {
			$data['error_company_email'] = $this->error['company_email'];
		} else {
			$data['error_company_email'] = '';
		}

		if (isset($this->error['contact_person'])) {
			$data['error_contact_person'] = $this->error['contact_person'];
		} else {
			$data['error_contact_person'] = '';
		}

		if (isset($this->error['bank_name'])) {
			$data['error_bank_name'] = $this->error['bank_name'];
		} else {
			$data['error_bank_name'] = '';
		}

		if (isset($this->error['iban'])) {
			$data['error_iban'] = $this->error['iban'];
		} else {
			$data['error_iban'] = '';
		}

		if (isset($this->error['swift_code'])) {
			$data['error_swift_code'] = $this->error['swift_code'];
		} else {
			$data['error_swift_code'] = '';
		}

		if (isset($this->error['beneficiary_name'])) {
			$data['error_beneficiary_name'] = $this->error['beneficiary_name'];
		} else {
			$data['error_beneficiary_name'] = '';
		}

		if (isset($this->error['officer_name'])) {
			$data['error_officer_name'] = $this->error['officer_name'];
		} else {
			$data['error_officer_name'] = '';
		}

		if (isset($this->error['officer_email'])) {
			$data['error_officer_email'] = $this->error['officer_email'];
		} else {
			$data['error_officer_email'] = '';
		}
		if (isset($this->error['officer_phone'])) {
			$data['error_officer_phone'] = $this->error['officer_phone'];
		} else {
			$data['error_officer_phone'] = '';
		}

		if (!isset($this->request->get['contract_id'])) {
			$data['action'] = $this->url->link('sale/contract/add', 'token=' . $this->session->data['token'].'&order_id='.$this->request->get['order_id'], 'SSL');
		} else {
			$data['action'] = $this->url->link('sale/contract/edit', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('contract/contract');

		if (isset($this->request->get['contract_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$contract_info = $this->model_contract_contract->getContract($this->request->get['contract_id']);
		}

		if (isset($this->request->post['instrument'])) {
			$data['instrument'] = $this->request->post['instrument'];
		} elseif (!empty($contract_info)) {
			$data['instrument'] = $contract_info['instrument'];
		} else {
			$data['instrument'] = '';
		}

		if (isset($this->request->post['issuance_bank'])) {
			$data['issuance_bank'] = $this->request->post['issuance_bank'];
		} elseif (!empty($contract_info)) {
			$data['issuance_bank'] = $contract_info['issuance_bank'];
		} else {
			$data['issuance_bank'] = '';
		}

		if (isset($this->request->post['isin_code'])) {
			$data['isin_code'] = $this->request->post['isin_code'];
		} elseif (!empty($contract_info)) {
			$data['isin_code'] = $contract_info['isin_code'];
		} else {
			$data['isin_code'] = '';
		}

		if (isset($this->request->post['face_value'])) {
			$data['face_value'] = $this->request->post['face_value'];
		} elseif (!empty($contract_info)) {
			$data['face_value'] = $contract_info['face_value'];
		} else {
			$data['face_value'] = '';
		}

		if (isset($this->request->post['maturity_date'])) {
			$data['maturity_date'] = $this->request->post['maturity_date'];
		} elseif (!empty($contract_info)) {
			$data['maturity_date'] = $contract_info['maturity_date'];
		} else {
			$data['maturity_date'] = '';
		}

		if (isset($this->request->post['price'])) {
			$data['price'] = $this->request->post['price'];
		} elseif (!empty($contract_info)) {
			$data['price'] = $contract_info['price'];
		} else {
			$data['price'] = '';
		}

		if (isset($this->request->post['company_name'])) {
			$data['company_name'] = $this->request->post['company_name'];
		} elseif (!empty($contract_info)) {
			$data['company_name'] = $contract_info['company_name'];
		} else {
			$data['company_name'] = '';
		}

		if (isset($this->request->post['company_address'])) {
			$data['company_address'] = $this->request->post['company_address'];
		} elseif (!empty($contract_info)) {
			$data['company_address'] = $contract_info['company_address'];
		} else {
			$data['company_address'] = '';
		}

		if (isset($this->request->post['company_telephone'])) {
			$data['company_telephone'] = $this->request->post['company_telephone'];
		} elseif (!empty($contract_info)) {
			$data['company_telephone'] = $contract_info['company_telephone'];
		} else {
			$data['company_telephone'] = '';
		}

		if (isset($this->request->post['company_email'])) {
			$data['company_email'] = $this->request->post['company_email'];
		} elseif (!empty($contract_info)) {
			$data['company_email'] = $contract_info['company_email'];
		} else {
			$data['company_email'] = '';
		}

		if (isset($this->request->post['contact_person'])) {
			$data['contact_person'] = $this->request->post['contact_person'];
		} elseif (!empty($contract_info)) {
			$data['contact_person'] = $contract_info['contact_person'];
		} else {
			$data['contact_person'] = '';
		}

		if (isset($this->request->post['bank_name'])) {
			$data['bank_name'] = $this->request->post['bank_name'];
		} elseif (!empty($contract_info)) {
			$data['bank_name'] = $contract_info['bank_name'];
		} else {
			$data['bank_name'] = '';
		}

		if (isset($this->request->post['iban'])) {
			$data['iban'] = $this->request->post['iban'];
		} elseif (!empty($contract_info)) {
			$data['iban'] = $contract_info['iban'];
		} else {
			$data['iban'] = '';
		}

		if (isset($this->request->post['swift_code'])) {
			$data['swift_code'] = $this->request->post['swift_code'];
		} elseif (!empty($contract_info)) {
			$data['swift_code'] = $contract_info['swift_code'];
		} else {
			$data['swift_code'] = '';
		}

		if (isset($this->request->post['beneficiary_name'])) {
			$data['beneficiary_name'] = $this->request->post['beneficiary_name'];
		} elseif (!empty($contract_info)) {
			$data['beneficiary_name'] = $contract_info['beneficiary_name'];
		} else {
			$data['beneficiary_name'] = '';
		}

		if (isset($this->request->post['officer_name'])) {
			$data['officer_name'] = $this->request->post['officer_name'];
		} elseif (!empty($contract_info)) {
			$data['officer_name'] = $contract_info['officer_name'];
		} else {
			$data['officer_name'] = '';
		}

		if (isset($this->request->post['officer_email'])) {
			$data['officer_email'] = $this->request->post['officer_email'];
		} elseif (!empty($contract_info)) {
			$data['officer_email'] = $contract_info['officer_email'];
		} else {
			$data['officer_email'] = '';
		}

		if (isset($this->request->post['officer_phone'])) {
			$data['officer_phone'] = $this->request->post['officer_phone'];
		} elseif (!empty($contract_info)) {
			$data['officer_phone'] = $contract_info['officer_phone'];
		} else {
			$data['officer_phone'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/contract.tpl', $data));
	}

	protected function validate(){

		if (!$this->user->hasPermission('modify', 'sale/contract')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['instrument']) < 2) || (utf8_strlen(trim($this->request->post['instrument'])) > 64)) {
			$this->error['instrument'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['issuance_bank']) < 2) || (utf8_strlen(trim($this->request->post['issuance_bank'])) > 32)) {
			$this->error['issuance_bank'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['isin_code']) < 2) || (utf8_strlen(trim($this->request->post['isin_code'])) > 32)) {
			$this->error['isin_code'] = 'Required field!';;
		}

		if ((utf8_strlen($this->request->post['face_value']) < 2) || (utf8_strlen(trim($this->request->post['face_value'])) > 9) || !is_numeric($this->request->post['face_value'])) {
			$this->error['face_value'] = 'Numeric only field!';
		}

		if ((utf8_strlen($this->request->post['maturity_date']) < 2) || (utf8_strlen(trim($this->request->post['maturity_date'])) > 32)) {
			$this->error['maturity_date'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['price']) < 2) || (utf8_strlen(trim($this->request->post['price'])) > 32) || !is_numeric($this->request->post['price'])) {
			$this->error['price'] = 'Numeric only field!';
		}

		if ((utf8_strlen($this->request->post['company_name']) < 2) || (utf8_strlen(trim($this->request->post['company_name'])) > 32)) {
			$this->error['company_name'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['company_address']) < 2) || (utf8_strlen(trim($this->request->post['company_address'])) > 32)) {
			$this->error['company_address'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['company_telephone']) < 2) || (utf8_strlen(trim($this->request->post['company_telephone'])) > 32)) {
			$this->error['company_telephone'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['company_email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['company_email'])) {
			$this->error['company_email'] = 'Please provide a valid e-mail address';
		}

		if ((utf8_strlen($this->request->post['contact_person']) < 2) || (utf8_strlen(trim($this->request->post['contact_person'])) > 32)) {
			$this->error['contact_person'] ='Required field!';
		}

		if ((utf8_strlen($this->request->post['bank_name']) < 2) || (utf8_strlen(trim($this->request->post['bank_name'])) > 32)) {
			$this->error['bank_name'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['iban']) < 2) || (utf8_strlen(trim($this->request->post['iban'])) > 32)) {
			$this->error['iban'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['swift_code']) < 2) || (utf8_strlen(trim($this->request->post['swift_code'])) > 32)) {
			$this->error['swift_code'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['beneficiary_name']) < 2) || (utf8_strlen(trim($this->request->post['beneficiary_name'])) > 32)) {
			$this->error['beneficiary_name'] = 'Required field!';
		}

		if ((utf8_strlen($this->request->post['officer_name']) < 2) || (utf8_strlen(trim($this->request->post['officer_name'])) > 32)) {
			$this->error['officer_name'] = 'Required field!';
		}
		if ((utf8_strlen($this->request->post['officer_email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['officer_email'])) {
			$this->error['officer_email'] = 'Please provide a valid e-mail address';
		}

		if ((utf8_strlen($this->request->post['officer_phone']) < 2) || (utf8_strlen(trim($this->request->post['officer_phone'])) > 32)) {
			$this->error['officer_phone'] = 'Required field!';
		}


		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = 'Please check the form fields!';
		}

		return !$this->error;

	}
} 