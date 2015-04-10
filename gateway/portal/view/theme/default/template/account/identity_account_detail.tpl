<table class="table table-responsive table-striped">
    <tbody>
    <tr>
        <td>Nationality</td>
        <td><?php echo $identity['country_id']?></td>
        <td></td>
    </tr>
    <tr>
        <td>Passport number</td>
        <td><?php echo $identity['passport']?></td>
        <td></td>
    </tr>
    <tr>
        <td>Date of issue</td>
        <td><?php echo $identity['issue']?></td>
        <td></td>
    </tr>
    <tr>
        <td>Date of expiration</td>
        <td><?php echo $identity['expiration']?></td>
        <td></td>
    </tr>
    <tr>
        <td>Date of birth</td>
        <td><?php echo date('d/m/Y',strtotime($customer['dob']))?></td>
        <td></td>
    </tr>
    <tr>
        <td>Place of birth</td>
        <td><?php echo $customer['pob']?></td>
        <td></td>
    </tr>
    </tbody>
</table>