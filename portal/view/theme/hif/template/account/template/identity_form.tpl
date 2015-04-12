<form id="detail-form">
    <div class="form-group required">
        <label class="control-label" for="input-bank-country"><?php echo $entry_nationality?></label>
        <div class="">
            <?php $country_id = (isset($identity['country_id']) ? $identity['country_id'] : 0)?>
            <select name="country_id" id="input-nationality" class="form-control">
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $customer['country_id']) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-pob"><?php echo $entry_passport?></label>
        <div class="">
            <input type="text" name="passport" value="<?php echo $customer['passport']?>" placeholder="<?php echo $entry_passport?>" id="input-passport" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-date-added"><?php echo $entry_doi?></label>
        <div class="input-group date">
            <input type="text" name="issue" value="<?php echo $customer['issue_date']?>" placeholder="<?php echo $entry_doi?>" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-date-added"><?php echo $entry_doe?></label>
        <div class="input-group date">
            <input type="text" name="expiration" value="<?php echo $customer['expiry_date']?>" placeholder="<?php echo $entry_doe?>" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-date-added"><?php echo $entry_dob?></label>
        <div class="input-group date">
            <input type="text" name="date_of_birth" value="<?php echo $customer['date_of_birth']?>" placeholder="<?php echo $entry_dob?>" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-pob"><?php echo $entry_pob?></label>
        <div class="">
            <input type="text" name="place_of_birth" value="<?php echo $customer['place_of_birth']?>" placeholder="<?php echo $entry_pob?>" id="input-pob" class="form-control" />
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