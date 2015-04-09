<?php echo $header?>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-2">
            <img src="<?php echo $logo?>" style="width: 555px;"/>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <?php if ($error_warning) { ?>
                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                    </div>
                    <?php } ?>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form">
                        <div class="form-group required">
                            <label class="control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                            <div class="">
                                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                                <?php if ($error_firstname) { ?>
                                <div class="text-danger"><?php echo $error_firstname; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                            <div class="">
                                <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                                <?php if ($error_lastname) { ?>
                                <div class="text-danger"><?php echo $error_lastname; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                            <div class="">
                                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                                <?php if ($error_email) { ?>
                                <div class="text-danger"><?php echo $error_email; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-mobile">Mobile Number</label>
                            <div class="">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <input type="text" name="mac1" placeholder="Area" class="form-control" maxlength="4"/>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" name="mobile" value="<?php echo $mobile; ?>" placeholder="Mobile Number" id="input-mobile" class="form-control" />
                                    </div>
                                </div>
                                <?php if ($error_mobile) { ?>
                                <div class="text-danger"><?php echo $error_mobile; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="input-telephone">Telephone Number</label>
                            <div class="">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <input type="text" name="tac1" placeholder="Area" class="form-control" maxlength="4"/>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="Alternative telephone" id="input-telephone" class="form-control" />
                                    </div>
                                </div>
                                <?php if ($error_telephone) { ?>
                                <div class="text-danger"><?php echo $error_telephone; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                            <div class="">
                                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                                <?php if ($error_password) { ?>
                                <div class="text-danger"><?php echo $error_password; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                            <div class="">
                                <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                                <?php if ($error_confirm) { ?>
                                <div class="text-danger"><?php echo $error_confirm; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <!--div class="form-group">
                            <label class=" control-label"><?php echo $entry_newsletter; ?></label>
                            <div class="">
                                <?php if ($newsletter) { ?>
                                <label class="radio-inline">
                                    <input type="radio" name="newsletter" value="1" checked="checked" />
                                    <?php echo $text_yes; ?></label>
                                <label class="radio-inline">
                                    <input type="radio" name="newsletter" value="0" />
                                    <?php echo $text_no; ?></label>
                                <?php } else { ?>
                                <label class="radio-inline">
                                    <input type="radio" name="newsletter" value="1" />
                                    <?php echo $text_yes; ?></label>
                                <label class="radio-inline">
                                    <input type="radio" name="newsletter" value="0" checked="checked" />
                                    <?php echo $text_no; ?></label>
                                <?php } ?>
                            </div>
                        </div-->
                        <?php if ($text_agree) { ?>
                        <div class="form-group">
                                <?php if ($agree) { ?>
                                <input type="checkbox" name="agree" value="1" checked="checked" />
                                <?php } else { ?>
                                <input type="checkbox" name="agree" value="1" />
                                <?php } ?>
                            <label class=" control-label"><?php echo $text_agree; ?></label>
                        </div>
                        <div class="form-group">
                            <?php if ($agree_term) { ?>
                            <input type="checkbox" name="agree_term" value="1" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="agree_term" value="1" />
                            <?php } ?>
                            <label class=" control-label"><?php echo $text_agree_term; ?></label>
                        </div>
                        <?php } ?>
                        <div class="buttons clearfix">
                            <div class="pull-left">
                                <a href="http://www.hifholding.com/" class="btn btn-danger"><i class="fa fa-home"></i> Cancel Registration</a></div>
                            <div class="pull-right">
                                <a href="<?php echo $back; ?>" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to step 1</a>
                                <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Finish</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer?>