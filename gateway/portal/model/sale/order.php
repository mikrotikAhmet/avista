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

class ModelSaleOrder extends Model {

    public function addOrder($data,$order_id)
    {
        $this->event->trigger('pre.order.add', $data);

        $this->db->query("INSERT INTO `" . DB_PREFIX . "order` SET order_id = '".(int) $order_id."',invoice_prefix = '" . $this->db->escape($data['invoice_prefix']) . "', application_id = '" . (int)$data['application_id'] . "', application_name = '" . $this->db->escape($data['application_name']) . "', application_url = '" . $this->db->escape($data['application_url']) . "', customer_id = '" . (int)$data['customer_id'] . "', customer_group_id = '" . (int)$data['customer_group_id'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "',  comment = '" . $this->db->escape($data['comment']) . "', total = '" . (float)$data['total'] . "', request = '" . (float)$data['request'] . "',commission = '" . (float)$data['commission'] . "',  tracking = '" . $this->db->escape($data['tracking']) . "', language_id = '" . (int)$data['language_id'] . "', currency_id = '" . (int)$data['currency_id'] . "', currency_code = '" . $this->db->escape($data['currency_code']) . "', currency_value = '" . (float)$data['currency_value'] . "', ip = '" . $this->db->escape($data['ip']) . "', forwarded_ip = '" . $this->db->escape($data['forwarded_ip']) . "', user_agent = '" . $this->db->escape($data['user_agent']) . "', accept_language = '" . $this->db->escape($data['accept_language']) . "', date_added = NOW(), date_modified = NOW()");

        // Products
        if (isset($data['products'])) {
            foreach ($data['products'] as $product) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$order_id . "', product_id = '" . (int)$product['product_id'] . "', name = '" . $this->db->escape($product['name']) . "', price = '" . (float)$product['price'] . "', total = '" . (float)$product['total'] . "'");
            }
        }

        $this->event->trigger('post.order.add', $order_id);
    }

    public function updateOrderStatus($order_id,$status){

        $this->db->query("UPDATE ".DB_PREFIX."order SET order_status_id = '".(int) $status."' WHERE order_id = '".(int) $order_id."'");

    }

    public function getOrder($order_id){

        $result = $this->db->query("SELECT * FROM ".DB_PREFIX."order WHERE order_id = '".(int) $order_id."'");

        return $result->row;

    }
}
//End of file order.php 