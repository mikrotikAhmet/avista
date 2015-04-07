<table class="table table-responsive table-striped" id="bank-manager">
    <thead>
    <tr>
        <th>Bank Name</th>
        <th>Account Number</th>
        <th>Status</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <?php if ($banks) { ?>
    <?php foreach ($banks as $bank) { ?>
    <tr id="<?php echo $bank['bank_id']?>">
        <td><?php echo $bank['bank']?></td>
        <td><?php echo $bank['account_number']?></td>
        <?php if (!in_array($bank['status_id'], $complete_status)) { ?>
        <td><?php echo $bank['status']?></td>
        <?php } else { ?>
        <td><i class="text-success fa fa-check-square-o"></i><?php echo $bank['status']?></td>
        <?php } ?>
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
        <td class="text-center" colspan="5">No banks uploaded yet</td>
    </tr>
    <?php } ?>
    </tbody>
</table>
<script>
    $("#bank-manager tr:odd").addClass("master");
    $("#bank-manager tr:not(.master)").hide();
    $("#bank-manager tr:first-child").show();

    $("#bank-manager tr.master").click(function() {

        if ($(this).next("tr").css('display') == 'none'){
            $('#bank-details-'+this.id).load('index.php?route=account/account/bankDetail&bank_id='+this.id);
        }

        $(this).next("tr").toggle();
        $(this).find(".expand").toggleClass("fa-minus");
        $(this).toggleClass("selected");


    });
</script>