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
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                        <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                                        <input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="control-label" for="input-merchant-group"><?php echo $entry_merchant_group; ?></label>
                                        <select name="filter_merchant_group_id" id="input-merchant-group" class="form-control">
                                            <option value="*"></option>
                                            <?php foreach ($merchant_groups as $merchant_group) { ?>
                                            <?php if ($merchant_group['merchant_group_id'] == $filter_merchant_group_id) { ?>
                                            <option value="<?php echo $merchant_group['merchant_group_id']; ?>" selected="selected"><?php echo $merchant_group['name']; ?></option>
                                            <?php } else { ?>
                                            <option value="<?php echo $merchant_group['merchant_group_id']; ?>"><?php echo $merchant_group['name']; ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                                        <select name="filter_status" id="input-status" class="form-control">
                                            <option value="*"></option>
                                            <?php if ($filter_status) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <?php } ?>
                                            <?php if (!$filter_status && !is_null($filter_status)) { ?>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="control-label" for="input-approved"><?php echo $entry_approved; ?></label>
                                        <select name="filter_approved" id="input-approved" class="form-control">
                                            <option value="*"></option>
                                            <?php if ($filter_approved) { ?>
                                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_yes; ?></option>
                                            <?php } ?>
                                            <?php if (!$filter_approved && !is_null($filter_approved)) { ?>
                                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                            <?php } else { ?>
                                            <option value="0"><?php echo $text_no; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="input-ip"><?php echo $entry_ip; ?></label>
                                        <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" placeholder="<?php echo $entry_ip; ?>" id="input-ip" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                                        <div class="input-group date">
                                            <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" id="input-date-added" data-date-format="yyyy-mm-dd" class="form-control datepick" />

                                        </div>
                                    </div>
                                    <button type="button" id="button-refresh" class="btn btn-default pull-right"><i class="fa fa-refresh"></i> <?php echo $button_refresh; ?></button>
                                    <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
                                </div>
                            </div>
                        </div>
                        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-merchant">
                            <table class="table table-hover table-nomargin">
                                <thead>
                                <tr>
                                    <th style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></th>
                                    <th class="text-left"><?php if ($sort == 'name') { ?>
                                        <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'c.email') { ?>
                                        <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'merchant_group') { ?>
                                        <a href="<?php echo $sort_merchant_group; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_merchant_group; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_merchant_group; ?>"><?php echo $column_merchant_group; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'c.status') { ?>
                                        <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'c.ip') { ?>
                                        <a href="<?php echo $sort_ip; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ip; ?></a>
                                        <?php } else { ?>
                                        <a href="<?php echo $sort_ip; ?>"><?php echo $column_ip; ?></a>
                                        <?php } ?></th>
                                    <th class="text-left"><?php if ($sort == 'c.date_added') { ?>
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
                                    <td class="text-left"><?php echo $merchant['name']; ?></td>
                                    <td class="text-left"><?php echo $merchant['email']; ?></td>
                                    <td class="text-left"><?php echo $merchant['merchant_group']; ?></td>
                                    <td class="text-left"><?php echo $merchant['status']; ?></td>
                                    <td class="text-left"><?php echo $merchant['ip']; ?></td>
                                    <td class="text-left"><?php echo $merchant['date_added']; ?></td>
                                    <td class="text-right"><?php if ($merchant['approve']) { ?>
                                        <a href="<?php echo $merchant['approve']; ?>" data-toggle="tooltip" title="<?php echo $button_approve; ?>" class="btn btn-success"><i class="fa fa-thumbs-o-up"></i></a>
                                        <?php } else { ?>
                                        <button type="button" class="btn btn-success" disabled><i class="fa fa-thumbs-o-up"></i></button>
                                        <?php } ?>
                                        <div class="btn-group" data-toggle="tooltip" title="<?php echo $button_login; ?>">
                                            <button type="button" data-toggle="dropdown" class="btn btn-info dropdown-toggle"><i class="fa fa-lock"></i></button>
                                            <ul class="dropdown-menu pull-right">
                                                <li><a href="index.php?route=sale/merchant/login&token=<?php echo $token; ?>&merchant_id=<?php echo $merchant['merchant_id']; ?>&application_id=0" target="_blank"><?php echo $text_default; ?></a></li>
                                                <?php foreach ($applications as $application) { ?>
                                                <li><a href="index.php?route=sale/merchant/login&token=<?php echo $token; ?>&merchant_id=<?php echo $merchant['merchant_id']; ?>&application_id=<?php echo $application['application_id']; ?>" target="_blank"><?php echo $application['name']; ?></a></li>
                                                <?php } ?>
                                            </ul>
                                        </div>
                                        <?php if ($merchant['unlock']) { ?>
                                        <a href="<?php echo $merchant['unlock']; ?>" data-toggle="tooltip" title="<?php echo $button_unlock; ?>" class="btn btn-warning"><i class="fa fa-unlock"></i></a>
                                        <?php } else { ?>
                                        <button type="button" class="btn btn-warning" disabled><i class="fa fa-unlock"></i></button>
                                        <?php } ?>
                                        <a href="<?php echo $merchant['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                                </tr>
                                <?php } ?>
                                <?php } else { ?>
                                <tr>
                                    <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
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
<script type="text/javascript"><!--
    $('#button-filter').on('click', function() {
        url = 'index.php?route=account/merchant&token=<?php echo $token; ?>';

        var filter_name = $('input[name=\'filter_name\']').val();

        if (filter_name) {
            url += '&filter_name=' + encodeURIComponent(filter_name);
        }

        var filter_email = $('input[name=\'filter_email\']').val();

        if (filter_email) {
            url += '&filter_email=' + encodeURIComponent(filter_email);
        }

        var filter_merchant_group_id = $('select[name=\'filter_merchant_group_id\']').val();

        if (filter_merchant_group_id != '*') {
            url += '&filter_merchant_group_id=' + encodeURIComponent(filter_merchant_group_id);
        }

        var filter_status = $('select[name=\'filter_status\']').val();

        if (filter_status != '*') {
            url += '&filter_status=' + encodeURIComponent(filter_status);
        }

        var filter_approved = $('select[name=\'filter_approved\']').val();

        if (filter_approved != '*') {
            url += '&filter_approved=' + encodeURIComponent(filter_approved);
        }

        var filter_ip = $('input[name=\'filter_ip\']').val();

        if (filter_ip) {
            url += '&filter_ip=' + encodeURIComponent(filter_ip);
        }

        var filter_date_added = $('input[name=\'filter_date_added\']').val();

        if (filter_date_added) {
            url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
        }

        location = url;
    });

    $('#button-refresh').on('click', function() {
        url = 'index.php?route=account/merchant&token=<?php echo $token; ?>';

        location = url;
    });
    //--></script>
<script type="text/javascript"><!--
    $('input[name=\'filter_name\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=account/merchant/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['merchant_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter_name\']').val(item['label']);
        }
    });

    $('input[name=\'filter_email\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=account/merchant/autocomplete&token=<?php echo $token; ?>&filter_email=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['email'],
                            value: item['merchant_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter_email\']').val(item['label']);
        }
    });
    //--></script>
<?php echo $footer?>