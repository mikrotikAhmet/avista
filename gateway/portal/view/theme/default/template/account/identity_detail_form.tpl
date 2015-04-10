<form id="detail-form">
    <div class="form-group required">
        <label class="control-label" for="input-bank-country">Nationality</label>
        <div class="">
            <select name="country_id" id="input-nationality" class="form-control">
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $identity['country_id']) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-pob">Passport number</label>
        <div class="">
            <input type="text" name="passport" value="<?php echo $identity['passport']?>" placeholder="Passport number" id="input-passport" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-date-added">Date of issue</label>
        <div class="input-group date">
            <input type="text" name="issue" value="<?php echo $identity['issue']?>" placeholder="Date of issue" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-date-added">Date of expiration</label>
        <div class="input-group date">
            <input type="text" name="expiration" value="<?php echo $identity['expiration']?>" placeholder="Date of expiration" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-date-added">Date of birth</label>
        <div class="input-group date">
            <input type="text" name="dob" value="<?php echo $customer['dob']?>" placeholder="Date of birth" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-pob">Place of birth</label>
        <div class="">
            <input type="text" name="pob" value="<?php echo $customer['pob']?>" placeholder="Place of birth" id="input-pob" class="form-control" />
        </div>
    </div>
</form>
<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript"><!--
            $('.date').datetimepicker({
                pickTime: false
            });
    //--></script>