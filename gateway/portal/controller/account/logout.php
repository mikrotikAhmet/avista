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

class ControllerAccountLogout extends Controller {
    public function index() {
        if ($this->customer->isLogged()) {
            $this->event->trigger('pre.customer.logout');

            $this->customer->logout();

            $this->event->trigger('post.customer.logout');

            $this->response->redirect($this->url->link('account/logout', '', 'SSL'));
        }

        $this->load->language('account/logout');

        $this->document->setTitle($this->language->get('heading_title'));


        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_message'] = $this->language->get('text_message');

        $data['button_continue'] = $this->language->get('button_continue');

        $data['continue'] = $this->url->link('common/dashboard');

        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
        }
    }
}
//End of file logout.php 