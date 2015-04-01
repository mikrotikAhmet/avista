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

class ModelAccountMerchantBanIp extends Model {
    public function addMerchantBanIp($data) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant_ban_ip` SET `ip` = '" . $this->db->escape($data['ip']) . "'");
    }

    public function editMerchantBanIp($merchant_ban_ip_id, $data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "merchant_ban_ip` SET `ip` = '" . $this->db->escape($data['ip']) . "' WHERE merchant_ban_ip_id = '" . (int)$merchant_ban_ip_id . "'");
    }

    public function deleteMerchantBanIp($merchant_ban_ip_id) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "merchant_ban_ip` WHERE merchant_ban_ip_id = '" . (int)$merchant_ban_ip_id . "'");
    }

    public function getMerchantBanIp($merchant_ban_ip_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_ban_ip` WHERE merchant_ban_ip_id = '" . (int)$merchant_ban_ip_id . "'");

        return $query->row;
    }

    public function getMerchantBanIps($data = array()) {
        $sql = "SELECT *, (SELECT COUNT(DISTINCT merchant_id) FROM `" . DB_PREFIX . "merchant_ip` ci WHERE ci.ip = cbi.ip) AS total FROM `" . DB_PREFIX . "merchant_ban_ip` cbi";

        $sql .= " ORDER BY `ip`";

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

    public function getTotalMerchantBanIps($data = array()) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "merchant_ban_ip`");

        return $query->row['total'];
    }
}
//End of file merchant_ban_ip.php 