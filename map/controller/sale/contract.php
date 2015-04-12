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


		$this->load->model('sale/order');

		if (isset($this->request->get['order_id'])) {
			$order_id = $this->request->get['order_id'];
		} else {
			$order_id = 0;
		}

		$order_info = $this->model_sale_order->getOrder($order_id);

		$data['product'] = $this->model_sale_order->getProduct($order_info['order_id']);

		$data['request'] = $this->currency->format($order_info['request'],$this->config->get('config_currency'),'1');
		$data['issuer_name'] = $order_info['issuer_name'];
		$data['product_name'] = $order_info['product_name'];
		$data['bank_pay'] = $order_info['bank_pay'];
		$data['bank_sett'] = $order_info['bank_sett'];


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

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = 'Please check the form fields!';
		}

		return !$this->error;

	}
} 