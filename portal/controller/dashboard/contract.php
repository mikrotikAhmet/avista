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

class ControllerDashboardContract extends Controller {

    public function index() {
        $this->load->language('dashboard/contract');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_view'] = $this->language->get('text_view');

        // Total Orders
        $this->load->model('account/order');

        $today = $this->model_account_order->getTotalOrdersByContract(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

        $yesterday = $this->model_account_order->getTotalOrdersByContract(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

        $difference = $today - $yesterday;

        if ($difference && $today) {
            $data['percentage'] = round(($difference / $today) * 100);
        } else {
            $data['percentage'] = 0;
        }

        $order_total = $this->model_account_order->getTotalOrdersByContract();

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

        $data['contract'] = $this->url->link('report/contract', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/dashboard/contract.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/dashboard/contract.tpl', $data);
        } else {
            return $this->load->view('default/template/dashboard/contract.tpl', $data);
        }
    }
}
//End of file contract.php 