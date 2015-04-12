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
		country_id = '".(int)$data['address']['country_id']."',
		address_1 = '".$this->db->escape($data['address']['address_1'])."',
		address_2 = '".$this->db->escape($data['address']['address_2'])."',
		city = '".$this->db->escape($data['address']['city'])."',
		postcode = '".$this->db->escape($data['address']['postcode'])."',
		zone_id = '".(int)$data['address']['zone_id']."',
		date_added = NOW()");

		if (isset($data['director'])) {
			foreach ($data['director'] as $director) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "certificate_director SET certificate_id = '" . (int)$unique_id . "', firstname = '" . $this->db->escape($director['firstname']) . "', lastname = '" . $this->db->escape($director['lastname']) . "', email = '" . $this->db->escape($director['email']) . "', address_1 = '" . $this->db->escape($director['address_1']) . "', address_2 = '" . $this->db->escape($director['address_2']) . "', city = '" . $this->db->escape($director['city']) . "', postcode = '" . $this->db->escape($director['postcode']) . "', country_id = '" . (int)$director['country_id'] . "', zone_id = '" . (int)$director['zone_id'] . "', telephone = '" . $this->db->escape($director['telephone']) . "', passport = '" . $this->db->escape($director['passport']) . "', ssn = '" . $this->db->escape($director['ssn']) . "', dob = '" . $this->db->escape($director['dob']) . "'");

			}
		}

		if (isset($data['ubo'])) {
			foreach ($data['ubo'] as $ubo) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "certificate_ubo SET certificate_id = '" . (int)$unique_id . "', firstname = '" . $this->db->escape($ubo['firstname']) . "', lastname = '" . $this->db->escape($ubo['lastname']) . "', email = '" . $this->db->escape($ubo['email']) . "', address_1 = '" . $this->db->escape($ubo['address_1']) . "', address_2 = '" . $this->db->escape($ubo['address_2']) . "', city = '" . $this->db->escape($ubo['city']) . "', postcode = '" . $this->db->escape($ubo['postcode']) . "', country_id = '" . (int)$ubo['country_id'] . "', zone_id = '" . (int)$ubo['zone_id'] . "', telephone = '" . $this->db->escape($ubo['telephone']) . "', passport = '" . $this->db->escape($ubo['passport']) . "', ssn = '" . $this->db->escape($ubo['ssn']) . "', dob = '" . $this->db->escape($ubo['dob']) . "'");

			}
		}

		if (isset($data['contact'])) {
			foreach ($data['contact'] as $contact) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "certificate_contact SET certificate_id = '" . (int)$unique_id . "', firstname = '" . $this->db->escape($contact['firstname']) . "', lastname = '" . $this->db->escape($contact['lastname']) . "', email = '" . $this->db->escape($contact['email']) . "', address_1 = '" . $this->db->escape($contact['address_1']) . "', address_2 = '" . $this->db->escape($contact['address_2']) . "', city = '" . $this->db->escape($contact['city']) . "', postcode = '" . $this->db->escape($contact['postcode']) . "', country_id = '" . (int)$contact['country_id'] . "', zone_id = '" . (int)$contact['zone_id'] . "', telephone = '" . $this->db->escape($contact['telephone']) . "', passport = '" . $this->db->escape($contact['passport']) . "', ssn = '" . $this->db->escape($contact['ssn']) . "', dob = '" . $this->db->escape($contact['dob']) . "'");

			}
		}
	}

	public function editCertificate($certificate_id,$data){


		$this->db->query("UPDATE ".DB_PREFIX."certificate SET legal_name = '".$this->db->escape($data['legal_name'])."',
		dba = '".$this->db->escape($data['dba'])."',
		`type` = '".$this->db->escape($data['type'])."',
		inc_date = '".$this->db->escape($data['inc_date'])."',
		registration_number = '".$this->db->escape($data['registration_number'])."',
		tax_number = '".$this->db->escape($data['tax_number'])."',
		country_id = '".(int)$data['address']['country_id']."',
		address_1 = '".$this->db->escape($data['address']['address_1'])."',
		address_2 = '".$this->db->escape($data['address']['address_2'])."',
		city = '".$this->db->escape($data['address']['city'])."',
		postcode = '".$this->db->escape($data['address']['postcode'])."',
		zone_id = '".(int)$data['address']['zone_id']."' WHERE certificate_id = '".(int) $certificate_id."'");

		$this->db->query("DELETE FROM ".DB_PREFIX."certificate_director WHERE certificate_id = '".(int) $certificate_id."'");

		if (isset($data['director'])) {
			foreach ($data['director'] as $director) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "certificate_director SET certificate_id = '" . (int)$certificate_id . "', firstname = '" . $this->db->escape($director['firstname']) . "', lastname = '" . $this->db->escape($director['lastname']) . "', email = '" . $this->db->escape($director['email']) . "', address_1 = '" . $this->db->escape($director['address_1']) . "', address_2 = '" . $this->db->escape($director['address_2']) . "', city = '" . $this->db->escape($director['city']) . "', postcode = '" . $this->db->escape($director['postcode']) . "', country_id = '" . (int)$director['country_id'] . "', zone_id = '" . (int)$director['zone_id'] . "', telephone = '" . $this->db->escape($director['telephone']) . "', passport = '" . $this->db->escape($director['passport']) . "', ssn = '" . $this->db->escape($director['ssn']) . "', dob = '" . $this->db->escape($director['dob']) . "'");

			}
		}

		$this->db->query("DELETE FROM ".DB_PREFIX."certificate_ubo WHERE certificate_id = '".(int) $certificate_id."'");

		if (isset($data['ubo'])) {
			foreach ($data['ubo'] as $ubo) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "certificate_ubo SET certificate_id = '" . (int)$certificate_id . "', firstname = '" . $this->db->escape($ubo['firstname']) . "', lastname = '" . $this->db->escape($ubo['lastname']) . "', email = '" . $this->db->escape($ubo['email']) . "', address_1 = '" . $this->db->escape($ubo['address_1']) . "', address_2 = '" . $this->db->escape($ubo['address_2']) . "', city = '" . $this->db->escape($ubo['city']) . "', postcode = '" . $this->db->escape($ubo['postcode']) . "', country_id = '" . (int)$ubo['country_id'] . "', zone_id = '" . (int)$ubo['zone_id'] . "', telephone = '" . $this->db->escape($ubo['telephone']) . "', passport = '" . $this->db->escape($ubo['passport']) . "', ssn = '" . $this->db->escape($ubo['ssn']) . "', dob = '" . $this->db->escape($ubo['dob']) . "'");

			}
		}

		$this->db->query("DELETE FROM ".DB_PREFIX."certificate_contact WHERE certificate_id = '".(int) $certificate_id."'");

		if (isset($data['contact'])) {
			foreach ($data['contact'] as $contact) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "certificate_contact SET certificate_id = '" . (int)$certificate_id . "', firstname = '" . $this->db->escape($contact['firstname']) . "', lastname = '" . $this->db->escape($contact['lastname']) . "', email = '" . $this->db->escape($contact['email']) . "', address_1 = '" . $this->db->escape($contact['address_1']) . "', address_2 = '" . $this->db->escape($contact['address_2']) . "', city = '" . $this->db->escape($contact['city']) . "', postcode = '" . $this->db->escape($contact['postcode']) . "', country_id = '" . (int)$contact['country_id'] . "', zone_id = '" . (int)$contact['zone_id'] . "', telephone = '" . $this->db->escape($contact['telephone']) . "', passport = '" . $this->db->escape($contact['passport']) . "', ssn = '" . $this->db->escape($contact['ssn']) . "', dob = '" . $this->db->escape($contact['dob']) . "'");

			}
		}
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

	public function getDirectors($certificate_id){

		$results = $this->db->query("SELECT * FROM ".DB_PREFIX."certificate_director WHERE certificate_id = '".(int) $certificate_id."'");

		return $results->rows;
	}

	public function getUbos($certificate_id){

		$results = $this->db->query("SELECT * FROM ".DB_PREFIX."certificate_ubo WHERE certificate_id = '".(int) $certificate_id."'");

		return $results->rows;
	}

	public function getContacts($certificate_id){

		$results = $this->db->query("SELECT * FROM ".DB_PREFIX."certificate_contact WHERE certificate_id = '".(int) $certificate_id."'");

		return $results->rows;
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

	public function deleteCertificate($certificate_id){

		$this->db->query("DELETE FROM ".DB_PREFIX."certificate WHERE certificate_id = '".(int) $certificate_id."'");
		$this->db->query("DELETE FROM ".DB_PREFIX."certificate_director WHERE certificate_id = '".(int) $certificate_id."'");
		$this->db->query("DELETE FROM ".DB_PREFIX."certificate_ubo WHERE certificate_id = '".(int) $certificate_id."'");
		$this->db->query("DELETE FROM ".DB_PREFIX."certificate_contact WHERE certificate_id = '".(int) $certificate_id."'");

	}
} 