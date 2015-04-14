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

class ControllerDashboardSale extends Controller {
    public function index() {
        $this->load->language('dashboard/sale');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_view'] = $this->language->get('text_view');

        $data['token'] = $this->session->data['token'];

        $this->load->model('report/sale');

        $today = $this->model_report_sale->getTotalSales(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

        $yesterday = $this->model_report_sale->getTotalSales(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

        $difference = $today - $yesterday;

        if ($difference && $today) {
            $data['percentage'] = round(($difference / $today) * 100);
        } else {
            $data['percentage'] = 0;
        }

        $sale_total = $this->model_report_sale->getTotalSales();

        if ($sale_total > 1000000000000) {
            $data['total'] = round($sale_total / 1000000000000, 1) . 'T';
        } elseif ($sale_total > 1000000000) {
            $data['total'] = round($sale_total / 1000000000, 1) . 'B';
        } elseif ($sale_total > 1000000) {
            $data['total'] = round($sale_total / 1000000, 1) . 'M';
        } elseif ($sale_total > 1000) {
            $data['total'] = round($sale_total / 1000, 1) . 'K';
        } else {
            $data['total'] = $sale_total;
        }

        $data['sale'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL');

        return $this->load->view('dashboard/sale.tpl', $data);
    }
}
//End of file sale.php 