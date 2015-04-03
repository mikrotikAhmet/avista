<?php echo $header?>
<!-- The header containing the logo -->
<header class="container_12">

    <div class="container">

        <!-- Your logos -->
        <a href="/tf-mango/"><img src="view/theme/mango/assets/img/logo-light.png" alt="Mango" width="210" height="67"></a>
        <a class="phone-title" href="login.html"><img src="view/theme/mango/assets/img/logo-mobile.png" alt="Mango" height="22" width="70" /></a>

        <!-- Right link -->
        <div class="right">
            <span>Got no account?</span>
            <a href="<?php echo $register; ?>">Register</a>
        </div>

    </div><!-- End of .container -->

</header><!-- End of header -->

<!-- The container of the sidebar and content box -->
<section id="login" class="container_12 clearfix">

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="box validate">

        <div class="header">
            <h2><span class="icon icon-lock"></span>Login</h2>
        </div>

        <div class="content">

            <!-- Login messages -->
            <div class="login-messages">
                <?php if ($error_warning) { ?>
                <div class="message welcome"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
                <?php } else { ?>
                <div class="message welcome">Welcome back!</div>
                <?php } ?>
                <div class="message failure">Invalid credentials.</div>
            </div>

            <!-- The form -->
            <div class="form-box">

                <div class="row">
                    <label for="login_name">
                        <strong><?php echo $entry_email; ?></strong>
                    </label>
                    <div>
                        <input tabindex=1 type="text" value="<?php echo $email; ?>" class="required" placeholder="<?php echo $entry_email; ?>" name="email" id=login_name />
                    </div>
                </div>

                <div class="row">
                    <label for="login_pw">
                        <strong><?php echo $entry_password; ?></strong>
                        <small><a href="<?php echo $forgotten; ?>" id=""><?php echo $text_forgotten; ?></a></small>
                    </label>
                    <div>
                        <input tabindex=2 type="password" class="required" value="<?php echo $password; ?>" name="password" id=login_pw placeholder="<?php echo $entry_password; ?>"/>
                    </div>
                </div>

            </div><!-- End of .form-box -->

        </div><!-- End of .content -->

        <div class="actions">
            <div class="left">
                <div class="rememberme">
                    <input tabindex=4 type="checkbox" name="login_remember" id="login_remember" checked /><label for="login_remember">Remember me?</label>
                </div>
            </div>
            <div class="right">
                <input tabindex=3 type="submit" value="Sign In" name="login_btn" />
            </div>
        </div><!-- End of .actions -->
        <?php if ($redirect) { ?>
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        <?php } ?>
    </form><!-- End of form -->

</section>
<?php echo $footer?>