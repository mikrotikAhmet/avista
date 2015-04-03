﻿<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="<?php echo $lang; ?>"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="<?php echo $lang; ?>"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="<?php echo $lang; ?>"> <![endif]-->

<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8" />
    <link rel="dns-prefetch" href="http://fonts.googleapis.com" />
    <link rel="dns-prefetch" href="http://themes.googleusercontent.com" />

    <link rel="dns-prefetch" href="http://ajax.googleapis.com" />
    <link rel="dns-prefetch" href="http://cdnjs.cloudflare.com" />
    <link rel="dns-prefetch" href="http://agorbatchev.typepad.com" />

    <!-- Use the .htaccess and remove these lines to avoid edge case issues.
       More info: h5bp.com/b/378 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <!-- Mobile viewport optimized: h5bp.com/viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <!-- iPhone: Don't render numbers as call links -->
    <meta name="format-detection" content="telephone=no">

    <link rel="shortcut icon" href="favicon.ico" />
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->
    <!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <!-- The Styles -->
    <!-- ---------- -->

    <!-- Layout Styles -->
    <link rel="stylesheet" href="view/theme/mango/assets/css/style.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/grid.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/layout.css">

    <!-- Icon Styles -->
    <link rel="stylesheet" href="view/theme/mango/assets/css/icons.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/fonts/font-awesome.css">
    <!--[if IE 8]><link rel="stylesheet" href="view/theme/mango/assets/css/fonts/font-awesome-ie7.css"><![endif]-->

    <!-- External Styles -->
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/jquery-ui-1.9.1.custom.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/jquery.chosen.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/jquery.cleditor.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/jquery.colorpicker.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/jquery.elfinder.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/jquery.fancybox.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/jquery.jgrowl.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/jquery.plupload.queue.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/syntaxhighlighter/shCore.css" />
    <link rel="stylesheet" href="view/theme/mango/assets/css/external/syntaxhighlighter/shThemeDefault.css" />

    <!-- Elements -->
    <link rel="stylesheet" href="view/theme/mango/assets/css/elements.css">
    <link rel="stylesheet" href="view/theme/mango/assets/css/forms.css">

    <!-- OPTIONAL: Print Stylesheet for Invoice -->
    <link rel="stylesheet" href="view/theme/mango/assets/css/print-invoice.css">

    <!-- Typographics -->
    <link rel="stylesheet" href="view/theme/mango/assets/css/typographics.css">

    <!-- Responsive Design -->
    <link rel="stylesheet" href="view/theme/mango/assets/css/media-queries.css">

    <!-- Bad IE Styles -->
    <link rel="stylesheet" href="view/theme/mango/assets/css/ie-fixes.css">

    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>


    <!-- The Scripts -->
    <!-- ----------- -->

    <!-- JavaScript at the top (will be cached by browser) -->


    <!-- Grab frameworks from CDNs -->
    <!-- Grab jQuery from a CDN; fall back to local if offline -->
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script>window.jQuery || document.write('<script src="view/theme/mango/assets/js/libs/jquery-1.10.2.min.js"><\/script>')</script>

    <!-- Do the same with jquery-migrate -->
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="view/theme/mango/assets/js/libs/jquery-migrate-1.2.1.min.js"><\/script>')</script>

    <!-- Do the same with jQuery UI -->
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.min.js"></script>
    <script>window.jQuery.ui || document.write('<script src="view/theme/mango/assets/js/libs/jquery-ui-1.9.1.min.js"><\/script>')</script>

    <!-- Do the same with Lo-Dash.js -->
    <!--[if gt IE 8]><!-->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/lodash.js/0.8.2/lodash.min.js"></script>
    <script>window._ || document.write('<script src="view/theme/mango/assets/js/libs/lo-dash.min.js"><\/script>')</script>
    <!--<![endif]-->
    <!-- IE8 doesn't like lodash -->
    <!--[if lt IE 9]><script src="http://documentcloud.github.com/underscore/underscore.js"></script><![endif]-->

    <!-- Do the same with require.js -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/require.js/2.0.6/require.min.js"></script>
    <script>window.require || document.write('<script src="view/theme/mango/assets/js/libs/require-2.0.6.min.js"><\/script>')</script>


    <!-- Load Webfont loader -->
    <script type="text/javascript">
        window.WebFontConfig = {
            google: { families: [ 'PT Sans:400,700' ] },
            active: function(){ $(window).trigger('fontsloaded') }
        };
    </script>
    <script defer async src="https://ajax.googleapis.com/ajax/libs/webfont/1.0.28/webfont.js"></script>

    <!-- Essential polyfills -->
    <script src="view/theme/mango/assets/js/mylibs/polyfills/modernizr-2.6.1.min.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/polyfills/respond.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/polyfills/matchmedia.js"></script>
    <!--[if lt IE 9]><script src="view/theme/mango/assets/js/mylibs/polyfills/selectivizr.js"></script><![endif]-->
    <!--[if lt IE 10]><script src="view/theme/mango/assets/js/mylibs/polyfills/excanvas.js"></script><![endif]-->
    <!--[if lt IE 10]><script src="view/theme/mango/assets/js/mylibs/polyfills/classlist.js"></script><![endif]-->


    <!-- scripts concatenated and minified via build script -->

    <!-- Scripts required everywhere -->
    <script src="view/theme/mango/assets/js/mylibs/jquery.hashchange.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/jquery.idle-timer.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/jquery.plusplus.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/jquery.scrollTo.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/jquery.ui.touch-punch.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/jquery.ui.multiaccordion.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/number-functions.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/fullstats/jquery.css-transform.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/fullstats/jquery.animate-css-rotate-scale.js"></script>
    <script src="view/theme/mango/assets/js/mylibs/forms/jquery.validate.js"></script>

    <!-- Do not touch! -->
    <script src="view/theme/mango/assets/js/mango.js"></script>
    <script src="view/theme/mango/assets/js/plugins.js"></script>
    <script src="view/theme/mango/assets/js/script.js"></script>

    <!-- Your custom JS goes here -->
    <script src="view/theme/mango/assets/js/app.js"></script>
    <!-- end scripts -->
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<!-- ----------------- -->
<!-- Some dialogs etc. -->

<!-- The loading box -->
<div id="loading-overlay"></div>
<div id="loading">
    <span>Loading...</span>
</div>
<!-- End of loading box -->
<?php if ($logged) { ?>
<!-- The lock screen -->
<div id="lock-screen" title="Screen Locked">

    <a href="login.html" class="header right button grey flat">Logout</a>

    <p>Due to the inactivity of this session, your account was temporarily locked.</p>
    <p>To unlock your account, simply slide the button and enter your password.</p>

    <div class="actions">
        <div id="slide_to_unlock">
            <img src="view/theme/mango/assets/img/elements/slide-unlock/lock-slider.png" alt="slide me">
            <span>slide to unlock</span>
        </div>
        <form action="#" method="GET">
            <input type="password" name="pwd" id="pwd" placeholder="Enter your password here..." autocorrect="off" autocapitalize="off"> <input type="submit" name=send value="Unlock" disabled> <input type="reset" value="X">
        </form>
    </div><!-- End of .actions -->

</div><!-- End of lock screen -->

<!-- The settings dialog -->
<div id="settings" class="settings-content" data-width=450>

    <ul class="tabs center-elements">
        <li><a href="#settings-1"><img src="view/theme/mango/assets/img/icons/packs/fugue/24x24/user-business.png" alt="" /><span>Account Settings</span></a></li>
        <li><a href="#settings-2"><img src="view/theme/mango/assets/img/icons/packs/fugue/24x24/balloon.png" alt="" /><span>Notifications</span></a></li>
        <li><a href="#settings-3"><img src="view/theme/mango/assets/img/icons/packs/fugue/24x24/credit-card.png" alt="" /><span>Invoicing</span></a></li>
    </ul>

    <div class="change_password">
        <form action="#" method="GET" class="validate" id="settings_password">
            <p>
                <label for="settings-password">New Password:</label> <input type="password" id="settings-password" class="required strongpw small password meter" />
            </p>
        </form>
        <div class="actions">
            <div class="right">
                <input form="settings_password" type="reset" value="Cancel" class="grey" />
                <input form="settings_password" type="submit" value="OK" />
            </div>
        </div>
    </div><!-- End of .change_password -->

    <div class="content">

        <div id="settings-1">
            <form action="#" method="GET">
                <p>
                    <label for="settings-name">Name:</label> <input type="text" id="settings-name" class="medium" />
                </p>
                <p>
                    <label for="settings-descr">Descripton:</label> <input type="text" id="settings-descr" class="medium" />
                </p>
                <p class="divider"></p>
                <p>
                    <label for="settings-pw">Password: </label> <input class="grey change_password_button" type="button" id="settings-pw" value="Change Password..." data-lang-changed="Password changed" />
                </p>
                </form>
        </div><!-- End of #settings-1 -->

        <div id="settings-2">
            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
            <form action="#" method="GET">
                <div class="spacer"></div>
                <p class="divider"></p>
                <div class="spacer"></div>
                <p>
                    <label for="settings-email">Email Address:</label> <input type="text" id="settings-email" class="medium" />
                </p>
                <p>
                    <label for="settings-interval">Interval: </label>
                    <select name="settings-interval" id="settings-interval" data-placeholder="Choose an Interval">
                        <option value=""></option>
                        <option value="Never">Never</option>
                        <option value="Daily">Daily</option>
                        <option value="Weekly">Weekly</option>
                        <option value="Monthly">Monthly</option>
                        <option value="Yearly">Yearly</option>
                    </select>
                </p>
            </form>
        </div><!-- End of #settings-2 -->

        <div id="settings-3">
            <form action="#" method="GET">
                <p>
                    <label for="settings-card-number">Card number:</label> <input type="text" id="settings-card-number" class="medium" />
                </p>
                <p>
                    <label for="settings-cvv">CVV:</label> <input type="text" id="settings-cvv" class="medium" />
                </p>
                <p>
                    <label for="settings-expiration">Expiration: </label>
                    <select sname="settings-expiration" id="settings-expiration" data-placeholder="Choose an Expiration">
                        <option value=""></option>
                        <option value="2012">2012</option>
                        <option value="2013">2013</option>
                        <option value="2014">2014</option>
                        <option value="2015">2015</option>
                    </select>
                </p>
            </form>
        </div><!-- End of #settings-3 -->

    </div><!-- End of .content -->

    <div class="actions">
        <div class="left">
            <button class="grey cancel">Cancel</button>
        </div>
        <div class="right">
            <button class="save">Save</button>
            <button class="hide saving" disabled >Saving...</button>
        </div>
    </div><!-- End of .actions -->

</div><!-- End of settings dialog -->

<!-- Add Client Example Dialog -->
<div style="display: none;" id="dialog_add_client" title="Add Client Example Dialog">
    <form action="" class="full validate">
        <div class="row">
            <label for="d2_username">
                <strong>Username</strong>
            </label>
            <div>
                <input class="required" type=text name=d2_username id=d2_username />
            </div>
        </div>
        <div class="row">
            <label for="d2_email">
                <strong>Email Address</strong>
            </label>
            <div>
                <input class="required" type=text name=d2_email id=d2_email />
            </div>
        </div>
        <div class="row">
            <label for="d2_role">
                <strong>Role</strong>
            </label>
            <div>
                <select name=d2_role id=d2_role class="search required" data-placeholder="Choose a Role">
                    <option value=""></option>
                    <option value="Applicant">Applicant</option>
                    <option value="Member">Member</option>
                    <option value="Moderator">Moderator</option>
                    <option value="Administrator">Administrator</option>
                </select>
            </div>
        </div>
    </form>
    <div class="actions">
        <div class="left">
            <button class="grey cancel">Cancel</button>
        </div>
        <div class="right">
            <button class="submit">Add User</button>
        </div>
    </div>
</div><!-- End if #dialog_add_client -->

<script>
    $$.ready(function() {
        $( "#dialog_add_client" ).dialog({
            autoOpen: false,
            modal: true,
            width: 400,
            open: function(){ $(this).parent().css('overflow', 'visible'); $$.utils.forms.resize() }
        }).find('button.submit').click(function(){
            var $el = $(this).parents('.ui-dialog-content');
            if ($el.validate().form()) {
                $el.find('form')[0].reset();
                $el.dialog('close');
            }
        }).end().find('button.cancel').click(function(){
            var $el = $(this).parents('.ui-dialog-content');
            $el.find('form')[0].reset();
            $el.dialog('close');;
        });

        $( ".open-add-client-dialog" ).click(function() {
            $( "#dialog_add_client" ).dialog( "open" );
            return false;
        });
    });
</script>
<!--  End of Add Client Example Dialog -->

<!-- Message Dialog -->
<div style="display: none;" id="dialog_message" title="Conversation: John Doe">
    <div class="spacer"></div>
    <div class="messages full chat">

        <div class="msg reply">
            <img src="view/theme/mango/assets/img/icons/packs/iconsweets2/25x25/user-2.png"/>
            <div class="content">
                <h3><a href="pages_profile.html">John Doe</a> <span>says:</span><small>3 hours ago</small></h3>
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
                    et dolore magna aliquyam erat, sed diam voluptua.</p>
            </div>
        </div>

        <div class="msg">
            <img src="view/theme/mango/assets/img/icons/packs/iconsweets2/25x25/user-2.png"/>
            <div class="content">
                <h3><a href="pages_profile.html">Peter Doe</a> <span>says:</span><small>5 hours ago</small></h3>
                <p>At vero eos et accusam et justo duo dolores et ea rebum.
                    Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
            </div>
        </div>

    </div><!-- End of .messages -->

    <div class="actions">
        <div class="left">
            <input style="width: 320px;" type="text" name=d3_message id=d3_message placeholder="Type your message..."/>
        </div>
        <div class="right">
            <button>Send</button>
            <button class="grey">Cancel</button>
        </div>
    </div><!-- End of .actions -->

</div><!-- End of #dialog_message -->

<script>
    $$.ready(function() {
        $( "#dialog_message" ).dialog({
            autoOpen: false,
            width: 500,
            modal: true
        }).find('button').click(function(){
            $(this).parents('.ui-dialog-content').dialog('close');
        });

        $( ".open-message-dialog" ).click(function() {
            $( "#dialog_message" ).dialog( "open" );
            return false;
        });
    });
</script>
<!-- End of Message Dialog -->

<!--------------------------------->
<!-- Now, the page itself begins -->
<!--------------------------------->

<!-- The toolbar at the top -->
<section id="toolbar">
    <div class="container_12">
        <!-- Right side -->
        <div class="right">
            <ul>
                <li class="space"></li>
                <li><a href="javascript:void(0);" id="btn-lock"><span>--:--</span><?php echo $text_lock_screen?></a></li>
                <li class="red"><a href="<?php echo $logout?>"><?php echo $text_logout?></a></li>

            </ul>
        </div><!-- End of .right -->

        <!-- Phone only items -->
        <div class="phone">

            <!-- User Link -->
            <li><a href="pages_profile.html"><span class="icon icon-user"></span></a></li>
            <!-- Navigation -->
            <li><a class="navigation" href="#"><span class="icon icon-list"></span></a></li>

        </div><!-- End of phone items -->

    </div><!-- End of .container_12 -->
</section><!-- End of #toolbar -->

<!-- The header containing the logo -->
<header class="container_12">

    <!-- Your logos -->
    <a href="<?php echo $home?>"><img src="<?php echo $logo?>" alt="Mango" width="300" height="60"></a>
    <a class="phone-title" href="dashboard.html"><img src="view/theme/mango/assets/img/logo-mobile.png" alt="Mango" height="22" width="70" /></a>

    <div class="buttons">
        <a href="statistics.html">
            <span class="icon icon-sitemap"></span>
            Statistics
        </a>
        <a href="forms.html">
            <span class="icon icon-list-alt"></span>
            Forms
        </a>
        <a href="tables_dynamic.html">
            <span class="icon icon-table"></span>
            Tables
        </a>
    </div><!-- End of .buttons -->
</header><!-- End of header -->

<!-- The container of the sidebar and content box -->
<div role="main" id="main" class="container_12 clearfix">

<!-- The blue toolbar stripe -->
<section class="toolbar">
    <div class="user">
        <div class="avatar">
            <img src="view/theme/mango/assets/img/layout/content/toolbar/user/avatar.png">
            <span>3</span>
        </div>
        <span>Administrator</span>
        <ul>
            <li><a href="javascript:$$.settings();">Settings</a></li>
            <li><a href="pages_profile.html">Profile</a></li>
            <li class="line"></li>
            <li><a href="login.html">Logout</a></li>
        </ul>
    </div>
    <ul class="shortcuts">

        <li>
            <a href="javascript:void(0);"><span class="icon i24_user-business"></span></a>
            <!-- Possible sizes: small/medium/large -->
            <div class="small">
                <h3>Create a User</h3>

                <!-- Button bar -->
                <button class="button flat left grey" onclick="$(this).parent().fadeToggle($$.config.fxSpeed).parent().removeClass('active')">Close</button>
                <button class="button flat right" onclick="$(this).parent().fadeToggle($$.config.fxSpeed).parent().removeClass('active')">Create</button>

                <div class="content">
                    <form class="full grid">
                        <div class="row no-bg">
                            <p class="_100 small">
                                <label for="p1_username">Username</label>
                                <input type="text" name="p1_username" id="p1_username" />
                            </p>
                        </div>
                        <div class="row no-bg">
                            <p class="_50 small">
                                <label for="p1_firstname">Firstname</label>
                                <input type="text" name="p1_firstname" id="p1_firstname" />
                            </p>
                            <p class="_50 small">
                                <label for="p1_lastname">Lastname</label>
                                <input type="text" name="p1_lastname" id="p1_lastname" />
                            </p>
                        </div>
                    </form>
                </div>
            </div><!-- End of popup -->
        </li>

        <li>
            <a href="javascript:void(0);"><span class="icon i24_inbox-document"></span></a>
            <!-- Possible sizes: small/medium/large -->
            <div class="small">
                <h3>Write a Message</h3>

                <!-- Button bar -->
                <button class="button flat left grey" onclick="$(this).parent().fadeToggle($$.config.fxSpeed).parent().removeClass('active')">Close</button>
                <button class="button flat right" onclick="$(this).parent().fadeToggle($$.config.fxSpeed).parent().removeClass('active')">Send</button>

                <div class="content">
                    <form class="full grid">
                        <div class="row no-bg">
                            <p class="_100 small">
                                <input type="text" name="p2_recipient" id="p2_recipient" placeholder="Recipient" />
                            </p>
                            <p class="_100 small">
                                <input type="text" name="p2_subject" id="p2_subject" placeholder="Subject" />
                            </p>
                            <p class="_100 small">
                                <textarea rows=3 class="full-width" name="p2_message" id="p2_message" placeholder="Message"></textarea>
                            </p>
                        </div>
                    </form>
                </div>
            </div><!-- End of popup -->
        </li>

        <li>
            <a href="javascript:void(0);"><span class="icon i24_calendar"></span></a>
            <!-- Possible sizes: small/medium/large -->
            <div class="small">
                <h3>Write a Message</h3>

                <!-- Button bar -->
                <button class="button flat left grey" onclick="$(this).parent().fadeToggle($$.config.fxSpeed).parent().removeClass('active')">Close</button>
                <button class="button flat right" onclick="$(this).parent().fadeToggle($$.config.fxSpeed).parent().removeClass('active')">Send</button>

                <div class="content">
                    <form class="full grid">
                        <div class="row no-bg">
                            <p class="_100 small">
                                <label for="p3_recipient" class="inline">Recipent</label>
                                <input type="text" name="p3_recipient" id="p3_recipient" />
                            </p>
                            <p class="_100 small">
                                <label for="p3_subject" class="inline">Subject</label>
                                <input type="text" name="p3_subject" id="p3_subject" />
                            </p>
                            <p class="_100 small">
                                <label for="p3_message">Message</label>
                                <textarea rows=3 class="full-width" name="p3_message" id="p3_message"></textarea>
                            </p>
                        </div>
                    </form>
                </div>
            </div><!-- End of popup -->
        </li>

        <li>
            <a href="javascript:void(0);"><span class="icon i24_application-blue"></span></a>
            <!-- Possible sizes: small/medium/large -->
            <div class="small">
                <h3>Information</h3>

                <!-- Button bar -->
                <button class="button flat left grey" onclick="$(this).parent().fadeToggle($$.config.fxSpeed).parent().removeClass('active')">Close</button>

                <div class="content">
                    <form class="full grid">
                        <div class="row no-bg">
                            <p class="_100 small">
                                <label for="p3_recipient">Priority</label>
                                <select name="p4_priority" id="p4_priority">
                                    <option value="0">low</option>
                                    <option value="1">medium</option>
                                    <option value="2">high</option>
                                </select>
                            </p>
                            <p class="_100 small">
                                <textarea rows=3 class="full-width" name="p4_question" id="p4_question" placeholder="Question"></textarea>
                            </p>
                        </div>
                    </form>
                </div>
            </div><!-- End of popup -->
        </li>

    </ul><!-- End of .shortcuts -->

    <input type="search" data-source="extras/search.php" placeholder="Search..." autocomplete="off" class="tooltip" title="e.g. Peach" data-gravity=s>
</section><!-- End of .toolbar-->
    <?php } ?>
