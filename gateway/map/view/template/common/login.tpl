<?php echo $header?>
<div class="container">
    <div class="row">
        <div class="col-md-5 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-lock"></i> <?php echo $text_login; ?></h3>
                </div>
                <div class="panel-body">
                    <?php if ($success) { ?>
                    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                    </div>
                    <?php } ?>
                    <?php if ($error_warning) { ?>
                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                    </div>
                    <?php } ?>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <div class="form-group">
                                <label for="input-username"><?php echo $entry_username; ?></label>
                                <div class="input-group"><span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $entry_username; ?>" id="input-username" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input-password"><?php echo $entry_password; ?></label>
                                <div class="input-group"><span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                                </div>
                                <?php if ($forgotten) { ?>
                                <span class="help-block"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></span>
                                <?php } ?>
                            </div>
                            <div class="text-right">
                                <button type="submit" class="btn btn-success btn-block"><i class="fa fa-key"></i> <?php echo $button_login; ?></button>
                            </div>
                            <?php if ($redirect) { ?>
                            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                            <?php } ?>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer?>