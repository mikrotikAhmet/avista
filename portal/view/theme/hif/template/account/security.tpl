<?php echo $header?>
<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <?php echo $heading_title?>
                </h1>
                <ol class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <form id="account-security" class="">
                <div class="">
                    <?php if ($auth) { ?>
                    <input type="checkbox" name="twoway"  id="input-twoway" value="1" checked="checked"/>
                    <?php } else { ?>
                    <input type="checkbox" name="twoway"  id="input-twoway" value="1"/>
                    <?php } ?>
                </div>
                <label class="control-label" for="input-password"><?php echo $entry_security; ?></label>
            </form>
            <button type="button" id="save-auth" class="btn btn-sm btn-success">Save</button>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

<script>
    $('#save-auth').click(function(){

        var element = $(this);
        var telephone = $('input[name=\'telephone\']').val();

        if ($('input[name=\'twoway\']').is(':checked')) {
            var auth = 1;
        } else {
            var auth = 0;
        }

        $.ajax({
            url: 'index.php?route=account/security/updateTwoway',
            type: 'post',
            data: 'auth='+auth,
            dataType: 'json',
            beforeSend: function() {
                element.button('loading');
            },
            success: function(json) {

                element.button('reset');

                if (json.error){
                    alert(json.error['message']);
                }

                if (!auth){
                    alert('2-Way Authentication Disabled');
                } else {
                    alert('2-Way Authentication Enabled');
                }

                if (json.redirect) {
                    location = json.redirect;
                }
            }
        });
    });
</script>
<?php echo $footer?>