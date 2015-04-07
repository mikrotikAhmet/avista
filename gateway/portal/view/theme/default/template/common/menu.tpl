<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
        <li class="active">
            <a href="<?php echo $home?>"><i class="fa fa-fw fa-dashboard"></i> <?php echo $text_dashboard?></a>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#operation"><i class="fa fa-fw fa-arrows-v"></i> <?php echo $text_operation?> <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="operation" class="collapse">
                <li id="request">
                    <a href="<?php echo $order?>"><i class="fa fa-fw fa-file"></i> <?php echo $text_request?></a>
                </li>
                <li id="transaction">
                    <a href="#"><i class="fa fa-fw fa-file"></i> <?php echo $text_transaction?></a>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#report"><i class="fa fa-fw fa-arrows-v"></i> <?php echo $text_report?> <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="report" class="collapse">
                <li id="order_report">
                    <a href="<?php echo $order_report?>"><i class="fa fa-fw fa-file"></i> <?php echo $text_order?></a>
                </li>
            </ul>
        </li>
    </ul>
</div>
<!-- /.navbar-collapse -->