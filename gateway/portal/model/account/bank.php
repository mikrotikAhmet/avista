<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/7/15
 * Time: 11:27 AM
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

class ModelAccountBank extends Model {

	public function addBank($data){

		$this->db->query("INSERT INTO ".DB_PREFIX."bank SET customer_id = '".(int) $this->customer->getId()."',
		bank = '".$this->db->escape($data['name'])."',
		country_id = '".(int) $data['country_id']."',
		zone_id = '".(int) $data['zone_id']."',
		currency_code = '".$this->db->escape($data['currency_code'])."',
		account_number = '".$this->db->escape($data['account'])."',
		swift = '".$this->db->escape($data['swift'])."',
		iban = '".$this->db->escape($data['iban'])."',
		sort_code = '".$this->db->escape($data['sort_code'])."',
		routing = '".$this->db->escape($data['routing'])."',
		status = '".(int) $this->config->get('config_order_status_id')."'");
	}

	public function updateBank($data,$bank_id){

		$this->db->query("UPDATE ".DB_PREFIX."bank SET bank = '".$this->db->escape($data['name'])."',
		country_id = '".(int) $data['country_id']."',
		zone_id = '".(int) $data['zone_id']."',
		currency_code = '".$this->db->escape($data['currency_code'])."',
		account_number = '".$this->db->escape($data['account'])."',
		swift = '".$this->db->escape($data['swift'])."',
		iban = '".$this->db->escape($data['iban'])."',
		sort_code = '".$this->db->escape($data['sort_code'])."',
		routing = '".$this->db->escape($data['routing'])."',
		status = '".(int) $this->config->get('config_order_status_id')."' WHERE bank_id = '".(int) $bank_id."'");
	}

	public function delete($bank_id){

		$this->db->query("DELETE FROM ".DB_PREFIX."bank WHERE bank_id = '".(int) $bank_id."' AND customer_id = '".(int) $this->customer->getId()."'");
	}
	public function getBank($bank_id){

		$result = $this->db->query("SELECT * FROM ".DB_PREFIX."bank WHERE bank_id = '".(int) $bank_id."' AND customer_id = '".(int) $this->customer->getId()."'");

		return $result->row;
	}

	public function getBanks(){

		$results = $this->db->query("SELECT * FROM ".DB_PREFIX."bank WHERE customer_id = '".(int) $this->customer->getId()."'");

		return $results->rows;
	}
} 