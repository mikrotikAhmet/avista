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

// Constants
define('_ENGINE_R_BASE', dirname($_SERVER['SCRIPT_NAME']));
define('_ENGINE_R_FILE', $_SERVER['SCRIPT_NAME']);
define('_ENGINE_R_REL', 'map');
define('_ENGINE_R_TARG', 'index.php');

// Main
include dirname(__FILE__) . DIRECTORY_SEPARATOR
    . _ENGINE_R_REL . DIRECTORY_SEPARATOR
    . _ENGINE_R_TARG;


//End of file index.php 