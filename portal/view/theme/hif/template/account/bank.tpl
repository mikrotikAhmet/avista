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
            <div class="alert alert-info alert-dismissable">
                <i class="fa fa-exclamation-circle"></i>
                <?php echo $info_bank_account?>
            </div>
            <button type="button" id="add-bank" class="pull-right btn btn-primary"><?php echo $button_add_bank?></button>
            <br/>
            <div id="bank-list"></div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
<script>
    $("#account-manager tr:odd").addClass("master");
    $("#account-manager tr:not(.master)").hide();
    $("#account-manager tr:first-child").show();

    $("#account-manager tr.master").click(function() {

//        if ($(this).next("tr").css('display') == 'none'){
//            $('#transaction-details-'+this.id).load('index.php?route=account/transaction/details&transaction_id='+this.id);
//        }

        $(this).next("tr").toggle();
        $(this).find(".expand").toggleClass("fa-minus");
        $(this).toggleClass("selected");

    });

    $('#bank-list').load('index.php?route=account/bank/bankList');

    $('#add-bank').on('click',function(){

        var element = $(this);
//
        $.ajax({
            url: 'index.php?route=account/bank/bankForm',
            type: 'post',
            dataType: 'html',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(html) {

                element.button('reset');
                $('.bank').html(html);

                $('#bank-general').modal('show');

            }
        });

    });

    function removeBank(bank_id){

        var element = $(this);

        if(confirm('Are you sure?'))

            $.ajax({
                url: 'index.php?route=account/bank/removeBank',
                type: 'post',
                data: 'bank_id=' + bank_id,
                dataType: 'json',
                beforeSend: function () {
                    element.button('loading');
                },
                success: function (json) {

                    element.button('reset');

                    $('#bank-list').load('index.php?route=account/bank/bankList');

                }
            });
        else return false;
    }

    function addBank(data){

//        var data = $('#bank-form').serialize();
        var element = $(this);

        $.ajax({
            url: 'index.php?route=account/bank/insertBank',
            type: 'post',
            data: data,
            dataType: 'json',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(json) {

                element.button('reset');

                if (json.error){
                    alert(json.error['message']);
                } else {
                    alert(json.message);

                    $('#bank-general').modal('hide');
                }

                $('#bank-list').load('index.php?route=account/bank/bankList');

            }
        });

    }

    function editBank(bank_id){

        var element = $(this);
//
        $.ajax({
            url: 'index.php?route=account/bank/editBank',
            type: 'post',
            data: 'bank_id='+bank_id,
            dataType: 'html',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(html) {

                element.button('reset');
                $('.modal-body').html(html);

                $('#bank-general').modal('show');

            }
        });
    }
</script>
<!-- Modal -->
<div class="modal fade" id="bank-general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><?php echo $heading_title?></h4>
            </div>
            <div class="modal-body bank">
            </div>
            <div class="modal-footer">
                <button type="button" id="button-close"class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="button-issue" onclick="addBank( $('#bank-form').serialize())" class="btn btn-primary">Continue</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<?php echo $footer?>