<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/11/15
 * Time: 4:13 AM
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

class ControllerContractContract extends Controller {

	private $error = array();

	public function index() {
		$this->load->language('contract/contract');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('contract/contract');

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_contract_id'])) {
			$filter_contract_id = $this->request->get['filter_contract_id'];
		} else {
			$filter_contract_id = null;
		}

		if (isset($this->request->get['filter_company_name'])) {
			$filter_company_name = $this->request->get['filter_company_name'];
		} else {
			$filter_company_name = null;
		}

		if (isset($this->request->get['filter_order_id'])) {
			$filter_order_id = $this->request->get['filter_order_id'];
		} else {
			$filter_order_id = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'company_name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_contract_id'])) {
			$url .= '&filter_contract_id=' . urlencode(html_entity_decode($this->request->get['filter_contract_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_company_name'])) {
			$url .= '&filter_company_name=' . urlencode(html_entity_decode($this->request->get['filter_company_name'], ENT_QUOTES, 'UTF-8'));
		}


		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . urlencode(html_entity_decode($this->request->get['filter_order_id'], ENT_QUOTES, 'UTF-8'));
		}

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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('contract/contract', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['insert'] = $this->url->link('contract/contract/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('contract/contract/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['contracts'] = array();

		$filter_data = array(
			'filter_contract_id'              => $filter_contract_id,
			'filter_order_id'              => $filter_order_id,
			'filter_company_name'              => $filter_company_name,
			'filter_date_added'        => $filter_date_added,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$contract_total = $this->model_contract_contract->getTotalContracts($filter_data);

		$results = $this->model_contract_contract->getContracts($filter_data);

		foreach ($results as $result) {
			$data['contracts'][] = array(
				'contract_id'    => $result['contract_id'],
				'company_name'    => $result['company_name'],
				'order_id'    => $result['order_id'],
				'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'           => $this->url->link('sale/contract/edit', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'].'&contract_id='. $result['contract_id']. $url, 'SSL'),
				'view'           => $this->url->link('contract/contract/view', 'token=' . $this->session->data['token'] . '&contract_id=' . $result['contract_id'] . $url, 'SSL'),

			);
		}

		$data['heading_title'] = 'Contracts';

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_contract'] = 'Contract ID';
		$data['column_order'] = 'Order ID';
		$data['column_company'] = 'Company Name';
		$data['column_date_added'] = 'Date Added';
		$data['column_action'] = 'Action';

		$data['entry_contract'] = 'Contract ID';
		$data['entry_order'] = 'Order ID';
		$data['entry_company'] = 'Company Name';
		$data['entry_date_added'] = 'Date Added';

		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_legal'])) {
			$url .= '&filter_legal=' . urlencode(html_entity_decode($this->request->get['filter_legal'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_contract'] = $this->url->link('contract/contract', 'token=' . $this->session->data['token'] . '&sort=contract_id' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('contract/contract', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_contract_id'])) {
			$url .= '&filter_contract_id=' . urlencode(html_entity_decode($this->request->get['filter_contract_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_company_name'])) {
			$url .= '&filter_company_name=' . urlencode(html_entity_decode($this->request->get['filter_company_name'], ENT_QUOTES, 'UTF-8'));
		}


		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . urlencode(html_entity_decode($this->request->get['filter_order_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $contract_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('contract/contract', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($contract_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($contract_total - $this->config->get('config_limit_admin'))) ? $contract_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $contract_total, ceil($contract_total / $this->config->get('config_limit_admin')));

		$data['filter_contract_id'] = $filter_contract_id;
		$data['filter_order_id'] = $filter_order_id;
		$data['filter_company_name'] = $filter_company_name;
		$data['filter_date_added'] = $filter_date_added;


		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('contract/contract_list.tpl', $data));
	}

	public function view(){

		$this->load->model('contract/contract');
		$this->load->model('sale/customer');
		$this->load->model('customer/certificate');
		$this->load->model('localisation/country');

		$data['contract'] = $this->model_contract_contract->getContract($this->request->get['contract_id']);
		$data['customer'] = $this->model_sale_customer->getCustomer($data['contract']['customer_id']);
		$data['certificate'] = $this->model_customer_certificate->getCertificate($data['customer']['certificate_id']);
		$data['country'] = $this->model_localisation_country->getCountry($data['certificate']['country_id']);

		$data['back'] = $this->url->link('contract/contract','token='.$this->session->data['token'],'SSL');

		if (!$data['contract']){

		} else {
			$this->response->setOutput($this->load->view('contract/contract_view.tpl', $data));
		}
	}
} 