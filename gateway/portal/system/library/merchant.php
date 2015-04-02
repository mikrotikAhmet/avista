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

class Merchant {
    private $merchant_id;
    private $firstname;
    private $lastname;
    private $email;
    private $telephone;
    private $fax;
    private $newsletter;
    private $merchant_group_id;
    private $address_id;

    public function __construct($registry) {
        $this->config = $registry->get('config');
        $this->db = $registry->get('db');
        $this->request = $registry->get('request');
        $this->session = $registry->get('session');

        if (isset($this->session->data['merchant_id'])) {
            $merchant_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE merchant_id = '" . (int)$this->session->data['merchant_id'] . "' AND status = '1'");

            if ($merchant_query->num_rows) {
                $this->merchant_id = $merchant_query->row['merchant_id'];
                $this->firstname = $merchant_query->row['firstname'];
                $this->lastname = $merchant_query->row['lastname'];
                $this->email = $merchant_query->row['email'];
                $this->telephone = $merchant_query->row['telephone'];
                $this->fax = $merchant_query->row['fax'];
                $this->newsletter = $merchant_query->row['newsletter'];
                $this->merchant_group_id = $merchant_query->row['merchant_group_id'];
                $this->address_id = $merchant_query->row['address_id'];

                $this->db->query("UPDATE " . DB_PREFIX . "merchant SET cart = '" . $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '') . "', wishlist = '" . $this->db->escape(isset($this->session->data['wishlist']) ? serialize($this->session->data['wishlist']) : '') . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE merchant_id = '" . (int)$this->merchant_id . "'");

                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant_ip WHERE merchant_id = '" . (int)$this->session->data['merchant_id'] . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

                if (!$query->num_rows) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "merchant_ip SET merchant_id = '" . (int)$this->session->data['merchant_id'] . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', date_added = NOW()");
                }
            } else {
                $this->logout();
            }
        }
    }

    public function login($email, $password, $override = false) {
        if ($override) {
            $merchant_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND status = '1'");
        } else {
            $merchant_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1' AND approved = '1'");
        }

        if ($merchant_query->num_rows) {
            $this->session->data['merchant_id'] = $merchant_query->row['merchant_id'];

            if ($merchant_query->row['cart'] && is_string($merchant_query->row['cart'])) {
                $cart = unserialize($merchant_query->row['cart']);

                foreach ($cart as $key => $value) {
                    if (!array_key_exists($key, $this->session->data['cart'])) {
                        $this->session->data['cart'][$key] = $value;
                    } else {
                        $this->session->data['cart'][$key] += $value;
                    }
                }
            }

            $this->merchant_id = $merchant_query->row['merchant_id'];
            $this->firstname = $merchant_query->row['firstname'];
            $this->lastname = $merchant_query->row['lastname'];
            $this->email = $merchant_query->row['email'];
            $this->telephone = $merchant_query->row['telephone'];
            $this->fax = $merchant_query->row['fax'];
            $this->newsletter = $merchant_query->row['newsletter'];
            $this->merchant_group_id = $merchant_query->row['merchant_group_id'];
            $this->address_id = $merchant_query->row['address_id'];

            $this->db->query("UPDATE " . DB_PREFIX . "merchant SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE merchant_id = '" . (int)$this->merchant_id . "'");

            return true;
        } else {
            return false;
        }
    }

    public function logout() {
        $this->db->query("UPDATE " . DB_PREFIX . "merchant SET cart = '" . $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '') . "' WHERE merchant_id = '" . (int)$this->merchant_id . "'");

        unset($this->session->data['merchant_id']);

        $this->merchant_id = '';
        $this->firstname = '';
        $this->lastname = '';
        $this->email = '';
        $this->telephone = '';
        $this->fax = '';
        $this->newsletter = '';
        $this->merchant_group_id = '';
        $this->address_id = '';
    }

    public function isLogged() {
        return $this->merchant_id;
    }

    public function getId() {
        return $this->merchant_id;
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

    public function getTelephone() {
        return $this->telephone;
    }

    public function getFax() {
        return $this->fax;
    }

    public function getNewsletter() {
        return $this->newsletter;
    }

    public function getGroupId() {
        return $this->merchant_group_id;
    }

    public function getAddressId() {
        return $this->address_id;
    }

    public function getBalance() {
        $query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "merchant_transaction WHERE merchant_id = '" . (int)$this->merchant_id . "'");

        return $query->row['total'];
    }

    public function getRewardPoints() {
        $query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "merchant_reward WHERE merchant_id = '" . (int)$this->merchant_id . "'");

        return $query->row['total'];
    }
}
//End of file merchant.php 