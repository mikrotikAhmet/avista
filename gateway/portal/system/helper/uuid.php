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

/*
 * Usage
 * // Named-based UUID.

$v3uuid = UUID::v3('1546058f-5a25-4334-85ae-e68f2a44bbaf', 'SomeRandomString');
$v5uuid = UUID::v5('1546058f-5a25-4334-85ae-e68f2a44bbaf', 'SomeRandomString');

		$v3id = strtoupper(UUID::random_key(10, $readable = true, $hash = true));
		$v3uuid = strtoupper(UUID::v3($this->config->get('config_encryption'), date('Ymd Hsi')));

// Pseudo-random UUID

$v4uuid = UUID::v4();
 */

class UUID {
    public static function v3($namespace, $name) {
        if(!self::is_valid($namespace)) return false;

        // Get hexadecimal components of namespace
        $nhex = str_replace(array('-','{','}'), '', $namespace);

        // Binary Value
        $nstr = '';

        // Convert Namespace UUID to bits
        for($i = 0; $i < strlen($nhex); $i+=2) {
            $nstr .= chr(hexdec($nhex[$i].$nhex[$i+1]));
        }

        // Calculate hash value
        $hash = md5($nstr . $name);

        return sprintf('%08s-%04s-%04x-%04x-%12s',

            // 32 bits for "time_low"
            substr($hash, 0, 8),

            // 16 bits for "time_mid"
            substr($hash, 8, 4),

            // 16 bits for "time_hi_and_version",
            // four most significant bits holds version number 3
            (hexdec(substr($hash, 12, 4)) & 0x0fff) | 0x3000,

            // 16 bits, 8 bits for "clk_seq_hi_res",
            // 8 bits for "clk_seq_low",
            // two most significant bits holds zero and one for variant DCE1.1
            (hexdec(substr($hash, 16, 4)) & 0x3fff) | 0x8000,

            // 48 bits for "node"
            substr($hash, 20, 12)
        );
    }

    public static function v4() {
        return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',

            // 32 bits for "time_low"
            mt_rand(0, 0xffff), mt_rand(0, 0xffff),

            // 16 bits for "time_mid"
            mt_rand(0, 0xffff),

            // 16 bits for "time_hi_and_version",
            // four most significant bits holds version number 4
            mt_rand(0, 0x0fff) | 0x4000,

            // 16 bits, 8 bits for "clk_seq_hi_res",
            // 8 bits for "clk_seq_low",
            // two most significant bits holds zero and one for variant DCE1.1
            mt_rand(0, 0x3fff) | 0x8000,

            // 48 bits for "node"
            mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }

    public static function v5($namespace, $name) {
        if(!self::is_valid($namespace)) return false;

        // Get hexadecimal components of namespace
        $nhex = str_replace(array('-','{','}'), '', $namespace);

        // Binary Value
        $nstr = '';

        // Convert Namespace UUID to bits
        for($i = 0; $i < strlen($nhex); $i+=2) {
            $nstr .= chr(hexdec($nhex[$i].$nhex[$i+1]));
        }

        // Calculate hash value
        $hash = sha1($nstr . $name);

        return sprintf('%08s-%04s-%04x-%04x-%12s',

            // 32 bits for "time_low"
            substr($hash, 0, 8),

            // 16 bits for "time_mid"
            substr($hash, 8, 4),

            // 16 bits for "time_hi_and_version",
            // four most significant bits holds version number 5
            (hexdec(substr($hash, 12, 4)) & 0x0fff) | 0x5000,

            // 16 bits, 8 bits for "clk_seq_hi_res",
            // 8 bits for "clk_seq_low",
            // two most significant bits holds zero and one for variant DCE1.1
            (hexdec(substr($hash, 16, 4)) & 0x3fff) | 0x8000,

            // 48 bits for "node"
            substr($hash, 20, 12)
        );
    }

    public static function random_key($len, $readable = false, $hash = false)
    {
        $key = '';

        if ($hash)
            $key = substr(sha1(uniqid(rand(), true)), 0, $len);
        else if ($readable)
        {
            $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

            for ($i = 0; $i < $len; ++$i)
                $key .= substr($chars, (mt_rand() % strlen($chars)), 1);
        }
        else
            for ($i = 0; $i < $len; ++$i)
                $key .= chr(mt_rand(33, 126));

        return $key;
    }

    public static function is_valid($uuid) {
        return preg_match('/^\{?[0-9a-f]{8}\-?[0-9a-f]{4}\-?[0-9a-f]{4}\-?'.
            '[0-9a-f]{4}\-?[0-9a-f]{12}\}?$/i', $uuid) === 1;
    }

    public static function uniqueId($format = 'random',$length = '20')
    {
        $format = trim($format);
        if ($format == "random" || empty($format)) {
            $final_id = md5(time() . rand(1000, 999999999) . uniqid(rand(), true)) . md5(rand(1, 999) . rand(999, 999999));
        } else {
            $final_id = '';
            $letters_lower = 'abcdefghijklmnopqrstuvwxyz';
            $letters_upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	        $number = '1234567890';
            $the_format = preg_split('//', $format, -1, PREG_SPLIT_NO_EMPTY);
            foreach ($the_format as $aLetter) {
                if ($aLetter == "l") {
                    $temp_rand = rand(0, 25);
                    $get_one = $letters_lower[$temp_rand];
                    $final_id .= $get_one;
                } elseif ($aLetter == "L") {
                    $temp_rand = rand(0, 25);
                    $get_one = $letters_upper[$temp_rand];
                    $final_id .= $get_one;
                } elseif ($aLetter == "n") {
                    $temp_rand = rand(1, 9);
                    $final_id .= $temp_rand;
                } else {
                    $final_id .= $aLetter;
                }
            }
        }

        $final_id = substr($final_id,0,$length);
        return $final_id;
    }
}
//End of file uuid.php 