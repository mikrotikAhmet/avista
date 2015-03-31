<?php



if (!defined('DIR_APPLICATION'))
    exit('No direct script access allowed');

/**
 *
 * Semite ADP (Application Development Program) for PHP 5.1.6 or newer
 *
 * @package		Open Gateway Core Application
 * @author		Semite LLC. Dev Team
 * @copyright	Copyright (c) 2008 - 2015, Semite LLC.
 * @license		http://www.semitepayment.com/merchant_guide/license.html
 * @link		http://www.semitepayment.com
 * @version		Version 1.0.1
 */
// ------------------------------------------------------------------------

class ControllerAccountMerchant extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('account/merchant');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('account/merchant');

        $this->getList();
    }

    public function add() {
        $this->load->language('account/merchant');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('account/merchant');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_account_merchant->addMerchant($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('account/merchant', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    protected function getList(){

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
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
            'sp'=>true
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('account/merchant', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'sp'=>false
        );

        $data['add'] = $this->url->link('account/merchant/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $data['delete'] = $this->url->link('account/merchant/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $data['merchants'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $merchant_total = $this->model_account_merchant->getTotalMerchants();

        $results = $this->model_account_merchant->getMerchants($filter_data);

        foreach ($results as $result) {
            $data['merchants'][] = array(
                'merchants_id'    => $result['merchants_id'],
                'legal_name'   => $result['legal_name'],
                'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'edit'       => $this->url->link('account/merchant/edit', 'token=' . $this->session->data['token'] . '&merchants_id=' . $result['merchants_id'] . $url, 'SSL')
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_legal_name'] = $this->language->get('column_legal_name');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

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

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_legal_name'] = $this->url->link('account/merchant', 'token=' . $this->session->data['token'] . '&sort=legal_name' . $url, 'SSL');
        $data['sort_status'] = $this->url->link('account/merchant', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
        $data['sort_date_added'] = $this->url->link('account/merchant', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $merchant_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('merchant/merchant', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($merchant_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($merchant_total - $this->config->get('config_limit_admin'))) ? $merchant_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $merchant_total, ceil($merchant_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('account/merchant_list.tpl', $data));
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['merchant_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_legal'] = $this->language->get('entry_legal');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['entry_legal'])) {
            $data['error_entry_legal'] = $this->error['entry_legal'];
        } else {
            $data['error_entry_legal'] = '';
        }

        $url = '';

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
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
            'sp'=>true
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('account/merchant', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'sp'=>false
        );

        if (!isset($this->request->get['merchant_id'])) {
            $data['action'] = $this->url->link('account/merchant/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $data['action'] = $this->url->link('account/merchant/edit', 'token=' . $this->session->data['token'] . '&merchant_id=' . $this->request->get['merchant_id'] . $url, 'SSL');
        }

        $data['cancel'] = $this->url->link('account/merchant', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['merchant_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $merchant_info = $this->model_account_merchant->getUser($this->request->get['merchant_id']);
        }

        if (isset($this->request->post['legal_name'])) {
            $data['legal_name'] = $this->request->post['legal_name'];
        } elseif (!empty($merchant_info)) {
            $data['legal_name'] = $merchant_info['legal_name'];
        } else {
            $data['legal_name'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($merchant_info)) {
            $data['status'] = $merchant_info['status'];
        } else {
            $data['status'] = 0;
        }

        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('account/merchant_form.tpl', $data));
    }
}
//End of file merchant.php 