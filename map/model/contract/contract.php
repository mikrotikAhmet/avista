<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/11/15
 * Time: 3:06 AM
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

class ModelContractContract extends Model {

	public function addContract($order_id,$data=array()){

		$order_data = $this->db->query("SELECT * FROM ".DB_PREFIX."order WHERE order_id = '".(int) $order_id."'");

		$customer_data = $this->db->query("SELECT * FROM ".DB_PREFIX."customer WHERE customer_id = '".(int) $order_data->row['customer_id']."'");

		$certificate_data = $this->db->query("SELECT * FROM ".DB_PREFIX."certificate WHERE certificate_id = '".(int) $customer_data->row['certificate_id']."'");

		$this->load->helper('uuid');

		$uuid = new UUID();

		$unique_id = $order_id.'-HIF-'.$uuid->uniqueId($format = 'nnnn', $length = '20').date('si').'-'.date('Y') ;

		$this->db->query("INSERT INTO ".DB_PREFIX."contract SET
		contract_id = '".$this->db->escape($unique_id)."' ,
		order_id = '".(int) $order_id."' ,
		customer_id = '".(int) $order_data->row['customer_id']."' ,
		instrument = '".$this->db->escape($data['instrument'])."',
		issuance_bank = '".$this->db->escape($data['issuance_bank'])."',
		isin_code = '".$this->db->escape($data['isin_code'])."',
		face_value = '".(float)$data['face_value']."',
		maturity_date = '".$this->db->escape($data['maturity_date'])."',
		price = '".(float)$data['price']."',
		company_name = '".$this->db->escape($certificate_data->row['legal_name'])."',
		date_added = NOW()");

		$this->db->query("UPDATE ".DB_PREFIX."order SET contract_no = '".$this->db->escape($unique_id)."' WHERE order_id = '".(int) $order_id ."'");

        $this->updateOrderStatus($order_id,2);
	}

	public function updateContract($order_id,$data){

		$this->db->query("UPDATE ".DB_PREFIX."contract SET
		instrument = '".$this->db->escape($data['instrument'])."',
		issuance_bank = '".$this->db->escape($data['issuance_bank'])."',
		isin_code = '".$this->db->escape($data['isin_code'])."',
		face_value = '".(float)$data['face_value']."',
		maturity_date = '".$this->db->escape($data['maturity_date'])."',
		price = '".(float)$data['price']."',
		company_name = '".$this->db->escape($data['company_name'])."',
		company_address = '".$this->db->escape($data['company_address'])."',
		company_telephone = '".$this->db->escape($data['company_telephone'])."',
		company_email = '".$this->db->escape($data['company_email'])."',
		contact_person = '".$this->db->escape($data['contact_person'])."',
		bank_name = '".$this->db->escape($data['bank_name'])."',
		iban = '".$this->db->escape($data['iban'])."',
		swift_code = '".$this->db->escape($data['swift_code'])."',
		beneficiary_name = '".$this->db->escape($data['beneficiary_name'])."',
		officer_name = '".$this->db->escape($data['officer_name'])."',
		officer_email = '".$this->db->escape($data['officer_email'])."',
		officer_phone = '".$this->db->escape($data['officer_phone'])."',
		date_added = NOW() WHERE order_id = '".(int) $order_id."'");

	}

	public function getContracts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "contract";

		$implode = array();

		if (!empty($data['filter_contract_id'])) {
			$implode[] = "contract_id = '". (int)$data['filter_contract_id']."'";
		}

		if (isset($data['filter_company_name'])) {
			$implode[] = "company_name LIKE '" . (int)$data['filter_company_name'] . "%'";
		}

		if (isset($data['filter_order_id']) && $data['filter_order_id'] !== null) {
			$implode[] = "order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'contract_id',
			'order_id',
			'company_name',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY company_name";
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

	public function getContract($contract_id){

		$result = $this->db->query("SELECT * FROM ".DB_PREFIX."contract WHERE contract_id = '".$this->db->escape($contract_id)."'");

		return $result->row;
	}

	public function getContractByOrderId($order_id){

		$result = $this->db->query("SELECT * FROM ".DB_PREFIX."contract WHERE order_id = '".$this->db->escape($order_id)."'");

		return $result->row;
	}

	public function getTotalContracts($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "contract";

		$implode = array();

		if (!empty($data['filter_contract_id'])) {
			$implode[] = "contract_id = '". (int)$data['filter_contract_id']."'";
		}

		if (isset($data['filter_company_name'])) {
			$implode[] = "company_name LIKE '" . (int)$data['filter_company_name'] . "%'";
		}

		if (isset($data['filter_order_id']) && $data['filter_order_id'] !== null) {
			$implode[] = "order_id = '" . (int)$data['filter_order_id'] . "'";
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

    public function updateOrderStatus($order_id,$status_id){

        $this->db->query("UPDATE ".DB_PREFIX."order SET order_status_id = '".(int) $status_id."' WHERE order_id = '".(int) $order_id."'");

        $this->db->query("INSERT INTO ".DB_PREFIX."order_history SET
		order_id = '".(int) $order_id."',
		order_status_id = '".(int) $status_id."',
		date_added = NOW()");
    }
}