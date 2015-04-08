<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/7/15
 * Time: 11:59 PM
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

class ModelCustomerCertificate extends Model {

	public function addCertificate($data){

		$this->load->helper('uuid');

		$uuid = new UUID();

		$unique_id = date('si') . $uuid->uniqueId($format = 'nnnn', $length = '20');

		$this->db->query("INSERT INTO ".DB_PREFIX."certificate SET certificate_id = '".(int) $unique_id."' ,legal_name = '".$this->db->escape($data['legal_name'])."',
		dba = '".$this->db->escape($data['dba'])."',
		`type` = '".$this->db->escape($data['type'])."',
		inc_date = '".$this->db->escape($data['inc_date'])."',
		registration_number = '".$this->db->escape($data['registration_number'])."',
		tax_number = '".$this->db->escape($data['tax_number'])."',
		date_added = NOW()");
	}

	public function editCertificate($certificate_id,$data){

		$this->db->query("UPDATE ".DB_PREFIX."certificate SET legal_name = '".$this->db->escape($data['legal_name'])."',
		dba = '".$this->db->escape($data['dba'])."',
		`type` = '".$this->db->escape($data['type'])."',
		inc_date = '".$this->db->escape($data['inc_date'])."',
		registration_number = '".$this->db->escape($data['registration_number'])."',
		tax_number = '".$this->db->escape($data['tax_number'])."' WHERE certificate_id = '".(int) $certificate_id."'");
	}

	public function getCertificates($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "certificate";

		$implode = array();

		if (!empty($data['filter_legal'])) {
			$implode[] = "legal_name LIKE '" . $this->db->escape($data['filter_legal']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'legal_name',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY legal_name";
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

	public function getCertificate($certificate_id) {

		$results = $this->db->query("SELECT * FROM ".DB_PREFIX."certificate WHERE certificate_id = '".(int) $certificate_id."'");

		return $results->row;
	}

	public function getTotalCertificates($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "certificate";

		$implode = array();

		if (!empty($data['filter_email'])) {
			$implode[] = "email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		if (isset($data['filter_status']) && $data['filter_status'] !== null) {
			$implode[] = "status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
} 