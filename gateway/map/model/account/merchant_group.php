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

class ModelAccountMerchantGroup extends Model {
    public function addMerchantGroup($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "merchant_group SET approval = '" . (int)$data['approval'] . "', sort_order = '" . (int)$data['sort_order'] . "'");

        $merchant_group_id = $this->db->getLastId();

        foreach ($data['merchant_group_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "merchant_group_description SET merchant_group_id = '" . (int)$merchant_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
        }
    }

    public function editMerchantGroup($merchant_group_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "merchant_group SET approval = '" . (int)$data['approval'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE merchant_group_id = '" . (int)$merchant_group_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_group_description WHERE merchant_group_id = '" . (int)$merchant_group_id . "'");

        foreach ($data['merchant_group_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "merchant_group_description SET merchant_group_id = '" . (int)$merchant_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
        }
    }

    public function deleteMerchantGroup($merchant_group_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_group WHERE merchant_group_id = '" . (int)$merchant_group_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_group_description WHERE merchant_group_id = '" . (int)$merchant_group_id . "'");
    }

    public function getMerchantGroup($merchant_group_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "merchant_group cg LEFT JOIN " . DB_PREFIX . "merchant_group_description cgd ON (cg.merchant_group_id = cgd.merchant_group_id) WHERE cg.merchant_group_id = '" . (int)$merchant_group_id . "' AND cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function getMerchantGroups($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "merchant_group cg LEFT JOIN " . DB_PREFIX . "merchant_group_description cgd ON (cg.merchant_group_id = cgd.merchant_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        $sort_data = array(
            'cgd.name',
            'cg.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY cgd.name";
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

    public function getMerchantGroupDescriptions($merchant_group_id) {
        $merchant_group_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant_group_description WHERE merchant_group_id = '" . (int)$merchant_group_id . "'");

        foreach ($query->rows as $result) {
            $merchant_group_data[$result['language_id']] = array(
                'name'        => $result['name'],
                'description' => $result['description']
            );
        }

        return $merchant_group_data;
    }

    public function getTotalMerchantGroups() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant_group");

        return $query->row['total'];
    }
}
//End of file merchant_group.php 