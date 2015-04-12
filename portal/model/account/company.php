<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/10/15
 * Time: 2:57 PM
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

class ModelAccountCompany extends Model {

	public function updateCompany($data){

		$this->db->query("UPDATE ".DB_PREFIX."customer_company SET
		dba = '".$this->db->escape($data['dba'])."',
		`type` = '".$this->db->escape($data['type'])."',
		inc_date = '".$this->db->escape($data['inc_date'])."',
		vat = '".$this->db->escape($data['tax_number'])."'  WHERE customer_id = '".(int) $this->customer->getId()."'");
	}
} 