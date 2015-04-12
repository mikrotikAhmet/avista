<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li id="dashboard"><a href="<?php echo $home; ?>"><i class="fa fa-dashboard fa-fw"></i> <span><?php echo $text_dashboard; ?></span></a></li>
            <li id="certificate"><a href="<?php echo $certificate; ?>"><i class="fa fa-shield fa-fw"></i> <span><?php echo $text_certificate; ?></span></a></li>
            <li id="sale">
                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> <?php echo $text_sale?><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li id="order"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li id="contract"><a href="<?php echo $contract; ?>">Contracts</a></li>
                    <li id="customer">
                        <a href="#"><?php echo $text_customer; ?> <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
                            <li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
                            <li><a href="<?php echo $customer_ban_ip; ?>"><?php echo $text_customer_ban_ip; ?></a></li>
                        </ul>
                        <!-- /.nav-third-level -->
                    </li>
                </ul>

                <!-- /.nav-second-level -->
            </li>
            <li id="system">
                <a href="#"><i class="fa fa-cog fa-fw"></i> <?php echo $text_system; ?><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li id="setting"><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
                    <li id="user">
                        <a href="#"><?php echo $text_users; ?> <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li id="user"><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
                            <li id="user_permission"><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
                            <li id="api"><a href="<?php echo $api; ?>"><?php echo $text_api; ?></a></li>
                        </ul>
                        <!-- /.nav-third-level -->
                    </li>
                </ul>

                <!-- /.nav-second-level -->
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>