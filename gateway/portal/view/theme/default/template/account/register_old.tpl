<?php echo $header?>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-2">
            <img src="<?php echo $logo?>" style="width: 345px;"/>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-certificate"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <?php if ($error_warning) { ?>
                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                    </div>
                    <?php } ?>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form">
                        <fieldset>
                            <legend>Account details</legend>
                            <div class="form-group required" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
                                <label class="control-label"><?php echo $entry_customer_group; ?></label>
                                <div class="">
                                    <?php foreach ($customer_groups as $customer_group) { ?>
                                    <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                                    <div class="radio-inline">
                                        <label>
                                            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                                            <?php echo $customer_group['name']; ?></label>
                                    </div>
                                    <?php } else { ?>
                                    <div class="radio-inline">
                                        <label>
                                            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                                            <?php echo $customer_group['name']; ?></label>
                                    </div>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                            <hr/>
                            <div id="business" style="display: none">

                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-country"><?php echo $entry_country; ?></label>
                                <div class="">
                                    <select name="country_id" id="input-country" class="form-control">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($countries as $country) { ?>
                                        <?php if ($country['country_id'] == $country_id) { ?>
                                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <?php if ($error_country) { ?>
                                    <div class="text-danger"><?php echo $error_country; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-currency"><?php echo $entry_currency; ?></label>
                                <div class="">
                                    <select name="currency_code" id="input-currency" class="form-control">
                                        <?php foreach ($currencies as $currency) { ?>
                                        <?php if ($currency['currency_id'] == $currency_id) { ?>
                                        <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['code']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $currency['code']; ?>"><?php echo $currency['code']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-language"><?php echo $entry_language; ?></label>
                                <div class="">
                                    <select name="language_id" id="input-language" class="form-control">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($languages as $language) { ?>
                                        <?php if ($language['language_id'] == $language_id) { ?>
                                        <option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <?php if ($error_language) { ?>
                                    <div class="text-danger"><?php echo $error_language; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend><?php echo $text_your_details; ?></legend>
                            <div class="form-group required">
                                <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                                <div class="">
                                    <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                                    <?php if ($error_firstname) { ?>
                                    <div class="text-danger"><?php echo $error_firstname; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                                <div class="">
                                    <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                                    <?php if ($error_lastname) { ?>
                                    <div class="text-danger"><?php echo $error_lastname; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
                                <div class="">
                                    <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                                    <?php if ($error_address_1) { ?>
                                    <div class="text-danger"><?php echo $error_address_1; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
                                <div class="">
                                    <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                                <div class="">
                                    <select name="zone_id" id="input-zone" class="form-control">
                                    </select>
                                    <?php if ($error_zone) { ?>
                                    <div class="text-danger"><?php echo $error_zone; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
                                <div class="">
                                    <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                                    <?php if ($error_city) { ?>
                                    <div class="text-danger"><?php echo $error_city; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                                <div class="">
                                    <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                                    <?php if ($error_postcode) { ?>
                                    <div class="text-danger"><?php echo $error_postcode; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                        </fieldset>
                        <div class="buttons clearfix">
                            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></a></div>
                            <div class="pull-right">
                                <button type="submit" class="btn btn-primary" ><?php echo $button_continue_2; ?> <i class="fa fa-arrow-right"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    $('select[name=\'country_id\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=account/register/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function() {
                $('.fa-spin').remove();
            },
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('input[name=\'postcode\']').parent().parent().addClass('required');
                } else {
                    $('input[name=\'postcode\']').parent().parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone']) {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'zone_id\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
    //--></script>
<?php echo $footer?>