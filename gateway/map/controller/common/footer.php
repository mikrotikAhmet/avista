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

class ControllerCommonFooter extends Controller {
    public function index() {
        $this->load->language('common/footer');

        $data['text_footer'] = $this->language->get('text_footer');

        if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
            $data['text_version'] = sprintf($this->language->get('text_version'), VERSION);
        } else {
            $data['text_version'] = '';
        }

        return $this->load->view('common/footer.tpl', $data);
    }
}
//End of file footer.php 