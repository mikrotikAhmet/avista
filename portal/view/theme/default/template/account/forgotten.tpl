<?php echo $header?>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-2">
            <div class="brand"></div>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-lock"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <?php if ($error_warning) { ?>
                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
                    <?php } ?>
                    <p><?php echo $text_email; ?></p>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form">
                        <fieldset>
                            <legend><?php echo $text_your_email; ?></legend>
                            <div class="form-group required">
                                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                                <div class="">
                                    <input type="email" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                                </div>
                            </div>
                        </fieldset>
                        <div class="buttons clearfix">
                            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back_login?></a></div>
                            <div class="pull-right">
                                <button type="submit" class="btn btn-primary"><i class="fa fa fa-arrow-circle-down"></i> <?php echo $button_forgotten?></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer?>