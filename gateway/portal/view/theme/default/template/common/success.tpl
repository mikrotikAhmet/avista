<?php echo $header?>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-lock"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <?php echo $text_message; ?>

                </div>
                <div class="panel-footer">
                    <div class="buttons">
                        <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer?>