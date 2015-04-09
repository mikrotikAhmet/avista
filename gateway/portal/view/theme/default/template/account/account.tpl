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
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ol>
    </div>
</div>
<!-- /.row -->
    <div class="row">
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    My account settings
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                <?php if (!$approved || $account_status) { ?>
                <p class="text-info"><b>After you providing company document(s) and valid bank account(s) please make a aprroval request by clicking</b> <button type="button" class="btn btn-sm btn-success">Request Approval</button>.</p>
                <?php } ?>
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills">
                        <li class="active"><a href="#account-pills" data-toggle="tab">Account Settings</a></li>
                        <li><a href="#profile-pills" data-toggle="tab">Personal Information</a></li>
                        <li><a href="#business-pills" data-toggle="tab">Business Information</a></li>
                        <li><a href="#bank-pills" data-toggle="tab">Bank Account(s)</a></li>
                        <li><a href="#verification-pills" data-toggle="tab">Verification</a></li>
                    </ul>
                    <br/>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="account-pills">
                            <div class="alert alert-info alert-dismissable">
                                <i class="fa fa-exclamation-circle"></i> In this section you can modify your basic account settings.
                            </div>
                            <table class="table table-responsive table-striped" id="account-manager">
                                <thead>
                                <tr></tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><b><?php echo $text_language?></b></td>
                                    <td><?php echo $current_language?></td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td colspan="2"><div class="form-group">
                                            <div class="col-sm-3">
                                                <select name="language_id" id="input-language" class="form-control">
                                                    <?php foreach ($languages as $language) { ?>
                                                    <?php if ($language['language_id'] == $language_id) { ?>
                                                    <option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                                                    <?php } else { ?>
                                                    <option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
                                                    <?php } ?>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div></td>
                                    <td>
                                        <button type="button" id="save-language" class="btn btn-sm btn-success">Save</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b><?php echo $text_password?></b></td>
                                    <td>*********</td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td colspan="2">
                                        <div class="form-group">
                                            <label class="control-label" for="input-password"><?php echo $entry_current_password; ?></label>
                                            <div class="">
                                                <input type="password" name="current_password" id="input-password" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="input-password"><?php echo $entry_new_password; ?></label>
                                            <div class="">
                                                <input type="password" name="new_password"  id="input-password" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="input-password"><?php echo $entry_retype_password; ?></label>
                                            <div class="">
                                                <input type="password" name="confirm_password"  id="input-password" class="form-control" />
                                            </div>
                                        </div>
                                    </td>
                                    <td><button type="button" id="save-password" class="btn btn-sm btn-success">Save</button></td>
                                </tr>
                                <tr>
                                    <td><b><?php echo $text_security?></b></td>
                                    <td><?php echo ($auth ? 'Active' : 'InActive')?></td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td colspan="2">
                                        <div class="form-group">

                                            <div class="">
                                                <?php if ($auth) { ?>
                                                <input type="checkbox" name="twoway"  id="input-twoway" value="1" checked="checked"/>
                                                <?php } else { ?>
                                                <input type="checkbox" name="twoway"  id="input-twoway" value="1"/>
                                                <?php } ?>
                                            </div>
                                            <label class="control-label" for="input-password"><?php echo $text_2way; ?></label>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                                            <div class="">
                                                <input type="text" name="telephone"  value="<?php echo $telephone?>" id="input-telephone" class="form-control" <?php echo (!empty($telephone) ? 'disabled' : '')?>/>
                                            </div>
                                        </div>
                                    </td>
                                    <td><button type="button" id="save-auth" class="btn btn-sm btn-success">Save</button></td>
                                </tr>
                                <!--tr>
                                    <td><b>Email preferences</b></td>
                                    <td><?php echo ($newsletter ? 'Enabled' : 'Disabled')?></td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td colspan="2"><div class="form-group">
                                            <label class=" control-label"><?php echo $entry_newsletter; ?></label>
                                            <div class="">
                                                <?php if ($newsletter) { ?>
                                                <input type="checkbox" name="newsletter"  id="input-twoway" value="1" checked="checked"/>
                                                <?php } else { ?>
                                                <input type="checkbox" name="newsletter"  id="input-twoway" value="1"/>
                                                <?php } ?>
                                            </div>
                                        </div></td>
                                    <td><button type="button" id="save-newsletter" class="btn btn-sm btn-success">Save</button></td>
                                </tr-->
                                <tr>
                                    <td><b>Account status</b></td>
                                    <td><?php echo ($approved ? 'Approved' : 'Pending')?></td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <?php if (!$approved) { ?>
                                <tr class="">
                                    <td colspan="3">
                                        <p>You account is waiting for Verification. To continue and get approved please follow this link : </p>
                                    </td>
                                </tr>
                                <?php } else { ?>
                                <tr class="">
                                    <td colspan="3">
                                        <p class="text-success"><strong>Your account is ACTIVE </strong></p>
                                    </td>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="profile-pills">
                            <div class="alert alert-info alert-dismissable">
                                <i class="fa fa-exclamation-circle"></i> <strong>Important Notice:</strong> In order to change your Personal Information, please contact to our <a href="mailto:compliance@hifholding.com">compliance</a> department. Our compliance team will review your change request.
                            </div>
                            <fieldset>
                                <legend><?php echo $text_your_details; ?></legend>
                                <table class="table table-responsive table-striped">
                                    <tbody>
                                    <tr>
                                        <td>Account type</td>
                                        <td>Business</td>
                                        <td></td>
                                    </tr>
                                        <tr>
                                            <td>First name</td>
                                            <td><?php echo $firstname?></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Last name</td>
                                            <td><?php echo $lastname?></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>E-Mail</td>
                                            <td><?php echo $email?></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Phone</td>
                                            <td><?php echo $telephone?></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><?php echo $address?></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </fieldset>
                        </div>
                        <div class="tab-pane fade" id="business-pills">
                            <?php if (!$approved) { ?>
                            <div class="alert alert-warning alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <i class="fa fa-info-circle"></i>  <strong>Action required!</strong> Your account has no Approved Business Certificate yet.</div>
                            <?php } else { ?>
                            <h1>Verified</h1>
                            <h3 class="text-success">Your Company account has been successfully approved.</h3>
                            <h4 class="text-success">Customer Unique ID : <b><?php echo $unique?></b></h4>
                            <ul>
                                <li>Company Certificate ID : <b><?php echo $certificate['certificate_id']?></b></li>
                                <li>Company Legal Name : <b><?php echo strtoupper($certificate['legal_name'])?></b></li>
                                <li>Company Registration Number : <b><?php echo strtoupper($certificate['registration_number'])?></b> with Date <b><?php echo date('jS \of F Y',strtotime($certificate['inc_date']))?></b></li>
                                <li>Company Registreted Country : <b><?php echo $registered_country['name']?></b></li>
                            </ul>
                            <?php } ?>
                        </div>
                        <div class="tab-pane fade" id="bank-pills">
                            <button type="button" id="add-bank" class="pull-right btn btn-primary">Add bank</button>
                            <br/><br/>
                            <div class="alert alert-info alert-dismissable">
                                <i class="fa fa-exclamation-circle"></i>
                                Please provide us valid bank account(s) which has associated to you company. We will review your Banking Information in order to verify.<br/>
                                Once we verify your Bank Information, you can use your verified bank information while you are placing an order.
                            </div>
                            <div id="bank-list"></div>
                        </div>
                        <div class="tab-pane fade" id="verification-pills">
                            <h3>Document required.</h3>
                            <p class="text-danger">Company documents are required to approve your Company. Please see the list of required documents.
                                More documents you provide will help up to approve your company faster.<br/>
                                <b>NOTE:</b> In some cases we may ask for additional information and documents to complete your approval process.
                            </p>
                            <div class="input-group">
                                <input type="text" name="upload" disabled value="" placeholder="Incorporation documents*" data-format="" id="input-incorporation-documents" class="form-control">
                                  <span class="input-group-btn">
                                    <button type="button" id="button-upload" data-loading-text="Uploading..." class="btn btn-primary"><i class="fa fa-upload"></i> Upload</button>
                                  </span>
                            </div>
                            <br/>
                            <ul>
                                <li>Company incorporation documents.</li>
                                <li>Passport copy of Ultimate Beneficial Owner(s) and authorized signer</li>
                                <li>a bank reference letter for the corporation (within 6 months) - required for corporations older than one year)</li>
                                <li>certified copy of Certificate of Goodstanding/Incumbency (issued by registered agent)/Extract of Registry - Required for corporations older than one year</li>
                                <li>copies of share and director registery</li>
                            </ul>
                            <div id="documents"></div>
                            <br/>
                        </div>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            </div>
    </div>
</div>
<!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<script>
    $("#account-manager tr:odd").addClass("master");
    $("#account-manager tr:not(.master)").hide();
    $("#account-manager tr:first-child").show();

    $("#account-manager tr.master").click(function() {

//        if ($(this).next("tr").css('display') == 'none'){
//            $('#transaction-details-'+this.id).load('index.php?route=account/transaction/details&transaction_id='+this.id);
//        }

        $(this).next("tr").toggle();
        $(this).find(".expand").toggleClass("fa-minus");
        $(this).toggleClass("selected");


    });
</script>
<script type="text/javascript"><!--

    $('#add-bank').on('click',function(){

        var element = $(this);
//
        $.ajax({
            url: 'index.php?route=account/account/addBank',
            type: 'post',
            dataType: 'html',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(html) {

                element.button('reset');
                $('.bank').html(html);

                $('#bank-general').modal('show');

            }
        });

    });
    $('#documents').load('index.php?route=account/account/documents');

    $('#button-upload').on('click', function() {
        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        $('#form-upload input[name=\'file\']').on('change', function() {
            $.ajax({
                url: 'index.php?route=account/account/upload',
                type: 'post',
                dataType: 'json',
                data: new FormData($(this).parent()[0]),
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function() {
                    $('#button-upload').button('loading');
                },
                complete: function() {
                    $('#button-upload').button('reset');
                },
                success: function(json) {
                    if (json['error']) {
                        alert(json['error']);
                    }

                    if (json['success']) {
                        alert(json['success']);

                        $('#documents').load('index.php?route=account/account/documents');
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
    });
    //--></script>
<!-- Modal -->
<div class="modal fade" id="bank-general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Add new Bank</h4>
            </div>
            <div class="modal-body bank">
                <div id="new-bank-form"></div>
            </div>
            <div class="modal-footer">
                <button type="button" id="button-close"class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="button-issue" onclick="addBank( $('#bank-form').serialize())" class="btn btn-primary">Continue</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    $('#bank-list').load('index.php?route=account/account/bankList');

    function addBank(data){

//        var data = $('#bank-form').serialize();
        var element = $(this);

        $.ajax({
            url: 'index.php?route=account/account/insertBank',
            type: 'post',
            data: data,
            dataType: 'json',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(json) {

                element.button('reset');

                if (json.error){
                    alert(json.error['message']);
                } else {
                    alert(json.message);

                    $('#bank-general').modal('hide');
                }

                $('#bank-list').load('index.php?route=account/account/bankList');

            }
        });

    }


    function removeBank(bank_id){

        var element = $(this);

        if(confirm('Are you sure?'))

        $.ajax({
            url: 'index.php?route=account/account/removeBank',
            type: 'post',
            data: 'bank_id=' + bank_id,
            dataType: 'json',
            beforeSend: function () {
                element.button('loading');
            },
            success: function (json) {

                element.button('reset');

                $('#bank-list').load('index.php?route=account/account/bankList');

            }
        });
        else return false;
    }

    function editBank(bank_id){

        var element = $(this);
//
        $.ajax({
            url: 'index.php?route=account/account/editBank',
            type: 'post',
            data: 'bank_id='+bank_id,
            dataType: 'html',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(html) {

                element.button('reset');
                $('.modal-body').html(html);

                $('#bank-general').modal('show');

            }
        });
    }


</script>
<?php echo $footer?>
