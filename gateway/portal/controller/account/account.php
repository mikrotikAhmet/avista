<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 11:54 PM
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

class ControllerAccountAccount extends Controller {

	private $error = array();

	public function index(){

		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
//			$this->session->data['acv_nc'] = $this->request->post;
//
//			$this->response->redirect($this->url->link('account/step2'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('account/dashboard'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_language'] = $this->language->get('text_language');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_security'] = $this->language->get('text_security');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_2way'] = $this->language->get('text_2way');

		$data['entry_language'] = $this->language->get('entry_language');
		$data['entry_current_password'] = $this->language->get('entry_current_password');
		$data['entry_new_password'] = $this->language->get('entry_new_password');
		$data['entry_retype_password'] = $this->language->get('entry_retype_password');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_newsletter'] = sprintf($this->language->get('entry_newsletter'), $this->config->get('config_name'));

		$customer_data = array();

		$this->load->model('account/customer');
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');

		$customer_data = $this->model_account_customer->getCustomer($this->customer->getId());
		$customer_address = $this->model_account_customer->getCustomerAddress($customer_data['address_id']);
		$customer_country = $this->model_localisation_country->getCountry($customer_address['country_id']);
		$customer_zone = $this->model_localisation_zone->getZone($customer_address['zone_id']);

		$this->load->model('localisation/language');
		$language_data = $this->model_localisation_language->getLanguage($customer_data['language_id']);

		$data['current_language'] = $language_data['name'];
		$data['language_id'] = $customer_data['language_id'];
		$data['auth'] = $customer_data['two_way'];
		$data['telephone'] = $customer_data['telephone'];
		$data['newsletter'] = $customer_data['newsletter'];
		$data['approved'] = $customer_data['approved'];


		// Personal Details
		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['firstname'] = $customer_data['firstname'];
		$data['lastname'] = $customer_data['lastname'];
		$data['email'] = $customer_data['email'];
		$data['telephone'] = $customer_data['telephone'];
		$data['address'] = $customer_address['address_1'].' '.$customer_address['address_2'].'<br/> '.$customer_address['city'].' '.$customer_address['postcode'].'<br/>'.$customer_zone['name'].' / '.$customer_country['name'];


		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();


		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/account.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/account.tpl', $data));
		}
	}

	public function updateLanguage(){

		$json = array();
		$language_id = $this->request->post['language_id'];

		$this->load->model('localisation/language');
		$this->load->model('account/customer');

		$this->model_localisation_language->updateCustomerLanguage($language_id);

		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

		if ($customer_info) {

			$json = array(
					'redirect'=>$this->url->link('account/account','','SSL'),
					'language'=> $this->model_localisation_language->getLanguage($customer_info['language_id']),
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updatePassword(){

		$json = array();
		$error = false;

		$current = $this->request->post['current'];
		$new = $this->request->post['new'];
		$confirm = $this->request->post['confirm'];

		if (empty($current) || empty($new) || empty($confirm)){
			$error = true;
			$json['error'] = array(
				'message'=>'Please fill the required fields',
			);
		}

		$this->load->model('account/customer');

		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

		if (!$this->customer->login($customer_info['email'],$current, false)){
			$error = true;
			$json['error'] = array(
				'message'=>'Your current password does not match with the one associated!',
			);
		}

		if ((utf8_strlen($new) < 4) || (utf8_strlen($new) > 20)) {
			$error = true;
			$json['error'] = array(
				'message'=>'Password must be between 4 and 20 characters!',
			);
		}

		if (empty($new) != empty($confirm)){
			$error = true;
			$json['error'] = array(
				'message'=>'Password confirmation does not match password!',
			);
		}

		if (!$error) {
			$this->model_account_customer->editPassword($customer_info['email'], $new);

			$json = array(
				'redirect' => $this->url->link('account/account', '', 'SSL'),
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updateTwoway(){

		$json = array();
		$error = false;
		$auth = $this->request->post['auth'];

		$this->load->model('account/customer');

		$this->model_account_customer->updateAuth($auth);

		if ($auth && empty($this->request->post['telephone'])){
			$error = true;
			$json['error'] = array(
				'message'=>'To activate your 2-Way-auth. You must enter your mobile phone number!',
			);
		}

		if (!$error) {
			$this->model_account_customer->updateTelephone($this->request->post['telephone']);
			$json = array(
				'redirect' => $this->url->link('account/account', '', 'SSL'),
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updateNewsletter(){

		$json = array();
		$subscribe = $this->request->post['subscribe'];

		$this->load->model('account/customer');

		$this->model_account_customer->editNewsletter($subscribe);

			$json = array(
				'redirect' => $this->url->link('account/account', '', 'SSL'),
			);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function upload() {

		$json = array();

		if (!$json) {
			if (!empty($this->request->files['file']['name']) && is_file($this->request->files['file']['tmp_name'])) {
				// Sanitize the filename
				$filename = basename(html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));

				// Validate the filename length
				if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
					$json['error'] = $this->language->get('error_filename');
				}

				// Allowed file extension types
				$allowed = array();

				$extension_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_ext_allowed'));

				$filetypes = explode("\n", $extension_allowed);

				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}

				if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}

				// Allowed file mime types
				$allowed = array();

				$mime_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_mime_allowed'));

				$filetypes = explode("\n", $mime_allowed);

				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}

				if (!in_array($this->request->files['file']['type'], $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}

				// Check to see if any PHP files are trying to be uploaded
				$content = file_get_contents($this->request->files['file']['tmp_name']);

				if (preg_match('/\<\?php/i', $content)) {
					$json['error'] = $this->language->get('error_filetype');
				}

				// Return any upload error
				if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
					$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
				}
			} else {
				$json['error'] = $this->language->get('error_upload');
			}
		}

		if (!$json) {
			$file = $filename . '.' . md5(mt_rand());

			move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);

			$json['filename'] = $file;
			$json['mask'] = $filename;

			$this->load->model('account/customer');
			$this->model_account_customer->addDocument($file,$filename);

			$json['success'] = 'Successfully uploaded';
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function documents(){

		$data = array();

		$this->load->model('account/customer');
        $this->load->model('localisation/order_status');

        $results = $this->model_account_customer->getDocuments();

        foreach ($results as $result) {
            $order_status_data = $this->model_localisation_order_status->getOrderStatus($result['status']);


            $data['documents'][] = array(
                'document_id'         => $result['document_id'],
                'filename'      =>$result['filename'],
                'mask'      =>$result['file'],
                'status'      =>$order_status_data['name'],
                'date_added' => date('d/m/y', strtotime($result['date_added'])),
            );
        }

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/document.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/document.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/document.tpl', $data));
		}

	}

	public function removeDocument(){

		$json = array();
		$document_id = $this->request->post['document_id'];

		$this->load->model('account/customer');

		$document_info = $this->model_account_customer->getDocument($document_id);
		unlink(DIR_DOWNLOAD.$document_info['file']);

		$this->model_account_customer->removeDocument($document_id);


		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
} 