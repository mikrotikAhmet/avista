<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/10/15
 * Time: 2:17 PM
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

class ModelAccountIdentity extends Model {

	public function updateIdentity($data){

		$this->db->query("UPDATE ".DB_PREFIX."customer SET date_of_birth = '".$this->db->escape($data['date_of_birth'])."', place_of_birth = '".$this->db->escape($data['place_of_birth'])."',country_id = '".(int) $data['country_id']."',passport = '".$this->db->escape($data['passport'])."',issue_date = '".$this->db->escape($data['issue'])."',expiry_date = '".$this->db->escape($data['expiration'])."' WHERE customer_id = '".(int) $this->customer->getId()."'");
	}
} 