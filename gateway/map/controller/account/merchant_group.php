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
 * @license		http://www.semitepayment.com/user_guide/license.html
 * @link		http://www.semitepayment.com
 * @version		Version 1.0.1
 */
// ------------------------------------------------------------------------

class ControllerAccountMerchantGroup extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('account/merchant_group');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('account/merchant_group');

        $this->getList();
    }

    public function add() {
        $this->load->language('account/merchant_group');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('account/merchant_group');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_account_merchant_group->addMerchantGroup($this->request->post);

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

            $this->response->redirect($this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('account/merchant_group');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('account/merchant_group');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_account_merchant_group->editMerchantGroup($this->request->get['merchant_group_id'], $this->request->post);

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

            $this->response->redirect($this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('account/merchant_group');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('account/merchant_group');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $merchant_group_id) {
                $this->model_account_merchant_group->deleteMerchantGroup($merchant_group_id);
            }

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

            $this->response->redirect($this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'cgd.name';
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
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        $data['add'] = $this->url->link('account/merchant_group/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $data['delete'] = $this->url->link('account/merchant_group/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $data['merchant_groups'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $merchant_group_total = $this->model_account_merchant_group->getTotalMerchantGroups();

        $results = $this->model_account_merchant_group->getMerchantGroups($filter_data);

        foreach ($results as $result) {
            $data['merchant_groups'][] = array(
                'merchant_group_id' => $result['merchant_group_id'],
                'name'              => $result['name'] . (($result['merchant_group_id'] == $this->config->get('config_merchant_group_id')) ? $this->language->get('text_default') : null),
                'sort_order'        => $result['sort_order'],
                'edit'              => $this->url->link('account/merchant_group/edit', 'token=' . $this->session->data['token'] . '&merchant_group_id=' . $result['merchant_group_id'] . $url, 'SSL')
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_sort_order'] = $this->language->get('column_sort_order');
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

        $data['sort_name'] = $this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . '&sort=cgd.name' . $url, 'SSL');
        $data['sort_sort_order'] = $this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . '&sort=cg.sort_order' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $merchant_group_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($merchant_group_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($merchant_group_total - $this->config->get('config_limit_admin'))) ? $merchant_group_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $merchant_group_total, ceil($merchant_group_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('account/merchant_group_list.tpl', $data));
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['merchant_group_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_approval'] = $this->language->get('entry_approval');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['help_approval'] = $this->language->get('help_approval');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = array();
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
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        if (!isset($this->request->get['merchant_group_id'])) {
            $data['action'] = $this->url->link('account/merchant_group/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $data['action'] = $this->url->link('account/merchant_group/edit', 'token=' . $this->session->data['token'] . '&merchant_group_id=' . $this->request->get['merchant_group_id'] . $url, 'SSL');
        }

        $data['cancel'] = $this->url->link('account/merchant_group', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['merchant_group_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $merchant_group_info = $this->model_account_merchant_group->getMerchantGroup($this->request->get['merchant_group_id']);
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->request->post['merchant_group_description'])) {
            $data['merchant_group_description'] = $this->request->post['merchant_group_description'];
        } elseif (isset($this->request->get['merchant_group_id'])) {
            $data['merchant_group_description'] = $this->model_account_merchant_group->getMerchantGroupDescriptions($this->request->get['merchant_group_id']);
        } else {
            $data['merchant_group_description'] = array();
        }

        if (isset($this->request->post['approval'])) {
            $data['approval'] = $this->request->post['approval'];
        } elseif (!empty($merchant_group_info)) {
            $data['approval'] = $merchant_group_info['approval'];
        } else {
            $data['approval'] = '';
        }

        if (isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($merchant_group_info)) {
            $data['sort_order'] = $merchant_group_info['sort_order'];
        } else {
            $data['sort_order'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('account/merchant_group_form.tpl', $data));
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'account/merchant_group')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['merchant_group_description'] as $language_id => $value) {
            if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 32)) {
                $this->error['name'][$language_id] = $this->language->get('error_name');
            }
        }

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'account/merchant_group')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        $this->load->model('setting/store');
        $this->load->model('account/merchant');

        foreach ($this->request->post['selected'] as $merchant_group_id) {
            if ($this->config->get('config_merchant_group_id') == $merchant_group_id) {
                $this->error['warning'] = $this->language->get('error_default');
            }

            $store_total = $this->model_setting_store->getTotalStoresByMerchantGroupId($merchant_group_id);

            if ($store_total) {
                $this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
            }

            $merchant_total = $this->model_account_merchant->getTotalMerchantsByMerchantGroupId($merchant_group_id);

            if ($merchant_total) {
                $this->error['warning'] = sprintf($this->language->get('error_merchant'), $merchant_total);
            }
        }

        return !$this->error;
    }
}
//End of file merchant_group.php 