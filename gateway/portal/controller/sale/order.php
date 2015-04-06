<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/5/15
 * Time: 10:38 PM
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

class ControllerSaleOrder extends Controller {

	private $error = array();

	public function index(){

		$this->load->language('sale/order');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        $this->load->model('account/customer');
        $data['customer'] = $this->model_account_customer->getCustomer($this->customer->getId());

        $data['insts'] = array(
            '1'=>'[BG] - Bank guarantee',
            '2'=>'[SBLC] - Standby Letter of Credit',
            '3'=>'[MTN] - Medium Term Note',
            '4'=>'[LTN] - Long-term Notes',
            '5'=>'BOND',
        );



		$data['heading_title'] = $this->language->get('heading_title');


		$data['action'] = $this->url->link('sale/order', '', 'SSL');

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/sale/order.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/sale/order.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/sale/order.tpl', $data));
		}
	}

    public function verification(){

        $this->load->helper('uuid');

        $uuid = new UUID();

        $unique_id =date('Ymdi'). $uuid->uniqueId($format = 'nnnnnn',$length = '20');

        $user = "semitellc";
        $password = "ZePFFHQAQQgQIF";
        $api_id = "3497179";
        $baseurl ="http://api.clickatell.com";

        $text = urlencode($unique_id);
        $to = '381656728972';

        // auth call
        $url = "$baseurl/http/auth?user=$user&password=$password&api_id=$api_id";

        // do auth call
        $ret = file($url);

        // explode our response. return string is on first line of the data returned
        $sess = explode(":",$ret[0]);
        if ($sess[0] == "OK") {

            $sess_id = trim($sess[1]); // remove any whitespace
            $url = "$baseurl/http/sendmsg?session_id=$sess_id&to=$to&text=$text";

            // do sendmsg call
            $ret = file($url);
            $send = explode(":",$ret[0]);

            if ($send[0] == "ID") {



            } else {
//				echo "send message failed";
            }
        } else {
//			echo "Authentication failure: ". $ret[0];
        }
    }
} 