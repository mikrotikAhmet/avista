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
                        <li class="active"><a href="#home-pills" data-toggle="tab">Account Settings</a>
                        </li>
                        <li><a href="#profile-pills" data-toggle="tab">Business Info</a>
                        </li>
                        <li><a href="#messages-pills" data-toggle="tab">Verification</a>
                    </ul>
                    <br/>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="home-pills">
                            <table class="table table-responsive table-striped" id="account-manager">
                                <thead>
                                <tr></tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><b>Language</b></td>
                                    <td><?php echo $current_language?></td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td><div class="form-group">
                                            <div class="">
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
                                    <td></td>
                                    <td>
                                        <button type="button" id="save-language" class="btn btn-sm btn-success">Save</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Password</b></td>
                                    <td>*********</td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td>ssssssssss</td>
                                </tr>
                                <tr>
                                    <td><b>Security</b></td>
                                    <td>2-Way Auth. Active</td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td>ssssssssss</td>
                                </tr>
                                <tr>
                                    <td><b>Email preferences</b></td>
                                    <td>Disabled</td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td>ssssssssss</td>
                                </tr>
                                <tr>
                                    <td><b>Referrals</b></td>
                                    <td></td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td>ssssssssss</td>
                                </tr>
                                <tr>
                                    <td><b>Account status</b></td>
                                    <td>Pending</td>
                                    <td><a href="javascript::viod()">Edit</a></td>
                                </tr>
                                <tr class="">
                                    <td>ssssssssss</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="profile-pills">
                            <h4>Profile Tab</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        </div>
                        <div class="tab-pane fade" id="messages-pills">
                            <h4>Messages Tab</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        </div>
                        <div class="tab-pane fade" id="settings-pills">
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