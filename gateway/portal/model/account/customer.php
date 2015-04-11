<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 5:01 PM
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
	public function addCustomer($data) {

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

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', application_id = '" . (int)$this->config->get('config_application_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', telephone = '" . $this->db->escape($data['tac1'].$data['telephone']) . "', mobile = '" . $this->db->escape($data['mac1'].$data['mobile']) . "',email = '" . $this->db->escape($data['email']) . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', unique_id = '".$this->db->escape($unique_id)."' , language_id = '".(int) $data['language_id']."', currency_code = '".$this->db->escape($data['currency_code'])."' ,status = '1', approved = '1' date_added = NOW()");

		$customer_id = $this->db->getLastId();

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_identity SET customer_id = '" . (int)$customer_id . "'");


		$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['address']) ? serialize($data['custom_field']['address']) : '') . "'");

		$address_id = $this->db->getLastId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");


		$uniqueid = date('si') . $uuid->uniqueId($format = 'nnnn', $length = '20');

		$this->db->query("INSERT INTO ".DB_PREFIX."certificate SET certificate_id = '".(int) $uniqueid."' ,legal_name = '".$this->db->escape($data['company'])."',
		registration_number = '".$this->db->escape($data['company_registration'])."',
		tax_number = '".$this->db->escape($data['tax_number'])."',
		country_id = '".(int)$data['country_id']."',
		address_1 = '".$this->db->escape($data['address_1'])."',
		address_2 = '".$this->db->escape($data['address_2'])."',
		postcode = '".$this->db->escape($data['postcode'])."',
		website = '".$this->db->escape($data['web'])."',
		date_added = NOW()");

		$this->db->query("INSERT INTO " . DB_PREFIX . "certificate_contact SET certificate_id = '" . (int)$unique_id . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', telephone = '" . $this->db->escape($data['telephone']) . "', passport = '" . $this->db->escape($data['passport']) . "', ssn = '" . $this->db->escape($data['ssn']) . "', dob = '" . $this->db->escape($data['dob']) . "'");

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET certificate_id = '" . (int)$uniqueid . "' WHERE customer_id = '" . (int)$customer_id . "'");


		$this->load->language('mail/customer');

		$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));

		$message = $this->language->get('text_greeting')."\n\n";
		$message .= sprintf($this->language->get('text_welcome'), $this->config->get('config_name')) . "\n\n";

		if (!$customer_group_info['approval']) {
			$message .= $this->language->get('text_login') . "\n";
		} else {
			$message .= $this->language->get('text_approval') . "\n";
		}

		$message .= $this->url->link('account/login', '', 'SSL') . "\n\n";

		$message .= sprintf($this->language->get('text_unique'),$unique_id) . "\n\n";
		$message .= $this->language->get('text_services') . "\n\n";

//		$message .= $this->language->get('text_thanks') . "\n\n";
		$message .= $this->config->get('config_name');

		$mail = new Mail($this->config->get('config_mail'));
		$mail->setTo($data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject($subject);
		$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
		$mail->send();

		// Send to main admin email if new account email is enabled
		if ($this->config->get('config_account_mail')) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_website') . ' ' . $this->config->get('config_name') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";
			$message .= $this->language->get('text_customer_group') . ' ' . $customer_group_info['name'] . "\n";
			$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

			$mail->setTo($this->config->get('config_email'));
			$mail->setSubject(html_entity_decode($this->language->get('text_new_customer'), ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
			$mail->send();

			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_mail_alert'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

		$this->event->trigger('post.customer.add', $customer_id);

		return $customer_id;
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

	public function addDocument($file,$filename){

		$this->db->query("INSERT INTO ".DB_PREFIX."customer_document SET customer_id = '".(int) $this->customer->getId()."', filename = '".$this->db->escape($filename)."',file = '".$this->db->escape($file)."', ip = '".$_SERVER['REMOTE_ADDR']."', date_added = NOW(), status = '".$this->config->get('config_order_status_id')."'");
	}

	public function editCustomer($data) {
		$this->event->trigger('pre.customer.edit', $data);

		$customer_id = $this->customer->getId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? serialize($data['custom_field']) : '') . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$this->event->trigger('post.customer.edit', $customer_id);
	}

	public function editPassword($email, $password) {
		$this->event->trigger('pre.customer.edit.password');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		$this->event->trigger('post.customer.edit.password');
	}

	public function updateAuth($auth) {
		$this->event->trigger('pre.customer.edit.auth');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET two_way = '".(int)$auth."' WHERE customer_id = '".(int) $this->customer->getId()."'");

		$this->event->trigger('post.customer.edit.auth');
	}

	public function updateToken($token,$customer_id) {
		$this->event->trigger('pre.customer.edit.token');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = '".(int)$token."' WHERE customer_id = '".(int) $customer_id."'");

		$this->event->trigger('post.customer.edit.token');
	}

	public function editNewsletter($newsletter) {
		$this->event->trigger('pre.customer.edit.newsletter');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '" . (int)$newsletter . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");

		$this->event->trigger('post.customer.edit.newsletter');
	}

	public function setRequest() {

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET account_status = '1' WHERE customer_id = '".(int) $this->customer->getId()."'");
	}

	public function removeGreeting() {

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firsttime = '0' WHERE customer_id = '".(int) $this->customer->getId()."'");
	}

	public function updateTelephone($telephone) {
		$this->event->trigger('pre.customer.edit.telephone');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET mobile = '" . (int)$telephone . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");

		$this->event->trigger('post.customer.edit.telephone');
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomerIdentity($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_identity WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomerAddress($address_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE address_id = '" . (int)$address_id . "'");

		return $query->row;
	}

	public function getIdentity() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_identity WHERE customer_id = '" . (int) $this->customer->getId() . "'");

		return $query->row;
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

	public function getTotalCustomersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function getIps($customer_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_ip` WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->rows;
	}

	public function isBanIp($ip) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_ban_ip` WHERE ip = '" . $this->db->escape($ip) . "'");

		return $query->num_rows;
	}
}