<?php echo $header; ?>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-exclamation-circle"></i> <?php echo $heading_title; ?></h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="pull-right">
                <button type="submit" form="form-setting" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
        </div>
        <!-- /.row -->
        <br/>
        <div class="row">
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
            <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                    <li><a href="#tab-application" data-toggle="tab"><?php echo $tab_application; ?></a></li>
                    <li><a href="#tab-local" data-toggle="tab"><?php echo $tab_local; ?></a></li>
                    <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
                    <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
                    <li><a href="#tab-ftp" data-toggle="tab"><?php echo $tab_ftp; ?></a></li>
                    <li><a href="#tab-mail" data-toggle="tab"><?php echo $tab_mail; ?></a></li>
                    <li><a href="#tab-fraud" data-toggle="tab"><?php echo $tab_fraud; ?></a></li>
                    <li><a href="#tab-server" data-toggle="tab"><?php echo $tab_server; ?></a></li>
                </ul>
                <br/>
                <div class="tab-content">
                <div class="tab-pane active" id="tab-general">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_name" value="<?php echo $config_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-owner"><?php echo $entry_owner; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_owner" value="<?php echo $config_owner; ?>" placeholder="<?php echo $entry_owner; ?>" id="input-owner" class="form-control" />
                            <?php if ($error_owner) { ?>
                            <div class="text-danger"><?php echo $error_owner; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-address"><?php echo $entry_address; ?></label>
                        <div class="col-sm-10">
                            <textarea name="config_address" placeholder="<?php echo $entry_address; ?>" rows="5" id="input-address" class="form-control"><?php echo $config_address; ?></textarea>
                            <?php if ($error_address) { ?>
                            <div class="text-danger"><?php echo $error_address; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-geocode"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_geocode; ?>"><?php echo $entry_geocode; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_geocode" value="<?php echo $config_geocode; ?>" placeholder="<?php echo $entry_geocode; ?>" id="input-geocode" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_email" value="<?php echo $config_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                            <?php if ($error_email) { ?>
                            <div class="text-danger"><?php echo $error_email; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                            <?php if ($error_telephone) { ?>
                            <div class="text-danger"><?php echo $error_telephone; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_fax" value="<?php echo $config_fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                        <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                            <input type="hidden" name="config_image" value="<?php echo $config_image; ?>" id="input-image" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-open"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_open; ?>"><?php echo $entry_open; ?></span></label>
                        <div class="col-sm-10">
                            <textarea name="config_open" rows="5" placeholder="<?php echo $entry_open; ?>" id="input-open" class="form-control"><?php echo $config_open; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-comment"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_comment; ?>"><?php echo $entry_comment; ?></span></label>
                        <div class="col-sm-10">
                            <textarea name="config_comment" rows="5" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control"><?php echo $config_comment; ?></textarea>
                        </div>
                    </div>
                    <?php if ($locations) { ?>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_location; ?>"><?php echo $entry_location; ?></span></label>
                        <div class="col-sm-10">
                            <?php foreach ($locations as $location) { ?>
                            <div class="checkbox">
                                <label>
                                    <?php if (in_array($location['location_id'], $config_location)) { ?>
                                    <input type="checkbox" name="config_location[]" value="<?php echo $location['location_id']; ?>" checked="checked" />
                                    <?php echo $location['name']; ?>
                                    <?php } else { ?>
                                    <input type="checkbox" name="config_location[]" value="<?php echo $location['location_id']; ?>" />
                                    <?php echo $location['name']; ?>
                                    <?php } ?>
                                </label>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <div class="tab-pane" id="tab-application">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-meta-title"><?php echo $entry_meta_title; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_meta_title" value="<?php echo $config_meta_title; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title" class="form-control" />
                            <?php if ($error_meta_title) { ?>
                            <div class="text-danger"><?php echo $error_meta_title; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-meta-description"><?php echo $entry_meta_description; ?></label>
                        <div class="col-sm-10">
                            <textarea name="config_meta_description" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description" class="form-control"><?php echo $config_meta_description; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-meta-keyword"><?php echo $entry_meta_keyword; ?></label>
                        <div class="col-sm-10">
                            <textarea name="config_meta_keyword" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword" class="form-control"><?php echo $config_meta_keyword; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-template"><?php echo $entry_template; ?></label>
                        <div class="col-sm-10">
                            <select name="config_template" id="input-template" class="form-control">
                                <?php foreach ($templates as $template) { ?>
                                <?php if ($template == $config_template) { ?>
                                <option value="<?php echo $template; ?>" selected="selected"><?php echo $template; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $template; ?>"><?php echo $template; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                            <br />
                            <img src="" alt="" id="template" class="img-thumbnail" /></div>
                    </div>
                </div>
                <div class="tab-pane" id="tab-local">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                        <div class="col-sm-10">
                            <select name="config_country_id" id="input-country" class="form-control">
                                <?php foreach ($countries as $country) { ?>
                                <?php if ($country['country_id'] == $config_country_id) { ?>
                                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                        <div class="col-sm-10">
                            <select name="config_zone_id" id="input-zone" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-language"><?php echo $entry_language; ?></label>
                        <div class="col-sm-10">
                            <select name="config_language" id="input-language" class="form-control">
                                <?php foreach ($languages as $language) { ?>
                                <?php if ($language['code'] == $config_language) { ?>
                                <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-admin-language"><?php echo $entry_admin_language; ?></label>
                        <div class="col-sm-10">
                            <select name="config_admin_language" id="input-admin-language" class="form-control">
                                <?php foreach ($languages as $language) { ?>
                                <?php if ($language['code'] == $config_admin_language) { ?>
                                <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-currency"><span data-toggle="tooltip" title="<?php echo $help_currency; ?>"><?php echo $entry_currency; ?></span></label>
                        <div class="col-sm-10">
                            <select name="config_currency" id="input-currency" class="form-control">
                                <?php foreach ($currencies as $currency) { ?>
                                <?php if ($currency['code'] == $config_currency) { ?>
                                <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_currency_auto; ?>"><?php echo $entry_currency_auto; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_currency_auto) { ?>
                                <input type="radio" name="config_currency_auto" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_currency_auto" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_currency_auto) { ?>
                                <input type="radio" name="config_currency_auto" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_currency_auto" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab-option">
                <fieldset>
                    <legend><?php echo $text_product; ?></legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-admin-limit"><span data-toggle="tooltip" title="<?php echo $help_limit_admin; ?>"><?php echo $entry_limit_admin; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_limit_admin" value="<?php echo $config_limit_admin; ?>" placeholder="<?php echo $entry_limit_admin; ?>" id="input-admin-limit" class="form-control" />
                            <?php if ($error_limit_admin) { ?>
                            <div class="text-danger"><?php echo $error_limit_admin; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend><?php echo $text_account; ?></legend>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_online; ?>"><?php echo $entry_customer_online; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_customer_online) { ?>
                                <input type="radio" name="config_customer_online" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_customer_online" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_customer_online) { ?>
                                <input type="radio" name="config_customer_online" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_customer_online" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-customer-group"><span data-toggle="tooltip" title="<?php echo $help_customer_group; ?>"><?php echo $entry_customer_group; ?></span></label>
                        <div class="col-sm-10">
                            <select name="config_customer_group_id" id="input-customer-group" class="form-control">
                                <?php foreach ($customer_groups as $customer_group) { ?>
                                <?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
                                <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_group_display; ?>"><?php echo $entry_customer_group_display; ?></span></label>
                        <div class="col-sm-10">
                            <?php foreach ($customer_groups as $customer_group) { ?>
                            <div class="checkbox">
                                <label>
                                    <?php if (in_array($customer_group['customer_group_id'], $config_customer_group_display)) { ?>
                                    <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                                    <?php echo $customer_group['name']; ?>
                                    <?php } else { ?>
                                    <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                                    <?php echo $customer_group['name']; ?>
                                    <?php } ?>
                                </label>
                            </div>
                            <?php } ?>
                            <?php if ($error_customer_group_display) { ?>
                            <div class="text-danger"><?php echo $error_customer_group_display; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_price; ?>"><?php echo $entry_customer_price; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_customer_price) { ?>
                                <input type="radio" name="config_customer_price" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_customer_price" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_customer_price) { ?>
                                <input type="radio" name="config_customer_price" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_customer_price" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-account"><span data-toggle="tooltip" title="<?php echo $help_account; ?>"><?php echo $entry_account; ?></span></label>
                        <div class="col-sm-10">
                            <select name="config_account_id" id="input-account" class="form-control">
                                <option value="0"><?php echo $text_none; ?></option>
                                <?php foreach ($informations as $information) { ?>
                                <?php if ($information['information_id'] == $config_account_id) { ?>
                                <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_account_mail; ?>"><?php echo $entry_account_mail; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_account_mail) { ?>
                                <input type="radio" name="config_account_mail" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_account_mail" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_account_mail) { ?>
                                <input type="radio" name="config_account_mail" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_account_mail" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend><?php echo $text_checkout; ?></legend>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-invoice-prefix"><span data-toggle="tooltip" title="<?php echo $help_invoice_prefix; ?>"><?php echo $entry_invoice_prefix; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" placeholder="<?php echo $entry_invoice_prefix; ?>" id="input-invoice-prefix" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-api"><span data-toggle="tooltip" title="<?php echo $help_api; ?>"><?php echo $entry_api; ?></span></label>
                        <div class="col-sm-10">
                            <select name="config_api_id" id="input-api" class="form-control">
                                <option value="0"><?php echo $text_none; ?></option>
                                <?php foreach ($apis as $api) { ?>
                                <?php if ($api['api_id'] == $config_api_id) { ?>
                                <option value="<?php echo $api['api_id']; ?>" selected="selected"><?php echo $api['username']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $api['api_id']; ?>"><?php echo $api['username']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_cart_weight; ?>"><?php echo $entry_cart_weight; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_cart_weight) { ?>
                                <input type="radio" name="config_cart_weight" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_cart_weight" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_cart_weight) { ?>
                                <input type="radio" name="config_cart_weight" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_cart_weight" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_checkout_guest; ?>"><?php echo $entry_checkout_guest; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_checkout_guest) { ?>
                                <input type="radio" name="config_checkout_guest" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_checkout_guest" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_checkout_guest) { ?>
                                <input type="radio" name="config_checkout_guest" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_checkout_guest" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-checkout"><span data-toggle="tooltip" title="<?php echo $help_checkout; ?>"><?php echo $entry_checkout; ?></span></label>
                        <div class="col-sm-10">
                            <select name="config_checkout_id" id="input-checkout" class="form-control">
                                <option value="0"><?php echo $text_none; ?></option>
                                <?php foreach ($informations as $information) { ?>
                                <?php if ($information['information_id'] == $config_checkout_id) { ?>
                                <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-order-status"><span data-toggle="tooltip" title="<?php echo $help_order_status; ?>"><?php echo $entry_order_status; ?></span></label>
                        <div class="col-sm-10">
                            <select name="config_order_status_id" id="input-order-status" class="form-control">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-process-status"><span data-toggle="tooltip" title="<?php echo $help_processing_status; ?>"><?php echo $entry_processing_status; ?></span></label>
                        <div class="col-sm-10">
                            <div class="well well-sm" style="height: 150px; overflow: auto;">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <div class="checkbox">
                                    <label>
                                        <?php if (in_array($order_status['order_status_id'], $config_processing_status)) { ?>
                                        <input type="checkbox" name="config_processing_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                                        <?php echo $order_status['name']; ?>
                                        <?php } else { ?>
                                        <input type="checkbox" name="config_processing_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
                                        <?php echo $order_status['name']; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                            <?php if ($error_processing_status) { ?>
                            <div class="text-danger"><?php echo $error_processing_status; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-complete-status"><span data-toggle="tooltip" title="<?php echo $help_complete_status; ?>"><?php echo $entry_complete_status; ?></span></label>
                        <div class="col-sm-10">
                            <div class="well well-sm" style="height: 150px; overflow: auto;">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <div class="checkbox">
                                    <label>
                                        <?php if (in_array($order_status['order_status_id'], $config_complete_status)) { ?>
                                        <input type="checkbox" name="config_complete_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                                        <?php echo $order_status['name']; ?>
                                        <?php } else { ?>
                                        <input type="checkbox" name="config_complete_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
                                        <?php echo $order_status['name']; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                            <?php if ($error_complete_status) { ?>
                            <div class="text-danger"><?php echo $error_complete_status; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_order_mail; ?>"><?php echo $entry_order_mail; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_order_mail) { ?>
                                <input type="radio" name="config_order_mail" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_order_mail" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_order_mail) { ?>
                                <input type="radio" name="config_order_mail" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_order_mail" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                </fieldset>
                </div>
                <div class="tab-pane" id="tab-image">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-logo"><?php echo $entry_logo; ?></label>
                        <div class="col-sm-10"><a href="" id="thumb-logo" data-toggle="image" class="img-thumbnail"><img src="<?php echo $logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                            <input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="input-logo" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-icon"><?php echo $entry_icon; ?></label>
                        <div class="col-sm-10"><a href="" id="thumb-icon" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                            <input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="input-icon" />
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab-ftp">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-ftp-host"><?php echo $entry_ftp_hostname; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_ftp_hostname" value="<?php echo $config_ftp_hostname; ?>" placeholder="<?php echo $entry_ftp_hostname; ?>" id="input-ftp-host" class="form-control" />
                            <?php if ($error_ftp_hostname) { ?>
                            <div class="text-danger"><?php echo $error_ftp_hostname; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-ftp-port"><?php echo $entry_ftp_port; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_ftp_port" value="<?php echo $config_ftp_port; ?>" placeholder="<?php echo $entry_ftp_port; ?>" id="input-ftp-port" class="form-control" />
                            <?php if ($error_ftp_port) { ?>
                            <div class="text-danger"><?php echo $error_ftp_port; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-ftp-username"><?php echo $entry_ftp_username; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_ftp_username" value="<?php echo $config_ftp_username; ?>" placeholder="<?php echo $entry_ftp_username; ?>" id="input-ftp-username" class="form-control" />
                            <?php if ($error_ftp_username) { ?>
                            <div class="text-danger"><?php echo $error_ftp_username; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-ftp-password"><?php echo $entry_ftp_password; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_ftp_password" value="<?php echo $config_ftp_password; ?>" placeholder="<?php echo $entry_ftp_password; ?>" id="input-ftp-password" class="form-control" />
                            <?php if ($error_ftp_password) { ?>
                            <div class="text-danger"><?php echo $error_ftp_password; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-ftp-root"><span data-toggle="tooltip" data-html="true" title="<?php echo htmlspecialchars($help_ftp_root); ?>"><?php echo $entry_ftp_root; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_ftp_root" value="<?php echo $config_ftp_root; ?>" placeholder="<?php echo $entry_ftp_root; ?>" id="input-ftp-root" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_ftp_status; ?></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_ftp_status) { ?>
                                <input type="radio" name="config_ftp_status" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_ftp_status" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_ftp_status) { ?>
                                <input type="radio" name="config_ftp_status" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_ftp_status" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab-mail">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-mail-protocol"><span data-toggle="tooltip" title="<?php echo $help_mail_protocol; ?>"><?php echo $entry_mail_protocol; ?></span></label>
                        <div class="col-sm-10">
                            <select name="config_mail[protocol]" id="input-mail-protocol" class="form-control">
                                <?php if ($config_mail_protocol == 'mail') { ?>
                                <option value="mail" selected="selected"><?php echo $text_mail; ?></option>
                                <?php } else { ?>
                                <option value="mail"><?php echo $text_mail; ?></option>
                                <?php } ?>
                                <?php if ($config_mail_protocol == 'smtp') { ?>
                                <option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
                                <?php } else { ?>
                                <option value="smtp"><?php echo $text_smtp; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-mail-parameter"><span data-toggle="tooltip" title="<?php echo $help_mail_parameter; ?>"><?php echo $entry_mail_parameter; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_mail[parameter]" value="<?php echo $config_mail_parameter; ?>" placeholder="<?php echo $entry_mail_parameter; ?>" id="input-mail-parameter" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-smtp-hostname"><span data-toggle="tooltip" title="<?php echo $help_mail_smtp_hostname; ?>"><?php echo $entry_smtp_hostname; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_mail[smtp_hostname]" value="<?php echo $config_smtp_hostname; ?>" placeholder="<?php echo $entry_smtp_hostname; ?>" id="input-smtp-hostname" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-smtp-username"><?php echo $entry_smtp_username; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_mail[smtp_username]" value="<?php echo $config_smtp_username; ?>" placeholder="<?php echo $entry_smtp_username; ?>" id="input-smtp-username" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-smtp-password"><?php echo $entry_smtp_password; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_mail[smtp_password]" value="<?php echo $config_smtp_password; ?>" placeholder="<?php echo $entry_smtp_password; ?>" id="input-smtp-password" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-smtp-port"><?php echo $entry_smtp_port; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_mail[smtp_port]" value="<?php echo $config_smtp_port; ?>" placeholder="<?php echo $entry_smtp_port; ?>" id="input-smtp-port" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-smtp-timeout"><?php echo $entry_smtp_timeout; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_mail[smtp_timeout]" value="<?php echo $config_smtp_timeout; ?>" placeholder="<?php echo $entry_smtp_timeout; ?>" id="input-smtp-timeout" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-alert-email"><span data-toggle="tooltip" title="<?php echo $help_mail_alert; ?>"><?php echo $entry_mail_alert; ?></span></label>
                        <div class="col-sm-10">
                            <textarea name="config_mail_alert" rows="5" placeholder="<?php echo $entry_mail_alert; ?>" id="input-alert-email" class="form-control"><?php echo $config_mail_alert; ?></textarea>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab-fraud">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_fraud_detection); ?>"><?php echo $entry_fraud_detection; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($config_fraud_detection) { ?>
                                <input type="radio" name="config_fraud_detection" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_fraud_detection" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$config_fraud_detection) { ?>
                                <input type="radio" name="config_fraud_detection" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="config_fraud_detection" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-fraud-key"><?php echo $entry_fraud_key; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_fraud_key" value="<?php echo $config_fraud_key; ?>" placeholder="<?php echo $entry_fraud_key; ?>" id="input-fraud-key" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-fraud-score"><span data-toggle="tooltip" title="<?php echo $help_fraud_score; ?>"><?php echo $entry_fraud_score; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="config_fraud_score" value="<?php echo $config_fraud_score; ?>" placeholder="<?php echo $entry_fraud_score; ?>" id="input-fraud-score" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-fraud-status"><span data-toggle="tooltip" title="<?php echo $help_fraud_status; ?>"><?php echo $entry_fraud_status; ?></span></label>
                        <div class="col-sm-10">
                            <select name="config_fraud_status_id" id="input-fraud-status" class="form-control">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <?php if ($order_status['order_status_id'] == $config_fraud_status_id) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab-server">
                <div class="form-group">
                    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_secure; ?>"><?php echo $entry_secure; ?></span></label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($config_secure) { ?>
                            <input type="radio" name="config_secure" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_secure" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$config_secure) { ?>
                            <input type="radio" name="config_secure" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_secure" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_shared; ?>"><?php echo $entry_shared; ?></span></label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($config_shared) { ?>
                            <input type="radio" name="config_shared" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_shared" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$config_shared) { ?>
                            <input type="radio" name="config_shared" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_shared" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-robots"><span data-toggle="tooltip" title="<?php echo $help_robots; ?>"><?php echo $entry_robots; ?></span></label>
                    <div class="col-sm-10">
                        <textarea name="config_robots" rows="5" placeholder="<?php echo $entry_robots; ?>" id="input-robots" class="form-control"><?php echo $config_robots; ?></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_seo_url; ?>"><?php echo $entry_seo_url; ?></span></label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($config_seo_url) { ?>
                            <input type="radio" name="config_seo_url" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_seo_url" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$config_seo_url) { ?>
                            <input type="radio" name="config_seo_url" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_seo_url" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-file-max-size"><span data-toggle="tooltip" title="<?php echo $help_file_max_size; ?>"><?php echo $entry_file_max_size; ?></span></label>
                    <div class="col-sm-10">
                        <input type="text" name="config_file_max_size" value="<?php echo $config_file_max_size; ?>" placeholder="<?php echo $entry_file_max_size; ?>" id="input-file-max-size" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-file-ext-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_ext_allowed; ?>"><?php echo $entry_file_ext_allowed; ?></span></label>
                    <div class="col-sm-10">
                        <textarea name="config_file_ext_allowed" rows="5" placeholder="<?php echo $entry_file_ext_allowed; ?>" id="input-file-ext-allowed" class="form-control"><?php echo $config_file_ext_allowed; ?></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-file-mime-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_mime_allowed; ?>"><?php echo $entry_file_mime_allowed; ?></span></label>
                    <div class="col-sm-10">
                        <textarea name="config_file_mime_allowed" cols="60" rows="5" placeholder="<?php echo $entry_file_mime_allowed; ?>" id="input-file-mime-allowed" class="form-control"><?php echo $config_file_mime_allowed; ?></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_maintenance; ?>"><?php echo $entry_maintenance; ?></span></label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($config_maintenance) { ?>
                            <input type="radio" name="config_maintenance" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_maintenance" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$config_maintenance) { ?>
                            <input type="radio" name="config_maintenance" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_maintenance" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_password; ?>"><?php echo $entry_password; ?></span></label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($config_password) { ?>
                            <input type="radio" name="config_password" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_password" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$config_password) { ?>
                            <input type="radio" name="config_password" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_password" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-encryption"><span data-toggle="tooltip" title="<?php echo $help_encryption; ?>"><?php echo $entry_encryption; ?></span></label>
                    <div class="col-sm-10">
                        <input type="text" name="config_encryption" value="<?php echo $config_encryption; ?>" placeholder="<?php echo $entry_encryption; ?>" id="input-encryption" class="form-control" />
                        <?php if ($error_encryption) { ?>
                        <div class="text-danger"><?php echo $error_encryption; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-compression"><span data-toggle="tooltip" title="<?php echo $help_compression; ?>"><?php echo $entry_compression; ?></span></label>
                    <div class="col-sm-10">
                        <input type="text" name="config_compression" value="<?php echo $config_compression; ?>" placeholder="<?php echo $entry_compression; ?>" id="input-compression" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $entry_error_display; ?></label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($config_error_display) { ?>
                            <input type="radio" name="config_error_display" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_error_display" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$config_error_display) { ?>
                            <input type="radio" name="config_error_display" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_error_display" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $entry_error_log; ?></label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($config_error_log) { ?>
                            <input type="radio" name="config_error_log" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_error_log" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$config_error_log) { ?>
                            <input type="radio" name="config_error_log" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="config_error_log" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-error-filename"><?php echo $entry_error_filename; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" placeholder="<?php echo $entry_error_filename; ?>" id="input-error-filename" class="form-control" />
                        <?php if ($error_error_filename) { ?>
                        <div class="text-danger"><?php echo $error_error_filename; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-google-analytics"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_google_analytics); ?>"><?php echo $entry_google_analytics; ?></span></label>
                    <div class="col-sm-10">
                        <textarea name="config_google_analytics" rows="5" placeholder="<?php echo $entry_google_analytics; ?>" id="input-google-analytics" class="form-control"><?php echo $config_google_analytics; ?></textarea>
                    </div>
                </div>
                </div>
                </div>
                </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
<script type="text/javascript"><!--
    $('select[name=\'config_template\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value),
            dataType: 'html',
            beforeSend: function() {
                $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function() {
                $('.fa-spin').remove();
            },
            success: function(html) {
                $('.fa-spin').remove();

                $('#template').attr('src', html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'config_template\']').trigger('change');
    //--></script>
<script type="text/javascript"><!--
    $('select[name=\'config_country_id\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=setting/setting/country&token=<?php echo $token; ?>&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('select[name=\'config_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function() {
                $('.fa-spin').remove();
            },
            success: function(json) {
                $('.fa-spin').remove();

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone'] != '') {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'config_zone_id\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'config_country_id\']').trigger('change');
    //--></script>
<?php echo $footer?>