<?php echo $header?>
<div class="wrapper">
    <h1>
        <a href="<?php echo $home?>">
            <img src="map/view/img/avclogo.png" alt="" class='retina-ready' width="59" height="49">AVISTA</a>
    </h1>
    <div class="login-body">
        <h2><?php echo $text_login; ?></h2>
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"  class='form-validate' id="test">
            <div class="form-group">
                <div class="email controls">
                    <input type="text" name='username' placeholder="<?php echo $entry_username; ?>" class='form-control' data-rule-required="true" data-rule-email="true">
                </div>
            </div>
            <div class="form-group">
                <div class="pw controls">
                    <input type="password" name="password" placeholder="<?php echo $entry_password; ?>" class='form-control' data-rule-required="true">
                </div>
            </div>

            <div class="submit">
                <button type="submit" class='btn btn-primary pull-right'><i class="fa fa-key"></i> <?php echo $button_login; ?></button>
            </div>
            <?php if ($redirect) { ?>
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            <?php } ?>
        </form>

        <div class="forget">
            <?php if ($forgotten) { ?>
                <span class="help-block"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></span>
            <?php } else { ?>
                <span class="help-block">&nbsp;</span>
            <?php } ?>
        </div>

    </div>
</div>