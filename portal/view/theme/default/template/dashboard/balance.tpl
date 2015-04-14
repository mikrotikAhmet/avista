<div class="panel panel-primary">
    <div class="panel-heading">
        <div class="row">
            <div class="col-xs-3">
                <i class="fa fa-money fa-5x"></i>
            </div>
            <div class="col-xs-9 text-right">
                <div class="huge"><?php echo ($negative ? '-' : '').$total; ?></div>
                <div><?php echo $heading_title; ?></div>
            </div>
        </div>
    </div>
    <a href="#">
        <div class="panel-footer">
            <span class="pull-left"><a href="<?php echo $transaction; ?>"><?php echo $text_view; ?></a></span>
            <div class="clearfix"></div>
        </div>
    </a>
</div>