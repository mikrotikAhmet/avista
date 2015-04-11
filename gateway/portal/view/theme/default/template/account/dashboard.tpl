<?php echo $header?>
<div id="page-wrapper">
<div class="container-fluid">
<!-- Page Heading -->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <?php echo $heading_title?> <small>Statistics Overview</small>
        </h1>
        <ol class="breadcrumb">
            <li class="active">
                <i class="fa fa-dashboard"></i> <?php echo $heading_title?>
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<?php if (!$approved) { ?>
<div class="row">
    <div class="col-lg-12">
        <div class="alert alert-warning alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <i class="fa fa-exclamation-circle"></i> <strong>Action required!</strong> Your account is in Pending Mode.
        </div>
    </div>
</div>
<?php } ?>
<!-- /.row -->

<div class="row">
    <div class="col-lg-3 col-md-6">
        <?php echo $order?>
    </div>
    <div class="col-lg-3 col-md-6">
        <?php echo $order_waiting?>
    </div>
</div>

<!-- /.row -->



</div>
<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<?php echo $footer?>