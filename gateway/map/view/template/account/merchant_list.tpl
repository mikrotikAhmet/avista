<?php echo $header?>
<div id="main">
    <div class="container-fluid">
        <div class="page-header">
            <div class="pull-left">
                <h1><?php echo $heading_title; ?></h1>
            </div>
        </div>
        <div class="breadcrumbs">
            <ul>
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php if ($breadcrumb['sp']) { ?>
                    <i class="fa fa-angle-right"></i>
                    <?php } ?>
                </li>

                <?php } ?>
            </ul>
            <div class="close-bread">
                <a href="#">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="box">
                    <div class="box-title">
                        <h3>
                            <i class="fa fa-list"></i> <?php echo $text_list; ?>
                        </h3>
                        <div class="pull-right">
                            <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-merchant').submit() : false;"><i class="fa fa-trash-o"></i></button>
                        </div>
                    </div>
                    <div class="box-content">
                        <?php if ($error_warning) { ?>
                        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                        <?php } ?>
                        <?php if ($success) { ?>
                        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                        <?php } ?>
                        <div class="well">
                            <div class="row">
                                <p>Add filter form here...</p>
                            </div>
                        </div>
                        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-merchant">
                            <table class="table table-hover table-nomargin">
                                <thead>
                                <tr>
                                    <th style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></th>
                                    <th class="text-left"><?php if ($sort == 'legal_name') { ?>
                                        <a href="<?php echo $sort_legal_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_legal_name; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_legal_name; ?>"><?php echo $column_legal_name; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'status') { ?>
                                        <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'date_added') { ?>
                                        <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                                        <?php } ?></th>
                                    <th class="text-right"><?php echo $column_action; ?></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if ($merchants) { ?>
                                <?php foreach ($merchants as $merchant) { ?>
                                <tr>
                                    <td class="text-center"><?php if (in_array($merchant['merchant_id'], $selected)) { ?>
                                        <input type="checkbox" name="selected[]" value="<?php echo $merchant['merchant_id']; ?>" checked="checked" />
                                        <?php } else { ?>
                                        <input type="checkbox" name="selected[]" value="<?php echo $merchant['merchant_id']; ?>" />
                                        <?php } ?></td>
                                    <td class="text-left"><?php echo $merchant['legal_name']; ?></td>
                                    <td class="text-left"><?php echo $merchant['status']; ?></td>
                                    <td class="text-left"><?php echo $merchant['date_added']; ?></td>
                                    <td class="text-right"><a href="<?php echo $merchant['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                                </tr>
                                <?php } ?>
                                <?php } else { ?>
                                <tr>
                                    <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </form>
                        <div class="row">
                            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer?>