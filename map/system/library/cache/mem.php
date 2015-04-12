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

class Mem {
    private $expire;
    private $cache;

    public function __construct($expire) {
        $this->expire = $expire;

        $this->cache = new Memcache();
        $this->cache->pconnect(CACHE_HOSTNAME, CACHE_PORT);
    }

    public function get($key) {
        return $this->cache->get(CACHE_PREFIX . $key);
    }

    public function set($key,$value) {
        return $this->cache->set(CACHE_PREFIX . $key, $value, MEMCACHE_COMPRESSED, $this->expire);
    }

    public function delete($key) {
        $this->cache->delete(CACHE_PREFIX . $key);
    }
}
//End of file mem.php 