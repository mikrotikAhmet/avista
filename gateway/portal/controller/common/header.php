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

class ControllerCommonHeader extends Controller {

    public function index() {
        $data['title'] = $this->document->getTitle();

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
	        $map_server = HTTPS_MAP;
        } else {
            $server = $this->config->get('config_url');
	        $map_server = HTTP_MAP;
        }

        $data['base'] = $server;
        $data['description'] = $this->document->getDescription();
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();
        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');
        $data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
        $data['name'] = $this->config->get('config_name');

        if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
            $data['icon'] = $map_server.'image/' . $this->config->get('config_icon');
        } else {
            $data['icon'] = '';
        }
        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = $map_server.'image/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }
        $this->load->language('common/header');

        $data['text_home'] = $this->language->get('text_home');
        $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

        $data['text_all'] = $this->language->get('text_all');

        $data['home'] = $this->url->link('common/dashboard');
        $data['logged'] = $this->customer->isLogged();
        $data['logout'] = $this->url->link('account/logout', '', 'SSL');

        $status = true;
//
        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

            foreach ($robots as $robot) {
                if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
                    $status = false;

                    break;
                }
            }
        }

//        $data['language'] = $this->load->controller('common/language');
//        $data['currency'] = $this->load->controller('common/currency');
//        $data['search'] = $this->load->controller('common/search');
//        $data['cart'] = $this->load->controller('common/cart');

        // For page specific css
	    if (!$this->customer->isLogged()) {
		    $data['class'] = 'login';
        } else {
            $data['class'] = 'common-home';
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
        } else {
            return $this->load->view('default/template/common/header.tpl', $data);
        }
    }
}
//End of file header.php 