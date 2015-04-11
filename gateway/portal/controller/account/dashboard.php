<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 5:54 PM
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

class ControllerAccountDashboard extends Controller {

	public function index(){

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->model('account/customer');
		$this->model_account_customer->updateToken('',$this->customer->getId());

		$this->load->language('account/dashboard');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/dashboard'),
			'separator' => false
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_approval_request'] = sprintf($this->language->get('text_approval_request'),$this->url->link('account/account','','SSL'));

		$data['approved'] = $this->customer->isApproved();

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['order'] = $this->load->controller('dashboard/order');
		$data['order_waiting'] = $this->load->controller('dashboard/awaiting');
//		$data['activity'] = $this->load->controller('dashboard/activity');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/dashboard.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/dashboard.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/dashboard.tpl', $data));
		}
	}
} 