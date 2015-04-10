<form id="bank-form" class="">
    <div class="form-group required">
        <label class="control-label" for="input-bank-name">Name of Bank</label>
        <div class="">
            <input type="text" name="name" value="" placeholder="" id="input-bank-name" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-bank-country">Country of Bank</label>
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
        <label class="control-label" for="input-bank-account">Account number</label>
        <div class="">
            <input type="text" name="account" value="" placeholder="" id="input-bank-account" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-bank-currency">Account currency</label>
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
        <label class="control-label" for="input-bank-iban">IBAN</label>
        <div class="">
            <input type="text" name="iban" value="" placeholder="" id="input-bank-iban" class="form-control" />
            <span class="text-muted">Please provide just numbers.(EX:123456781234)</span>
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-bank-swift">SWIFT/BIC Code</label>
        <div class="">
            <input type="text" name="swift" value="" placeholder="" id="input-bank-swift" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-bank-routing">Routing Code <small><b>(optional)</b></small></label>
        <div class="">
            <input type="text" name="routing" value="" placeholder="" id="input-bank-routing" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-bank-sort-code">Sort Code <small><b>(optional)</b></small></label>
        <div class="">
            <input type="text" name="sort_code" value="" placeholder="" id="input-bank-sort-code" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-officer-name">Officer Name <small><b>(optional)</b></small></label>
        <div class="">
            <input type="text" name="officer_name" value="" placeholder="" id="input-bank-sort-code" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-officer-telephone">Officer Telephone <small><b>(optional)</b></small></label>
        <div class="">
            <input type="text" name="officer_telephone" value="" placeholder="" id="input-bank-sort-code" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-officer-email">Officer Email <small><b>(optional)</b></small></label>
        <div class="">
            <input type="text" name="officer_email" value="" placeholder="" id="input-bank-sort-code" class="form-control" />
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

                html = '';

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