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
    <tr>
        <td><?php echo $bank['bank']?></td>
        <td><?php echo $bank['account_number']?></td>
        <td><?php echo $bank['status']?></td>
        <td><i class="expand fa fa-plus"></i></td>
    </tr>
    <tr>
        <td colspan="4">Hello There!</td>
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

//        if ($(this).next("tr").css('display') == 'none'){
//            $('#transaction-details-'+this.id).load('index.php?route=account/transaction/details&transaction_id='+this.id);
//        }

        $(this).next("tr").toggle();
        $(this).find(".expand").toggleClass("fa-minus");
        $(this).toggleClass("selected");


    });
</script>