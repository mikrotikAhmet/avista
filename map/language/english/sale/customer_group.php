<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/4/15
 * Time: 2:38 PM
 */
/**
 * @package     Semite LLC avista
 * @version     customer_group.php 4/4/15 root
 * @copyright   Copyright (c) 2014 Semite LLC .
 * @license     http://www.semitepayment.com/license/
 */
/**
 * Description of customer_group.php
 *
 * @author root
 */
// Heading
$_['heading_title']     = 'Customer Groups';

// Text
$_['text_success']      = 'Success: You have modified customer groups!';
$_['text_list']         = 'Customer Group List';
$_['text_add']          = 'Add Customer Group';
$_['text_edit']         = 'Edit Customer Group';

// Column
$_['column_name']       = 'Customer Group Name';
$_['column_sort_order'] = 'Sort Order';
$_['column_action']     = 'Action';

// Entry
$_['entry_name']        = 'Customer Group Name';
$_['entry_description'] = 'Description';
$_['entry_approval']    = 'Approve New Customers';
$_['entry_sort_order']  = 'Sort Order';

// Help
$_['help_approval']     = 'Customers must be approved by an administrator before they can login.';

// Error
$_['error_permission']   = 'Warning: You do not have permission to modify customer groups!';
$_['error_name']         = 'Customer Group Name must be between 3 and 32 characters!';
$_['error_default']      = 'Warning: This customer group cannot be deleted as it is currently assigned as the default application customer group!';
$_['error_application']        = 'Warning: This customer group cannot be deleted as it is currently assigned to %s applications!';
$_['error_customer']     = 'Warning: This customer group cannot be deleted as it is currently assigned to %s customers!';