<form id="detail-form">
    <div class="form-group required">
        <label class="control-label" for="input-date-added"><?php echo $entry_inc_date?></label>
        <div class="input-group date">
            <input type="text" name="inc_date" value="<?php echo $company['inc_date']?>" placeholder="<?php echo $entry_inc_date?>" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-last-name"><?php echo $entry_dba?> <small><?php echo $help_dba?></small></label>
        <div class="">
            <input type="text" name="dba" value="<?php echo $company['dba']?>" placeholder="<?php echo $entry_dba?>" id="input-mobile" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-last-name"><?php echo $entry_type?> <small><?php echo $help_type?></small></label>
        <div class="">
            <input type="text" name="type" value="<?php echo $company['type']?>" placeholder="<?php echo $entry_type?>" id="input-mobile" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-last-name"><?php echo $entry_vat?></label>
        <div class="">
            <input type="text" name="tax_number" value="<?php echo $company['vat']?>" placeholder="<?php echo $entry_vat?>" id="input-mobile" class="form-control" />
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