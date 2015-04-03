<?php echo $header?>
<?php echo $left_column?>
<!-- Here goes the content. -->
<section id="content" class="container_12 clearfix" data-sort=true>
    <h1 class="grid_12 margin-top no-margin-top-phone">My Account</h1>
    <div class="grid_12">
        <div class="alert warning sticky no-margin">
            <span class="icon"></span>
            <strong>Warning!</strong> <br/><b>Dear Client,</b><br/> You are seeing this message, because your account has not being approved yet. To get approved please follow the instructions
        </div>
        <form action="" class="box validate">

            <div class="header">
                <h2>Form Validation with Popups</h2>
            </div>

            <div class="content">

                <div class="row">
                    <label for="v1_normal_input">
                        <strong>Input Field Validation</strong>
                    </label>
                    <div>
                        <input class="required" type="text" name="v1_normal_input" id="v1_normal_input" />
                    </div>
                </div>

                <div class="row">
                    <label for="v1_password">
                        <strong>Password</strong>
                    </label>
                    <div>
                        <input class="required" type="password" name="v1_password" id="v1_password" />
                    </div>
                </div>

                <div class="row">
                    <label for="v1_repeat_password">
                        <strong>Repeat Password</strong>
                    </label>
                    <div>
                        <input class="required" equalTo="#v1_password" type="password" name="v1_repeat_password" id="v1_repeat_password" />
                    </div>
                </div>

                <div class="row">
                    <label for="v1_email">
                        <strong>Email Address</strong>
                    </label>
                    <div>
                        <input class="required" email=true type="text" name="v1_email" id="v1_email" value="wrong@email" />
                    </div>
                </div>

                <div class="row">
                    <label for="v1_minchars">
                        <strong>Minimum Chars</strong>
                        <small>min. 5 chars</small>
                    </label>
                    <div>
                        <input class="required" minlength=5 type="text" name="v1_minchars" id="v1_minchars" value="abc" />
                    </div>
                </div>

                <div class="row">
                    <label for="v1_maxchars">
                        <strong>Maximum Chars</strong>
                        <small>max. 10 chars</small>
                    </label>
                    <div>
                        <input class="required" maxlength=10 type="text" name="v1_maxchars" id="v1_maxchars" value="This are obviously more than 10 chars..." />
                    </div>
                </div>

                <div class="row">
                    <label for="v1_charrange">
                        <strong>Char-Range</strong>
                        <small>5-10 chars</small>
                    </label>
                    <div>
                        <input class="required" minlength=5 maxlength=10 type="text" name="v1_charrange" id="v1_charrange" />
                    </div>
                </div>

                <div class="row">
                    <label for="v1_pattern">
                        <strong>Pattern Input</strong>
                        <small>e.g. only numbers</small>
                    </label>
                    <div>
                        <input class="required" pattern="^\d{1,10}$" type="text" name="v1_pattern" id="v1_pattern" value="012abc" />
                    </div>
                </div>

                <div class="row not-on-phone">
                    <label for="f6_file">
                        <strong>Upload</strong>
                    </label>
                    <div>
                        <input type="file" id=f6_file name=f6_file class="required" />
                    </div>
                </div>

            </div><!-- End of .content -->

            <div class="actions">
                <div class="left">
                    <input type="reset" value="Cancel" />
                </div>
                <div class="right">
                    <input type="submit" value="Submit" name=submit />
                </div>
            </div><!-- End of .actions -->

        </form><!-- End of .box -->
    </div>
</section><!-- End of #content -->
<?php echo $footer?>