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
                <?php if ($error_install) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_install; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $customer; ?></div>
                    <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $order; ?></div>
                    <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $sale; ?></div>
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
<?php echo $footer?>