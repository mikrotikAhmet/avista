<?php echo $header?>
<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <?php echo $heading_title?>
                </h1>
                <ol class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <legend><?php echo $personal_title?><span class="pull-right"><button type="button" class="btn btn-link" value="Personal Details" id="modify-personal"><i class="fa fa-edit"></i> <?php echo $button_modify?></button></span></legend>
                <div id="personal-table">
                </div>
            </div>
            <div class="col-lg-6">
                <legend><?php echo $identity_title?><span class="pull-right"><button type="button" value="Identity Details" id="modify-identity" class="btn btn-link"><i class="fa fa-edit"></i> <?php echo $button_modify?></button></span></legend>
                <div id="identity-table">
                </div>
            </div>
            <div class="col-lg-12">
                <legend><?php echo $company_title?><span class="pull-right"><button type="button" value="Company Details" id="modify-company" class="btn btn-link"><i class="fa fa-edit"></i> <?php echo $button_modify?></button></span></legend>
                <div id="company-table">

                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
<script>
    $('#personal-table').load('index.php?route=account/account/getPersonalDetails');

    $('#modify-personal').on('click',function(){

        var element = $(this);
        $('#form-title').html(this.value);
        $('#button-update').val('personal');

        $.ajax({
            url : 'index.php?route=account/account/personalForm',
            dataType : 'html',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(html) {

                element.button('reset');

                $('.account').html(html);

                $('#form-account').modal('show');

            }
        });

    });

    $('#identity-table').load('index.php?route=account/account/getIdentityDetails');

    $('#modify-identity').on('click',function(){

        var element = $(this);
        $('#form-title').html(this.value);
        $('#button-update').val('identity');

        $.ajax({
            url : 'index.php?route=account/account/identityForm',
            dataType : 'html',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(html) {

                element.button('reset');

                $('.account').html(html);

                $('#form-account').modal('show');

            }
        });

    });

    $('#company-table').load('index.php?route=account/account/getCompanyDetails');

    $('#modify-company').on('click',function(){

        var element = $(this);
        $('#form-title').html(this.value);
        $('#button-update').val('company');

        $.ajax({
            url : 'index.php?route=account/account/companyForm',
            dataType : 'html',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(html) {

                element.button('reset');

                $('.account').html(html);

                $('#form-account').modal('show');

            }
        });

    });

    function formUpdate(section,data){

        var element = $(this);

        $.ajax({
            url : 'index.php?route=account/account/updateAccount&section='+section,
            type: 'post',
            data: data,
            dataType : 'json',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(json) {

                element.button('reset');


                if (json.error){
                    alert(json.error['message']);
                }else {
                    alert(json.message);

                    $('#detail-form')[0].reset();

                    $('#form-account').modal('hide');

                    $('#' + section + '-table').load('index.php?route=account/account/get' + section + 'Details');

                }

            }
        });
    }
</script>
<!-- Modal -->
<div class="modal fade" id="form-account" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><span id="form-title"></span></h4>
            </div>
            <div class="modal-body account">

            </div>
            <div class="modal-footer">
                <button type="button" id="button-close"class="btn btn-danger" onclick="$('#detail-form')[0].reset();" data-dismiss="modal"><i class="fa fa-remove"></i> Cancel</button>
                <button type="button" id="button-update" value="" onclick="formUpdate(this.value,$('#detail-form').serialize())" class="btn btn-primary"><i class="fa fa-check"></i> Update</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<?php echo $footer?>