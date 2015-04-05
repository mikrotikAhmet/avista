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
                    Pill Tabs
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills">
                        <li class="active"><a href="#account-pills" data-toggle="tab">Account Settings</a></li>
                        <li><a href="#profile-pills" data-toggle="tab">Personal Information</a></li>
                        <li><a href="#business-pills" data-toggle="tab">Business Information</a></li>
                        <li><a href="#verification-pills" data-toggle="tab">Verification</a></li>
                    </ul>
                    <br/>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="account-pills">
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
                                                <input type="text" name="telephone"  value="<?php echo $telephone?>" id="input-telephone" class="form-control" />
                                            </div>
                                        </div>
                                    </td>
                                    <td><button type="button" id="save-auth" class="btn btn-sm btn-success">Save</button></td>
                                </tr>
                                <tr>
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
                                </tr>
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
                            <h4>Profile Tab</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        </div>
                        <div class="tab-pane fade" id="business-pills">
                            <h4>Messages Tab</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        </div>
                        <div class="tab-pane fade" id="verification-pills">
                            <h4>Settings Tab</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
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
<?php echo $footer?>