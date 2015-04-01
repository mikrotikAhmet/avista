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

class ModelSettingSetting extends Model {
    public function getSetting($code, $application_id = 0) {
        $setting_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE application_id = '" . (int)$application_id . "' AND `code` = '" . $this->db->escape($code) . "'");

        foreach ($query->rows as $result) {
            if (!$result['serialized']) {
                $setting_data[$result['key']] = $result['value'];
            } else {
                $setting_data[$result['key']] = unserialize($result['value']);
            }
        }

        return $setting_data;
    }

    public function editSetting($code, $data, $application_id = 0) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "setting` WHERE application_id = '" . (int)$application_id . "' AND `code` = '" . $this->db->escape($code) . "'");

        foreach ($data as $key => $value) {
            if (substr($key, 0, strlen($code)) == $code) {
                if (!is_array($value)) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "setting SET application_id = '" . (int)$application_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
                } else {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "setting SET application_id = '" . (int)$application_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
                }
            }
        }
    }

    public function deleteSetting($code, $application_id = 0) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE application_id = '" . (int)$application_id . "' AND `code` = '" . $this->db->escape($code) . "'");
    }

    public function editSettingValue($code = '', $key = '', $value = '', $application_id = 0) {
        if (!is_array($value)) {
            $this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape($value) . "' WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "' AND application_id = '" . (int)$application_id . "'");
        } else {
            $this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1' WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "' AND application_id = '" . (int)$application_id . "'");
        }
    }
}
//End of file settin.php 