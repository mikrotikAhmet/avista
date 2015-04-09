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
                            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
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