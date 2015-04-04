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
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-application').submit() : false;"><i class="fa fa-trash-o"></i></button>
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <br/>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-list"></i> <?php echo $text_list; ?>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-application">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
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
                                        <td class="text-right"><a href="<?php echo $application['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a></td>
                                    </tr>
                                    <?php } ?>
                                    <?php } else { ?>
                                    <tr>
                                        <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </form>
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