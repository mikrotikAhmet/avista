<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/12/15
 * Time: 9:55 AM
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

class ModelAccountCustomer extends Model {


	public function addCustomer($data){

		$this->load->helper('uuid');

		$uuid = new UUID();

		$unique_id = $uuid->uniqueId($format = 'nnnnnn',$length = '20');

		$this->event->trigger('pre.customer.add', $data);

		if (isset($data['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($data['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $data['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$this->load->model('account/customer_group');

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET
		customer_id = '" . (int)$unique_id . "',
		customer_group_id = '" . (int)$customer_group_id . "',
		application_id = '" . (int)$this->config->get('config_application_id') . "',
		firstname = '" . $this->db->escape($data['firstname']) . "',
		lastname = '" . $this->db->escape($data['lastname']) . "',
		telephone = '" . $this->db->escape($data['tac1'].$data['telephone']) . "',
		mobile = '" . $this->db->escape($data['mac1'].$data['mobile']) . "',
		email = '" . $this->db->escape($data['email']) . "',
		salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "',
		password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "',
		ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "',
		status = '1',
		approved = '".(int)!$customer_group_info['approval']."', date_added = NOW()");

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_company SET
		customer_id = '" . (int)$unique_id . "',
		legal_name = '" . $this->db->escape($data['legal_name']) . "',
		registration_number = '" . $this->db->escape($data['registration_number']) . "',
		address_1 = '" . $this->db->escape($data['address_1']) . "',
		address_2 = '" . $this->db->escape($data['address_2']) . "',
		postcode = '" . $this->db->escape($data['postcode']) . "',
		country_id = '" . (int)$data['country_id'] . "',
		url = '" . $this->db->escape($data['url']) . "'");

	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . $customer_id . "'");

		return $query->row;
	}

	public function getCustomerCompany($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_company WHERE customer_id = '" . $customer_id . "'");

		return $query->row;
	}

	public function updateToken($token,$customer_id) {
		$this->event->trigger('pre.customer.edit.token');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = '".(int)$token."' WHERE customer_id = '".(int) $customer_id."'");

		$this->event->trigger('post.customer.edit.token');
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function getCustomerByToken($token) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE token = '" . $this->db->escape($token) . "' AND token != ''");

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = ''");

		return $query->row;
	}

	public function getTotalCompaniesByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function updateAuth($auth) {
		$this->event->trigger('pre.customer.edit.auth');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET two_way = '".(int)$auth."' WHERE customer_id = '".(int) $this->customer->getId()."'");

		$this->event->trigger('post.customer.edit.auth');
	}

	public function addDocument($file,$filename){

		$this->db->query("INSERT INTO ".DB_PREFIX."customer_document SET customer_id = '".(int) $this->customer->getId()."', filename = '".$this->db->escape($filename)."',file = '".$this->db->escape($file)."', ip = '".$_SERVER['REMOTE_ADDR']."', date_added = NOW(), status = '".$this->config->get('config_order_status_id')."'");
	}

	public function getDocuments(){
		$results = $this->db->query("SELECT * FROM ".DB_PREFIX."customer_document WHERE customer_id = '".(int) $this->customer->getId()."'");

		return $results->rows;
	}

	public function getDocument($document_id){
		$result = $this->db->query("SELECT * FROM ".DB_PREFIX."customer_document WHERE document_id = '".(int) $document_id."'");

		return $result->row;
	}

	public function removeDocument($document_id){
		$this->db->query("DELETE FROM ".DB_PREFIX."customer_document WHERE document_id = '".(int) $document_id."'");
	}
} 