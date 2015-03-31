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
            $data['base'] = HTTPS_SERVER;
        } else {
            $data['base'] = HTTP_SERVER;
        }

        $data['description'] = $this->document->getDescription();
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();
        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');

        $this->load->language('common/header');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_application'] = $this->language->get('text_application');
        $data['text_front'] = $this->language->get('text_front');
        $data['text_help'] = $this->language->get('text_help');
        $data['text_homepage'] = $this->language->get('text_homepage');
        $data['text_documentation'] = $this->language->get('text_documentation');
        $data['text_support'] = $this->language->get('text_support');
        $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());

        if (!isset($this->request->get['token']) || !isset($this->session->data['token']) && ($this->request->get['token'] != $this->session->data['token'])) {
            $data['logged'] = '';

            $data['home'] = $this->url->link('common/dashboard', '', 'SSL');
        } else {
            $data['logged'] = true;

            $data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');

        }

        // For page specific css
        if (isset($this->request->get['route'])) {
            $data['class'] = '';
        }
        else {
                $data['class'] = 'login';
        }

        if ($data['logged']) {
            $data['menu'] = $this->load->controller('common/menu');
        }

        return $this->load->view('common/header.tpl', $data);
    }
}
//End of file header.php 