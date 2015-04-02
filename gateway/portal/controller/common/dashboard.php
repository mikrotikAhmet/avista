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

	    if (!$this->merchant->isLogged()) {
		    $this->response->redirect($this->url->link('account/login', '', 'SSL'));
	    }

        $this->document->setTitle($this->config->get('config_meta_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));
        $this->document->setKeywords($this->config->get('config_meta_keyword'));

        if (isset($this->request->get['route'])) {
            $this->document->addLink(HTTP_SERVER, 'canonical');
        }

	    $data['left_column'] = $this->load->controller('common/left_column');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/dashboard.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/dashboard.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/common/dashboard.tpl', $data));
        }
    }
}
//End of file dashboard.php 