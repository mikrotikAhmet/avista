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

class ModelAccountMerchant extends Model {

    public function addMerchant($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "merchant SET merchant_group_id = '" . (int)$data['merchant_group_id'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? serialize($data['custom_field']) : '') . "', newsletter = '" . (int)$data['newsletter'] . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '" . (int)$data['status'] . "', approved = '" . (int)$data['approved'] . "', safe = '" . (int)$data['safe'] . "', date_added = NOW()");

        $merchant_id = $this->db->getLastId();

        if (isset($data['address'])) {
            foreach ($data['address'] as $address) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "address SET merchant_id = '" . (int)$merchant_id . "', firstname = '" . $this->db->escape($address['firstname']) . "', lastname = '" . $this->db->escape($address['lastname']) . "', company = '" . $this->db->escape($address['company']) . "', address_1 = '" . $this->db->escape($address['address_1']) . "', address_2 = '" . $this->db->escape($address['address_2']) . "', city = '" . $this->db->escape($address['city']) . "', postcode = '" . $this->db->escape($address['postcode']) . "', country_id = '" . (int)$address['country_id'] . "', zone_id = '" . (int)$address['zone_id'] . "', custom_field = '" . $this->db->escape(isset($address['custom_field']) ? serialize($address['custom_field']) : '') . "'");

                if (isset($address['default'])) {
                    $address_id = $this->db->getLastId();

                    $this->db->query("UPDATE " . DB_PREFIX . "merchant SET address_id = '" . (int)$address_id . "' WHERE merchant_id = '" . (int)$merchant_id . "'");
                }
            }
        }
    }

    public function editMerchant($merchant_id, $data) {
        if (!isset($data['custom_field'])) {
            $data['custom_field'] = array();
        }

        $this->db->query("UPDATE " . DB_PREFIX . "merchant SET merchant_group_id = '" . (int)$data['merchant_group_id'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? serialize($data['custom_field']) : '') . "', newsletter = '" . (int)$data['newsletter'] . "', status = '" . (int)$data['status'] . "', approved = '" . (int)$data['approved'] . "', safe = '" . (int)$data['safe'] . "' WHERE merchant_id = '" . (int)$merchant_id . "'");

        if ($data['password']) {
            $this->db->query("UPDATE " . DB_PREFIX . "merchant SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE merchant_id = '" . (int)$merchant_id . "'");
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE merchant_id = '" . (int)$merchant_id . "'");

        if (isset($data['address'])) {
            foreach ($data['address'] as $address) {
                if (!isset($address['custom_field'])) {
                    $address['custom_field'] = array();
                }

                $this->db->query("INSERT INTO " . DB_PREFIX . "address SET address_id = '" . (int)$address['address_id'] . "', merchant_id = '" . (int)$merchant_id . "', firstname = '" . $this->db->escape($address['firstname']) . "', lastname = '" . $this->db->escape($address['lastname']) . "', company = '" . $this->db->escape($address['company']) . "', address_1 = '" . $this->db->escape($address['address_1']) . "', address_2 = '" . $this->db->escape($address['address_2']) . "', city = '" . $this->db->escape($address['city']) . "', postcode = '" . $this->db->escape($address['postcode']) . "', country_id = '" . (int)$address['country_id'] . "', zone_id = '" . (int)$address['zone_id'] . "', custom_field = '" . $this->db->escape(isset($address['custom_field']) ? serialize($address['custom_field']) : '') . "'");

                if (isset($address['default'])) {
                    $address_id = $this->db->getLastId();

                    $this->db->query("UPDATE " . DB_PREFIX . "merchant SET address_id = '" . (int)$address_id . "' WHERE merchant_id = '" . (int)$merchant_id . "'");
                }
            }
        }
    }

    public function editToken($merchant_id, $token) {
        $this->db->query("UPDATE " . DB_PREFIX . "merchant SET token = '" . $this->db->escape($token) . "' WHERE merchant_id = '" . (int)$merchant_id . "'");
    }

    public function deleteMerchant($merchant_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant WHERE merchant_id = '" . (int)$merchant_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_reward WHERE merchant_id = '" . (int)$merchant_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_transaction WHERE merchant_id = '" . (int)$merchant_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_ip WHERE merchant_id = '" . (int)$merchant_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE merchant_id = '" . (int)$merchant_id . "'");
    }

    public function getMerchant($merchant_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "merchant WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->row;
    }

    public function getMerchantByEmail($email) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "merchant WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

        return $query->row;
    }

    public function getMerchants($data = array()) {
        $sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name, cgd.name AS merchant_group FROM " . DB_PREFIX . "merchant c LEFT JOIN " . DB_PREFIX . "merchant_group_description cgd ON (c.merchant_group_id = cgd.merchant_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        $implode = array();

        if (!empty($data['filter_name'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_email'])) {
            $implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }

        if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
            $implode[] = "c.newsletter = '" . (int)$data['filter_newsletter'] . "'";
        }

        if (!empty($data['filter_merchant_group_id'])) {
            $implode[] = "c.merchant_group_id = '" . (int)$data['filter_merchant_group_id'] . "'";
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = "c.merchant_id IN (SELECT merchant_id FROM " . DB_PREFIX . "merchant_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $implode[] = "c.status = '" . (int)$data['filter_status'] . "'";
        }

        if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
            $implode[] = "c.approved = '" . (int)$data['filter_approved'] . "'";
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        if ($implode) {
            $sql .= " AND " . implode(" AND ", $implode);
        }

        $sort_data = array(
            'name',
            'c.email',
            'merchant_group',
            'c.status',
            'c.approved',
            'c.ip',
            'c.date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY name";
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

    public function approve($merchant_id) {
        $merchant_info = $this->getMerchant($merchant_id);

        if ($merchant_info) {
            $this->db->query("UPDATE " . DB_PREFIX . "merchant SET approved = '1' WHERE merchant_id = '" . (int)$merchant_id . "'");

            $this->load->language('mail/merchant');

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($merchant_info['store_id']);

            if ($store_info) {
                $store_name = $store_info['name'];
                $store_url = $store_info['url'] . 'index.php?route=account/login';
            } else {
                $store_name = $this->config->get('config_name');
                $store_url = HTTP_CATALOG . 'index.php?route=account/login';
            }

            $message  = sprintf($this->language->get('text_approve_welcome'), $store_name) . "\n\n";
            $message .= $this->language->get('text_approve_login') . "\n";
            $message .= $store_url . "\n\n";
            $message .= $this->language->get('text_approve_services') . "\n\n";
            $message .= $this->language->get('text_approve_thanks') . "\n";
            $message .= $store_name;

            $mail = new Mail($this->config->get('config_mail'));
            $mail->setTo($merchant_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($store_name);
            $mail->setSubject(sprintf($this->language->get('text_approve_subject'), $store_name));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
        }
    }

    public function getAddress($address_id) {
        $address_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE address_id = '" . (int)$address_id . "'");

        if ($address_query->num_rows) {
            $country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$address_query->row['country_id'] . "'");

            if ($country_query->num_rows) {
                $country = $country_query->row['name'];
                $iso_code_2 = $country_query->row['iso_code_2'];
                $iso_code_3 = $country_query->row['iso_code_3'];
                $address_format = $country_query->row['address_format'];
            } else {
                $country = '';
                $iso_code_2 = '';
                $iso_code_3 = '';
                $address_format = '';
            }

            $zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$address_query->row['zone_id'] . "'");

            if ($zone_query->num_rows) {
                $zone = $zone_query->row['name'];
                $zone_code = $zone_query->row['code'];
            } else {
                $zone = '';
                $zone_code = '';
            }

            return array(
                'address_id'     => $address_query->row['address_id'],
                'merchant_id'    => $address_query->row['merchant_id'],
                'firstname'      => $address_query->row['firstname'],
                'lastname'       => $address_query->row['lastname'],
                'company'        => $address_query->row['company'],
                'address_1'      => $address_query->row['address_1'],
                'address_2'      => $address_query->row['address_2'],
                'postcode'       => $address_query->row['postcode'],
                'city'           => $address_query->row['city'],
                'zone_id'        => $address_query->row['zone_id'],
                'zone'           => $zone,
                'zone_code'      => $zone_code,
                'country_id'     => $address_query->row['country_id'],
                'country'        => $country,
                'iso_code_2'     => $iso_code_2,
                'iso_code_3'     => $iso_code_3,
                'address_format' => $address_format,
                'custom_field'   => unserialize($address_query->row['custom_field'])
            );
        }
    }

    public function getAddresses($merchant_id) {
        $address_data = array();

        $query = $this->db->query("SELECT address_id FROM " . DB_PREFIX . "address WHERE merchant_id = '" . (int)$merchant_id . "'");

        foreach ($query->rows as $result) {
            $address_info = $this->getAddress($result['address_id']);

            if ($address_info) {
                $address_data[$result['address_id']] = $address_info;
            }
        }

        return $address_data;
    }

    public function getTotalMerchants($data = array()) {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant";

        $implode = array();

        if (!empty($data['filter_name'])) {
            $implode[] = "CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_email'])) {
            $implode[] = "email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
        }

        if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
            $implode[] = "newsletter = '" . (int)$data['filter_newsletter'] . "'";
        }

        if (!empty($data['filter_merchant_group_id'])) {
            $implode[] = "merchant_group_id = '" . (int)$data['filter_merchant_group_id'] . "'";
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = "merchant_id IN (SELECT merchant_id FROM " . DB_PREFIX . "merchant_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $implode[] = "status = '" . (int)$data['filter_status'] . "'";
        }

        if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
            $implode[] = "approved = '" . (int)$data['filter_approved'] . "'";
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

    public function getTotalMerchantsAwaitingApproval() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant WHERE status = '0' OR approved = '0'");

        return $query->row['total'];
    }

    public function getTotalAddressesByMerchantId($merchant_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->row['total'];
    }

    public function getTotalAddressesByCountryId($country_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE country_id = '" . (int)$country_id . "'");

        return $query->row['total'];
    }

    public function getTotalAddressesByZoneId($zone_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE zone_id = '" . (int)$zone_id . "'");

        return $query->row['total'];
    }

    public function getTotalMerchantsByMerchantGroupId($merchant_group_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant WHERE merchant_group_id = '" . (int)$merchant_group_id . "'");

        return $query->row['total'];
    }

    public function addHistory($merchant_id, $comment) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "merchant_history SET merchant_id = '" . (int)$merchant_id . "', comment = '" . $this->db->escape(strip_tags($comment)) . "', date_added = NOW()");
    }

    public function getHistories($merchant_id, $start = 0, $limit = 10) {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        $query = $this->db->query("SELECT comment, date_added FROM " . DB_PREFIX . "merchant_history WHERE merchant_id = '" . (int)$merchant_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

        return $query->rows;
    }

    public function getTotalHistories($merchant_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant_history WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->row['total'];
    }

    public function addTransaction($merchant_id, $description = '', $amount = '', $order_id = 0) {
        $merchant_info = $this->getMerchant($merchant_id);

        if ($merchant_info) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "merchant_transaction SET merchant_id = '" . (int)$merchant_id . "', order_id = '" . (int)$order_id . "', description = '" . $this->db->escape($description) . "', amount = '" . (float)$amount . "', date_added = NOW()");

            $this->load->language('mail/merchant');

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($merchant_info['store_id']);

            if ($store_info) {
                $store_name = $store_info['name'];
            } else {
                $store_name = $this->config->get('config_name');
            }

            $message  = sprintf($this->language->get('text_transaction_received'), $this->currency->format($amount, $this->config->get('config_currency'))) . "\n\n";
            $message .= sprintf($this->language->get('text_transaction_total'), $this->currency->format($this->getTransactionTotal($merchant_id)));

            $mail = new Mail($this->config->get('config_mail'));
            $mail->setTo($merchant_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($store_name);
            $mail->setSubject(sprintf($this->language->get('text_transaction_subject'), $this->config->get('config_name')));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
        }
    }

    public function deleteTransaction($order_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_transaction WHERE order_id = '" . (int)$order_id . "'");
    }

    public function getTransactions($merchant_id, $start = 0, $limit = 10) {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant_transaction WHERE merchant_id = '" . (int)$merchant_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

        return $query->rows;
    }

    public function getTotalTransactions($merchant_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "merchant_transaction WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->row['total'];
    }

    public function getTransactionTotal($merchant_id) {
        $query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "merchant_transaction WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->row['total'];
    }

    public function getTotalTransactionsByOrderId($order_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant_transaction WHERE order_id = '" . (int)$order_id . "'");

        return $query->row['total'];
    }

    public function addReward($merchant_id, $description = '', $points = '', $order_id = 0) {
        $merchant_info = $this->getMerchant($merchant_id);

        if ($merchant_info) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "merchant_reward SET merchant_id = '" . (int)$merchant_id . "', order_id = '" . (int)$order_id . "', points = '" . (int)$points . "', description = '" . $this->db->escape($description) . "', date_added = NOW()");

            $this->load->language('mail/merchant');

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($merchant_info['store_id']);

            if ($store_info) {
                $store_name = $store_info['name'];
            } else {
                $store_name = $this->config->get('config_name');
            }

            $message  = sprintf($this->language->get('text_reward_received'), $points) . "\n\n";
            $message .= sprintf($this->language->get('text_reward_total'), $this->getRewardTotal($merchant_id));

            $mail = new Mail($this->config->get('config_mail'));
            $mail->setTo($merchant_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($store_name);
            $mail->setSubject(sprintf($this->language->get('text_reward_subject'), $store_name));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
        }
    }

    public function deleteReward($order_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_reward WHERE order_id = '" . (int)$order_id . "' AND points > 0");
    }

    public function getRewards($merchant_id, $start = 0, $limit = 10) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant_reward WHERE merchant_id = '" . (int)$merchant_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

        return $query->rows;
    }

    public function getTotalRewards($merchant_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant_reward WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->row['total'];
    }

    public function getRewardTotal($merchant_id) {
        $query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "merchant_reward WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->row['total'];
    }

    public function getTotalMerchantRewardsByOrderId($order_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant_reward WHERE order_id = '" . (int)$order_id . "'");

        return $query->row['total'];
    }

    public function getIps($merchant_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant_ip WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->rows;
    }

    public function getTotalIps($merchant_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant_ip WHERE merchant_id = '" . (int)$merchant_id . "'");

        return $query->row['total'];
    }

    public function getTotalMerchantsByIp($ip) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant_ip WHERE ip = '" . $this->db->escape($ip) . "'");

        return $query->row['total'];
    }

    public function addBanIp($ip) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant_ban_ip` SET `ip` = '" . $this->db->escape($ip) . "'");
    }

    public function removeBanIp($ip) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "merchant_ban_ip` WHERE `ip` = '" . $this->db->escape($ip) . "'");
    }

    public function getTotalBanIpsByIp($ip) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "merchant_ban_ip` WHERE `ip` = '" . $this->db->escape($ip) . "'");

        return $query->row['total'];
    }

    public function getTotalLoginAttempts($email) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_login` WHERE `email` = '" . $this->db->escape($email) . "'");

        return $query->row;
    }

    public function deleteLoginAttempts($email) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "merchant_login` WHERE `email` = '" . $this->db->escape($email) . "'");
    }
}
//End of file merchant.php 