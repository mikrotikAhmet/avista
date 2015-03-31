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

class DB {
    private $db;

    public function __construct($driver, $hostname, $username, $password, $database) {
        $class = 'DB\\' . $driver;

        if (class_exists($class)) {
            $this->db = new $class($hostname, $username, $password, $database);
        } else {
            exit('Error: Could not load database driver ' . $driver . '!');
        }
    }

    public function query($sql) {
        return $this->db->query($sql);
    }

    public function escape($value) {
        return $this->db->escape($value);
    }

    public function countAffected() {
        return $this->db->countAffected();
    }

    public function getLastId() {
        return $this->db->getLastId();
    }
}
//End of file db.php 