<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/12/15
 * Time: 6:59 PM
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

class ControllerAccountDocument extends Controller {

	public function index(){

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/document');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('account/dashboard'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_document'),
			'href'      => $this->url->link('account/document', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$data['heading_title'] = $this->language->get('heading_title');


		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/document.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/document.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/document.tpl', $data));
		}
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

		$data['documents'] = array();

		$this->load->model('account/customer');
		$this->load->model('localisation/order_status');

		$results = $this->model_account_customer->getDocuments();

		$data['complete_status'] = $this->config->get('config_complete_status');

		foreach ($results as $result) {
			$order_status_data = $this->model_localisation_order_status->getOrderStatus($result['status']);


			$data['documents'][] = array(
				'document_id'         => $result['document_id'],
				'filename'      =>$result['filename'],
				'mask'      =>$result['file'],
				'status'      =>$order_status_data['name'],
				'status_id'      =>$result['status'],
				'date_added' => date('d/m/y', strtotime($result['date_added'])),
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/document_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/document_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/document_list.tpl', $data));
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