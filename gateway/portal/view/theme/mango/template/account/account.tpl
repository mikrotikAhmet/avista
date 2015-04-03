<?php echo $header?>
<?php echo $left_column?>
<!-- Here goes the content. -->
<section id="content" class="container_12 clearfix" data-sort=true>
    <div class="alert warning sticky no-margin">
        <span class="icon"></span>
        <strong>Warning!</strong> You are seeing this message, because your account has not being approved yet. To get approved please follow the instructions
    </div>
    <div class="alert information sticky no-margin">
        <span class="icon"></span>
        <strong>Action Required!</strong> Please complete your account profile before doing a Account Activation request.
    </div>
    <h1 class="grid_12 margin-top no-margin-top-phone">My Account</h1>
    <div class="grid_12">
            <div class="box tabbedBox">
                <div class="header">
                    <h2>Tabs</h2>
                    <ul>
                        <li class="current"><a href="#t1-c1">Personal Information</a></li>
                        <li class=""><a href="#t1-c2">Company Information</a></li>
                        <li class=""><a href="#t1-c3">Third Tab</a></li>
                    </ul>
                </div><!-- End of .header -->

                <div class="content tabbed">
                    <div id="t1-c1" style="display: block;">
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                        <p>Sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                    </div>
                    <div id="t1-c2" style="display: none;">
                        <p>At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p>
                    </div>
                    <div id="t1-c3" style="display: none;">
                        <p>Sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                    </div>

                </div><!-- End of .content -->
                <div class="actions">
                    <div class="left">
                        <input type="reset" value="Cancel">
                    </div>
                    <div class="right">
                        <input type="submit" value="Save" name="save">
                    </div>
                </div>
            </div><!-- End of .box -->
    </div>
</section><!-- End of #content -->
<?php echo $footer?>