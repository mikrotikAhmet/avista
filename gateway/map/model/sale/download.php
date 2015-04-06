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

class ModelSaleDownload extends Model{

    public function getDownload($download_id) {

            $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_document`  WHERE document_id = '" . (int)$download_id . "'");

            return $query->row;

    }
}
//End of file download.php 