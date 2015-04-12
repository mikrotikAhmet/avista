<?php echo $header?>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-2">
            <div class="brand"></div>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-check-square-o"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <?php echo $text_message; ?>

                </div>
                <div class="panel-footer">
                    <div class="buttons">
                        <a href="<?php echo $continue; ?>" class="btn btn-primary"><i class="fa fa-check"></i> <?php echo $button_continue; ?></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer?>