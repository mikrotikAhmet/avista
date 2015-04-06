<?php
/**
 *
 * Semite ADP (Application Development Program) for PHP 5.1.6 or newer
 *
 * @package		Open Gateway Core Processor Application
 * @author		Semite LLC. Dev Team
 * @copyright	Copyright (c) 2008 - 2015, Semite LLC.
 * @license		http://www.semitepayment.com/user_guide/license.html
 * @link		http://www.semitepayment.com
 * @version		Version 1.0.1
 */
// ------------------------------------------------------------------------


// HTTP
define('HTTP_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/');
define('HTTP_PORTAL', 'http://'.$_SERVER['HTTP_HOST'].'/portal/');
define('HTTP_IMAGE', 'http://'.$_SERVER['HTTP_HOST'].'/map/');

// HTTPS
define('HTTPS_SERVER', 'https://'.$_SERVER['HTTP_HOST'].'/');
define('HTTPS_PORTAL', 'https://'.$_SERVER['HTTP_HOST'].'/portal/');
define('HTTPS_IMAGE', 'https://'.$_SERVER['HTTP_HOST'].'/map/');

// DIR
define('DIR_APPLICATION', APPLICATION_PATH_COR.'map/');
define('DIR_SYSTEM', APPLICATION_PATH_COR.'map/system/');
define('DIR_LANGUAGE', APPLICATION_PATH_COR.'map/language/');
define('DIR_TEMPLATE', APPLICATION_PATH_COR.'map/view/template/');
define('DIR_CONFIG', APPLICATION_PATH_COR.'map/system/config/');
define('DIR_IMAGE', APPLICATION_PATH_COR.'map/image/');
define('DIR_CACHE', APPLICATION_PATH_COR.'map/system/cache/');
define('DIR_DOWNLOAD', APPLICATION_PATH_COR.'map/download/');
define('DIR_DOCUMENT', APPLICATION_PATH_COR.'map/system/document/');
define('DIR_LOGS', APPLICATION_PATH_COR.'map/system/logs/');
define('DIR_MODIFICATION', APPLICATION_PATH_COR.'map/system/modification/');
define('DIR_PORTAL', APPLICATION_PATH_COR.'portal/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'ahm671et');
define('DB_DATABASE', 'avista_ebanking');
define('DB_PREFIX', 'engine4_');

//End of file config.php 