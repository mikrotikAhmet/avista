<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/11/15
 * Time: 11:51 AM
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

class ControllerDashboardAwaiting extends Controller {
	public function index() {
		$this->load->language('dashboard/awaiting');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		// Total Orders
		$this->load->model('sale/order');

		$today = $this->model_sale_order->getTotalOrdersWaiting(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

		$yesterday = $this->model_sale_order->getTotalOrdersWaiting(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$order_total = $this->model_sale_order->getTotalOrdersWaiting();

		if ($order_total > 1000000000000) {
			$data['total'] = round($order_total / 1000000000000, 1) . 'T';
		} elseif ($order_total > 1000000000) {
			$data['total'] = round($order_total / 1000000000, 1) . 'B';
		} elseif ($order_total > 1000000) {
			$data['total'] = round($order_total / 1000000, 1) . 'M';
		} elseif ($order_total > 1000) {
			$data['total'] = round($order_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $order_total;
		}

		$data['order'] = $this->url->link('account/order', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/dashboard/order_waiting.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/dashboard/order_waiting.tpl', $data);
		} else {
			return $this->load->view('default/template/dashboard/order_waiting.tpl', $data);
		}
	}
}