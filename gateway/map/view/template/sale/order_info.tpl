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
                <div class="pull-right"><a href="<?php echo $invoice; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></a> <a href="<?php echo $shipping; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a> <a href="<?php echo $edit; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a> <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-list"></i> <?php echo $heading_title; ?>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab-order" data-toggle="tab"><?php echo $tab_order; ?></a></li>
                            <li><a href="#tab-payment" data-toggle="tab">Order Details</a></li>
                            <li><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
                        </ul>
                        <br/>
                        <!-- /.tab contant -->
                        <div class="tab-content">
                        <div class="tab-pane active" id="tab-order">
                            <table class="table table-bordered">
                                <tr>
                                    <td><?php echo $text_order_id; ?></td>
                                    <td>#<?php echo $order_id; ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $text_invoice_no; ?></td>
                                    <td><?php if ($invoice_no) { ?>
                                        <?php echo $invoice_no; ?>
                                        <?php } else { ?>
                                        <button id="button-invoice" class="btn btn-success btn-xs"><i class="fa fa-cog"></i> <?php echo $button_generate; ?></button>
                                        <?php } ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $text_application_name; ?></td>
                                    <td><?php echo $application_name; ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $text_application_url; ?></td>
                                    <td><a href="<?php echo $application_url; ?>" target="_blank"><?php echo $application_url; ?></a></td>
                                </tr>
                                <?php if ($customer) { ?>
                                <tr>
                                    <td><?php echo $text_customer; ?></td>
                                    <td><a href="<?php echo $customer; ?>" target="_blank"><?php echo $firstname; ?> <?php echo $lastname; ?></a></td>
                                </tr>
                                <?php } else { ?>
                                <tr>
                                    <td><?php echo $text_customer; ?></td>
                                    <td><?php echo $firstname; ?> <?php echo $lastname; ?></td>
                                </tr>
                                <?php } ?>
                                <?php if ($customer_group) { ?>
                                <tr>
                                    <td><?php echo $text_customer_group; ?></td>
                                    <td><?php echo $customer_group; ?></td>
                                </tr>
                                <?php } ?>
                                <tr>
                                    <td><?php echo $text_email; ?></td>
                                    <td><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></td>
                                </tr>
                                <tr>
                                    <td><?php echo $text_telephone; ?></td>
                                    <td><?php echo $telephone; ?></td>
                                </tr>
                                <?php if ($fax) { ?>
                                <tr>
                                    <td><?php echo $text_fax; ?></td>
                                    <td><?php echo $fax; ?></td>
                                </tr>
                                <?php } ?>
                                <tr>
                                    <td><?php echo $text_total; ?></td>
                                    <td><?php echo $total; ?></td>
                                </tr>
                                <?php if ($order_status) { ?>
                                <tr>
                                    <td><?php echo $text_order_status; ?></td>
                                    <td id="order-status"><?php echo $order_status; ?></td>
                                </tr>
                                <?php } ?>
                                <?php if ($comment) { ?>
                                <tr>
                                    <td><?php echo $text_comment; ?></td>
                                    <td><?php echo $comment; ?></td>
                                </tr>
                                <?php } ?>
                                <?php if ($ip) { ?>
                                <tr>
                                    <td><?php echo $text_ip; ?></td>
                                    <td><?php echo $ip; ?></td>
                                </tr>
                                <?php } ?>
                                <?php if ($forwarded_ip) { ?>
                                <tr>
                                    <td><?php echo $text_forwarded_ip; ?></td>
                                    <td><?php echo $forwarded_ip; ?></td>
                                </tr>
                                <?php } ?>
                                <?php if ($user_agent) { ?>
                                <tr>
                                    <td><?php echo $text_user_agent; ?></td>
                                    <td><?php echo $user_agent; ?></td>
                                </tr>
                                <?php } ?>
                                <?php if ($accept_language) { ?>
                                <tr>
                                    <td><?php echo $text_accept_language; ?></td>
                                    <td><?php echo $accept_language; ?></td>
                                </tr>
                                <?php } ?>
                                <tr>
                                    <td><?php echo $text_date_added; ?></td>
                                    <td><?php echo $date_added; ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $text_date_modified; ?></td>
                                    <td><?php echo $date_modified; ?></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane" id="tab-payment">
                            <table class="table table-bordered">
                                <tr>
                                    <td>Banking Instrument</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Requested amount</td>
                                    <td><?php echo $request?></td>
                                </tr>
                                <tr>
                                    <td>Preferred bank account of Payment</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Preferred bank account of Settlement</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Beneficiary Name</td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane" id="tab-history">
                            <div id="history"></div>
                            <br />
                            <fieldset>
                                <legend><?php echo $text_history; ?></legend>
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                                        <div class="col-sm-10">
                                            <select name="order_status_id" id="input-order-status" class="form-control">
                                                <?php foreach ($order_statuses as $order_statuses) { ?>
                                                <?php if ($order_statuses['order_status_id'] == $order_status_id) { ?>
                                                <option value="<?php echo $order_statuses['order_status_id']; ?>" selected="selected"><?php echo $order_statuses['name']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $order_statuses['order_status_id']; ?>"><?php echo $order_statuses['name']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-notify"><?php echo $entry_notify; ?></label>
                                        <div class="col-sm-10">
                                            <input type="checkbox" name="notify" value="1" id="input-notify" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="comment" rows="8" id="input-comment" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </form>
                                <div class="text-right">
                                    <button id="button-history" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_history_add; ?></button>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                        <!-- /.tab content end -->
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
<script>
//    $('#history').delegate('.pagination a', 'click', function(e) {
//        e.preventDefault();
//
//        $('#history').load(this.href);
//    });

//    $('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

    $('#button-history').on('click', function() {


        if(typeof verifyStatusChange == 'function'){
            if(verifyStatusChange() == false){
                return false;
            }else{
                addOrderInfo();
            }
        }else{
            addOrderInfo();
        }

        $.ajax({
            url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/order/history&order_id=<?php echo $order_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&append=' + ($('input[name=\'append\']').prop('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
            beforeSend: function() {
                $('#button-history').button('loading');
            },
            complete: function() {
                $('#button-history').button('reset');
            },
            success: function(json) {
                $('.alert').remove();

                if (json['error']) {
                    $('#history').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                if (json['success']) {
                    $('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

                    $('#history').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('textarea[name=\'comment\']').val('');

                    $('#order-status').html($('select[name=\'order_status_id\'] option:selected').text());
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
</script>
<?php echo $footer?>