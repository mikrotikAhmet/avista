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
                                                    <?php if ($country['country_id'] == $address['country_id']) { ?>
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
                                                <input type="text" name="address[address_1]" value="<?php echo $address['address_1']; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                                                <?php if ($error_address_1) { ?>
                                                <div class="text-danger"><?php echo $error_address_1; ?></div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="address[address_2]" value="<?php echo $address['address_2']; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
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
                                                <input type="text" name="address[city]" value="<?php echo $address['city']; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                                                <?php if ($error_city) { ?>
                                                <div class="text-danger"><?php echo $error_city; ?></div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="address[postcode]" value="<?php echo $address['postcode']; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
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
                                    <select name="director_country" class="form-control">
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
<script type="text/javascript"><!--

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

    $('#add-director').on('click',function(){
        $('#director-form-modal  #form').html('Add new');
        $('#director-form-modal').modal('show');

    });


    ////////// ADD DIRECTOR ////////////////////////////

    var director_row = 0;



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
        html +='<input type="hidden" value="'+data[3].value+'" name="director['+director_row+'][telephone]"/>';
        html +='<input type="hidden" value="'+data[4].value+'" name="director['+director_row+'][passport]"/>';
        html +='<input type="hidden" value="'+data[5].value+'" name="director['+director_row+'][ssn]"/>';
        html +='<input type="hidden" value="'+data[6].value+'" name="director['+director_row+'][country_id]"/>';
        html +='<input type="hidden" value="'+data[7].value+'" name="director['+director_row+'][address_1]"/>';
        html +='<input type="hidden" value="'+data[8].value+'" name="director['+director_row+'][address_2]"/>';
        html +='<input type="hidden" value="'+data[9].value+'" name="director['+director_row+'][city]"/>';
        html +='<input type="hidden" value="'+data[10].value+'" name="director['+director_row+'][postcode]"/>';
        html +='<input type="hidden" value="'+data[11].value+'" name="director['+director_row+'][zone_id]"/>';
        html +='<input type="hidden" value="'+data[12].value+'" name="director['+director_row+'][dob]"/>';
        html +='</td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#director-row' + director_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#director-list tbody').append(html);

        director_row++;

        $('#director-form-modal').modal('hide');

        $('.date').datetimepicker({
            pickTime: false
        });

        console.log(data);
//        console.log(data[0].value);
//        console.log(data[1].value);
    }
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script>
<?php echo $footer?>