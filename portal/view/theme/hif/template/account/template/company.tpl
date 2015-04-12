<table class="table table-responsive table-striped">
    <tbody>
    <tr>
        <td><?php echo $text_legal_name?></td>
        <td><?php echo $company['legal_name']?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_inc_date?></td>
        <td><?php echo ($company['inc_date'] ? $company['inc_date'] : '-')?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_business_type?></td>
        <td><?php echo ($company['type'] ? $company['type'] : '-')?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_register?></td>
        <td><?php echo $company['registration_number']?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_vat?></td>
        <td><?php echo ($company['vat'] ? $company['vat'] : '-')?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_address?></td>
        <td>
            <?php echo $company['address_1'].' '.$company['address_2'].'<br/>'.$company['postcode'].' '.$country['name']?>
        </td>
        <td></td>
    </tr>
    </tbody>
</table>