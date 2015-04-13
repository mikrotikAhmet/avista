<?php



if (!defined('DIR_APPLICATION'))
    exit('No direct script access allowed');

/**
 *
 * Semite ADP (Application Development Program) for PHP 5.1.6 or newer
 *
 * @package		Open Gateway Core Application
 * @author		Semite LLC. Dev Team
 * @copyright	Copyright (c) 2008 - 2015, Semite LLC.
 * @license		http://www.semitepayment.com/user_guide/license.html
 * @link		http://www.semitepayment.com
 * @version		Version 1.0.1
 */
// ------------------------------------------------------------------------

class Customer {
    private $customer_id;
    private $language_id;
    private $currency_code;
    private $firstname;
    private $lastname;
    private $email;
    private $telephone;
	private $mobile;
    private $customer_group_id;
    private $approved;
	private $twoway;
	private $certificate;

    public function __construct($registry) {
        $this->config = $registry->get('config');
        $this->db = $registry->get('db');
        $this->request = $registry->get('request');
        $this->session = $registry->get('session');

        if (isset($this->session->data['customer_id'])) {
            $customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND status = '1'");

            if ($customer_query->num_rows) {
                $this->customer_id = $customer_query->row['customer_id'];
                $this->firstname = $customer_query->row['firstname'];
                $this->lastname = $customer_query->row['lastname'];
                $this->email = $customer_query->row['email'];
                $this->telephone = $customer_query->row['telephone'];
                $this->customer_group_id = $customer_query->row['customer_group_id'];
                $this->approved = $customer_query->row['approved'];
	            $this->twoway = $customer_query->row['two_way'];
	            $this->mobile = $customer_query->row['mobile'];
	            $this->certificate = $customer_query->row['certificate_id'];


                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

                if (!$query->num_rows) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "customer_ip SET customer_id = '" . (int)$this->session->data['customer_id'] . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', date_added = NOW()");
                }
            } else {
                $this->logout();
            }
        }
    }

    public function login($email, $password, $override = false) {
        if ($override) {
            $customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND status = '1'");
        } else {
            $customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1' AND approved = '1'");
        }

        if ($customer_query->num_rows) {
            $this->session->data['customer_id'] = $customer_query->row['customer_id'];

            $this->customer_id = $customer_query->row['customer_id'];
            $this->firstname = $customer_query->row['firstname'];
            $this->lastname = $customer_query->row['lastname'];
            $this->email = $customer_query->row['email'];
            $this->telephone = $customer_query->row['telephone'];
            $this->customer_group_id = $customer_query->row['customer_group_id'];
            $this->approved = $customer_query->row['approved'];
	        $this->twoway = $customer_query->row['two_way'];
	        $this->mobile = $customer_query->row['mobile'];
	        $this->certificate = $customer_query->row['certificate_id'];

            $this->db->query("UPDATE " . DB_PREFIX . "customer SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

            return true;
        } else {
            return false;
        }
    }

    public function logout() {

        unset($this->session->data['customer_id']);

        $this->customer_id = '';
        $this->firstname = '';
        $this->lastname = '';
        $this->email = '';
        $this->customer_group_id = '';
    }

	public function getCertificate(){
		return $this->certificate;
	}

	public function getMobile(){
		return $this->mobile;
	}

    public function getLanguage(){
        return $this->language_id;
    }

	public function getTelephone(){
		return $this->telephone;
	}

    public function getCurrency(){
        return $this->currency_code;
    }

	public function isTwoway(){
		return $this->twoway;
	}

    public function isApproved(){
        return $this->approved;
    }

    public function isLogged() {
        return $this->customer_id;
    }

    public function getId() {
        return $this->customer_id;
    }

    public function getFirstName() {
        return $this->firstname;
    }

    public function getLastName() {
        return $this->lastname;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getGroupId() {
        return $this->customer_group_id;
    }

    public function getBalance() {
        $query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$this->customer_id . "'");

        return $query->row['total'];
    }

}
//End of file customer.php 