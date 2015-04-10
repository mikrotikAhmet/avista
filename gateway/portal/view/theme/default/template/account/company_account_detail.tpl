<table class="table table-responsive table-striped">
    <tbody>
    <tr>
        <td>Legal name of company</td>
        <td><?php echo $certificate['legal_name']?></td>
        <td></td>
    </tr>
    <tr>
        <td>Incorporation date</td>
        <td><?php echo $certificate['inc_date']?></td>
        <td></td>
    </tr>
    <?php if (!empty($certificate['dba'])) { ?>
    <tr>
        <td>Registered DBA/trade name</td>
        <td><?php echo $certificate['dba']?></td>
        <td></td>
    </tr>
    <?php } ?>
    <tr>
        <td>Type of business</td>
        <td><?php echo $certificate['type']?></td>
        <td></td>
    </tr>
    <tr>
        <td>Company registration number</td>
        <td><?php echo $certificate['registration_number']?></td>
        <td></td>
    </tr>
    <tr>
        <td>VAT / Tax Identification number</td>
        <td><?php echo $certificate['tax_number']?></td>
        <td></td>
    </tr>
    <tr>
        <td>Company registered address</td>
        <td>
            <?php echo $certificate['address_1'].' '.$certificate['address_2']?><br/>
            <?php echo (!empty($certificate['city']) ? $certificate['city'].' - ' : '').$certificate['postcode']?><br/>
            <?php echo (!empty($certificate_zone) ? $certificate_zone.' / ' : '').$certificate_country?>

        </td>
        <td></td>
    </tr>
    </tbody>
</table>