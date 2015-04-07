<div class="table">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-left"><?php echo $column_bank; ?></th>
            <th class="text-left"><?php echo $column_account; ?></th>
            <th class="text-left"><?php echo $column_status; ?></th>
        </tr>
        </thead>
        <tbody>
        <?php if ($banks) { ?>
        <?php foreach ($banks as $bank) { ?>
        <tr>
            <td class="text-left"><?php echo $bank['bank']?></td>
            <td class="text-left"><?php echo $bank['account_number']?></td>
            <td class="text-left dropdown">
                <a href="#" class="dropdown-toggle btn btn-default" data-toggle="dropdown" aria-expanded="false"><?php echo $bank['status']?> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <?php foreach ($bank['actions'] as $action) { ?>
                    <li><a href="javascript::void()" onclick="updateBankStatus('<?php echo $action['order_status_id']?>','<?php echo $bank['bank_id']?>','<?php echo $bank['customer_id']?>')"><?php echo $action['name']?></a></li>
                    <?php } ?>

                </ul>
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