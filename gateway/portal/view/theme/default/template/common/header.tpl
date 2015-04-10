<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>

    <!-- Bootstrap Core CSS -->
    <link href="view/theme/default/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="view/theme/default/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="view/theme/default/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- jQuery -->
    <script src="view/theme/default/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="view/theme/default/js/bootstrap.min.js"></script>

    <script src="view/javascript/inputmask/js/jquery.mask.min.js" type="text/javascript"></script>
    <script src="view/javascript/common.js" type="text/javascript"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>
<body>
<div id="wrapper">
    <?php if ($logged) { ?>
    <!-- Navigation -->
    <nav class="navbar navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?php echo $home?>"><img src="<?php echo $logo?>" style="  width: 213px;
  position: relative;
  bottom: 10px;"/></a>
        </div>
        <?php if (!$approved || $account_status) { ?>
        <p class="text-info" style=" color: #FFF;
  position: relative;
  top: 0px;
  background: #173e9a;
  padding: 10px 5px;"><b>***After you providing company document(s) and valid bank account(s) please make a aprroval request by clicking</b> <button type="button" class="btn btn-sm btn-success">Request Approval</button></p>
        <?php } ?>
        <!-- Top Menu Items -->
        <ul class="pull-right" style=" padding: 0;
  margin: 0;
  position: relative;
  bottom: 52px;
  right: 15px;
  list-style: none;">
            <li style="color: #FFF"><i class="fa fa-user"></i> <?php echo $text_logged?></li>
            <li><a href="<?php echo $logout; ?>" style="color: #FFF"><i class="fa fa-fw fa-power-off"></i> <?php echo $text_logout; ?></a></li>
        </ul>
        <?php echo $column_left?>
    </nav>
    <?php } ?>
    <?php if (!$approved && $hasrequest) { ?>
    <div class="alert alert-info alert-dismissable">
        <i class="fa fa-exclamation-circle"></i> Your account is being reviewing by our underwriting team.<br/>
        When we approve your account you will receive email as your account has been activated.
    </div>
    <?php } ?>
    <script>
        $(document).ready(function(){
            $('#basic-modal-content').modal();
            return false;
        });
        </script>
    <?php if ($isFirst) { ?>
    <!-- Modal -->
    <div class="modal fade" id="basic-modal-content" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel"><i class="fa fa-shield"></i> You have been approved!</h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="background: #337ab7; color: #fff;margin-top: 20px;">
                        <div class="col-md-4">
                            <img src="<?php echo $logo?>" style="width: 200px;"/>
                        </div>
                    </div>
                    <h3>Congratulations!</h3>
                    <p>Your HIF Invest Holding E-Banking account successfully approved by our compilance team.</p>
                    <p>Your Verified <b>Business Certification</b> number and <b>Globally Unique Customer</b> number has been sent to email which associated to your account.</p>
                    <div class="col-md-4">
                        <img src="image/seal.png" style="width: 100px;"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="button-close" onclick="removeGreeting()" class="btn btn-default" data-dismiss="modal">Close and Do not show again!</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <script>

        function removeGreeting(){

            $.ajax({
                url : 'index.php?route=account/account/removeGreeting',
                type : 'post',
                dataType : 'json',
                success : function(e){

                    location = 'index.php?route=sale/order';
                }
            });
        }
    </script>
    <?php } ?>
