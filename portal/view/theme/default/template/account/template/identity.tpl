<?php if ($country) { ?>
<table class="table table-responsive table-striped">
    <tbody>
    <tr>
        <td><?php echo $text_nationality?></td>
        <td><?php echo $country['name']?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_passport?></td>
        <td><?php echo $customer['passport']?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_doi?></td>
        <td><?php echo $customer['issue_date']?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_doe?></td>
        <td><?php echo $customer['expiry_date']?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_dob?></td>
        <td><?php echo $customer['date_of_birth']?></td>
        <td></td>
    </tr>
    <tr>
        <td><?php echo $text_pob?></td>
        <td><?php echo $customer['place_of_birth']?></td>
        <td></td>
    </tr>
    </tbody>
</table>
<?php } else { ?>
<div class="no_record">No record found!</div>
<?php } ?>
