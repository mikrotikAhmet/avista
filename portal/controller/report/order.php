<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/6/15
 * Time: 9:52 PM
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

class ControllerReportOrder extends Controller {

	public function index(){
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/order');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/order');

		if (isset($this->request->get['filter_order_id'])) {
			$filter_order_id = $this->request->get['filter_order_id'];
		} else {
			$filter_order_id = null;
		}

		if (isset($this->request->get['filter_order_status'])) {
			$filter_order_status = $this->request->get['filter_order_status'];
		} else {
			$filter_order_status = null;
		}

		if (isset($this->request->get['filter_total'])) {
			$filter_total = $this->request->get['filter_total'];
		} else {
			$filter_total = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$filter_date_modified = $this->request->get['filter_date_modified'];
		} else {
			$filter_date_modified = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'o.order_id';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_order_status'])) {
			$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('account/dashboard'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_order'),
			'href'      => $this->url->link('account/order', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$data['orders'] = array();

		$filter_data = array(
			'filter_order_id'      => $filter_order_id,
			'filter_order_status'  => $filter_order_status,
			'filter_total'         => $filter_total,
			'filter_date_added'    => $filter_date_added,
			'filter_date_modified' => $filter_date_modified,
			'sort'                 => $sort,
			'order'                => $order,
			'start'                => ($page - 1) * $this->config->get('config_limit'),
			'limit'                => $this->config->get('config_limit')
		);

		$order_total = $this->model_account_order->getTotalOrders($filter_data);

		$results = $this->model_account_order->getOrders($filter_data);

		foreach ($results as $result) {
			$data['orders'][] = array(
				'order_id'      => $result['order_id'],
				'status'        => $result['status'],
				'total'         => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'date_added'    => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
				'invoice'=>($result['invoice_no'] > 0 ? '<span class="text-success"><a href="'.$this->url->link('account/order/viewInvoice','invoice_id='.$result['invoice_no'],'SSL').'" target="_blank" style="color : #000">Issued</a></span>' : '<span class="text-danger">Not Issued</span>'),
				'contract'=>($result['contract_no'] > 0 ? '<span class="text-success"><a href="'.$this->url->link('account/order/view','contract_id='.$result['contract_no'],'SSL').'" target="_blank" style="color : #000">Issued</a></span>' : '<span class="text-danger">Not Issued</span>'),
				'view'          => $this->url->link('account/order/info', '' . '&order_id=' . $result['order_id'] . $url, 'SSL'),
			);
		}


		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_missing'] = $this->language->get('text_missing');

		$data['column_order_id'] = $this->language->get('column_order_id');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_date_modified'] = $this->language->get('column_date_modified');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_order_id'] = $this->language->get('entry_order_id');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_date_modified'] = $this->language->get('entry_date_modified');

		$data['button_invoice_print'] = $this->language->get('button_invoice_print');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_refresh'] = $this->language->get('button_refresh');
		$data['button_export'] = $this->language->get('button_export');
		$data['button_view'] = $this->language->get('button_view');

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_order_status'])) {
			$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_order'] = $this->url->link('account/order', '' . '&sort=o.order_id' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('account/order', '' . '&sort=status' . $url, 'SSL');
		$data['sort_total'] = $this->url->link('account/order', '' . '&sort=o.total' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('account/order', '' . '&sort=o.date_added' . $url, 'SSL');
		$data['sort_date_modified'] = $this->url->link('account/order', '' . '&sort=o.date_modified' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_order_status'])) {
			$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit');
		$pagination->url = $this->url->link('account/order', '' . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));

		$data['filter_order_id'] = $filter_order_id;
		$data['filter_order_status'] = $filter_order_status;
		$data['filter_total'] = $filter_total;
		$data['filter_date_added'] = $filter_date_added;
		$data['filter_date_modified'] = $filter_date_modified;

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/report/order.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/report/order.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/report/order.tpl', $data));
		}
	}

	public function getOrder(){

		$json = array();
		$order_id = $this->request->post['order_id'];

		$this->load->model('account/order');

$data['order'] = $this->model_account_order->getOrder($order_id);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/report/order_detail.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/report/order_detail.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/report/order_detail.tpl', $data));
		}

	}

	public function view(){


		$this->load->model('contract/contract');
		$this->load->model('account/customer');
		$this->load->model('account/certificate');
		$this->load->model('account/bank');
		$this->load->model('localisation/country');
		$this->load->model('account/order');



		$data['contract'] = $this->model_contract_contract->getContract($this->request->get['contract_id']);
		$data['customer'] = $this->model_account_customer->getCustomer($this->customer->getId());
		$data['certificate'] = $this->model_account_certificate->getCertificate($data['customer']['certificate_id']);
		$data['country'] = $this->model_localisation_country->getCountry($data['certificate']['country_id']);
		$data['order'] = $this->model_account_order->getOrder($data['contract']['order_id']);
		$data['bank'] = $this->model_account_bank->getBank($data['order']['bank_id']);

		$data['back'] = $this->url->link('account/order','','SSL');



		if (!$data['contract']){

		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/contract_view.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/contract_view.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/account/contract_view.tpl', $data));
			}
		}
	}

	public function viewInvoice(){


		$this->load->model('account/order');
		$this->load->model('account/customer');
		$this->load->model('contract/contract');
		$this->load->model('account/certificate');


		$data['order'] = $this->model_account_order->getOrderByInvoice($this->request->get['invoice_id']);
		$data['customer'] = $this->model_account_customer->getCustomer($this->customer->getId());
		$data['certificate'] = $this->model_account_certificate->getCertificate($data['customer']['certificate_id']);
		$data['contract'] = $this->model_contract_contract->getContract($data['order']['contract_no']);

		$data['back'] = $this->url->link('account/order','','SSL');

		if (!$data['order']){

		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/invoice_view.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/invoice_view.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/account/invoice_view.tpl', $data));
			}
		}
	}
} 