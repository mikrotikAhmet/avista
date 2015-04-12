<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/10/15
 * Time: 1:05 PM
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

class ModelAccountPersonal extends Model {

	public function updatePersonal($data){

		$this->db->query("UPDATE ".DB_PREFIX."customer SET firstname = '".$this->db->escape($data['firstname'])."',lastname = '".$this->db->escape($data['lastname'])."',telephone = '".$this->db->escape($data['telephone'])."', mobile = '".$this->db->escape($data['mobile'])."',email = '".$this->db->escape($data['email'])."' WHERE customer_id = '".(int) $this->customer->getId()."'");
	}
} 