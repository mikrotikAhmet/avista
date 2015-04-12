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
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-order" class="">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Order Form
                        </div>
                        <div class="panel-body">
                            <?php if ($error_warning) { ?>
                            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                            </div>
                            <?php } ?>
                            <?php if (!$banks) { ?>
                            <h3 class="text-danger">To place an order request you must have at least 1 (One) verified Bank Account.</h3>
                            <?php } ?>
                            <div class="form-group required">
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
                            <div class="form-group required">
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

                            <div class="form-group required">
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
                            <span class="text-danger">NOTE:</span> You must also declare the SETTLEMENT Account, even is the same with PAYMENT Account.
                            <div class="form-group required">
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
                            <div class="form-group required">
                                <label class=" control-label">Beneficiary  Name <small>(optional)</small></label>
                                <div class="">
                                    <input type="text" name="issuer_name" value="" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class=" control-label">Your Unique Customer ID</br/></label>
                                <div class="">
                                    <input type="text" name="unique" value="" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <button type="button" onclick="placeOrder();" id="issue-order" class="btn btn-primary" onclick="sendCode()" data-keyboard="false" data-backdrop="static" data-toggle="modal" data-target="#make-request">Submit request</button>
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
                                <td><strong>Bank for Payment</strong></td>
                                <td class="bank"></td>
                            </tr>
                            <tr>
                                <td><strong>Bank for Settlement</strong></td>
                                <td class="settlement"></td>
                            </tr>
                            <tr>
                                <td><strong>Beneficiary  Name</strong></td>
                                <td class="issuer"></td>
                            </tr>
                            </tbody>
                        </table>
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

    function placeOrder(){

//       alert('Your Order has been placed. Thank You.');

        $('#form-order').submit();
    }

    $('#issue-order').attr("disabled", true);

    $('select[name=\'currency_code\']').on('change', function(e) {

        $('#currency_symbol').html(this.value);
        $('#currency_icon').html(this.value);

        if ($('input[name=\'amount\']').val() < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank_id\']').val() == "" || $('select[name=\'settlement\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){

            $('#issue-order').attr("disabled", true);
        } else {
            $('#issue-order').attr("disabled", false);
        }

    });

    $('select[name=\'bank_id\']').on('change', function(e) {

        $('.bank').html($(this).find("option:selected").text());

        if ($('input[name=\'amount\']').val() < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank_id\']').val() == "" || $('select[name=\'settlement\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){

            $('#issue-order').attr("disabled", true);
        } else {
            $('#issue-order').attr("disabled", false);
        }
    });

    $('select[name=\'settlement\']').on('change', function(e) {

        $('.settlement').html($(this).find("option:selected").text());

        if ($('input[name=\'amount\']').val() < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank_id\']').val() == "" || $('select[name=\'settlement\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){

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

        if ($('input[name=\'amount\']').val() < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank_id\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){

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

        if (this.value < 10000 || $('select[name=\'instrument\']').val() == "" || $('select[name=\'bank_id\']').val() == "" || $('select[name=\'currency_code\']').val() == ""){
            $('#issue-order').attr("disabled", true);
        } else {
            $('#issue-order').attr("disabled", false);
        }
    });

    $('input[name=\'issuer_name\']').on('keyup', function(e) {

        $('.issuer').html(this.value);
    });


</script>
<?php echo $footer?>