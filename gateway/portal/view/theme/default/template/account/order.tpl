<?php echo $header?>
<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <?php echo $heading_title?>
                </h1>
                <ol class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
                    </div>
                    <div class="panel-body">
                        <p><span class="text-success"><b>Issued</b></span> means, you have ISSUED CONTRACT. You can safely view and print your contract.<br/>
                        After  singing the contract please go to : <b>My Accouns -> Verification & Document Upload Center</b> TAB and upload your contract. </p>
                        <div class="well">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
                                        <input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" id="input-order-id" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                                        <select name="filter_order_status" id="input-order-status" class="form-control">
                                            <option value="*"></option>
                                            <?php if ($filter_order_status == '0') { ?>
                                            <option value="0" selected="selected"><?php echo $text_missing; ?></option>
                                            <?php } else { ?>
                                            <option value="0"><?php echo $text_missing; ?></option>
                                            <?php } ?>
                                            <?php foreach ($order_statuses as $order_status) { ?>
                                            <?php if ($order_status['order_status_id'] == $filter_order_status) { ?>
                                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                            <?php } else { ?>
                                            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="input-total"><?php echo $entry_total; ?></label>
                                        <input type="text" name="filter_total" value="<?php echo $filter_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                                        <div class="input-group date">
                                            <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="input-date-modified"><?php echo $entry_date_modified; ?></label>
                                        <div class="input-group date">
                                            <input type="text" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" placeholder="<?php echo $entry_date_modified; ?>" data-format="YYYY-MM-DD" id="input-date-modified" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                                    </div>
                                    <button type="button" id="button-refresh" class="btn btn-default pull-right"><i class="fa fa-refresh"></i> <?php echo $button_refresh; ?></button>
                                    <button type="button" id="button-export" class="btn btn-info pull-left"><i class="fa fa-file-excel-o"></i> <?php echo $button_export; ?></button>
                                    <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>&nbsp;
                                </div>
                            </div>
                        </div>
                        <form method="post" enctype="multipart/form-data" target="_blank" id="form-order">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-right"><?php if ($sort == 'o.order_id') { ?>
                                            <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_id; ?></a>
                                            <?php } else { ?>
                                            <a href="<?php echo $sort_order; ?>"><?php echo $column_order_id; ?></a>
                                            <?php } ?></td>
                                        <td class="text-left">
                                            Invoice#
                                        </td>
                                        <td class="text-left">
                                            Contract#
                                        </td>
                                        <td class="text-left"><?php if ($sort == 'status') { ?>
                                            <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                                            <?php } else { ?>
                                            <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                                            <?php } ?></td>
                                        <td class="text-right"><?php if ($sort == 'o.total') { ?>
                                            <a href="<?php echo $sort_total; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_total; ?></a>
                                            <?php } else { ?>
                                            <a href="<?php echo $sort_total; ?>"><?php echo $column_total; ?></a>
                                            <?php } ?></td>
                                        <td class="text-left"><?php if ($sort == 'o.date_added') { ?>
                                            <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                                            <?php } else { ?>
                                            <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                                            <?php } ?></td>
                                        <td class="text-left"><?php if ($sort == 'o.date_modified') { ?>
                                            <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>
                                            <?php } else { ?>
                                            <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a>
                                            <?php } ?></td>
                                        <td class="text-right"><?php echo $column_action; ?></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php if ($orders) { ?>
                                    <?php foreach ($orders as $order) { ?>
                                    <tr>
                                        <td class="text-right"><?php echo $order['order_id']; ?></td>
                                        <td class="text-left"><?php echo $order['invoice']; ?></td>
                                        <td class="text-left"><?php echo $order['contract']; ?></td>
                                        <td class="text-left"><?php echo $order['status']; ?></td>
                                        <td class="text-right"><?php echo $order['total']; ?></td>
                                        <td class="text-left"><?php echo $order['date_added']; ?></td>
                                        <td class="text-left"><?php echo $order['date_modified']; ?></td>
                                        <td class="text-right">
                                            <button type="button" class="btn btn-sm btn-primary" data-toggle="tooltip" title="<?php echo $button_view; ?>" onclick="orderView('<?php echo $order['order_id']?>')"><i class="fa fa-eye"></i></button>
                                    </tr>
                                    <?php } ?>
                                    <?php } else { ?>
                                    <tr>
                                        <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
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
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->


    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->
<!-- Modal -->
<div class="modal fade" id="order-view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Order View</h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" id="button-close"class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</div>
<!-- /#wrapper -->
<script type="text/javascript"><!--
    $('#button-refresh').on('click', function() {
        url = 'index.php?route=account/order';

        location = url;
    });
    $('#button-filter').on('click', function() {
        url = 'index.php?route=account/order';

        var filter_order_id = $('input[name=\'filter_order_id\']').val();

        if (filter_order_id) {
            url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
        }

        var filter_order_status = $('select[name=\'filter_order_status\']').val();

        if (filter_order_status != '*') {
            url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
        }

        var filter_total = $('input[name=\'filter_total\']').val();

        if (filter_total) {
            url += '&filter_total=' + encodeURIComponent(filter_total);
        }

        var filter_date_added = $('input[name=\'filter_date_added\']').val();

        if (filter_date_added) {
            url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
        }

        var filter_date_modified = $('input[name=\'filter_date_modified\']').val();

        if (filter_date_modified) {
            url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
        }

        location = url;
    });
    //--></script>
<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    function orderView(order_id){

        var element = $(this);
//
        $.ajax({
            url: 'index.php?route=account/order/getOrder',
            type: 'post',
            data : 'order_id='+order_id,
            dataType: 'html',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(html) {

                element.button('reset');
                $('.modal-body').html(html);

                $('#order-view').modal('show');

            }
        });

    }
    //--></script>
<?php echo $footer?>