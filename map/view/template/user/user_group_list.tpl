<?php echo $header; ?>
<!-- Page Content -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><?php echo $heading_title; ?></h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="pull-right"><a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-user-group').submit() : false;"><i class="fa fa-trash-o"></i></button>
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <br/>
        <div class="row">
            <div class="col-lg-12">
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
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-list"></i> <?php echo $text_list; ?>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-user-group">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                                        <td class="text-left"><?php if ($sort == 'name') { ?>
                                            <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                                            <?php } else { ?>
                                            <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                                            <?php } ?></td>
                                        <td class="text-right"><?php echo $column_action; ?></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php if ($user_groups) { ?>
                                    <?php foreach ($user_groups as $user_group) { ?>
                                    <tr>
                                        <td class="text-center"><?php if (in_array($user_group['user_group_id'], $selected)) { ?>
                                            <input type="checkbox" name="selected[]" value="<?php echo $user_group['user_group_id']; ?>" checked="checked" />
                                            <?php } else { ?>
                                            <input type="checkbox" name="selected[]" value="<?php echo $user_group['user_group_id']; ?>" />
                                            <?php } ?></td>
                                        <td class="text-left"><?php echo $user_group['name']; ?></td>
                                        <td class="text-right"><a href="<?php echo $user_group['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a></td>
                                    </tr>
                                    <?php } ?>
                                    <?php } else { ?>
                                    <tr>
                                        <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
<?php echo $footer?>