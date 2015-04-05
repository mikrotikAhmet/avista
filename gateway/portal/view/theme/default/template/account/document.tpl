<table class="table table-responsive table-striped">
    <thead>
        <tr>
            <th>Filename</th>
            <th>Mask</th>
            <th>Status</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <?php if ($documents) { ?>
    <?php foreach ($documents as $document) { ?>
        <tr>
            <td><?php echo $document['file']?></td>
            <td><?php echo $document['filename']?></td>
            <td><?php echo ($document['status'] ? 'Approved' : 'Pending')?></td>
            <td><button type="button" id="remove-document" onclick="removeDocument('<?php echo $document['document_id']?>')" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i></button></td>
        </tr>
    <?php } ?>
    <?php } else { ?>
    <tr>
        <td class="text-center" colspan="5">No documents uploaded yet</td>
    </tr>
    <?php } ?>
    </tbody>
</table>
<script>
function removeDocument(document_id){

    $.ajax({
        url: 'index.php?route=account/account/removeDocument',
        type: 'post',
        data: 'document_id='+document_id,
        dataType: 'json',
        beforeSend: function() {
        },
        success: function(json) {

            $('#documents').load('index.php?route=account/account/documents');
        }
    });
}
</script>