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
                                    <th class="text-left"><?php echo $column_name; ?></th>
                                    <th class="text-left"><?php echo $column_url; ?></th>
                                    <th class="text-right"><?php echo $column_action; ?></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if ($applications) { ?>
                                <?php foreach ($applications as $application) { ?>
                                <tr>
                                    <td class="text-center"><?php if (in_array($application['application_id'], $selected)) { ?>
                                        <input type="checkbox" name="selected[]" value="<?php echo $application['application_id']; ?>" checked="checked" />
                                        <?php } else { ?>
                                        <input type="checkbox" name="selected[]" value="<?php echo $application['application_id']; ?>" />
                                        <?php } ?></td>
                                    <td class="text-left"><?php echo $application['name']; ?></td>
                                    <td class="text-left"><?php echo $application['url']; ?></td>
                                    <td class="text-right"><a href="<?php echo $application['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                                </tr>
                                <?php } ?>
                                <?php } else { ?>
                                <tr>
                                    <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer?>