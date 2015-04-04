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
                    <button type="submit" form="form-user" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-api" class="form-horizontal">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-username"><?php echo $entry_username; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $entry_username; ?>" id="input-username" class="form-control" />
                                    <?php if ($error_username) { ?>
                                    <div class="text-danger"><?php echo $error_username; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                                <div class="col-sm-10">
                                    <textarea name="password" placeholder="<?php echo $entry_password; ?>" rows="5" id="input-password" class="form-control"><?php echo $password; ?></textarea>
                                    <br />
                                    <button type="button" id="button-generate" class="btn btn-primary"><i class="fa fa-refresh"></i> <?php echo $button_generate; ?></button>
                                    <?php if ($error_password) { ?>
                                    <div class="text-danger"><?php echo $error_password; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="status" id="input-status" class="form-control">
                                        <?php if ($status) { ?>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <?php } else { ?>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <?php } ?>
                                    </select>
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
    $('#button-generate').on('click', function() {
        rand = '';

        string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

        for (i = 0; i < 256; i++) {
            rand += string[Math.floor(Math.random() * (string.length - 1))];
        }

        $('#input-password').val(rand);
    });
    //--></script>
<?php echo $footer?>