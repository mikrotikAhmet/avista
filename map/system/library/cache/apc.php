<?php

namespace Cache;

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

class APC {
    private $expire;
    private $cache;

    public function __construct($expire) {
        $this->expire = $expire;
    }

    public function get($key) {
        return apc_fetch(CACHE_PREFIX . $key);
    }

    public function set($key, $value) {
        return apc_store(CACHE_PREFIX . $key, $value, $this->expire);
    }

    public function delete($key) {
        apc_delete(CACHE_PREFIX . $key);
    }
}
//End of file apc.php 