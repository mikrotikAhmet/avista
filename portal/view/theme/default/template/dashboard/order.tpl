<div class="panel panel-primary">
    <div class="panel-heading">
        <div class="row">
            <div class="col-xs-3">
                <i class="fa fa-building fa-5x"></i>
            </div>
            <div class="col-xs-9 text-right">
                <div class="huge"><?php echo $total; ?></div>
                <div><?php echo $heading_title; ?></div>
            </div>
        </div>
    </div>
    <a href="#">
        <div class="panel-footer">
            <span class="pull-left"><a href="<?php echo $order; ?>"><?php echo $text_view; ?></a></span>
                <span class="pull-right">
    <?php if ($percentage > 0) { ?>
    <i class="fa fa-caret-up"></i>
                    <?php } elseif ($percentage < 0) { ?>
                    <i class="fa fa-caret-down"></i>
                    <?php } ?>
                    <?php echo $percentage; ?>%</span>
            <div class="clearfix"></div>
        </div>
    </a>
</div>