<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 1:15 PM
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

class ModelUserApi extends Model {
	public function addApi($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "api` SET username = '" . $this->db->escape($data['username']) . "', `password` = '" . $this->db->escape($data['password']) . "', status = '" . (int)$data['status'] . "', date_added = NOW(), date_modified = NOW()");
	}

	public function editApi($api_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "api` SET username = '" . $this->db->escape($data['username']) . "', `password` = '" . $this->db->escape($data['password']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE api_id = '" . (int)$api_id . "'");
	}

	public function deleteApi($api_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "api` WHERE api_id = '" . (int)$api_id . "'");
	}

	public function getApi($api_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "api` WHERE api_id = '" . (int)$api_id . "'");

		return $query->row;
	}

	public function getApis($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "api`";

		$sort_data = array(
			'username',
			'status',
			'date_added',
			'date_modified'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY username";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalApis() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "api`");

		return $query->row['total'];
	}
}