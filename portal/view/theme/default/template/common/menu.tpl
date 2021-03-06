<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav side-nav">
        <div class="unique">
            <span>ID : <?php echo $unique?></span>
        </div>
        <li>
            <a class="text_grey" href="<?php echo $home?>"><i class="fa fa-fw fa-dashboard"></i> <?php echo $text_dashboard?></a>
        </li>
        <li class="nav-heading"><?php echo $text_heading_my_account?></li>
        <li><a class="text_grey" href="<?php echo $account; ?>"><i class="fa fa-fw fa-cogs"></i> <?php echo $text_account?></a></li>
        <li><a class="text_grey" href="<?php echo $bank?>"><i class="fa fa-fw fa-bank"></i> <?php echo $text_bank?></a></li>
        <!--li><a class="text_grey" href="<?php echo $security?>"><i class="fa fa-fw fa-shield"></i> <?php echo $text_security?></a></li-->
        <li class="nav-heading">Operation</li>
        <li><a class="text_grey" href="<?php echo $order?>"><i class="fa fa-fw fa-file-o"></i> <?php echo $text_order?></a></li>
        <li><a class="text_grey" href="<?php echo $document?>"><i class="fa fa-fw fa-file"></i> <?php echo $text_document?></a></li>
        <li class="nav-heading">Reports</li>
        <li><a class="text_grey" href="<?php echo $myorder?>"><i class="fa fa-fw fa-list"></i> <?php echo $text_myorder?></a></li>
        <!--li><a class="text_grey" href="<?php echo $myinvoice?>"><i class="fa fa-fw fa-list"></i> <?php echo $text_myinvoice?></a></li>
        <li><a class="text_grey" href="<?php echo $mycontract?>"><i class="fa fa-fw fa-list"></i> <?php echo $text_mycontract?></a></li-->
        <li class="nav-heading"></li>
        <li><a class="text_grey" href="<?php echo $logout; ?>"><i class="fa fa-fw fa-power-off"></i> <?php echo $text_logout?></a></li>
    </ul>
</div>
<!-- /.navbar-collapse -->