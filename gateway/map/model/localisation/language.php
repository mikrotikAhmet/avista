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

class ModelLocalisationLanguage extends Model {
    public function addLanguage($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "language SET name = '" . $this->db->escape($data['name']) . "', code = '" . $this->db->escape($data['code']) . "', locale = '" . $this->db->escape($data['locale']) . "', directory = '" . $this->db->escape($data['directory']) . "', image = '" . $this->db->escape($data['image']) . "', sort_order = '" . $this->db->escape($data['sort_order']) . "', status = '" . (int)$data['status'] . "'");

        $this->cache->delete('language');

        $language_id = $this->db->getLastId();


        // Merchant Group
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant_group_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

        foreach ($query->rows as $merchant_group) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "merchant_group_description SET merchant_group_id = '" . (int)$merchant_group['merchant_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($merchant_group['name']) . "', description = '" . $this->db->escape($merchant_group['description']) . "'");
        }

        // Custom Field
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_field_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

        foreach ($query->rows as $custom_field) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "custom_field_description SET custom_field_id = '" . (int)$custom_field['custom_field_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($custom_field['name']) . "'");
        }

        // Custom Field Value
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_field_value_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

        foreach ($query->rows as $custom_field_value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "custom_field_value_description SET custom_field_value_id = '" . (int)$custom_field_value['custom_field_value_id'] . "', language_id = '" . (int)$language_id . "', custom_field_id = '" . (int)$custom_field_value['custom_field_id'] . "', name = '" . $this->db->escape($custom_field_value['name']) . "'");
        }
    }

    public function editLanguage($language_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "language SET name = '" . $this->db->escape($data['name']) . "', code = '" . $this->db->escape($data['code']) . "', locale = '" . $this->db->escape($data['locale']) . "', directory = '" . $this->db->escape($data['directory']) . "', image = '" . $this->db->escape($data['image']) . "', sort_order = '" . $this->db->escape($data['sort_order']) . "', status = '" . (int)$data['status'] . "' WHERE language_id = '" . (int)$language_id . "'");

        $this->cache->delete('language');
    }

    public function deleteLanguage($language_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "language WHERE language_id = '" . (int)$language_id . "'");

        $this->cache->delete('language');

        $this->db->query("DELETE FROM " . DB_PREFIX . "merchant_group_description WHERE language_id = '" . (int)$language_id . "'");
    }

    public function getLanguage($language_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "language WHERE language_id = '" . (int)$language_id . "'");

        return $query->row;
    }

    public function getLanguages($data = array()) {
        if ($data) {
            $sql = "SELECT * FROM " . DB_PREFIX . "language";

            $sort_data = array(
                'name',
                'code',
                'sort_order'
            );

            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                $sql .= " ORDER BY " . $data['sort'];
            } else {
                $sql .= " ORDER BY sort_order, name";
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
        } else {
            $language_data = $this->cache->get('language');

            if (!$language_data) {
                $language_data = array();

                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "language ORDER BY sort_order, name");

                foreach ($query->rows as $result) {
                    $language_data[$result['code']] = array(
                        'language_id' => $result['language_id'],
                        'name'        => $result['name'],
                        'code'        => $result['code'],
                        'locale'      => $result['locale'],
                        'image'       => $result['image'],
                        'directory'   => $result['directory'],
                        'sort_order'  => $result['sort_order'],
                        'status'      => $result['status']
                    );
                }

                $this->cache->set('language', $language_data);
            }

            return $language_data;
        }
    }

    public function getTotalLanguages() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "language");

        return $query->row['total'];
    }
}
//End of file language.php 