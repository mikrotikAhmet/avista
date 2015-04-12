<form id="bank-form" class="">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group required">
                <label class="control-label" for="input-bank-name"><?php echo $entry_name ?></label>
                <div class="">
                    <input type="text" name="name" value="" placeholder="<?php echo $entry_name ?>" id="input-bank-name" class="form-control" />
                </div>
            </div>
            <div class="form-group required">
                <label class="control-label" for="input-bank-country"><?php echo $entry_country ?></label>
                <div class="">
                    <select name="country_id" id="input-bank-country" class="form-control">
                        <?php foreach ($countries as $country) { ?>
                        <?php if ($country['country_id'] == $country_id) { ?>
                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <!--div class="form-group required">
                <label class="control-label" for="input-bank-zone">State/Region of Bank</label>
                <div class="">
                    <select name="zone_id" id="input-bank-zone" class="form-control"></select>
                </div>
            </div-->
            <div class="form-group required">
                <label class="control-label" for="input-bank-account"><?php echo $entry_number ?></label>
                <div class="">
                    <input type="text" name="account" value="" placeholder="<?php echo $entry_number ?>" id="input-bank-account" class="form-control" />
                </div>
            </div>
            <div class="form-group required">
                <label class="control-label" for="input-bank-currency"><?php echo $entry_currency ?></label>
                <div class="">
                    <select name="currency_code" id="input-bank-currency" class="form-control">
                        <?php foreach ($currencies as $currency) { ?>
                        <?php if ($currency['currency_code'] == $currency_code) { ?>
                        <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['code']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $currency['code']; ?>"><?php echo $currency['code']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="form-group required">
                <label class="control-label" for="input-bank-iban"><?php echo $entry_iban ?></label>
                <div class="">
                    <input type="text" name="iban" value="" placeholder="<?php echo $entry_iban ?>" id="input-bank-iban" class="form-control" />
                </div>
            </div>
            <div class="form-group required">
                <label class="control-label" for="input-bank-swift"><?php echo $entry_swift ?></label>
                <div class="">
                    <input type="text" name="swift" value="" placeholder="<?php echo $entry_swift ?>" id="input-bank-swift" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-bank-routing"><?php echo $entry_routing ?></label>
                <div class="">
                    <input type="text" name="routing" value="" placeholder="<?php echo $entry_routing ?>" id="input-bank-routing" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-bank-sort-code"><?php echo $entry_sort_code ?></label>
                <div class="">
                    <input type="text" name="sort_code" value="" placeholder="<?php echo $entry_sort_code ?>" id="input-bank-sort-code" class="form-control" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label class="control-label" for="input-officer-name"><?php echo $entry_officer_name ?></label>
                <div class="">
                    <input type="text" name="officer_name" value="" placeholder="<?php echo $entry_officer_name ?>" id="input-bank-sort-code" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-officer-telephone"><?php echo $entry_officer_telephone ?></label>
                <div class="">
                    <input type="text" name="officer_telephone" value="" placeholder="<?php echo $entry_officer_telephone ?>" id="input-bank-sort-code" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-officer-email"><?php echo $entry_officer_email ?></label>
                <div class="">
                    <input type="text" name="officer_email" value="" placeholder="<?php echo $entry_officer_email ?>" id="input-bank-sort-code" class="form-control" />
                </div>
            </div>
        </div>
    </div>
</form>
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

            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
    //--></script>