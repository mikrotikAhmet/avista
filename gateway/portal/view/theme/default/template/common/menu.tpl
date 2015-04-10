<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
        <div style="display: block;
  padding: 21px 21px;
  font-weight: bolder;color: #FFF">
            <i class="fa fa-lock"></i> Unique ID : <?php echo $unique?><br/><i class="fa fa-user"></i> <?php echo $text_logged?>
        </div>
        <li class="">
            <a href="<?php echo $home?>"><i class="fa fa-fw fa-dashboard"></i> <?php echo $text_dashboard?></a>
        </li>
        <li>
            <a href="<?php echo $setting; ?>"><i class="fa fa-fw fa-cog"></i> <?php echo $text_setting; ?></a>
        </li>
        <li id="">
            <a href="javascript:;" data-toggle="collapse" data-target="#operation"><?php echo $text_operation?></a>
            <ul id="operation" class="">
                <li id="request">
                    <a href="<?php echo $order?>"><i class="fa fa-fw fa-file"></i> <?php echo $text_request?></a>
                </li>
                <li id="transaction">
                    <a href="#"><i class="fa fa-fw fa-file"></i> <?php echo $text_transaction?></a>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#report"><?php echo $text_report?></a>
            <ul id="report" class="">
                <li id="order_report">
                    <a href="<?php echo $order_report?>"><i class="fa fa-fw fa-file"></i> <?php echo $text_order?></a>
                </li>
            </ul>
        </li>
        <li><a href="<?php echo $logout; ?>" style="color: #FFF"><i class="fa fa-fw fa-power-off"></i> Logout</a></li>
    </ul>
</div>
<!-- /.navbar-collapse -->