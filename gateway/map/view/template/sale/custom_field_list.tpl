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
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-user').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
                        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-user">
                            <table class="table table-hover table-nomargin">
                                <thead>
                                <tr>
                                    <th style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></th>
                                    <th class="text-left"><?php if ($sort == 'cfd.name') { ?>
                                        <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'cf.location') { ?>
                                        <a href="<?php echo $sort_location; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_location; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_location; ?>"><?php echo $column_location; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'cf.type') { ?>
                                        <a href="<?php echo $sort_type; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_type; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_type; ?>"><?php echo $column_type; ?></a>
                                        <?php } ?></th>
                                    <th class="text-right"><?php if ($sort == 'cf.sort_order') { ?>
                                        <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                                        <?php } ?></th>
                                    <th class="text-right"><?php echo $column_action; ?></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if ($custom_fields) { ?>
                                <?php foreach ($custom_fields as $custom_field) { ?>
                                <tr>
                                    <td class="text-center"><?php if (in_array($custom_field['custom_field_id'], $selected)) { ?>
                                        <input type="checkbox" name="selected[]" value="<?php echo $custom_field['custom_field_id']; ?>" checked="checked" />
                                        <?php } else { ?>
                                        <input type="checkbox" name="selected[]" value="<?php echo $custom_field['custom_field_id']; ?>" />
                                        <?php } ?></td>
                                    <td class="text-left"><?php echo $custom_field['name']; ?></td>
                                    <td class="text-left"><?php echo $custom_field['location']; ?></td>
                                    <td class="text-left"><?php echo $custom_field['type']; ?></td>
                                    <td class="text-right"><?php echo $custom_field['sort_order']; ?></td>
                                    <td class="text-right"><a href="<?php echo $custom_field['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                                </tr>
                                <?php } ?>
                                <?php } else { ?>
                                <tr>
                                    <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
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