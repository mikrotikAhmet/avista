<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta charset="UTF-8" />
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="map/view/css/bootstrap.min.css">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="map/view/css/plugins/jquery-ui/jquery-ui.min.css">
    <?php foreach ($styles as $style) { ?>
    <link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <!-- Theme CSS -->
    <link rel="stylesheet" href="map/view/css/style.css">
    <!-- Color CSS -->
    <link rel="stylesheet" href="map/view/css/themes.css">
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <!-- jQuery -->
    <script src="map/view/js/jquery.min.js"></script>
    <!-- Nice Scroll -->
    <script src="map/view/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- Bootstrap -->
    <script src="map/view/js/bootstrap.min.js"></script>
    <!-- Theme framework -->
    <script src="map/view/js/eakroko.min.js"></script>
    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <!--[if lte IE 9]>
    <script src="map/view/js/plugins/placeholder/jquery.placeholder.min.js"></script>
    <script>
        $(document).ready(function() {
            $('input, textarea').placeholder();
        });
    </script>
    <![endif]-->
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" />
    <!-- Apple devices Homescreen icon -->
    <link rel="apple-touch-icon-precomposed" href="map/view/img/apple-touch-icon-precomposed.png" />
    <script src="map/view/js/common.js" type="text/javascript"></script>
</head>
<body class='<?php echo $class?>'>
<?php if ($logged) { ?>
<?php echo $menu?>
<?php } ?>
