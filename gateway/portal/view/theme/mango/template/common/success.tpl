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
            <h2><span class="icon icon-check-sign"></span><?php echo $heading_title; ?></h2>
        </div>

        <div class="content">
            <h1><?php echo $heading_title; ?></h1>
            <?php echo $text_message; ?>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
           </div>
    </form><!-- End of form -->
</section>
<?php echo $footer?>
