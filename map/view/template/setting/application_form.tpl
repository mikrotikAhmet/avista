<?php echo $header; ?>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><?php echo $heading_title; ?></h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="pull-right">
                    <button type="submit" form="form-user" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <br/>
        <div class="row">
            <div class="col-lg-12">
                <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-list"></i> <?php echo $text_form; ?>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-application" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-application" data-toggle="tab"><?php echo $tab_application; ?></a></li>
                        <li><a href="#tab-local" data-toggle="tab"><?php echo $tab_local; ?></a></li>
                        <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
                        <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
                        <li><a href="#tab-server" data-toggle="tab"><?php echo $tab_server; ?></a></li>
                    </ul>
                    <br/>
                    <div class="tab-content">
                    <div class="tab-pane active" id="tab-general">
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-url"><span data-toggle="tooltip" data-html="true" title="<?php echo htmlspecialchars($help_url); ?>"><?php echo $entry_url; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="config_url" value="<?php echo $config_url; ?>" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />
                                <?php if ($error_url) { ?>
                                <div class="text-danger"><?php echo $error_url; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-ssl"><span data-toggle="tooltip" data-html="true" title="<?php echo $help_ssl; ?>"><?php echo $entry_ssl; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="config_ssl" value="<?php echo $config_ssl; ?>" placeholder="<?php echo $entry_ssl; ?>" id="input-ssl" class="form-control" />
                            </div>
                        </div>
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
                                <textarea name="config_address" rows="5" placeholder="<?php echo $entry_address; ?>" id="input-address" class="form-control"><?php echo $config_address; ?></textarea>
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
                                <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-open"><span data-toggle="tooltip" title="<?php echo $help_open; ?>"><?php echo $entry_open; ?></span></label>
                            <div class="col-sm-10">
                                <textarea name="open" rows="5" placeholder="<?php echo $entry_open; ?>" id="input-open" class="form-control"><?php echo $open; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-comment"><span data-toggle="tooltip" title="<?php echo $help_comment; ?>"><?php echo $entry_comment; ?></span></label>
                            <div class="col-sm-10">
                                <textarea name="comment" rows="5" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control"><?php echo $comment; ?></textarea>
                            </div>
                        </div>
                        <?php if ($locations) { ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_location; ?>"><?php echo $entry_location; ?></span></label>
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
                    </div>
                    <div class="tab-pane" id="tab-option">
                    <fieldset>
                        <legend><?php echo $text_items; ?></legend>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-catalog-limit"><span data-toggle="tooltip" title="<?php echo $help_product_limit; ?>"><?php echo $entry_product_limit; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="config_product_limit" value="<?php echo $config_product_limit; ?>" placeholder="<?php echo $entry_product_limit; ?>" id="input-catalog-limit" class="form-control" />
                                <?php if ($error_product_limit) { ?>
                                <div class="text-danger"><?php echo $error_product_limit; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-list-description-limit"><span data-toggle="tooltip" title="<?php echo $help_product_description_length; ?>"><?php echo $entry_product_description_length; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="config_product_description_length" value="<?php echo $config_product_description_length; ?>" placeholder="<?php echo $entry_product_description_length; ?>" id="input-list-description-limit" class="form-control" />
                                <?php if ($error_product_description_length) { ?>
                                <div class="text-danger"><?php echo $error_product_description_length; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend><?php echo $text_account; ?></legend>
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
                            <label class="col-sm-2 control-label" for="input-icon"><span data-toggle="tooltip" title="<?php echo $help_icon; ?>"><?php echo $entry_icon; ?></span></label>
                            <div class="col-sm-10"><a href="" id="thumb-icon" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="input-icon" />
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
                    </div>
                    </div>
                    </form>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
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
            url: 'index.php?route=setting/application/country&token=<?php echo $token; ?>&country_id=' + this.value,
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