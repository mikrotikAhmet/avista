<?php echo $header?>
<!-- The header containing the logo -->
<header class="container_12">

    <div class="container">

        <!-- Your logos -->
        <a href="/tf-mango/"><img src="view/theme/mango/assets/img/logo-light.png" alt="Mango" width="210" height="67"></a>
        <a class="phone-title" href="login.html"><img src="view/theme/mango/assets/img/logo-mobile.png" alt="Mango" height="22" width="70" /></a>

    </div><!-- End of .container -->

</header><!-- End of header -->

<!-- The container of the sidebar and content box -->
<section id="login" class="container_12 clearfix">

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="box validate">

        <div class="header">
            <h2><span class="icon icon-user"></span>Register new Account</h2>
        </div>

        <div class="content">
            <!-- Login messages -->
            <div class="login-messages">
                <?php if ($error_warning) { ?>
                <div class="message welcome"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
                <?php } ?>
            </div>
            <!-- The form -->
            <div class="form-box">
                <div class="row">
                    <label class="col-sm-2 control-label" for="input-firstname"><strong><?php echo $entry_firstname; ?></strong></label>
                    <div>
                        <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control required" />
                        <?php if (!$error_firstname) { ?>
                            <div class="text-danger"><?php echo $error_firstname; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="row">
                        <label class="col-sm-2 control-label" for="input-lastname"><strong><?php echo $entry_lastname; ?></strong></label>
                    <div>
                        <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control required" />
                        <?php if ($error_lastname) { ?>
                        <div class="text-danger"><?php echo $error_lastname; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-2 control-label" for="input-email"><strong><?php echo $entry_email; ?></strong></label>
                    <div>
                        <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control required" />
                        <?php if ($error_email) { ?>
                        <div class="text-danger"><?php echo $error_email; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="clearfix" style="margin-top: 10px"></div>
                <div class="header">
                    <h2><span class="icon icon-key"></span><?php echo $text_your_password; ?></h2>
                </div>
                <div class="row">
                    <label class="col-sm-2 control-label" for="input-password"><strong><?php echo $entry_password; ?></strong></label>
                    <div>
                        <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control required" />
                        <?php if ($error_password) { ?>
                        <div class="text-danger"><?php echo $error_password; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-2 control-label" for="input-confirm"><strong><?php echo $entry_confirm; ?></strong></label>
                    <div>
                        <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control required" />
                        <?php if ($error_confirm) { ?>
                        <div class="text-danger"><?php echo $error_confirm; ?></div>
                        <?php } ?>
                    </div>
                </div>
            </div><!-- End of .form-box -->
        </div><!-- End of .content -->
        <div class="actions">
            <div class="left">
                <?php if ($text_agree) { ?>
                <div class="buttons">
                    <div class="pull-right"><?php echo $text_agree; ?>
                        <?php if ($agree) { ?>
                        <input type="checkbox" name="agree" value="1" checked="checked" />
                        <?php } else { ?>
                        <input type="checkbox" name="agree" value="1" />
                        <?php } ?>
                        &nbsp;
                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="right">
                <input tabindex=3 type="submit" value="<?php echo $button_continue?>" name="login_btn" />
            </div>
        </div><!-- End of .actions -->
    </form><!-- End of form -->
</section>
<?php echo $footer?>