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
    <!--tr>
        <td><strong>State/Region of Bank</strong></td>
        <td><?php echo $bank['zone']?></td>
    </tr-->
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
    <tr>
        <td><strong>Office Name</strong></td>
        <td><?php echo $bank['officer_name']?></td>
    </tr>
    <tr>
        <td><strong>Office E-Mail</strong></td>
        <td><?php echo $bank['officer_email']?></td>
    </tr>
    <tr>
        <td><strong>Office Telephone</strong></td>
        <td><?php echo $bank['officer_telephone']?></td>
    </tr>
    <?php if (!in_array($bank['status'], $complete_status)) { ?>
    <?php } ?>
    </tbody>
</table>