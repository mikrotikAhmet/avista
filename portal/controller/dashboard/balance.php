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

class ControllerDashboardBalance extends Controller {

    private $negative = false;

    public function index() {
        $this->load->language('dashboard/balance');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_view'] = $this->language->get('text_view');


        $balance_total = $this->customer->getBalance();

        if ($balance_total < 0){
            $this->negative = true;
            $balance_total = preg_replace("/[^0-9,.]/", "", $balance_total);
        }

        if ($balance_total > 1000000000000) {
            $data['total'] = round($balance_total / 1000000000000, 1) . 'T';
        } elseif ($balance_total > 1000000000) {
            $data['total'] = round($balance_total / 1000000000, 1) . 'B';
        } elseif ($balance_total > 1000000) {
            $data['total'] = round($balance_total / 1000000, 1) . 'M';
        } elseif ($balance_total > 1000) {
            $data['total'] = round($balance_total / 1000, 1) . 'K';
        } else {
            $data['total'] = $balance_total;
        }

        $data['negative'] = $this->negative;

        $data['balance'] = $this->url->link('report/balance', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/dashboard/balance.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/dashboard/balance.tpl', $data);
        } else {
            return $this->load->view('default/template/dashboard/balance.tpl', $data);
        }
    }
}
//End of file balance.php 