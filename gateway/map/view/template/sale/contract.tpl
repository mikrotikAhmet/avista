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
                                    <div class="form-group required">
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
                                        <input type="text" name="maturity_date" value="<?php echo $maturity_date; ?>" placeholder="MATURITY DATE OF INSTRUMENT" data-format="YYYY-MM-DD" id="input-customer" class="form-control date" />
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

                            <!--div class="form-group required">
                                <label class="control-label" for="input-customer">COMPANY’S NAME: </label>
                                <input type="text" name="company_name" value="<?php echo $company_name; ?>" placeholder="COMPANY’S NAME" id="input-customer" class="form-control" />
                                <?php if ($error_company_name) { ?>
                                <div class="text-danger"><?php echo $error_company_name; ?></div>
                                <?php } ?>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-customer">COMPANY’S ADDRESS: </label>
                                <textarea name="company_address" placeholder="COMPANY’S ADDRESS" id="input-customer" class="form-control"><?php echo $company_address; ?></textarea>
                                <?php if ($error_company_address) { ?>
                                <div class="text-danger"><?php echo $error_company_address; ?></div>
                                <?php } ?>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group required">
                                        <label class="control-label" for="input-customer">COMPANY’S TELEPHONE: </label>
                                        <input type="text" name="company_telephone" value="<?php echo $company_telephone; ?>" placeholder="COMPANY’S TELEPHONE" id="input-customer" class="form-control" />
                                        <?php if ($error_company_telephone) { ?>
                                        <div class="text-danger"><?php echo $error_company_telephone; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group required">
                                        <label class="control-label" for="input-customer">COMPANY’S EMAIL: </label>
                                        <input type="text" name="company_email" value="<?php echo $company_email; ?>" placeholder="COMPANY’S EMAIL" id="input-customer" class="form-control" />
                                        <?php if ($error_company_email) { ?>
                                        <div class="text-danger"><?php echo $error_company_email; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">COMPANY’S CONTACT PERSON:</label>
                                    <input type="text" name="contact_person" value="<?php echo $contact_person; ?>" placeholder="COMPANY’S CONTACT PERSON" id="input-customer" class="form-control" />
                                    <?php if ($error_contact_person) { ?>
                                    <div class="text-danger"><?php echo $error_contact_person; ?></div>
                                    <?php } ?>
                                </div>
                        </div>
                            <div class="col-md-4">
                                <legend>Bank Information</legend>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">BANK NAME:</label>
                                    <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" placeholder="BANK NAME" id="input-customer" class="form-control" />
                                    <?php if ($error_bank_name) { ?>
                                    <div class="text-danger"><?php echo $error_bank_name; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">BANK IBAN:</label>
                                    <input type="text" name="iban" value="<?php echo $iban; ?>" placeholder="BANK IBAN" id="input-customer" class="form-control" />
                                    <?php if ($error_iban) { ?>
                                    <div class="text-danger"><?php echo $error_iban; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">BANK SWIFT CODE:</label>
                                    <input type="text" name="swift_code" value="<?php echo $swift_code; ?>" placeholder="BANK SWIFT CODE" id="input-customer" class="form-control" />
                                    <?php if ($error_swift_code) { ?>
                                    <div class="text-danger"><?php echo $error_swift_code; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">BENEFICIARY NAME:</label>
                                    <input type="text" name="beneficiary_name" value="<?php echo $beneficiary_name; ?>" placeholder="COMPANY’S CONTACT PERSON" id="input-customer" class="form-control" />
                                    <?php if ($error_beneficiary_name) { ?>
                                    <div class="text-danger"><?php echo $error_beneficiary_name; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">BANK OFFICER NAME:</label>
                                    <input type="text" name="officer_name" value="<?php echo $officer_name; ?>" placeholder="BANK OFFICER NAME" id="input-customer" class="form-control" />
                                    <?php if ($error_officer_name) { ?>
                                    <div class="text-danger"><?php echo $error_officer_name; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">BANK OFFICER EMAIL:</label>
                                    <input type="text" name="officer_email" value="<?php echo $officer_email; ?>" placeholder="COMPANY’S CONTACT PERSON" id="input-customer" class="form-control" />
                                    <?php if ($error_officer_email) { ?>
                                    <div class="text-danger"><?php echo $error_officer_email; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="form-group required">
                                    <label class="control-label" for="input-customer">BANK OFFICER PHONE:</label>
                                    <input type="text" name="officer_phone" value="<?php echo $officer_phone; ?>" placeholder="BANK OFFICER PHONE" id="input-customer" class="form-control" />
                                    <?php if ($error_officer_phone) { ?>
                                    <div class="text-danger"><?php echo $error_officer_phone; ?></div>
                                    <?php } ?>
                                </div>
                            </div-->
                            <div class="pull-right">
                                <a href="<?php echo $cancel?>" class="btn btn-danger"><i class="fa fa-remove"></i> Cancel Contract</a>
                                <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Create Contract</button>
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