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
            <li class="active">
                <i class="fa fa-dashboard"></i> <?php echo $heading_title?>
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-8">
        <div class="panel panel-default">
            <div class="panel-heading">
                Order Form
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class=" control-label">Instrument</label>
                    <div class="">
                        <select name="instrument" class="form-control">
                            <option value="">--Please select--</option>
                            <option value="">[BG] - Bank guarantee</option>
                            <option value="">SBLC</option>
                            <option value="">LTD</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class=" control-label">Requested amount</label>
                    <div class="">
                        <input type="text" value="" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class=" control-label">Period</label>
                    <div class="">
                        <select name="instrument" class="form-control">
                            <option value="">--Please select--</option>
                            <option value="">3 Months</option>
                            <option value="">6 Months</option>
                            <option value="">12 Months</option>
                            <option value="">24 Months</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                Buttons here!
            </div>
        </div>
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