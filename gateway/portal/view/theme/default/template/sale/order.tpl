<?php echo $header?>
<div id="page-wrapper">
<div class="container-fluid">
<!-- Page Heading -->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <?php echo $heading_title?>
        </h1>
        <ol class="breadcrumb">
            <li class="active">
                <i class="fa fa-dashboard"></i> <?php echo $heading_title?>
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <p class="text-info">You can place order in this section.</p>
        <p class="text-info">Please you are obligated to fill all neccessary fields required.<br/>After clicking <b class="text-danger">Submit Request</b> button<br/>
        You will be asked to provide your <strong class="text-danger">Unique Customer number</strong> which associated to your account and already sent to your registered email address.</p>
    </div>
    <div class="col-lg-6">
        <form id="order">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Order Form
                </div>
                <div class="panel-body">
                    <?php if (!$banks) { ?>
                    <h3 class="text-danger">To place an order request you must have at least 1 (One) verified Bank Account.</h3>
                    <?php } ?>
                    <div class="form-group">
                        <label class=" control-label">Instrument</label>
                        <div class="">
                            <select name="instrument" class="form-control">
                                <option value="">--Please select--</option>
                                <?php foreach ($insts as $key=>$inst) { ?>
                                    <option value="<?php echo $key?>"><?php echo $inst?></option>
                                <?php } ?>
                                <option value="999">Other</option>
                            </select>
                            <br/>
                            <div id="other" style="display: none">
                                <input type="text" name="other" value="" class="form-control"/>
                            </div>
                            <input type="hidden" name="product_name" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class=" control-label">Requested amount</label>
                        <div class="">
                            <div class="form-group input-group">
                                <span class="input-group-addon" id="currency_icon">EUR</span>
                                <input type="text" name="amount" class="form-control amount" maxlength="9">
                                <input type="hidden" name="currency_code" value="EUR">
                                <span class="input-group-addon">.00</span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class=" control-label">Preferred bank account of Payment</label>
                        <div class="">
                            <select name="bank_id" class="form-control">
                                <option value="">--Please select--</option>
                                <?php foreach ($banks as $bank) { ?>
                                    <option value="<?php echo $bank['bank_id']?>"><?php echo '[ '.$bank['currency_code'].' ] '.$bank['bank']?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class=" control-label">Preferred bank account for Settlement</label>
                        <div class="">
                            <select name="settlement" class="form-control">
                                <option value="">--Please select--</option>
                                <?php foreach ($banks as $bank) { ?>
                                <option value="<?php echo $bank['bank_id']?>"><?php echo '[ '.$bank['currency_code'].' ] '.$bank['bank']?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <p class="text-info"><i class="fa fa-exclamation-circle"></i> Issuer name should be mentioned on the incorporation documents</p>
                    <div class="form-group">
                        <label class=" control-label">Beneficiary  Name <small>(optional)</small></label>
                        <div class="">
                            <input type="text" name="issuer_name" value="" class="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="col-lg-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                Order Details
            </div>
            <div class="panel-body">
                <div class="alert alert-info alert-dismissable">
                    <i class="fa fa-exclamation-circle"></i> <strong>Important Notice!</strong>
                    <p>After placing order our complient desk will review your order and issue the <b>Electronic Contract</b>.</p>
                </div>
                <table class="table table-responsive table-striped">
                    <tbody>
                    <tr>
                        <td><strong>Date of order</strong></td>
                        <td class=""><?php echo date('Y/m/d')?></td>
                    </tr>
                    <tr>
                        <td><strong>Requested Instrument</strong></td>
                        <td class="instrument"></td>
                    </tr>
                    <tr>
                        <td><strong>Requested Amount (<span id="currency_symbol"></span>)</strong></td>
                        <td class="amount">0.00</td>
                    </tr>
                    <tr>
                        <td><strong>Preferred bank account</strong></td>
                        <td class="bank"></td>
                    </tr>
                    <tr>
                        <td><strong>Beneficiary  Name</strong></td>
                        <td class="issuer"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <button type="button" id="issue-order" class="btn btn-primary" onclick="sendCode()" data-keyboard="false" data-backdrop="static" data-toggle="modal" data-target="#make-request">Submit request</button>
            </div>
        </div>
    </div>
</div>
<!-- /.row -->

</div>
<!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<script>

    $('#issue-order').attr("disabled", true);

    $('select[name=\'currency_code\']').on('change', function(e) {

        $('#currency_symbol').html(this.value);
        $('#currency_icon').html(this.value);

        if ($('input[name=\'amount\']').val() < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){

            $('#issue-order').attr("disabled", true);
        } else {
            $('#issue-order').attr("disabled", false);
        }

    });

    $('select[name=\'bank\']').on('change', function(e) {

        $('.bank').html($(this).find("option:selected").text());

        if ($('input[name=\'amount\']').val() < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){

            $('#issue-order').attr("disabled", true);
        } else {
            $('#issue-order').attr("disabled", false);
        }
    });

$('select[name=\'instrument\']').on('change', function(e) {

    if (this.value == '999') {
        $('#other').show();
    } else {
        $('input[name=\'other\']').val('');
        $('#other').hide();
    }
    $('.instrument').html($(this).find("option:selected").text());

    if ($('input[name=\'amount\']').val() < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){

        $('#issue-order').attr("disabled", true);
    } else {
        $('#issue-order').attr("disabled", false);
    }
if ($('select[name=\'instrument\']').val() != "") {
    $('input[name=\'product_name\']').val($(this).find("option:selected").text());
} else {
    $('input[name=\'product_name\']').val('');
}

});
$('input[name=\'amount\']').on('keyup', function(e) {

    var upfront = 0;

    $('.amount').html(this.value+'.00');

    if (this.value < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){
        $('#issue-order').attr("disabled", true);
    } else {
        $('#issue-order').attr("disabled", false);
    }
});

    $('input[name=\'issuer_name\']').on('keyup', function(e) {

        $('.issuer').html(this.value);

//        if (this.value < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){
//            $('#issue-order').attr("disabled", true);
//        } else {
//            $('#issue-order').attr("disabled", false);
//        }
    });

    function issue(){

        var data = $('input[name=\'vc\']').val();
        var unique = $('input[name=\'unique\']').val();

        var element = $(this);

        $.ajax({
            url: 'index.php?route=sale/order/verifyCode',
            type: 'post',
            data : 'vc='+data+'&unique='+unique,
            dataType: 'json',
            beforeSend: function() {

                $('#button-issue').attr("disabled", true);
                $('#button-close').attr("disabled", true);
                element.button('loading');
            },
            success: function(json) {

                element.button('reset');

                if (json.error){
                    alert(json.error['message']);
                    $('#button-issue').attr("disabled", false);
                    $('#button-close').attr("disabled", false);

                } else {
                    alert(json.message);

                    $('#button-issue').attr("disabled", false);
                    $('#button-close').attr("disabled", false);

                    if (json.redirect) {
                        location = json.redirect;
                    }
                }
            }
        });
    };

    function sendCode(){

        var element = $(this);

        $.ajax({
            url: 'index.php?route=sale/order/verification',
            type: 'post',
            data : $('form').serialize(),
            dataType: 'json',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(json) {

                element.button('reset');

//                alert('Verification code has been sent!');
            }
        });


    }
</script>
<!-- Modal -->
<div class="modal fade" id="make-request" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Order Request</h4>
            </div>
            <div class="modal-body">
                <?php if (!$approved) { ?>
                <p>You account is not approved yet.</p>
                <?php } else if (!$customer['mobile']) { ?>
                <p>We could not able to find any mobile number registered to our system.<br/>
                Please go to My Account->Personal & Business Information and update your Personal Information</p>
                <?php } else if ($customer['mobile']) { ?>
                <p>Dear Customer,</p>
                <div class="form-group">
                    <label class="control-label" for="input-vc">Unique Customer Id</label>
                    <div class="">
                        <input type="text" name="unique"  value="" id="input-vc" class="form-control"/>
                        <span class="text-muted">This Unique Customer ID is 6 digit ID number. You also can find it in <b>My Account section</b> under <b>Business Information Tab</b>.</span>
                    </div>
                </div>
                <!--div class="form-group">
                    <label class="control-label" for="input-vc">Verification code</label>
                    <div class="">
                        <input type="text" name="vc"  value="" id="input-vc" class="form-control"/>
                        <span class="text-muted">This Verification code also will be your Order Code.</span>
                    </div>
                </div-->
                <?php } ?>
            </div>
            <div class="modal-footer">
                <button type="button" id="button-close"class="btn btn-default" data-dismiss="modal">Close</button>
                <?php if ($approved) { ?>
                <button type="button" id="button-issue" onclick="issue()" class="btn btn-primary">Continue</button>
                <?php } ?>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<?php echo $footer?>