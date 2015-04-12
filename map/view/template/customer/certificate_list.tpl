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
            <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-certificate').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
                <div class="well">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label" for="input-name"><?php echo $entry_legal; ?></label>
                                <input type="text" name="filter_legal" value="<?php echo $filter_legal; ?>" placeholder="<?php echo $entry_legal; ?>" id="input-legal" class="form-control" />
                            </div>

                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                                <div class="input-group date">
                                    <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <button type="button" id="button-filter" class="btn btn-primary pull-left"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
                        </div>
                    </div>
                </div>
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-certificate">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></th>
                                <th class="text-left"><?php if ($sort == 'legal_name') { ?>
                                    <a href="<?php echo $sort_legal; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_legal; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_legal; ?>"><?php echo $column_legal; ?></a>
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
                            <?php if ($certificates) { ?>
                            <?php foreach ($certificates as $certificate) { ?>
                            <tr>
                                <td class="text-center"><?php if (in_array($certificate['certificate_id'], $selected)) { ?>
                                    <input type="checkbox" name="selected[]" value="<?php echo $certificate['certificate_id']; ?>" checked="checked" />
                                    <?php } else { ?>
                                    <input type="checkbox" name="selected[]" value="<?php echo $certificate['certificate_id']; ?>" />
                                    <?php } ?></td>
                                <td class="text-left"><?php echo $certificate['legal_name']; ?></td>
                                <td class="text-left"><?php echo $certificate['date_added']; ?></td>
                                <td class="text-right">
                                    <a href="<?php echo $certificate['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a></td>
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
<script type="text/javascript"><!--
    $('#button-filter').on('click', function() {
        url = 'index.php?route=customer/certificate&token=<?php echo $token; ?>';

        var filter_legal = $('input[name=\'filter_legal\']').val();

        if (filter_legal) {
            url += '&filter_legal=' + encodeURIComponent(filter_legal);
        }

        var filter_date_added = $('input[name=\'filter_date_added\']').val();

        if (filter_date_added) {
            url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
        }

        location = url;
    });
    //--></script>
<script type="text/javascript"><!--
    $('input[name=\'filter_legal\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=customer/certificate/autocomplete&token=<?php echo $token; ?>&filter_legal=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['legal_name'],
                            value: item['certificate_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter_legal\']').val(item['label']);
        }
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script>
<?php echo $footer?>