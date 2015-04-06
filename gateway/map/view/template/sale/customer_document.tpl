<div class="table">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-left"><?php echo $column_filename; ?></th>
            <th class="text-left"><?php echo $column_mask; ?></th>
            <th class="text-right"><?php echo $column_ip; ?></th>
            <th class="text-left"><?php echo $column_date_added; ?></th>
            <th class="text-left"><?php echo $column_status; ?></th>
        </tr>
        </thead>
        <tbody>
        <?php if ($documents) { ?>
        <?php foreach ($documents as $document) { ?>
        <tr>
            <td class="text-left"><a href="<?php echo $document['href']?>"><?php echo $document['filename']?></a></td>
            <td class="text-left"><?php echo $document['mask']?></td>
            <td class="text-right"><a href="http://www.geoiptool.com/en/?IP=<?php echo $document['filter_ip']; ?>" target="_blank"><?php echo $document['filter_ip']; ?></a></td>
            <td class="text-left"><?php echo $document['date_added']?></td>
            <td class="text-left dropdown">
                    <a href="#" class="dropdown-toggle btn btn-default" data-toggle="dropdown" aria-expanded="false"><?php echo $document['status']?> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <?php foreach ($document['actions'] as $action) { ?>
                        <li><a href="javascript::void()" onclick="updateDocumentStatus('<?php echo $action['order_status_id']?>','<?php echo $document['document_id']?>','<?php echo $document['customer_id']?>')"><?php echo $action['name']?></a></li>
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