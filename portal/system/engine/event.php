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

class Event {
    private $data = array();

    public function __construct($registry) {
        $this->registry = $registry;
    }

    public function register($key, $action) {
        $this->data[$key][] = $action;
    }

    public function unregister($key, $action) {
        unset($this->data[$key]);
    }

    public function trigger($key, &$arg = array()) {
        if (isset($this->data[$key])) {
            foreach ($this->data[$key] as $event) {
                $action = new Action($event, $arg);
                $action->execute($this->registry);
            }
        }
    }
}
//End of file event.php 