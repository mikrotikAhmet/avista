<div class="alert alert-warning alert-dismissable">
    <i class="fa fa-exclamation-circle"></i> If you change your E-Mail address, please be advised that next login process you will use your new e-mail address to proceed login.
</div>
<form id="detail-form">
    <div class="form-group required">
        <label class="control-label" for="input-first-name">First Name</label>
        <div class="">
            <input type="text" name="firstname" value="<?php echo $customer['firstname']?>" placeholder="" id="input-first-name" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-last-name">Last Name</label>
        <div class="">
            <input type="text" name="lastname" value="<?php echo $customer['lastname']?>" placeholder="" id="input-last-name" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-email">E-Mail Address</label>
        <div class="">
            <input type="text" name="email" value="<?php echo $customer['email']?>" placeholder="" id="input-email" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-last-name">Mobile Number</label>
        <div class="">
            <input type="text" name="mobile" value="<?php echo $customer['mobile']?>" placeholder="" id="input-mobile" class="form-control" />
        </div>
    </div>
</form>