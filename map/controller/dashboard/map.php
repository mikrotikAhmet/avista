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

class ControllerDashboardMap extends Controller {
    public function index() {
        $this->load->language('dashboard/map');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_order'] = $this->language->get('text_order');
        $data['text_sale'] = $this->language->get('text_sale');

        $data['token'] = $this->session->data['token'];

        return $this->load->view('dashboard/map.tpl', $data);
    }

    public function map() {
        $json = array();

        $this->load->model('report/sale');

        $results = $this->model_report_sale->getTotalOrdersByCountry();

        foreach ($results as $result) {
            $json[strtolower($result['iso_code_2'])] = array(
                'total'  => $result['total'],
                'amount' => $this->currency->format($result['amount'], $this->config->get('currency_code'))
            );
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
//End of file map.php 