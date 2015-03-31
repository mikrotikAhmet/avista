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

class ControllerCommonDashboard extends Controller {
    public function index() {

        // Set Page related.js and .css files
        //CSS
        // JS
        $this->document->addScript('map/view/js/plugins/jquery-ui/jquery-ui.js');
        $this->document->addScript('map/view/js/plugins/nicescroll/jquery.nicescroll.min.js');
        $this->document->addScript('map/view/js/plugins/form/jquery.form.min.js');
        $this->document->addScript('map/view/js/application.min.js');
        $this->document->addScript('map/view/js/demonstration.min.js');

        $this->load->language('common/dashboard');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
            'sp'=>true
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
            'sp'=>false
        );

        // Check install directory exists
        if (is_dir(dirname(DIR_APPLICATION) . '/install')) {
            $data['error_install'] = $this->language->get('error_install');
        } else {
            $data['error_install'] = '';
        }

        $data['token'] = $this->session->data['token'];

        $data['header'] = $this->load->controller('common/header');
        $data['footer'] = $this->load->controller('common/footer');

        // Run currency update
        if ($this->config->get('config_currency_auto')) {
            $this->load->model('localisation/currency');

            $this->model_localisation_currency->refresh();
        }

        $this->response->setOutput($this->load->view('common/dashboard.tpl', $data));
    }
}
//End of file dashboard.php 