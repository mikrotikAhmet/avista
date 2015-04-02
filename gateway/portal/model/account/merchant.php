<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/2/15
 * Time: 7:32 PM
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
class ModelAccountMerchant extends Model {

public function addMerchant($data) {
	$this->event->trigger('pre.merchant.add', $data);

	if (isset($data['merchant_group_id']) && is_array($this->config->get('config_merchant_group_display')) && in_array($data['merchant_group_id'], $this->config->get('config_merchant_group_display'))) {
		$merchant_group_id = $data['merchant_group_id'];
	} else {
		$merchant_group_id = $this->config->get('config_merchant_group_id');
	}

	$this->load->model('account/merchant_group');

	$merchant_group_info = $this->model_account_merchant_group->getMerchantGroup($merchant_group_id);

	$this->db->query("INSERT INTO " . DB_PREFIX . "merchant SET merchant_group_id = '" . (int)$merchant_group_id . "', store_id = '" . (int)$this->config->get('config_store_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['account']) ? serialize($data['custom_field']['account']) : '') . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$merchant_group_info['approval'] . "', date_added = NOW()");

	$merchant_id = $this->db->getLastId();

	$this->db->query("INSERT INTO " . DB_PREFIX . "address SET merchant_id = '" . (int)$merchant_id . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '" . $this->db->escape($data['company']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['address']) ? serialize($data['custom_field']['address']) : '') . "'");

	$address_id = $this->db->getLastId();

	$this->db->query("UPDATE " . DB_PREFIX . "merchant SET address_id = '" . (int)$address_id . "' WHERE merchant_id = '" . (int)$merchant_id . "'");

	$this->load->language('mail/merchant');

	$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));

	$message = sprintf($this->language->get('text_welcome'), $this->config->get('config_name')) . "\n\n";

	if (!$merchant_group_info['approval']) {
		$message .= $this->language->get('text_login') . "\n";
	} else {
		$message .= $this->language->get('text_approval') . "\n";
	}

	$message .= $this->url->link('account/login', '', 'SSL') . "\n\n";
	$message .= $this->language->get('text_services') . "\n\n";
	$message .= $this->language->get('text_thanks') . "\n";
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
		$message .= $this->language->get('text_merchant_group') . ' ' . $merchant_group_info['name'] . "\n";
		$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
		$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

		$mail->setTo($this->config->get('config_email'));
		$mail->setSubject(html_entity_decode($this->language->get('text_new_merchant'), ENT_QUOTES, 'UTF-8'));
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

	$this->event->trigger('post.merchant.add', $merchant_id);

	return $merchant_id;
}

public function editMerchant($data) {
	$this->event->trigger('pre.merchant.edit', $data);

	$merchant_id = $this->merchant->getId();

	$this->db->query("UPDATE " . DB_PREFIX . "merchant SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? serialize($data['custom_field']) : '') . "' WHERE merchant_id = '" . (int)$merchant_id . "'");

	$this->event->trigger('post.merchant.edit', $merchant_id);
}

public function editPassword($email, $password) {
	$this->event->trigger('pre.merchant.edit.password');

	$this->db->query("UPDATE " . DB_PREFIX . "merchant SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

	$this->event->trigger('post.merchant.edit.password');
}

public function editNewsletter($newsletter) {
	$this->event->trigger('pre.merchant.edit.newsletter');

	$this->db->query("UPDATE " . DB_PREFIX . "merchant SET newsletter = '" . (int)$newsletter . "' WHERE merchant_id = '" . (int)$this->merchant->getId() . "'");

	$this->event->trigger('post.merchant.edit.newsletter');
}

public function getMerchant($merchant_id) {
	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE merchant_id = '" . (int)$merchant_id . "'");

	return $query->row;
}

public function getMerchantByEmail($email) {
	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

	return $query->row;
}

public function getMerchantByToken($token) {
	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE token = '" . $this->db->escape($token) . "' AND token != ''");

	$this->db->query("UPDATE " . DB_PREFIX . "merchant SET token = ''");

	return $query->row;
}

public function getTotalMerchantsByEmail($email) {
	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

	return $query->row['total'];
}

public function getIps($merchant_id) {
	$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_ip` WHERE merchant_id = '" . (int)$merchant_id . "'");

	return $query->rows;
}

public function isBanIp($ip) {
	$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_ban_ip` WHERE ip = '" . $this->db->escape($ip) . "'");

	return $query->num_rows;
}
}