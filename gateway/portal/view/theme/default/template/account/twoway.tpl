<?php echo $header?>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-2">
            <img src="<?php echo $logo?>" style="width: 555px;"/>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-lock"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <p><?php echo $text_2way; ?></p>
                    <?php if ($error_warning) { ?>
                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                    </div>
                    <?php } ?>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form">
                        <fieldset>
                            <legend><?php echo $heading_title; ?></legend>
                            <div class="form-group required">
                                <label class="control-label" for="input-email"><?php echo $entry_code; ?></label>
                                <div class="">
                                    <input type="text" name="code" value="" placeholder="<?php echo $entry_code; ?>" id="input-code" class="form-control" />
                                </div>
                            </div>
                        </fieldset>
                        <div class="buttons clearfix">
                            <div class="pull-left"><button type="button" class="btn btn-default" id="request-code"><?php echo $button_request_code; ?></button></div>
                            <div class="pull-right">
                                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer?>