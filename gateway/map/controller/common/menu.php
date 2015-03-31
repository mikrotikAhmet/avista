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

class ControllerCommonMenu extends Controller {
    public function index() {
        $this->load->language('common/menu');

        $data['text_dashboard'] = $this->language->get('text_dashboard');
        $data['text_boarding'] = $this->language->get('text_boarding');
        $data['text_system'] = $this->language->get('text_system');
        $data['text_application'] = $this->language->get('text_application');
        $data['text_gateway'] = $this->language->get('text_gateway');
        $data['text_user'] = $this->language->get('text_user');
        $data['text_user_group'] = $this->language->get('text_user_group');
        $data['text_users'] = $this->language->get('text_users');
        $data['text_api'] = $this->language->get('text_api');
        $data['text_logout'] = $this->language->get('text_logout');


        $data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');
        $data['merchant'] = $this->url->link('account/merchant', 'token=' . $this->session->data['token'], 'SSL');
        $data['user'] = $this->url->link('user/user', 'token=' . $this->session->data['token'], 'SSL');
        $data['user_group'] = $this->url->link('user/user_permission', 'token=' . $this->session->data['token'], 'SSL');
        $data['api'] = $this->url->link('user/api', 'token=' . $this->session->data['token'], 'SSL');
        $data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], 'SSL');


        return $this->load->view('common/menu.tpl', $data);
    }
}
//End of file menu.php 