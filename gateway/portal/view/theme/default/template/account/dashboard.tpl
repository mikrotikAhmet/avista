<?php echo $header?>
<div id="page-wrapper">
<div class="container-fluid">
<!-- Page Heading -->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <?php echo $heading_title?> <small>Statistics Overview</small>
        </h1>
        <ol class="breadcrumb">
            <li class="active">
                <i class="fa fa-dashboard"></i> <?php echo $heading_title?>
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<?php if (!$approved) { ?>
<div class="row">
    <div class="col-lg-12">
        <div class="alert alert-warning alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <i class="fa fa-exclamation-circle"></i> <strong>Action required!</strong> Your account is in Pending Mode.
        </div>
    </div>
</div>
<?php } ?>
<!-- /.row -->

<div class="row">
    <div class="col-lg-3 col-md-6">
        <?php echo $order?>
    </div>
    <div class="col-lg-3 col-md-6">
        <?php echo $order?>
    </div>
    <div class="col-lg-3 col-md-6">
        <?php echo $order?>
    </div>
    <div class="col-lg-3 col-md-6">
        <?php echo $order?>
    </div>
</div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Area Chart</h3>
                </div>
                <div class="panel-body">
                    <div id="morris-area-chart" style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg height="347" version="1.1" width="1495" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative; left: -0.333343505859375px; top: -0.66668701171875px;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with RaphaÃ«l 2.1.2</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><text x="49.84375" y="313.65625" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text><path fill="none" stroke="#aaaaaa" d="M62.34375,313.65625H1470" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="49.84375" y="241.4921875" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">7,500</tspan></text><path fill="none" stroke="#aaaaaa" d="M62.34375,241.4921875H1470" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="49.84375" y="169.328125" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">15,000</tspan></text><path fill="none" stroke="#aaaaaa" d="M62.34375,169.328125H1470" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="49.84375" y="97.1640625" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">22,500</tspan></text><path fill="none" stroke="#aaaaaa" d="M62.34375,97.1640625H1470" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="49.84375" y="25" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30,000</tspan></text><path fill="none" stroke="#aaaaaa" d="M62.34375,25H1470" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="1470" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012-06</tspan></text><text x="1365.6605361753834" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012-04</tspan></text><text x="1263.1028254898486" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012-02</tspan></text><text x="1157.0528786517139" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011-12</tspan></text><text x="1052.642144701534" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011-10</tspan></text><text x="948.3026808769175" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011-08</tspan></text><text x="843.963217052301" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011-06</tspan></text><text x="739.6237532276846" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011-04</tspan></text><text x="638.7765255556681" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011-02</tspan></text><text x="532.7265787175332" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010-12</tspan></text><text x="428.3158447673535" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010-10</tspan></text><text x="323.9763809427371" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010-08</tspan></text><text x="219.63691711812058" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010-06</tspan></text><text x="115.29745329350412" y="326.15625" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: sans-serif;" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,6.6719)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010-04</tspan></text><path fill="#7cb47c" stroke="none" d="M62.34375,262.535228125C101.66704177953014,257.243196875,180.31362533859044,246.25992081982588,219.63691711812058,241.367103125C258.97802642904156,236.4720684760759,337.6602450508835,230.0818527814136,377.00135436180443,223.38381875C415.93266045073665,216.7555559064136,493.795272628601,190.0397008891326,532.7265787175332,188.06191562499998C571.212446521695,186.1067594828826,648.1841821300187,206.21359713404513,686.6700499341805,207.652053125C725.9933417137106,209.1218088527951,804.6399252727709,198.71595846864383,843.963217052301,199.6947625C883.304326363222,200.6740100311438,961.986544985064,232.85924982002618,1001.327654295985,215.484259375C1040.2589603849171,198.29025841377617,1118.1215725627817,69.80618024719615,1157.0528786517139,61.418796875C1195.9663672092552,53.035252122196155,1273.793344324338,136.102396976059,1312.7068328818793,148.400546875C1352.0301246614094,160.828210257309,1430.67670822047,157.34167421875,1470,160.32205L1470,313.65625L62.34375,313.65625Z" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path><path fill="none" stroke="#4da74d" d="M62.34375,262.535228125C101.66704177953014,257.243196875,180.31362533859044,246.25992081982588,219.63691711812058,241.367103125C258.97802642904156,236.4720684760759,337.6602450508835,230.0818527814136,377.00135436180443,223.38381875C415.93266045073665,216.7555559064136,493.795272628601,190.0397008891326,532.7265787175332,188.06191562499998C571.212446521695,186.1067594828826,648.1841821300187,206.21359713404513,686.6700499341805,207.652053125C725.9933417137106,209.1218088527951,804.6399252727709,198.71595846864383,843.963217052301,199.6947625C883.304326363222,200.6740100311438,961.986544985064,232.85924982002618,1001.327654295985,215.484259375C1040.2589603849171,198.29025841377617,1118.1215725627817,69.80618024719615,1157.0528786517139,61.418796875C1195.9663672092552,53.035252122196155,1273.793344324338,136.102396976059,1312.7068328818793,148.400546875C1352.0301246614094,160.828210257309,1430.67670822047,157.34167421875,1470,160.32205" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><circle cx="62.34375" cy="262.535228125" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="219.63691711812058" cy="241.367103125" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="377.00135436180443" cy="223.38381875" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="532.7265787175332" cy="188.06191562499998" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="686.6700499341805" cy="207.652053125" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="843.963217052301" cy="199.6947625" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1001.327654295985" cy="215.484259375" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1157.0528786517139" cy="61.418796875" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1312.7068328818793" cy="148.400546875" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1470" cy="160.32205" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><path fill="#a7b3bc" stroke="none" d="M62.34375,288.00433125C101.66704177953014,282.2167734375,180.31362533859044,269.9224771402534,219.63691711812058,264.8541C258.97802642904156,259.7834263590034,337.6602450508835,250.21922812499997,377.00135436180443,247.44812812499998C415.93266045073665,244.70589374999997,493.795272628601,245.030155920059,532.7265787175332,242.80076250000002C571.212446521695,240.596877013809,648.1841821300187,232.80727645408749,686.6700499341805,229.7150125C725.9933417137106,226.55546317283748,804.6399252727709,217.66244102190683,843.963217052301,217.79350937499999C883.304326363222,217.92463711565685,961.986544985064,244.15623784358638,1001.327654295985,230.763796875C1040.2589603849171,217.51086049983638,1118.1215725627817,119.07005912036506,1157.0528786517139,111.21199999999999C1195.9663672092552,103.35753724536507,1273.793344324338,159.6642937165509,1312.7068328818793,167.913709375C1352.0301246614094,176.2500007478009,1430.67670822047,175.1445484375,1470,177.554828125L1470,313.65625L62.34375,313.65625Z" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path><path fill="none" stroke="#7a92a3" d="M62.34375,288.00433125C101.66704177953014,282.2167734375,180.31362533859044,269.9224771402534,219.63691711812058,264.8541C258.97802642904156,259.7834263590034,337.6602450508835,250.21922812499997,377.00135436180443,247.44812812499998C415.93266045073665,244.70589374999997,493.795272628601,245.030155920059,532.7265787175332,242.80076250000002C571.212446521695,240.596877013809,648.1841821300187,232.80727645408749,686.6700499341805,229.7150125C725.9933417137106,226.55546317283748,804.6399252727709,217.66244102190683,843.963217052301,217.79350937499999C883.304326363222,217.92463711565685,961.986544985064,244.15623784358638,1001.327654295985,230.763796875C1040.2589603849171,217.51086049983638,1118.1215725627817,119.07005912036506,1157.0528786517139,111.21199999999999C1195.9663672092552,103.35753724536507,1273.793344324338,159.6642937165509,1312.7068328818793,167.913709375C1352.0301246614094,176.2500007478009,1430.67670822047,175.1445484375,1470,177.554828125" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><circle cx="62.34375" cy="288.00433125" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="219.63691711812058" cy="264.8541" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="377.00135436180443" cy="247.44812812499998" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="532.7265787175332" cy="242.80076250000002" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="686.6700499341805" cy="229.7150125" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="843.963217052301" cy="217.79350937499999" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1001.327654295985" cy="230.763796875" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1157.0528786517139" cy="111.21199999999999" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1312.7068328818793" cy="167.913709375" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1470" cy="177.554828125" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><path fill="#2577b5" stroke="none" d="M62.34375,288.00433125C101.66704177953014,287.73491875,180.31362533859044,289.6274108008918,219.63691711812058,286.92668125C258.97802642904156,284.22472798839186,337.6602450508835,267.58933206806284,377.00135436180443,266.3936C415.93266045073665,265.2103234743128,493.795272628601,279.70657129782796,532.7265787175332,277.410646875C571.212446521695,275.14099161032794,648.1841821300187,250.39545143261964,686.6700499341805,248.13128125C725.9933417137106,245.81784440136965,804.6399252727709,256.7073194595838,843.963217052301,259.10021875C883.304326363222,261.49420227208384,961.986544985064,278.64733488219895,1001.327654295985,267.2788125C1040.2589603849171,256.028712225949,1118.1215725627817,175.6837858193022,1157.0528786517139,168.625728125C1195.9663672092552,161.57090066305219,1273.793344324338,202.88175057148146,1312.7068328818793,210.827271875C1352.0301246614094,218.85646854023145,1430.67670822047,227.10026796875,1470,232.5246L1470,313.65625L62.34375,313.65625Z" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path><path fill="none" stroke="#0b62a4" d="M62.34375,288.00433125C101.66704177953014,287.73491875,180.31362533859044,289.6274108008918,219.63691711812058,286.92668125C258.97802642904156,284.22472798839186,337.6602450508835,267.58933206806284,377.00135436180443,266.3936C415.93266045073665,265.2103234743128,493.795272628601,279.70657129782796,532.7265787175332,277.410646875C571.212446521695,275.14099161032794,648.1841821300187,250.39545143261964,686.6700499341805,248.13128125C725.9933417137106,245.81784440136965,804.6399252727709,256.7073194595838,843.963217052301,259.10021875C883.304326363222,261.49420227208384,961.986544985064,278.64733488219895,1001.327654295985,267.2788125C1040.2589603849171,256.028712225949,1118.1215725627817,175.6837858193022,1157.0528786517139,168.625728125C1195.9663672092552,161.57090066305219,1273.793344324338,202.88175057148146,1312.7068328818793,210.827271875C1352.0301246614094,218.85646854023145,1430.67670822047,227.10026796875,1470,232.5246" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><circle cx="62.34375" cy="288.00433125" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="219.63691711812058" cy="286.92668125" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="377.00135436180443" cy="266.3936" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="532.7265787175332" cy="277.410646875" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="686.6700499341805" cy="248.13128125" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="843.963217052301" cy="259.10021875" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1001.327654295985" cy="267.2788125" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1157.0528786517139" cy="168.625728125" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1312.7068328818793" cy="210.827271875" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="1470" cy="232.5246" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle></svg><div class="morris-hover morris-default-style" style="left: 629.170049934181px; top: 146px; display: none;"><div class="morris-hover-row-label">2011 Q1</div><div class="morris-hover-point" style="color: #0b62a4">
                                iPhone:
                                6,810
                            </div><div class="morris-hover-point" style="color: #7A92A3">
                                iPad:
                                1,914
                            </div><div class="morris-hover-point" style="color: #4da74d">
                                iPod Touch:
                                2,293
                            </div></div></div>
                </div>
            </div>
        </div>
    </div>
<!-- /.row -->
    <div class="row">
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Donut Chart</h3>
                </div>
                <div class="panel-body">
                    <div id="morris-donut-chart"><svg height="347" version="1.1" width="456" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative; left: -0.333343505859375px; top: -0.66668701171875px;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with RaphaÃ«l 2.1.2</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><path fill="none" stroke="#0b62a4" d="M228,286.6666666666667A110.66666666666667,110.66666666666667,0,0,0,332.48523596313163,212.46843260739092" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#0b62a4" stroke="#ffffff" d="M228,289.6666666666667A113.66666666666667,113.66666666666667,0,0,0,335.3176670585177,213.45703469614548L380.0071354523873,229.05497876316207A161,161,0,0,1,228,337Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#3980b5" d="M332.48523596313163,212.46843260739092A110.66666666666667,110.66666666666667,0,0,0,128.7245062356979,127.09716318080183" stroke-width="2" opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path><path fill="#3980b5" stroke="#ffffff" d="M335.3176670585177,213.45703469614548A113.66666666666667,113.66666666666667,0,0,0,126.03330309148488,125.77148386943801L79.08675935354682,102.64574477120273A166,166,0,0,1,384.7278539446975,230.70264891108636Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="none" stroke="#679dc6" d="M128.7245062356979,127.09716318080183A110.66666666666667,110.66666666666667,0,0,0,227.9652330418721,286.66666120548564" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path><path fill="#679dc6" stroke="#ffffff" d="M126.03330309148488,125.77148386943801A113.66666666666667,113.66666666666667,0,0,0,227.9642905640915,289.66666105744156L227.9494203591091,336.9999920549685A161,161,0,0,1,83.57209792723518,104.85521029014241Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="228" y="166" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: 800; font-stretch: normal; font-size: 15px; line-height: normal; font-family: Arial;" font-size="15px" font-weight="800" transform="matrix(1.9399,0,0,1.9399,-214.2895,-163.6982)" stroke-width="0.5154994979919678"><tspan dy="5.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">In-Store Sales</tspan></text><text x="228" y="186" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 14px; line-height: normal; font-family: Arial;" font-size="14px" transform="matrix(2.3033,0,0,2.3033,-297.1538,-231.5405)" stroke-width="0.43415850903614456"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30</tspan></text></svg></div>
                    <div class="text-right">
                        <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Tasks Panel</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            <span class="badge">just now</span>
                            <i class="fa fa-fw fa-calendar"></i> Calendar updated
                        </a>
                        <a href="#" class="list-group-item">
                            <span class="badge">4 minutes ago</span>
                            <i class="fa fa-fw fa-comment"></i> Commented on a post
                        </a>
                        <a href="#" class="list-group-item">
                            <span class="badge">23 minutes ago</span>
                            <i class="fa fa-fw fa-truck"></i> Order 392 shipped
                        </a>
                        <a href="#" class="list-group-item">
                            <span class="badge">46 minutes ago</span>
                            <i class="fa fa-fw fa-money"></i> Invoice 653 has been paid
                        </a>
                        <a href="#" class="list-group-item">
                            <span class="badge">1 hour ago</span>
                            <i class="fa fa-fw fa-user"></i> A new user has been added
                        </a>
                        <a href="#" class="list-group-item">
                            <span class="badge">2 hours ago</span>
                            <i class="fa fa-fw fa-check"></i> Completed task: "pick up dry cleaning"
                        </a>
                        <a href="#" class="list-group-item">
                            <span class="badge">yesterday</span>
                            <i class="fa fa-fw fa-globe"></i> Saved the world
                        </a>
                        <a href="#" class="list-group-item">
                            <span class="badge">two days ago</span>
                            <i class="fa fa-fw fa-check"></i> Completed task: "fix error on sales page"
                        </a>
                    </div>
                    <div class="text-right">
                        <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Transactions Panel</h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                            <tr>
                                <th>Order #</th>
                                <th>Order Date</th>
                                <th>Order Time</th>
                                <th>Amount (USD)</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>3326</td>
                                <td>10/21/2013</td>
                                <td>3:29 PM</td>
                                <td>$321.33</td>
                            </tr>
                            <tr>
                                <td>3325</td>
                                <td>10/21/2013</td>
                                <td>3:20 PM</td>
                                <td>$234.34</td>
                            </tr>
                            <tr>
                                <td>3324</td>
                                <td>10/21/2013</td>
                                <td>3:03 PM</td>
                                <td>$724.17</td>
                            </tr>
                            <tr>
                                <td>3323</td>
                                <td>10/21/2013</td>
                                <td>3:00 PM</td>
                                <td>$23.71</td>
                            </tr>
                            <tr>
                                <td>3322</td>
                                <td>10/21/2013</td>
                                <td>2:49 PM</td>
                                <td>$8345.23</td>
                            </tr>
                            <tr>
                                <td>3321</td>
                                <td>10/21/2013</td>
                                <td>2:23 PM</td>
                                <td>$245.12</td>
                            </tr>
                            <tr>
                                <td>3320</td>
                                <td>10/21/2013</td>
                                <td>2:15 PM</td>
                                <td>$5663.54</td>
                            </tr>
                            <tr>
                                <td>3319</td>
                                <td>10/21/2013</td>
                                <td>2:13 PM</td>
                                <td>$943.45</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-right">
                        <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<?php echo $footer?>