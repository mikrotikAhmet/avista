<div class="alert alert-warning alert-dismissable">
    <i class="fa fa-exclamation-circle"></i> <?php echo $info_mail_change?>
</div>
<form id="detail-form">
    <div class="form-group required">
        <label class="control-label" for="input-first-name"><?php echo $entry_firstname?></label>
        <div class="">
            <input type="text" name="firstname" value="<?php echo $customer['firstname']?>" placeholder="<?php echo $entry_firstname?>" id="input-first-name" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-last-name"><?php echo $entry_lastname?></label>
        <div class="">
            <input type="text" name="lastname" value="<?php echo $customer['lastname']?>" placeholder="<?php echo $entry_lastname?>" id="input-last-name" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-email"><?php echo $entry_email?></label>
        <div class="">
            <input type="text" name="email" value="<?php echo $customer['email']?>" placeholder="<?php echo $entry_email?>" id="input-email" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-mobile"><?php echo $entry_mobile?><br/>
        <small class="text-danger"><?php echo $help_mobile?></small></label>
        <div class="">
            <input type="text" name="mobile" value="<?php echo $customer['mobile']?>" placeholder="<?php echo $entry_mobile?>" id="input-mobile" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-telephone"><?php echo $entry_telephone?><br/>
            <small class="text-danger"><?php echo $help_mobile?></small></label>
        <div class="">
            <input type="text" name="telephone" value="<?php echo $customer['telephone']?>" placeholder="<?php echo $entry_telephone?>" id="input-telephone" class="form-control" />
        </div>
    </div>
</form>