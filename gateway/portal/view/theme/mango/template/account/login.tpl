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
            <a href="javascript:void(0);">Register</a>
        </div>

    </div><!-- End of .container -->

</header><!-- End of header -->

<!-- The container of the sidebar and content box -->
<section id="login" class="container_12 clearfix">

    <form action="dashboard.html" method="post" class="box validate">

        <div class="header">
            <h2><span class="icon icon-lock"></span>Login</h2>
        </div>

        <div class="content">

            <!-- Login messages -->
            <div class="login-messages">
                <div class="message welcome">Welcome back!</div>
                <div class="message failure">Invalid credentials.</div>
            </div>

            <!-- The form -->
            <div class="form-box">

                <div class="row">
                    <label for="login_name">
                        <strong>Username</strong>
                        <small>Or email address</small>
                    </label>
                    <div>
                        <input tabindex=1 type="text" class="required" name=login_name id=login_name />
                    </div>
                </div>

                <div class="row">
                    <label for="login_pw">
                        <strong>Password</strong>
                        <small><a href="javascript:void(0);" id="">Forgot it?</a></small>
                    </label>
                    <div>
                        <input tabindex=2 type="password" class="required" name=login_pw id=login_pw />
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

    </form><!-- End of form -->

</section>
<?php echo $footer?>