<form id="detail-form">
    <div class="form-group required">
        <label class="control-label" for="input-date-added">Incorporation date</label>
        <div class="input-group date">
            <input type="text" name="inc_date" value="<?php echo $certificate['inc_date']?>" placeholder="Incorporation date" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-last-name">Registered DBA/trade name <small>(if other than legal name)</small></label>
        <div class="">
            <input type="text" name="dba" value="<?php echo $certificate['dba']?>" placeholder="Registered DBA/trade name" id="input-mobile" class="form-control" />
        </div>
    </div>
    <div class="form-group required">
        <label class="control-label" for="input-last-name">Type of business <small>(LLC, Ltd, Sole Proprietor, etc)</small></label>
        <div class="">
            <input type="text" name="type" value="<?php echo $certificate['type']?>" placeholder="Type of business" id="input-mobile" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="input-last-name">VAT / Tax Identification number</label>
        <div class="">
            <input type="text" name="tax_number" value="<?php echo $certificate['tax_number']?>" placeholder="VAT / Tax Identification number" id="input-mobile" class="form-control" />
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