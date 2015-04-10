<table class="table table-responsive table-hover table-bordered" id="">
    <tbody>
    <tr>
        <td><strong>Name of Bank</strong></td>
        <td><?php echo $bank['bank']?></td>
    </tr>
    <tr>
        <td><strong>Country of Bank</strong></td>
        <td><?php echo $bank['country']?></td>
    </tr>
    <?php if ($bank['zone']) { ?>
    <tr>
        <td><strong>State/Region of Bank</strong></td>
        <td><?php echo $bank['zone']?></td>
    </tr>
    <?php } ?>
    <tr>
        <td><strong>Account number</strong></td>
        <td><?php echo $bank['account_number']?></td>
    </tr>
    <tr>
        <td><strong>Account currency</strong></td>
        <td><?php echo $bank['currency_code']?></td>
    </tr>
    <tr>
        <td><strong>IBAN</strong></td>
        <td><?php echo $bank['iban']?></td>
    </tr>
    <tr>
        <td><strong>SWIFT/BIC Code</strong></td>
        <td><?php echo $bank['swift']?></td>
    </tr>
    <?php if (!empty($bank['routing'])) { ?>
    <tr>
        <td><strong>Routing Code</strong></td>
        <td><?php echo $bank['routing']?></td>
    </tr>
    <?php } ?>
    <?php if (!empty($bank['sort_code'])) { ?>
    <tr>
        <td><strong>Sort Code</strong></td>
        <td><?php echo $bank['sort_code']?></td>
    </tr>
    <?php } ?>
    <?php if (!in_array($bank['status'], $complete_status)) { ?>
    <tr>
        <td colspan="2">
            <button type="button" class="btn btn-link pull-right" onclick="removeBank('<?php echo $bank['bank_id']?>')" value="<?php echo $bank_id?>"><i class="text-danger fa fa-remove"></i> Delete</button>
            <button type="button" class="btn btn-link pull-right" onclick="editBank('<?php echo $bank['bank_id']?>')" value="<?php echo $bank['bank_id']?>"><i class="fa fa-edit"></i> Edit</button>
        </td>
    </tr>
    <?php } ?>
    </tbody>
</table>