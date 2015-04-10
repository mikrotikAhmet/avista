<table class="table table-responsive table-striped">
    <tbody>
    <tr>
        <td>Nationality</td>
        <td><?php echo (!empty($identity['country_id']) ? $country['name'] : '<span class="text-danger">No record</span>')?></td>
        <td></td>
    </tr>
    <tr>
        <td>Passport number</td>
        <td><?php echo (!empty($identity['passport']) ? $identity['passport'] : '<span class="text-danger">No record</span>')?></td>
        <td></td>
    </tr>
    <tr>
        <td>Date of issue</td>
        <td><?php echo (!empty($identity['issue']) ? $identity['issue'] : '<span class="text-danger">No record</span>')?></td>
        <td></td>
    </tr>
    <tr>
        <td>Date of expiration</td>
        <td><?php echo (!empty($identity['expiration']) ? $identity['expiration'] : '<span class="text-danger">No record</span>')?></td>
        <td></td>
    </tr>
    <tr>
        <td>Date of birth</td>
        <td><?php echo date('d/m/Y',strtotime($customer['dob']))?></td>
        <td></td>
    </tr>
    <tr>
        <td>Place of birth</td>
        <td><?php echo (!empty($customer['pob']) ? $customer['pob'] : '<span class="text-danger">No record</span>')?></td>
        <td></td>
    </tr>
    </tbody>
</table>