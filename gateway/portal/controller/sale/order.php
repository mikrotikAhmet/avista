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
    private $uuid = '';

	public function index(){

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

        $this->load->model('sale/order');

		$this->load->language('sale/order');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['approved'] = $this->customer->isApproved();

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

		$data['complete_status'] = $this->config->get('config_complete_status');

		$this->load->model('account/bank');
		$this->load->model('localisation/currency');

		$data['banks'] = $this->model_account_bank->getBanks();
		$data['currencies'] = $this->model_localisation_currency->getCurrencies();

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

    public function verifyCode(){

        $json = array();
        $code = $this->request->post['vc'];
	    $unique = $this->request->post['unique'];

        $this->load->model('sale/order');

        $order_data = $this->model_sale_order->getOrder($code);

        if ($unique != $this->customer->getUniqueId()){

            $json['error'] = array(
                'message'=>'Verification code or Customer Unique ID does not match!'
            );
        } else {

	        $this->model_sale_order->updateOrderStatus($code, '1');

	        $json = array(
		        'message' => 'Your order has been placed successfully.',
		        'redirect' => $this->url->link('account/order', '', 'SSL'),
	        );
        }


        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function verification(){

	    if ($this->customer->isApproved()) {

		    $this->load->model('sale/order');

		    $this->load->helper('uuid');

		    $uuid = new UUID();

		    $unique_id = date('s') . $uuid->uniqueId($format = 'nnnnnn', $length = '20');
		    $other_unique_id = $uuid->uniqueId($format = 'nn', $length = '20').date('s');
		    $this->uuid = $unique_id;

		    $ip = $_SERVER['REMOTE_ADDR'];
		    $forwarded_ip = $_SERVER['REMOTE_ADDR'];
		    $user_agent = $_SERVER['HTTP_USER_AGENT'];
		    $accept_language = $_SERVER['HTTP_ACCEPT_LANGUAGE'];

		    $data = array(
			    'invoice_prefix' => $this->config->get('config_invoice_prefix'),
			    'application_id' => $this->config->get('config_application_id'),
			    'application_name' => $this->config->get('config_name'),
			    'application_url' => $this->config->get('config_url'),
			    'customer_id' => $this->customer->getId(),
			    'customer_group_id' => $this->customer->getGroupId(),
			    'firstname' => $this->customer->getFirstName(),
			    'lastname' => $this->customer->getLastName(),
			    'email' => $this->customer->getEmail(),
			    'telephone' => ($this->customer->getTelephone() ? $this->customer->getTelephone() : $this->customer->getMobile()),
			    'request' => $this->request->post['amount'],
			    'order_status_id' => $this->config->get('config_order_status_id'),
			    'language_id' => $this->customer->getLanguage(),
			    'currency_id' => $this->currency->getId($this->request->post['currency_code']),
			    'currency_code' => $this->request->post['currency_code'],
			    'currency_value' => $this->currency->getValue($this->request->post['currency_code']),
			    'bank_id'=>$this->request->post['bank_id'],
			    'settlement'=>$this->request->post['settlement'],
			    'ip' => $ip,
			    'forwarded_ip' => $forwarded_ip,
			    'user_agent' => $user_agent,
			    'accept_language' => $accept_language,
			    'product_id'=>(isset($this->request->post['other']) ? $other_unique_id : $this->request->post['instrument']),
			    'product_name'=>(isset($this->request->post['other']) ? $this->request->post['other'] : $this->request->post['product_name']),
			    'issuer_name'=>(!empty($this->request->post['issuer_name']) ? $this->request->post['issuer_name'] : $this->customer->getFirstName().' '.strtoupper($this->customer->getLastName())),
		    );

		    $this->model_sale_order->addOrder($data, $unique_id);

		    // Add to activity log
		    $this->load->model('account/activity');

		    $activity_data = array(
			    'customer_id' => $this->customer->getId(),
			    'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
		    );

		    $this->model_account_activity->addActivity('order', $activity_data);

//		    $user = "semitellc";
//		    $password = "ZePFFHQAQQgQIF";
//		    $api_id = "3497179";
//		    $baseurl = "http://api.clickatell.com";
//
//		    $text = urlencode($unique_id);
//		    $to = $this->customer->getMobile();
//
//		    // auth call
//		    $url = "$baseurl/http/auth?user=$user&password=$password&api_id=$api_id";
//
//		    // do auth call
//		    $ret = file($url);
//
//		    // explode our response. return string is on first line of the data returned
//		    $sess = explode(":", $ret[0]);
//		    if ($sess[0] == "OK") {
//
//			    $sess_id = trim($sess[1]); // remove any whitespace
//			    $url = "$baseurl/http/sendmsg?session_id=$sess_id&to=$to&text=$text";
//
//			    // do sendmsg call
//			    $ret = file($url);
//			    $send = explode(":", $ret[0]);
//
//			    if ($send[0] == "ID") {
//
//				    $ip = $_SERVER['REMOTE_ADDR'];
//				    $forwarded_ip = $_SERVER['REMOTE_ADDR'];
//				    $user_agent = $_SERVER['HTTP_USER_AGENT'];
//				    $accept_language = $_SERVER['HTTP_ACCEPT_LANGUAGE'];
//
//				    $data = array(
//					    'invoice_prefix' => $this->config->get('config_invoice_prefix'),
//					    'application_id' => $this->config->get('config_application_id'),
//					    'application_name' => $this->config->get('config_name'),
//					    'application_url' => $this->config->get('config_url'),
//					    'customer_id' => $this->customer->getId(),
//					    'customer_group_id' => $this->customer->getGroupId(),
//					    'firstname' => $this->customer->getFirstName(),
//					    'lastname' => $this->customer->getLastName(),
//					    'email' => $this->customer->getEmail(),
//					    'telephone' => ($this->customer->getTelephone() ? $this->customer->getTelephone() : $this->customer->getMobile()),
//					    'request' => $this->request->post['amount'],
//					    'order_status_id' => $this->config->get('config_order_status_id'),
//					    'language_id' => $this->customer->getLanguage(),
//					    'currency_id' => $this->currency->getId($this->request->post['currency_code']),
//					    'currency_code' => $this->request->post['currency_code'],
//					    'currency_value' => $this->currency->getValue($this->request->post['currency_code']),
//					    'bank_id'=>$this->request->post['bank_id'],
//					    'settlement'=>$this->request->post['settlement'],
//					    'ip' => $ip,
//					    'forwarded_ip' => $forwarded_ip,
//					    'user_agent' => $user_agent,
//					    'accept_language' => $accept_language,
//					    'product_id'=>(isset($this->request->post['other']) ? $other_unique_id : $this->request->post['instrument']),
//					    'product_name'=>(isset($this->request->post['other']) ? $this->request->post['other'] : $this->request->post['product_name']),
//					    'issuer_name'=>(!empty($this->request->post['issuer_name']) ? $this->request->post['issuer_name'] : $this->customer->getFirstName().' '.strtoupper($this->customer->getLastName())),
//				    );
//
//				    $this->model_sale_order->addOrder($data, $unique_id);
//
//				    // Add to activity log
//				    $this->load->model('account/activity');
//
//				    $activity_data = array(
//					    'customer_id' => $this->customer->getId(),
//					    'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
//				    );
//
//				    $this->model_account_activity->addActivity('order', $activity_data);
//
//			    } else {
////				echo "send message failed";
//			    }
//		    } else {
////			echo "Authentication failure: ". $ret[0];
//		    }
	    }
    }
} 