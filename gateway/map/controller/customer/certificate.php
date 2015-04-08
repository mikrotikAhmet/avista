<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/7/15
 * Time: 11:56 PM
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

class ControllerCustomerCertificate extends Controller {

	private $error = array();

	public function index() {
		$this->load->language('customer/certificate');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/certificate');

		$this->getList();
	}

	public function add() {
		$this->load->language('customer/certificate');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/certificate');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_customer_certificate->addCertificate($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_legal'])) {
				$url .= '&filter_legal=' . urlencode(html_entity_decode($this->request->get['filter_legal'], ENT_QUOTES, 'UTF-8'));
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

			$this->response->redirect($this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('customer/certificate');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/certificate');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_customer_certificate->editCertificate($this->request->get['certificate_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_legal'])) {
				$url .= '&filter_legal=' . urlencode(html_entity_decode($this->request->get['filter_legal'], ENT_QUOTES, 'UTF-8'));
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

			$this->response->redirect($this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('customer/certificate');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/certificate');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $certificate_id) {
				$this->model_customer_certificate->deleteCertificate($certificate_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_legal'])) {
				$url .= '&filter_legal=' . urlencode(html_entity_decode($this->request->get['filter_legal'], ENT_QUOTES, 'UTF-8'));
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

			$this->response->redirect($this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_legal'])) {
			$filter_legal = $this->request->get['filter_legal'];
		} else {
			$filter_legal = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'legal_name';
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

		if (isset($this->request->get['filter_legal'])) {
			$url .= '&filter_legal=' . urlencode(html_entity_decode($this->request->get['filter_legal'], ENT_QUOTES, 'UTF-8'));
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
			'href' => $this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['insert'] = $this->url->link('customer/certificate/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('customer/certificate/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['certificates'] = array();

		$filter_data = array(
			'filter_legal'              => $filter_legal,
			'filter_date_added'        => $filter_date_added,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$certificate_total = $this->model_customer_certificate->getTotalCertificates($filter_data);

		$results = $this->model_customer_certificate->getCertificates($filter_data);

		foreach ($results as $result) {
			$data['certificates'][] = array(
				'certificate_id'    => $result['certificate_id'],
				'legal_name'    => $result['legal_name'],
				'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'           => $this->url->link('customer/certificate/edit', 'token=' . $this->session->data['token'] . '&certificate_id=' . $result['certificate_id'] . $url, 'SSL'),

			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_legal'] = $this->language->get('column_legal');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_legal'] = $this->language->get('entry_legal');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

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

		$data['sort_legal'] = $this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . '&sort=legal_name' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . '&sort=c.date_added' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_legal'])) {
			$url .= '&filter_legal=' . urlencode(html_entity_decode($this->request->get['filter_legal'], ENT_QUOTES, 'UTF-8'));
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
		$pagination->total = $certificate_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($certificate_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($certificate_total - $this->config->get('config_limit_admin'))) ? $certificate_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $certificate_total, ceil($certificate_total / $this->config->get('config_limit_admin')));

		$data['filter_legal'] = $filter_legal;
		$data['filter_date_added'] = $filter_date_added;

		$this->load->model('setting/application');

		$data['applications'] = $this->model_setting_application->getApplications();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customer/certificate_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['certificate_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['entry_legal'] = $this->language->get('entry_legal');
		$data['entry_dba'] = $this->language->get('entry_dba');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_registration'] = $this->language->get('entry_registration');
		$data['entry_tax'] = $this->language->get('entry_tax');
		$data['entry_inc_date'] = $this->language->get('entry_inc_date');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_dob'] = $this->language->get('entry_dob');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_passport'] = $this->language->get('entry_passport');
		$data['entry_ssn'] = $this->language->get('entry_ssn');

		$data['help_dba'] = $this->language->get('help_dba');
		$data['help_type'] = $this->language->get('help_type');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_director'] = $this->language->get('button_add_director');
		$data['button_add_ubo'] = $this->language->get('button_add_ubo');
		$data['button_add_contact'] = $this->language->get('button_add_contact');

		$data['tab_general'] = $this->language->get('tab_general');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['certificate_id'])) {
			$data['certificate_id'] = $this->request->get['certificate_id'];
		} else {
			$data['certificate_id'] = 0;
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['legal_name'])) {
			$data['error_legal_name'] = $this->error['legal_name'];
		} else {
			$data['error_legal_name'] = '';
		}

		if (isset($this->error['type'])) {
			$data['error_type'] = $this->error['type'];
		} else {
			$data['error_type'] = '';
		}

		if (isset($this->error['registration'])) {
			$data['error_registration'] = $this->error['registration'];
		} else {
			$data['error_registration'] = '';
		}

		if (isset($this->error['inc_date'])) {
			$data['error_inc_date'] = $this->error['inc_date'];
		} else {
			$data['error_inc_date'] = '';
		}

		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = "";
		}

		if (isset($this->error['address_1'])) {
			$data['error_address_1'] = $this->error['address_1'];
		} else {
			$data['error_address_1'] = "";
		}

		if (isset($this->error['zone'])) {
			$data['error_zone'] = $this->error['zone'];
		} else {
			$data['error_zone'] = "";
		}

		if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = "";
		}

		$url = '';

		if (isset($this->request->get['filter_legal'])) {
			$url .= '&filter_legal=' . urlencode(html_entity_decode($this->request->get['filter_legal'], ENT_QUOTES, 'UTF-8'));
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
			'href' => $this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['certificate_id'])) {
			$data['action'] = $this->url->link('customer/certificate/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('customer/certificate/edit', 'token=' . $this->session->data['token'] . '&certificate_id=' . $this->request->get['certificate_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('customer/certificate', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['certificate_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$certificate_info = $this->model_customer_certificate->getCertificate($this->request->get['certificate_id']);
		}


		if (isset($this->request->post['legal_name'])) {
			$data['legal_name'] = $this->request->post['legal_name'];
		} elseif (!empty($certificate_info)) {
			$data['legal_name'] = $certificate_info['legal_name'];
		} else {
			$data['legal_name'] = '';
		}

		if (isset($this->request->post['dba'])) {
			$data['dba'] = $this->request->post['dba'];
		} elseif (!empty($certificate_info)) {
			$data['dba'] = $certificate_info['dba'];
		} else {
			$data['dba'] = '';
		}

		if (isset($this->request->post['type'])) {
			$data['type'] = $this->request->post['type'];
		} elseif (!empty($certificate_info)) {
			$data['type'] = $certificate_info['type'];
		} else {
			$data['type'] = '';
		}

		if (isset($this->request->post['registration_number'])) {
			$data['registration_number'] = $this->request->post['registration_number'];
		} elseif (!empty($certificate_info)) {
			$data['registration_number'] = $certificate_info['registration_number'];
		} else {
			$data['registration_number'] = '';
		}

		if (isset($this->request->post['tax_number'])) {
			$data['tax_number'] = $this->request->post['tax_number'];
		} elseif (!empty($certificate_info)) {
			$data['tax_number'] = $certificate_info['tax_number'];
		} else {
			$data['tax_number'] = '';
		}

		if (isset($this->request->post['inc_date'])) {
			$data['inc_date'] = $this->request->post['inc_date'];
		} elseif (!empty($certificate_info)) {
			$data['inc_date'] = $certificate_info['inc_date'];
		} else {
			$data['inc_date'] = '';
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		$this->load->model('sale/customer');

		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = $this->request->post['country_id'];
		} elseif (!empty($certificate_info)) {
			$data['country_id'] = $certificate_info['country_id'];
		} else {
			$data['country_id'] = '';
		}

		if (isset($this->request->post['address_1'])) {
			$data['address_1'] = $this->request->post['address_1'];
		} elseif (!empty($certificate_info)) {
			$data['address_1'] = $certificate_info['address_1'];
		} else {
			$data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$data['address_2'] = $this->request->post['address_2'];
		} elseif (!empty($certificate_info)) {
			$data['address_2'] = $certificate_info['address_2'];
		} else {
			$data['address_2'] = '';
		}

		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} elseif (!empty($certificate_info)) {
			$data['city'] = $certificate_info['city'];
		} else {
			$data['city'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$data['postcode'] = $this->request->post['postcode'];
		} elseif (!empty($certificate_info)) {
			$data['postcode'] = $certificate_info['postcode'];
		} else {
			$data['postcode'] = '';
		}

		if (isset($this->request->post['zone_id'])) {
			$data['zone_id'] = $this->request->post['zone_id'];
		} elseif (!empty($certificate_info)) {
			$data['zone_id'] = $certificate_info['zone_id'];
		} else {
			$data['zone_id'] = '';
		}

		$this->load->model('customer/certificate');

		if (isset($this->request->post['director'])) {
			$data['directors'] = $this->request->post['director'];
		} elseif (!empty($certificate_info)) {
			$data['directors'] = $this->model_customer_certificate->getDirectors($certificate_info['certificate_id']);
		} else {
			$data['directors'] = '';
		}

		if (isset($this->request->post['ubo'])) {
			$data['ubos'] = $this->request->post['ubo'];
		} elseif (!empty($certificate_info)) {
			$data['ubos'] = $this->model_customer_certificate->getUbos($certificate_info['certificate_id']);
		} else {
			$data['ubos'] = '';
		}

		if (isset($this->request->post['contact'])) {
			$data['contacts'] = $this->request->post['contact'];
		} elseif (!empty($certificate_info)) {
			$data['contacts'] = $this->model_customer_certificate->getContacts($certificate_info['certificate_id']);
		} else {
			$data['contacts'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customer/certificate_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'customer/certificate')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['legal_name']) < 2) || (utf8_strlen(trim($this->request->post['legal_name'])) > 32)) {
			$this->error['legal_name'] = $this->language->get('error_legal_name');
		}

		if ((utf8_strlen($this->request->post['inc_date']) < 1) || (utf8_strlen(trim($this->request->post['inc_date'])) > 32)) {
			$this->error['inc_date'] = $this->language->get('error_inc_date');
		}

		if ((utf8_strlen($this->request->post['type']) < 3) || (utf8_strlen($this->request->post['type']) > 32)) {
			$this->error['type'] = $this->language->get('error_type');
		}

		if ((utf8_strlen($this->request->post['registration_number']) < 3) || (utf8_strlen($this->request->post['registration_number']) > 32)) {
			$this->error['registration'] = $this->language->get('error_registration');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'customer/certificate')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_legal'])) {
			if (isset($this->request->get['filter_legal'])) {
				$filter_legal = $this->request->get['filter_legal'];
			} else {
				$filter_legal = '';
			}

			$this->load->model('customer/certificate');

			$filter_data = array(
				'filter_legal'  => $filter_legal,
				'start'        => 0,
				'limit'        => 5
			);

			$results = $this->model_customer_certificate->getCertificates($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'certificate_id'       => $result['certificate_id'],
					'legal_name'              => strip_tags(html_entity_decode($result['legal_name'], ENT_QUOTES, 'UTF-8')),
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['legal_name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
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