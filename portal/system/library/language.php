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

class Language {
    private $default = 'english';
    private $directory;
    private $data = array();

    public function __construct($directory = '') {
        $this->directory = $directory;
    }

    public function get($key) {
        return (isset($this->data[$key]) ? $this->data[$key] : $key);
    }

    public function load($filename) {
        $_ = array();

        $file = DIR_LANGUAGE . $this->default . '/' . $filename . '.php';

        if (file_exists($file)) {
            require($file);
        }

        $file = DIR_LANGUAGE . $this->directory . '/' . $filename . '.php';

        if (file_exists($file)) {
            require($file);
        }

        $this->data = array_merge($this->data, $_);

        return $this->data;
    }
}
//End of file language.php 