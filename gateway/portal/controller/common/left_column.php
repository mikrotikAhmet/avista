<?php
if (!defined('DIR_APPLICATION'))
	exit('No direct script access allowed');
	
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/2/15
 * Time: 7:14 PM
 */

/**
 * Smatsa Question Bank
 *
 * @category   PhpStorm
 * @package    smatsa
 * @copyright  Copyright 2009-2014 Semite d.o.o. Developments
 * @license    http://www.semitepayment.com/license/
 * @version    home.php 10/22/14 ahmet $
 * @author     Ahmet GOUDENOGLU <ahmet.gudenoglu@semitepayment.com>
 */

/**
 * @category   PhpStorm
 * @package    smatsa
 * @copyright  Copyright 2009-2014 Semite d.o.o. Developments
 * @license    http://www.semitepayment.com/license/
 */

class ControllerCommonLeftColumn extends Controller {
	public function index() {

		$data = array();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/left_column.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/left_column.tpl', $data);
		} else {
			return $this->load->view('default/template/common/left_column.tpl', $data);
		}
	}
}