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
                    <button type="button" form="form-certificate" onclick="$('#form-certificate').submit()" data-toggle="tooltip" title="<?php echo $button_save; ?>"
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
                              id="form-certificate" class="form-horizontal">
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
                                        <div class="row">
                                        <div class="form-group required">
                                            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                                            <div class="col-sm-10">
                                                <select name="address[country_id]" id="input-country" class="form-control">
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
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="address[postcode]" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-director">
                                    <button type="button" class="btn btn-primary pull-right" id="add-director"><?php echo $button_add_director?></button>
                                    <div id="director-list">
                                        <table class="table table-responsive table-striped">
                                            <thead>
                                            <tr>
                                                <th>Director name</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php if ($directors) { ?>
                                            <?php $director_row = 1;?>
                                            <?php foreach ($directors as $director) { ?>
                                            <tr id="director-row<?php echo $director_row;?>">
                                                <td><?php echo $director['firstname'].' '.$director['lastname']?></td>
                                                <td>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][firstname]" value="<?php echo $director['firstname']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][lastname]" value="<?php echo $director['lastname']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][email]" value="<?php echo $director['email']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][dob]" value="<?php echo $director['dob']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][telephone]" value="<?php echo $director['telephone']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][passport]" value="<?php echo $director['passport']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][ssn]" value="<?php echo $director['ssn']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][country_id]" value="<?php echo $director['country_id']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][address_1]" value="<?php echo $director['address_1']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][address_2]" value="<?php echo $director['address_2']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][city]" value="<?php echo $director['city']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][postcode]" value="<?php echo $director['postcode']?>"/>
                                                    <input type="hidden" name="director[<?php echo $director_row?>][zone_id]" value="<?php echo $director['zone_id']?>"/>

                                                </td>
                                                <td class="text-left">
                                                    <button type="button" onclick="editDirector('<?php echo $director_row?>');" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></button>
                                                    <button type="button" onclick="$('#director-row<?php echo $director_row?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                            </tr>
                                            <?php $director_row++;} ?>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-ubo">
                                    <button type="button" class="btn btn-primary pull-right" id="add-ubo"><?php echo $button_add_ubo?></button>
                                    <div id="ubo-list">
                                        <table class="table table-responsive table-striped">
                                            <thead>
                                            <tr>
                                                <th>Ultimate Beneficiary Owner name</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php if ($ubos) { ?>
                                            <?php $ubo_row = 1;?>
                                            <?php foreach ($ubos as $ubo) { ?>
                                            <tr id="ubo-row<?php echo $ubo_row;?>">
                                                <td><?php echo $ubo['firstname'].' '.$ubo['lastname']?></td>
                                                <td>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][firstname]" value="<?php echo $ubo['firstname']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][lastname]" value="<?php echo $ubo['lastname']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][email]" value="<?php echo $ubo['email']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][dob]" value="<?php echo $ubo['dob']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][telephone]" value="<?php echo $ubo['telephone']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][passport]" value="<?php echo $ubo['passport']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][ssn]" value="<?php echo $ubo['ssn']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][country_id]" value="<?php echo $ubo['country_id']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][address_1]" value="<?php echo $ubo['address_1']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][address_2]" value="<?php echo $ubo['address_2']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][city]" value="<?php echo $ubo['city']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][postcode]" value="<?php echo $ubo['postcode']?>"/>
                                                    <input type="hidden" name="ubo[<?php echo $ubo_row?>][zone_id]" value="<?php echo $ubo['zone_id']?>"/>

                                                </td>
                                                <td class="text-left">
                                                    <button type="button" onclick="editUbo('<?php echo $ubo_row?>');" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></button>
                                                    <button type="button" onclick="$('#ubo-row<?php echo $ubo_row?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                            </tr>
                                            <?php $ubo_row++;} ?>
                                            <?php } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-contact">
                                    <button type="button" class="btn btn-primary pull-right" id="add-contact"><?php echo $button_add_contact?></button>
                                    <div id="contact-list">
                                        <table class="table table-responsive table-striped">
                                            <thead>
                                            <tr>
                                                <th>Ultimate Beneficiary Owner name</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php if ($contacts) { ?>
                                            <?php $contact_row = 1;?>
                                            <?php foreach ($contacts as $contact) { ?>
                                            <tr id="contact-row<?php echo $contact_row;?>">
                                                <td><?php echo $contact['firstname'].' '.$contact['lastname']?></td>
                                                <td>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][firstname]" value="<?php echo $contact['firstname']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][lastname]" value="<?php echo $contact['lastname']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][email]" value="<?php echo $contact['email']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][dob]" value="<?php echo $contact['dob']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][telephone]" value="<?php echo $contact['telephone']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][passport]" value="<?php echo $contact['passport']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][ssn]" value="<?php echo $contact['ssn']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][country_id]" value="<?php echo $contact['country_id']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][address_1]" value="<?php echo $contact['address_1']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][address_2]" value="<?php echo $contact['address_2']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][city]" value="<?php echo $contact['city']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][postcode]" value="<?php echo $contact['postcode']?>"/>
                                                    <input type="hidden" name="contact[<?php echo $contact_row?>][zone_id]" value="<?php echo $contact['zone_id']?>"/>

                                                </td>
                                                <td class="text-left">
                                                    <button type="button" onclick="editContact('<?php echo $contact_row?>');" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></button>
                                                    <button type="button" onclick="$('#contact-row<?php echo $contact_row?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                            </tr>
                                            <?php $contact_row++;} ?>
                                            <?php } ?>
                                            </tbody>
                                        </table>
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
<!-- Modal -->
<div class="modal fade" id="director-form-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-md">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><span id="form"></span></h4>
            </div>
            <div class="modal-body">
                <input type="hidden" name="mode_edit" value=""/>
                <form id="form-director">

                    <fieldset>
                       <legend>Director Information</legend>
                        <div class="form-group required">
                            <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                            <div class="">
                                <input type="text" name="director_firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                            <div class="">
                                <input type="text" name="director_lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                            <div class="">
                                <input type="text" name="director_email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-dob"><?php echo $entry_dob; ?></label>
                            <div class="">
                                <input type="text" name="director_dob" value="" placeholder="<?php echo $entry_dob; ?>" data-format = "YYYY-MM-DD" id="input-dob" class="form-control date" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                            <div class="">
                                <input type="text" name="director_telephone" value="" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group required">
                                    <label class="control-label" for="input-passport"><?php echo $entry_passport; ?></label>
                                    <div class="">
                                        <input type="text" name="director_passport" value="" placeholder="<?php echo $entry_passport; ?>" id="input-passport" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-ssn"><?php echo $entry_ssn; ?></label>
                                    <div class="">
                                        <input type="text" name="director_ssn" value="" placeholder="<?php echo $entry_ssn; ?>" id="input-ssn" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </fieldset>
                        <fieldset>
                            <legend>Director Address</legend>
                            <div class="form-group required">
                                <label class="control-label" for="input-country"><?php echo $entry_country; ?></label>
                                <div class="">
                                    <select name="director_country" class="form-control" id="country_id">
                                        <option value=""><?php echo $text_select?></option>
                                        <?php foreach ($countries as $country) { ?>
                                        <option value="<?php echo $country['country_id']?>"><?php echo $country['name']?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-address_1"><?php echo $entry_address_1; ?></label>
                                <div class="">
                                    <input type="text" name="director_address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-address_1" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-address_2"><?php echo $entry_address_2; ?></label>
                                <div class="">
                                    <input type="text" name="director_address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-address_2" class="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group required">
                                        <label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
                                        <div class="">
                                            <input type="text" name="director_city" value="" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                                        <div class="">
                                            <input type="text" name="director_postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                                <div class="">
                                    <select name="director_zone" class="form-control">
                                    </select>
                                </div>
                            </div>
                        </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="button-close"class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="button-issue" onclick="addDirector()" class="btn btn-primary">Continue</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="ubo-form-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-md">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><span id="form"></span></h4>
            </div>
            <div class="modal-body">
                <input type="hidden" name="mode_edit" value=""/>
                <form id="form-ubo">

                    <fieldset>
                        <legend>Director Information</legend>
                        <div class="form-group required">
                            <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                            <div class="">
                                <input type="text" name="ubo_firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                            <div class="">
                                <input type="text" name="ubo_lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                            <div class="">
                                <input type="text" name="ubo_email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-dob"><?php echo $entry_dob; ?></label>
                            <div class="">
                                <input type="text" name="ubo_dob" value="" placeholder="<?php echo $entry_dob; ?>" data-format = "YYYY-MM-DD" id="input-dob" class="form-control date" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                            <div class="">
                                <input type="text" name="ubo_telephone" value="" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group required">
                                    <label class="control-label" for="input-passport"><?php echo $entry_passport; ?></label>
                                    <div class="">
                                        <input type="text" name="ubo_passport" value="" placeholder="<?php echo $entry_passport; ?>" id="input-passport" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-ssn"><?php echo $entry_ssn; ?></label>
                                    <div class="">
                                        <input type="text" name="ubo_ssn" value="" placeholder="<?php echo $entry_ssn; ?>" id="input-ssn" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </fieldset>
                    <fieldset>
                        <legend>Director Address</legend>
                        <div class="form-group required">
                            <label class="control-label" for="input-country"><?php echo $entry_country; ?></label>
                            <div class="">
                                <select name="ubo_country" class="form-control" id="country_id">
                                    <option value=""><?php echo $text_select?></option>
                                    <?php foreach ($countries as $country) { ?>
                                    <option value="<?php echo $country['country_id']?>"><?php echo $country['name']?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-address_1"><?php echo $entry_address_1; ?></label>
                            <div class="">
                                <input type="text" name="ubo_address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-address_1" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="input-address_2"><?php echo $entry_address_2; ?></label>
                            <div class="">
                                <input type="text" name="ubo_address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-address_2" class="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group required">
                                    <label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
                                    <div class="">
                                        <input type="text" name="ubo_city" value="" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                                    <div class="">
                                        <input type="text" name="ubo_postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                            <div class="">
                                <select name="ubo_zone" class="form-control">
                                </select>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="button-close"class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="button-issue" onclick="addUbo()" class="btn btn-primary">Continue</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="contact-form-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-md">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><span id="form"></span></h4>
            </div>
            <div class="modal-body">
                <input type="hidden" name="mode_edit" value=""/>
                <form id="form-contact">

                    <fieldset>
                        <legend>Director Information</legend>
                        <div class="form-group required">
                            <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                            <div class="">
                                <input type="text" name="contact_firstname" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                            <div class="">
                                <input type="text" name="contact_lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                            <div class="">
                                <input type="text" name="contact_email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-dob"><?php echo $entry_dob; ?></label>
                            <div class="">
                                <input type="text" name="contact_dob" value="" placeholder="<?php echo $entry_dob; ?>" data-format = "YYYY-MM-DD" id="input-dob" class="form-control date" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                            <div class="">
                                <input type="text" name="contact_telephone" value="" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group required">
                                    <label class="control-label" for="input-passport"><?php echo $entry_passport; ?></label>
                                    <div class="">
                                        <input type="text" name="contact_passport" value="" placeholder="<?php echo $entry_passport; ?>" id="input-passport" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-ssn"><?php echo $entry_ssn; ?></label>
                                    <div class="">
                                        <input type="text" name="contact_ssn" value="" placeholder="<?php echo $entry_ssn; ?>" id="input-ssn" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </fieldset>
                    <fieldset>
                        <legend>Director Address</legend>
                        <div class="form-group required">
                            <label class="control-label" for="input-country"><?php echo $entry_country; ?></label>
                            <div class="">
                                <select name="contact_country" class="form-control" id="country_id">
                                    <option value=""><?php echo $text_select?></option>
                                    <?php foreach ($countries as $country) { ?>
                                    <option value="<?php echo $country['country_id']?>"><?php echo $country['name']?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-address_1"><?php echo $entry_address_1; ?></label>
                            <div class="">
                                <input type="text" name="contact_address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-address_1" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="input-address_2"><?php echo $entry_address_2; ?></label>
                            <div class="">
                                <input type="text" name="contact_address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-address_2" class="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group required">
                                    <label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
                                    <div class="">
                                        <input type="text" name="contact_city" value="" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                                    <div class="">
                                        <input type="text" name="contact_postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                            <div class="">
                                <select name="contact_zone" class="form-control">
                                </select>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="button-close"class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="button-issue" onclick="addContact()" class="btn btn-primary">Continue</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript"><!--

$('select[name=\'address[country_id]\']').on('change', function() {
    $.ajax({
        url: 'index.php?route=customer/certificate/country&token=<?php echo $token?>&country_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
            $('select[name=\'address[country_id]\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
        },
        complete: function() {
            $('.fa-spin').remove();
        },
        success: function(json) {
            if (json['postcode_required'] == '1') {
                $('input[name=\'address[postcode]\']').parent().parent().addClass('required');
            } else {
                $('input[name=\'address[postcode\']').parent().parent().removeClass('required');
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

            $('select[name=\'address[zone_id]\']').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'address[country_id]\']').trigger('change');

    /////////////////////////////////////////////////////
    $('select[name=\'director_country\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=customer/certificate/country&token=<?php echo $token?>&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('select[name=\'director_country\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function() {
                $('.fa-spin').remove();
            },
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('input[name=\'director_postcode\']').parent().parent().addClass('required');
                } else {
                    $('input[name=\'director_postcode\']').parent().parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone']) {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

//                        if (json['zone'][i]['zone_id'] == '<?php //echo $address['zone_id']; ?>') {
//                            html += ' selected="selected"';
//                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'director_zone\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'director_country\']').trigger('change');
    /////////////////////////////////////////////////////

/////////////////////////////////////////////////////
$('select[name=\'ubo_country\']').on('change', function() {
    $.ajax({
        url: 'index.php?route=customer/certificate/country&token=<?php echo $token?>&country_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
            $('select[name=\'ubo_country\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
        },
        complete: function() {
            $('.fa-spin').remove();
        },
        success: function(json) {
            if (json['postcode_required'] == '1') {
                $('input[name=\'ubo_postcode\']').parent().parent().addClass('required');
            } else {
                $('input[name=\'ubo_postcode\']').parent().parent().removeClass('required');
            }

            html = '<option value=""><?php echo $text_select; ?></option>';

            if (json['zone']) {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';

//                        if (json['zone'][i]['zone_id'] == '<?php //echo $address['zone_id']; ?>') {
//                            html += ' selected="selected"';
//                        }

                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }

            $('select[name=\'ubo_zone\']').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'ubo_country\']').trigger('change');
/////////////////////////////////////////////////////

/////////////////////////////////////////////////////
$('select[name=\'contact_country\']').on('change', function() {
    $.ajax({
        url: 'index.php?route=customer/certificate/country&token=<?php echo $token?>&country_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
            $('select[name=\'contact_country\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
        },
        complete: function() {
            $('.fa-spin').remove();
        },
        success: function(json) {
            if (json['postcode_required'] == '1') {
                $('input[name=\'contact_postcode\']').parent().parent().addClass('required');
            } else {
                $('input[name=\'contact_postcode\']').parent().parent().removeClass('required');
            }

            html = '<option value=""><?php echo $text_select; ?></option>';

            if (json['zone']) {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';

//                        if (json['zone'][i]['zone_id'] == '<?php //echo $address['zone_id']; ?>') {
//                            html += ' selected="selected"';
//                        }

                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }

            $('select[name=\'contact_zone\']').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'contact_country\']').trigger('change');
/////////////////////////////////////////////////////

    $('#add-director').on('click',function(){
        $('#form-director')[0].reset();
        $('input[name=\'mode_edit\']').val('0');
        $('#director-form-modal  #form').html('Add new');
        $('#director-form-modal').modal('show');

    });

$('#add-ubo').on('click',function(){
    $('#form-ubo')[0].reset();
    $('input[name=\'mode_edit\']').val('0');
    $('#ubo-form-modal  #form').html('Add new');
    $('#ubo-form-modal').modal('show');

});

$('#add-contact').on('click',function(){
    $('#form-contact')[0].reset();
    $('input[name=\'mode_edit\']').val('0');
    $('#contact-form-modal  #form').html('Add new');
    $('#contact-form-modal').modal('show');

});


    ////////// ADD DIRECTOR ////////////////////////////

    var director_row = '<?php echo $director_row?>';
    var director_data = [];



    function addDirector(){

        var data = $('#form-director').serializeArray();

        if (!data[0].value || !data[1].value || !data[2].value || !data[3].value || !data[4].value || !data[5].value || !data[7].value || !data[8].value || !data[11].value || !data[12].value){
            alert('Please check your form again.\n\nYour form does not seems valid!');
            return false;
        }

        html  = '<tr id="director-row' + director_row + '">';
        html +='<td>'+data[0].value+' '+data[1].value+'</td>';
        html +='<td>';
        html +='<input type="hidden" value="'+data[0].value+'" name="director['+director_row+'][firstname]"/>';
        html +='<input type="hidden" value="'+data[1].value+'" name="director['+director_row+'][lastname]"/>';
        html +='<input type="hidden" value="'+data[2].value+'" name="director['+director_row+'][email]"/>';
        html +='<input type="hidden" value="'+data[3].value+'" name="director['+director_row+'][dob]"/>';
        html +='<input type="hidden" value="'+data[4].value+'" name="director['+director_row+'][telephone]"/>';
        html +='<input type="hidden" value="'+data[5].value+'" name="director['+director_row+'][passport]"/>';
        html +='<input type="hidden" value="'+data[6].value+'" name="director['+director_row+'][ssn]"/>';
        html +='<input type="hidden" value="'+data[7].value+'" name="director['+director_row+'][country_id]"/>';
        html +='<input type="hidden" value="'+data[8].value+'" name="director['+director_row+'][address_1]"/>';
        html +='<input type="hidden" value="'+data[9].value+'" name="director['+director_row+'][address_2]"/>';
        html +='<input type="hidden" value="'+data[10].value+'" name="director['+director_row+'][city]"/>';
        html +='<input type="hidden" value="'+data[11].value+'" name="director['+director_row+'][postcode]"/>';
        html +='<input type="hidden" value="'+data[12].value+'" name="director['+director_row+'][zone_id]"/>';
        html +='</td>';
        html += '  <td class="text-left"><button type="button" onclick="editDirector(\''+director_row+'\');" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></button>';
        html += '  <button type="button" onclick="$(\'#director-row' + director_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        if ($('input[name=\'mode_edit\']').val() == '0'){
            $('#director-list tbody').append(html);
        } else {
            $('#director-row' + $('input[name=\'mode_edit\']').val()).remove();
            $('#director-list tbody').append(html);
        }

//        $('#director-list tbody').append(html);

        director_row++;
        $('#form-director')[0].reset();
        $('#director-form-modal').modal('hide');

        $('.date').datetimepicker({
            pickTime: false
        });

        console.log(data);
//        console.log(data[0].value);
//        console.log(data[1].value);
    }

////////// ADD UBO ////////////////////////////

var ubo_row = '<?php echo $ubo_row?>';
var ubo_data = [];



function addUbo(){

    var data = $('#form-ubo').serializeArray();

    if (!data[0].value || !data[1].value || !data[2].value || !data[3].value || !data[4].value || !data[5].value || !data[7].value || !data[8].value || !data[11].value || !data[12].value){
        alert('Please check your form again.\n\nYour form does not seems valid!');
        return false;
    }

    html  = '<tr id="ubo-row' + ubo_row + '">';
    html +='<td>'+data[0].value+' '+data[1].value+'</td>';
    html +='<td>';
    html +='<input type="hidden" value="'+data[0].value+'" name="ubo['+ubo_row+'][firstname]"/>';
    html +='<input type="hidden" value="'+data[1].value+'" name="ubo['+ubo_row+'][lastname]"/>';
    html +='<input type="hidden" value="'+data[2].value+'" name="ubo['+ubo_row+'][email]"/>';
    html +='<input type="hidden" value="'+data[3].value+'" name="ubo['+ubo_row+'][dob]"/>';
    html +='<input type="hidden" value="'+data[4].value+'" name="ubo['+ubo_row+'][telephone]"/>';
    html +='<input type="hidden" value="'+data[5].value+'" name="ubo['+ubo_row+'][passport]"/>';
    html +='<input type="hidden" value="'+data[6].value+'" name="ubo['+ubo_row+'][ssn]"/>';
    html +='<input type="hidden" value="'+data[7].value+'" name="ubo['+ubo_row+'][country_id]"/>';
    html +='<input type="hidden" value="'+data[8].value+'" name="ubo['+ubo_row+'][address_1]"/>';
    html +='<input type="hidden" value="'+data[9].value+'" name="ubo['+ubo_row+'][address_2]"/>';
    html +='<input type="hidden" value="'+data[10].value+'" name="ubo['+ubo_row+'][city]"/>';
    html +='<input type="hidden" value="'+data[11].value+'" name="ubo['+ubo_row+'][postcode]"/>';
    html +='<input type="hidden" value="'+data[12].value+'" name="ubo['+ubo_row+'][zone_id]"/>';
    html +='</td>';
    html += '  <td class="text-left"><button type="button" onclick="editDirector(\''+ubo_row+'\');" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></button>';
    html += '  <button type="button" onclick="$(\'#ubo-row' + ubo_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';

    if ($('input[name=\'mode_edit\']').val() == '0'){
        $('#ubo-list tbody').append(html);
    } else {
        $('#ubo-row' + $('input[name=\'mode_edit\']').val()).remove();
        $('#ubo-list tbody').append(html);
    }

//        $('#ubo-list tbody').append(html);

    ubo_row++;
    $('#form-ubo')[0].reset();
    $('#ubo-form-modal').modal('hide');

    $('.date').datetimepicker({
        pickTime: false
    });

    console.log(data);
//        console.log(data[0].value);
//        console.log(data[1].value);
}

////////// ADD CONTACT ////////////////////////////

var contact_row = '<?php echo $contact_row?>';
var contact_data = [];



function addContact(){

    var data = $('#form-contact').serializeArray();

    if (!data[0].value || !data[1].value || !data[2].value || !data[3].value || !data[4].value || !data[5].value || !data[7].value || !data[8].value || !data[11].value || !data[12].value){
        alert('Please check your form again.\n\nYour form does not seems valid!');
        return false;
    }

    html  = '<tr id="contact-row' + contact_row + '">';
    html +='<td>'+data[0].value+' '+data[1].value+'</td>';
    html +='<td>';
    html +='<input type="hidden" value="'+data[0].value+'" name="contact['+contact_row+'][firstname]"/>';
    html +='<input type="hidden" value="'+data[1].value+'" name="contact['+contact_row+'][lastname]"/>';
    html +='<input type="hidden" value="'+data[2].value+'" name="contact['+contact_row+'][email]"/>';
    html +='<input type="hidden" value="'+data[3].value+'" name="contact['+contact_row+'][dob]"/>';
    html +='<input type="hidden" value="'+data[4].value+'" name="contact['+contact_row+'][telephone]"/>';
    html +='<input type="hidden" value="'+data[5].value+'" name="contact['+contact_row+'][passport]"/>';
    html +='<input type="hidden" value="'+data[6].value+'" name="contact['+contact_row+'][ssn]"/>';
    html +='<input type="hidden" value="'+data[7].value+'" name="contact['+contact_row+'][country_id]"/>';
    html +='<input type="hidden" value="'+data[8].value+'" name="contact['+contact_row+'][address_1]"/>';
    html +='<input type="hidden" value="'+data[9].value+'" name="contact['+contact_row+'][address_2]"/>';
    html +='<input type="hidden" value="'+data[10].value+'" name="contact['+contact_row+'][city]"/>';
    html +='<input type="hidden" value="'+data[11].value+'" name="contact['+contact_row+'][postcode]"/>';
    html +='<input type="hidden" value="'+data[12].value+'" name="contact['+contact_row+'][zone_id]"/>';
    html +='</td>';
    html += '  <td class="text-left"><button type="button" onclick="editDirector(\''+contact_row+'\');" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></button>';
    html += '  <button type="button" onclick="$(\'#contact-row' + contact_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';

    if ($('input[name=\'mode_edit\']').val() == '0'){
        $('#contact-list tbody').append(html);
    } else {
        $('#contact-row' + $('input[name=\'mode_edit\']').val()).remove();
        $('#contact-list tbody').append(html);
    }

//        $('#contact-list tbody').append(html);

    contact_row++;
    $('#form-contact')[0].reset();
    $('#contact-form-modal').modal('hide');

    $('.date').datetimepicker({
        pickTime: false
    });

    console.log(data);
//        console.log(data[0].value);
//        console.log(data[1].value);
}

    function editDirector(director_row){

        $('input[name=\'director_firstname\']').val($('input[name=\'director['+director_row+'][firstname]\']').val());
        $('input[name=\'director_lastname\']').val($('input[name=\'director['+director_row+'][lastname]\']').val());
        $('input[name=\'director_email\']').val($('input[name=\'director['+director_row+'][email]\']').val());
        $('input[name=\'director_dob\']').val($('input[name=\'director['+director_row+'][dob]\']').val());
        $('input[name=\'director_telephone\']').val($('input[name=\'director['+director_row+'][telephone]\']').val());
        $('input[name=\'director_passport\']').val($('input[name=\'director['+director_row+'][passport]\']').val());
        $('input[name=\'director_ssn\']').val($('input[name=\'director['+director_row+'][snn]\']').val());

        var country_id = $('input[name=\'director['+director_row+'][country_id]\']').val();

        $('#country_id option').prop('selected', false)
                .filter('[value=\''+country_id+'\']')
                .prop('selected', true);

        $.ajax({
            url: 'index.php?route=customer/certificate/country&token=<?php echo $token?>&country_id=' + $('input[name=\'director['+director_row+'][country_id]\']').val(),
            dataType: 'json',
            beforeSend: function() {
                $('select[name=\'director_country\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function() {
                $('.fa-spin').remove();
            },
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('input[name=\'director_postcode\']').parent().parent().addClass('required');
                } else {
                    $('input[name=\'director_postcode\']').parent().parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone']) {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == $('input[name=\'director['+director_row+'][zone_id]\']').val()) {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'director_zone\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

        $('input[name=\'director_address_1\']').val($('input[name=\'director['+director_row+'][address_1]\']').val());
        $('input[name=\'director_address_2\']').val($('input[name=\'director['+director_row+'][address_2]\']').val());
        $('input[name=\'director_city\']').val($('input[name=\'director['+director_row+'][city]\']').val());
        $('input[name=\'director_postcode\']').val($('input[name=\'director['+director_row+'][postcode]\']').val());
        $('input[name=\'mode_edit\']').val(director_row);

        $('#director-form-modal').modal('show');
    }

function editUbo(ubo_row){

    $('input[name=\'ubo_firstname\']').val($('input[name=\'ubo['+ubo_row+'][firstname]\']').val());
    $('input[name=\'ubo_lastname\']').val($('input[name=\'ubo['+ubo_row+'][lastname]\']').val());
    $('input[name=\'ubo_email\']').val($('input[name=\'ubo['+ubo_row+'][email]\']').val());
    $('input[name=\'ubo_dob\']').val($('input[name=\'ubo['+ubo_row+'][dob]\']').val());
    $('input[name=\'ubo_telephone\']').val($('input[name=\'ubo['+ubo_row+'][telephone]\']').val());
    $('input[name=\'ubo_passport\']').val($('input[name=\'ubo['+ubo_row+'][passport]\']').val());
    $('input[name=\'ubo_ssn\']').val($('input[name=\'ubo['+ubo_row+'][snn]\']').val());

    var country_id = $('input[name=\'ubo['+ubo_row+'][country_id]\']').val();

    $('#country_id option').prop('selected', false)
            .filter('[value=\''+country_id+'\']')
            .prop('selected', true);

    $.ajax({
        url: 'index.php?route=customer/certificate/country&token=<?php echo $token?>&country_id=' + $('input[name=\'ubo['+ubo_row+'][country_id]\']').val(),
        dataType: 'json',
        beforeSend: function() {
            $('select[name=\'ubo_country\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
        },
        complete: function() {
            $('.fa-spin').remove();
        },
        success: function(json) {
            if (json['postcode_required'] == '1') {
                $('input[name=\'ubo_postcode\']').parent().parent().addClass('required');
            } else {
                $('input[name=\'ubo_postcode\']').parent().parent().removeClass('required');
            }

            html = '<option value=""><?php echo $text_select; ?></option>';

            if (json['zone']) {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                    if (json['zone'][i]['zone_id'] == $('input[name=\'ubo['+ubo_row+'][zone_id]\']').val()) {
                        html += ' selected="selected"';
                    }

                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }

            $('select[name=\'ubo_zone\']').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

    $('input[name=\'ubo_address_1\']').val($('input[name=\'ubo['+ubo_row+'][address_1]\']').val());
    $('input[name=\'ubo_address_2\']').val($('input[name=\'ubo['+ubo_row+'][address_2]\']').val());
    $('input[name=\'ubo_city\']').val($('input[name=\'ubo['+ubo_row+'][city]\']').val());
    $('input[name=\'ubo_postcode\']').val($('input[name=\'ubo['+ubo_row+'][postcode]\']').val());
    $('input[name=\'mode_edit\']').val(ubo_row);

    $('#ubo-form-modal').modal('show');
}

function editContact(contact_row){

    $('input[name=\'contact_firstname\']').val($('input[name=\'contact['+contact_row+'][firstname]\']').val());
    $('input[name=\'contact_lastname\']').val($('input[name=\'contact['+contact_row+'][lastname]\']').val());
    $('input[name=\'contact_email\']').val($('input[name=\'contact['+contact_row+'][email]\']').val());
    $('input[name=\'contact_dob\']').val($('input[name=\'contact['+contact_row+'][dob]\']').val());
    $('input[name=\'contact_telephone\']').val($('input[name=\'contact['+contact_row+'][telephone]\']').val());
    $('input[name=\'contact_passport\']').val($('input[name=\'contact['+contact_row+'][passport]\']').val());
    $('input[name=\'contact_ssn\']').val($('input[name=\'contact['+contact_row+'][snn]\']').val());

    var country_id = $('input[name=\'contact['+contact_row+'][country_id]\']').val();

    $('#country_id option').prop('selected', false)
            .filter('[value=\''+country_id+'\']')
            .prop('selected', true);

    $.ajax({
        url: 'index.php?route=customer/certificate/country&token=<?php echo $token?>&country_id=' + $('input[name=\'contact['+contact_row+'][country_id]\']').val(),
        dataType: 'json',
        beforeSend: function() {
            $('select[name=\'contact_country\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
        },
        complete: function() {
            $('.fa-spin').remove();
        },
        success: function(json) {
            if (json['postcode_required'] == '1') {
                $('input[name=\'contact_postcode\']').parent().parent().addClass('required');
            } else {
                $('input[name=\'contact_postcode\']').parent().parent().removeClass('required');
            }

            html = '<option value=""><?php echo $text_select; ?></option>';

            if (json['zone']) {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                    if (json['zone'][i]['zone_id'] == $('input[name=\'contact['+contact_row+'][zone_id]\']').val()) {
                        html += ' selected="selected"';
                    }

                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }

            $('select[name=\'contact_zone\']').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

    $('input[name=\'contact_address_1\']').val($('input[name=\'contact['+contact_row+'][address_1]\']').val());
    $('input[name=\'contact_address_2\']').val($('input[name=\'contact['+contact_row+'][address_2]\']').val());
    $('input[name=\'contact_city\']').val($('input[name=\'contact['+contact_row+'][city]\']').val());
    $('input[name=\'contact_postcode\']').val($('input[name=\'contact['+contact_row+'][postcode]\']').val());
    $('input[name=\'mode_edit\']').val(contact_row);

    $('#contact-form-modal').modal('show');
}
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script>
<?php echo $footer?>