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

class ModelAccountOrder extends Model {

    public function addOrder($data,$order_id)
    {
        $this->event->trigger('pre.order.add', $data);

        $this->db->query("INSERT INTO `" . DB_PREFIX . "order` SET order_id = '".(int) $order_id."',invoice_prefix = '" . $this->db->escape($data['invoice_prefix']) . "', application_id = '" . (int)$data['application_id'] . "', application_name = '" . $this->db->escape($data['application_name']) . "', application_url = '" . $this->db->escape($data['application_url']) . "', customer_id = '" . (int)$data['customer_id'] . "', customer_group_id = '" . (int)$data['customer_group_id'] . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . (isset($data['fax']) ? $this->db->escape($data['fax']) : '') . "',  comment = '" . (isset($data['comment']) ? $this->db->escape($data['comment']) : '')  . "', total = '" . (isset($data['total']) ? (float)$data['total'] : 0) . "', request = '" . (float)$data['request'] . "',commission = '" . (isset($data['commission']) ? (float)$data['commission'] : 0) . "',  tracking = '" . (isset($data['tracking']) ? $this->db->escape($data['tracking']) : '')  . "', language_id = '" . (int)$data['language_id'] . "', currency_id = '" . (int)$data['currency_id'] . "', currency_code = '" . $this->db->escape($data['currency_code']) . "',settlement = '".(int) $data['settlement']."', bank_id = '".(int) $data['bank_id']."', currency_value = '" . (float)$data['currency_value'] . "', ip = '" . $this->db->escape($data['ip']) . "', forwarded_ip = '" . $this->db->escape($data['forwarded_ip']) . "', user_agent = '" . $this->db->escape($data['user_agent']) . "', accept_language = '" . $this->db->escape($data['accept_language']) . "', issuer_name = '".$this->db->escape($data['issuer_name'])."', order_status_id = '1',date_added = NOW(), date_modified = NOW()");

	    // Products
	    $this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$order_id . "', product_id = '" . (int)$data['product_id'] . "', name = '" . $this->db->escape($data['product_name']) . "', other = '" . $this->db->escape($data['other']) . "',price = '" . (isset($data['price']) ? (float)$data['price'] : 0) . "'");


        $this->event->trigger('post.order.add', $order_id);
    }

    public function updateOrderStatus($order_id,$status){

        $this->db->query("UPDATE ".DB_PREFIX."order SET order_status_id = '1' WHERE order_id = '".(int) $order_id."'");

    }

    public function getOrder($order_id){

        $result = $this->db->query("SELECT * FROM ".DB_PREFIX."order WHERE order_id = '".(int) $order_id."'");

        return $result->row;

    }

	public function getOrderByInvoice($invoice_id){

		$result = $this->db->query("SELECT * FROM ".DB_PREFIX."order WHERE invoice_no = '".$this->db->escape($invoice_id)."'");

		return $result->row;

	}
	public function getTotalOrdersWaiting($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order`";

		if (!empty($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE order_status_id > '0' OR invoice_no > 0 OR contract_no > 0";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}

//		if (!empty($data['filter_contract'])) {
//			$sql .= " AND contract_no <> '1')";
//		}
//
//		if (!empty($data['filter_invoice'])) {
//			$sql .= " AND invoice_no <> '0')";
//		}

		$sql .= " AND customer_id = '".(int) $this->customer->getId()."'";

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalOrders($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order`";

		if (!empty($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}

		if (!empty($data['filter_contract'])) {
			$sql .= " AND contract_no > '1')";
		}

		if (!empty($data['filter_invoice'])) {
			$sql .= " AND invoice_no <> '0')";
		}

		$sql .= " AND customer_id = '".(int) $this->customer->getId()."'";

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getOrders($data = array()) {
		$sql = "SELECT o.order_id, o.invoice_no, o.contract_no, CONCAT(o.firstname, ' ', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS status,  o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM `" . DB_PREFIX . "order` o";

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			} else {

			}
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(o.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(o.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}

		$sql .= " AND o.customer_id = '".(int) $this->customer->getId()."'";

		$sort_data = array(
			'o.order_id',
			'status',
			'o.date_added',
			'o.date_modified',
			'o.total'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY o.order_id";
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
}
//End of file order.php 