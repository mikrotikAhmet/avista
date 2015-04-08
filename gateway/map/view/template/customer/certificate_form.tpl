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
                    <button type="submit" form="form-user" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                            class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                       class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"
                              id="form-application" class="form-horizontal">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                                <li class=""><a href="#tab-address" data-toggle="tab">Company Address</a></li>
                                <li class=""><a href="#tab-director" data-toggle="tab">Company Director(s)</a></li>
                                <li class=""><a href="#tab-ubo" data-toggle="tab">Ultimate Beneficiary Owner(s)</a></li>
                                <li class=""><a href="#tab-contact" data-toggle="tab">Contact(s)</a></li>
                            </ul>
                            <br/>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab-general">
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-legal"><?php echo $entry_legal; ?></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="legal_name" value="<?php echo $legal_name; ?>" placeholder="<?php echo $entry_legal; ?>" id="input-legal" class="form-control" />
                                            <?php if ($error_legal_name) { ?>
                                            <div class="text-danger"><?php echo $error_legal_name; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group required">
                                            <label class="col-sm-2 control-label" for="input-incdate"><?php echo $entry_inc_date; ?></label>
                                            <div class="input-group date">
                                                <input type="text" name="inc_date" value="<?php echo $inc_date; ?>" placeholder="<?php echo $entry_inc_date; ?>" data-format="YYYY-MM-DD" id="input-incdate" class="form-control" />
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                              </span>
                                                <?php if ($error_inc_date) { ?>
                                                <div class="text-danger"></div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-dba"><?php echo $entry_dba; ?><br/><small>(if other than legal name)</small></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="dba" value="<?php echo $dba; ?>" placeholder="<?php echo $entry_dba; ?>" id="input-dba" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?><br/><small>(LLC, Ltd, Sole Proprietor, etc)</small></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="type" value="<?php echo $type; ?>" placeholder="<?php echo $entry_type; ?>" id="input-type" class="form-control" />
                                            <?php if ($error_type) { ?>
                                            <div class="text-danger"><?php echo $error_type; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-registration"><?php echo $entry_registration; ?></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="registration_number" value="<?php echo $registration_number; ?>" placeholder="<?php echo $entry_registration; ?>" id="input-registration" class="form-control" />
                                            <?php if ($error_registration) { ?>
                                            <div class="text-danger"><?php echo $error_registration; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-tax"><?php echo $entry_tax; ?></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="tax_number" value="<?php echo $tax_number; ?>" placeholder="<?php echo $entry_tax; ?>" id="input-tax" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-address">
                                    <div class="tab-pane" id="tab-address">
                                        <div class="form-group required">
                                            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                                            <div class="col-sm-10">
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
                                            <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="address[address_1]" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                                                <?php if ($error_address_1) { ?>
                                                <div class="text-danger"><?php echo $error_address_1; ?></div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="address[address_2]" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                                            <div class="col-sm-10">
                                                <select name="address[zone_id]" id="input-zone" class="form-control">
                                                </select>
                                                <?php if ($error_zone) { ?>
                                                <div class="text-danger"><?php echo $error_zone; ?></div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="address[city]" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                                                <?php if ($error_city) { ?>
                                                <div class="text-danger"><?php echo $error_city; ?></div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="address[postcode]" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                                                <?php if ($error_postcode) { ?>
                                                <div class="text-danger"><?php echo $error_postcode; ?></div>
                                                <?php } ?>
                                            </div>
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
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script>
<?php echo $footer?>