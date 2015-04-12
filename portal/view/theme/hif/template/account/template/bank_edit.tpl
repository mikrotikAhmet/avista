<form id="bank-form" class="">
    <div class="row">
        <div class="col-md-6">
            <input type="hidden" name="bank_id" value="<?php echo $bank['bank_id']?>"/>
            <div class="form-group required">
                <label class="control-label" for="input-bank-name"><?php echo $entry_name ?></label>
                <div class="">
                    <input type="text" name="name" value="<?php echo $bank['bank']?>" placeholder="<?php echo $entry_name ?>" id="input-bank-name" class="form-control" />
                </div>
            </div>
            <div class="form-group required">
                <label class="control-label" for="input-bank-country"><?php echo $entry_country ?></label>
                <div class="">
                    <select name="country_id" id="input-bank-country" class="form-control">
                        <?php foreach ($countries as $country) { ?>
                        <?php if ($country['country_id'] == $bank['country_id']) { ?>
                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="form-group required">
                <label class="control-label" for="input-bank-account"><?php echo $entry_number ?></label>
                <div class="">
                    <input type="text" name="account" value="<?php echo $bank['account_number']?>" placeholder="<?php echo $entry_number ?>" id="input-bank-account" class="form-control" />
                </div>
            </div>
            <div class="form-group required">
                <label class="control-label" for="input-bank-currency"><?php echo $entry_currency ?></label>
                <div class="">
                    <select name="currency_code" id="input-bank-currency" class="form-control">
                        <?php foreach ($currencies as $currency) { ?>
                        <?php if ($currency['currency_code'] == $bank['currency_code']) { ?>
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
                    <input type="text" name="iban" value="<?php echo $bank['iban']?>" placeholder="<?php echo $entry_iban ?>" id="input-bank-iban" class="form-control" />
                </div>
            </div>
            <div class="form-group required">
                <label class="control-label" for="input-bank-swift"><?php echo $entry_swift ?></label>
                <div class="">
                    <input type="text" name="swift" value="<?php echo $bank['swift']?>" placeholder="<?php echo $entry_swift ?>" id="input-bank-swift" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-bank-routing"><?php echo $entry_routing ?></label>
                <div class="">
                    <input type="text" name="routing" value="<?php echo $bank['routing']?>" placeholder="<?php echo $entry_routing ?>" id="input-bank-routing" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-bank-sort-code"><?php echo $entry_sort_code ?></label>
                <div class="">
                    <input type="text" name="sort_code" value="<?php echo $bank['sort_code']?>" placeholder="<?php echo $entry_sort_code ?>" id="input-bank-sort-code" class="form-control" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label class="control-label" for="input-officer-name"><?php echo $entry_officer_name ?></label>
                <div class="">
                    <input type="text" name="officer_name" value="<?php echo $bank['officer_name']?>" placeholder="<?php echo $entry_officer_name ?>" id="input-bank-sort-code" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-officer-telephone"><?php echo $entry_officer_telephone ?></label>
                <div class="">
                    <input type="text" name="officer_telephone" value="<?php echo $bank['officer_telephone']?>" placeholder="<?php echo $entry_officer_telephone ?>" id="input-bank-sort-code" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="input-officer-email"><?php echo $entry_officer_email ?></label>
                <div class="">
                    <input type="text" name="officer_email" value="<?php echo $bank['officer_email']?>" placeholder="<?php echo $entry_officer_email ?>" id="input-bank-sort-code" class="form-control" />
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