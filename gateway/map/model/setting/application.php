<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 12:38 PM
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

class ModelSettingApplication extends Model {
	public function addApplication($data) {
		$this->event->trigger('pre.admin.add.application', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "application SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "'");

		$application_id = $this->db->getLastId();

		// Layout Route
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE application_id = '0'");

		foreach ($query->rows as $layout_route) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "layout_route SET layout_id = '" . (int)$layout_route['layout_id'] . "', route = '" . $this->db->escape($layout_route['route']) . "', application_id = '" . (int)$application_id . "'");
		}

		$this->cache->delete('application');

		$this->event->trigger('post.admin.add.application', $application_id);

		return $application_id;
	}

	public function editApplication($application_id, $data) {
		$this->event->trigger('pre.admin.edit.application', $data);

		$this->db->query("UPDATE " . DB_PREFIX . "application SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "' WHERE application_id = '" . (int)$application_id . "'");

		$this->cache->delete('application');

		$this->event->trigger('post.admin.edit.application', $application_id);
	}

	public function deleteApplication($application_id) {
		$this->event->trigger('pre.admin.delete.application', $application_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "application WHERE application_id = '" . (int)$application_id . "'");

		$this->cache->delete('application');

		$this->event->trigger('post.admin.delete.application', $application_id);
	}

	public function getApplication($application_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "application WHERE application_id = '" . (int)$application_id . "'");

		return $query->row;
	}

	public function getApplications($data = array()) {
		$application_data = $this->cache->get('application');

		if (!$application_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "application ORDER BY url");

			$application_data = $query->rows;

			$this->cache->set('application', $application_data);
		}

		return $application_data;
	}

	public function getTotalApplications() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "application");

		return $query->row['total'];
	}

	public function getTotalApplicationsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_layout_id' AND `value` = '" . (int)$layout_id . "' AND application_id != '0'");

		return $query->row['total'];
	}

	public function getTotalApplicationsByLanguage($language) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_language' AND `value` = '" . $this->db->escape($language) . "' AND application_id != '0'");

		return $query->row['total'];
	}

	public function getTotalApplicationsByCurrency($currency) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_currency' AND `value` = '" . $this->db->escape($currency) . "' AND application_id != '0'");

		return $query->row['total'];
	}

	public function getTotalApplicationsByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_country_id' AND `value` = '" . (int)$country_id . "' AND application_id != '0'");

		return $query->row['total'];
	}

	public function getTotalApplicationsByZoneId($zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_zone_id' AND `value` = '" . (int)$zone_id . "' AND application_id != '0'");

		return $query->row['total'];
	}

	public function getTotalApplicationsByCustomerGroupId($customer_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_customer_group_id' AND `value` = '" . (int)$customer_group_id . "' AND application_id != '0'");

		return $query->row['total'];
	}

	public function getTotalApplicationsByInformationId($information_id) {
		$account_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_account_id' AND `value` = '" . (int)$information_id . "' AND application_id != '0'");

		$checkout_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_checkout_id' AND `value` = '" . (int)$information_id . "' AND application_id != '0'");

		return ($account_query->row['total'] + $checkout_query->row['total']);
	}

	public function getTotalApplicationsByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_order_status_id' AND `value` = '" . (int)$order_status_id . "' AND application_id != '0'");

		return $query->row['total'];
	}
}