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

class Cache {
    private $cache;

    public function __construct($driver, $expire = 3600) {
        $class = 'Cache\\' . $driver;

        if (class_exists($class)) {
            $this->cache = new $class($expire);
        } else {
            exit('Error: Could not load cache driver ' . $driver . ' cache!');
        }
    }

    public function get($key) {
        return $this->cache->get($key);
    }

    public function set($key, $value) {
        return $this->cache->set($key, $value);
    }

    public function delete($key) {
        return $this->cache->delete($key);
    }
}
//End of file cache.php 