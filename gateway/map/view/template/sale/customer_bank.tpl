<div class="table">
    <table class="table table-bordered table-hover" id="bank-manager">
        <thead>
        <tr>
            <th class="text-left"><?php echo $column_bank; ?></th>
            <th class="text-left"><?php echo $column_account; ?></th>
            <th class="text-left"><?php echo $column_status; ?></th>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <?php if ($banks) { ?>
        <?php foreach ($banks as $bank) { ?>
        <tr id="<?php echo $bank['bank_id']?>">
            <td class="text-left"><?php echo $bank['bank']?></td>
            <td class="text-left"><?php echo $bank['account_number']?></td>
            <td class="text-left dropdown">
                <a href="#" class="dropdown-toggle btn btn-default" data-toggle="dropdown" aria-expanded="false"><?php echo $bank['status']?> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <?php foreach ($bank['actions'] as $action) { ?>
                    <li>
                        <a href="javascript::void()" onclick="updateBankStatus('<?php echo $action['order_status_id']?>','<?php echo $bank['bank_id']?>','<?php echo $bank['customer_id']?>')"><?php echo $action['name']?></a>
                    </li>
                    <?php } ?>
                </ul>
            </td>
            <td><i class="expand fa fa-plus"></i></td>
        </tr>
        <tr>
            <td colspan="4">
                <div id="bank-details-<?php echo $bank['bank_id']?>"></div>
            </td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
            <td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
<div class="row">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<script>

    $("#bank-manager tr:odd").addClass("master");
    $("#bank-manager tr:not(.master)").hide();
    $("#bank-manager tr:first-child").show();

    $("#bank-manager tr.master").click(function() {

        if ($(this).next("tr").css('display') == 'none'){
            $('#bank-details-'+this.id).load('index.php?route=sale/customer/bankDetail&token=<?php echo $token?>&bank_id='+this.id);
        }

        $(this).next("tr").toggle();
        $(this).find(".expand").toggleClass("fa-minus");
        $(this).toggleClass("selected");


    });
</script>
