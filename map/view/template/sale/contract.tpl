<?php echo $header; ?>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Create a Contract</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-list"></i> New Sale Contract
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form method="post" action="<?php echo $action?>" enctype="multipart/form-data"  id="form-order">
                            <div class="col-md-8">
                                <legend>Main Information</legend>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">INSTRUMENT OF: </label>
                                    <input type="text" name="instrument" value="<?php echo $instrument; ?>" placeholder="INSTRUMENT OF" id="input-customer" class="form-control" />
                                    <?php if ($error_instrument) { ?>
                                    <div class="text-danger"><?php echo $error_instrument; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group required">
                                            <label class="control-label" for="input-customer">ISSUANCE BANK: </label>
                                            <input type="text" name="issuance_bank" value="<?php echo $issuance_bank; ?>" placeholder="ISSUANCE BANK" id="input-customer" class="form-control" />
                                            <?php if ($error_issuance_bank) { ?>
                                            <div class="text-danger"><?php echo $error_issuance_bank; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label" for="input-customer">ISIN CODE: </label>
                                            <input type="text" name="isin_code" value="<?php echo $isin_code; ?>" placeholder="ISIN CODE" id="input-customer" class="form-control" />
                                            <?php if ($error_isin_code) { ?>
                                            <div class="text-danger"><?php echo $error_isin_code; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                    <div class="form-group required">
                                        <label class="control-label" for="input-customer">FACE VALUE OF INSTRUMENT: <b>EURO</b> </label>
                                        <input type="text" name="face_value" value="<?php echo $face_value; ?>" placeholder="FACE VALUE OF INSTRUMENT" id="input-customer" class="form-control" maxlength="9"/>
                                        <?php if ($error_face_value) { ?>
                                        <div class="text-danger"><?php echo $error_face_value; ?></div>
                                        <?php } ?>
                                    </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group required">
                                            <label class="control-label" for="input-customer">MATURITY DATE OF INSTRUMENT: </label>
                                            <input type="text" name="maturity_date" value="<?php echo $maturity_date; ?>" placeholder="MATURITY DATE OF INSTRUMENT" data-format="" id="input-customer" class="form-control" />
                                            <?php if ($error_maturity_date) { ?>
                                            <div class="text-danger"><?php echo $error_maturity_date; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group required">
                                            <label class="control-label" for="input-customer">PURCHASE PRICE OF INSTRUMENT: </label>
                                            <input type="text" name="price" value="<?php echo $price; ?>" placeholder="PURCHASE PRICE OF INSTRUMENT" id="input-customer" class="form-control" maxlength="9"/>
                                            <?php if ($error_price) { ?>
                                            <div class="text-danger"><?php echo $error_price; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="pull-right">
                                    <a href="<?php echo $cancel?>" class="btn btn-danger"><i class="fa fa-remove"></i> Cancel Contract</a>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Create Contract</button>
                                </div>
                            </div>
                                <div class="col-md-4">
                                    <legend>Request Overview</legend>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>Banking Instrument</td>
                                            <td><?php echo ($product['name'] != 'Other' ? $product['name'] : $product['other'])?></td>
                                        </tr>
                                        <tr>
                                            <td>Requested amount</td>
                                            <td><?php echo $request?></td>
                                        </tr>
                                        <tr>
                                            <td>Preferred bank account of Payment</td>
                                            <td><?php echo $bank_pay ?></td>
                                        </tr>
                                        <tr>
                                            <td>Preferred bank account of Settlement</td>
                                            <td><?php echo $bank_sett ?></td>
                                        </tr>
                                        <tr>
                                            <td>Beneficiary Name</td>
                                            <td><?php echo $issuer_name?></td>
                                        </tr>
                                    </table>
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
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script>
<?php echo $footer?>