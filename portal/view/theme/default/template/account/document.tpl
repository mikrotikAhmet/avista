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
            <div class="col-md-12">
                <p>We only accept .pdf, .jpg and .png formats.</p>

                <div class="input-group">
                    <input type="text" name="upload" disabled value="" placeholder="" data-format="" id="input-incorporation-documents" class="form-control">
                                  <span class="input-group-btn">
                                    <button type="button" id="button-upload" data-loading-text="Uploading..." class="btn btn-primary"><i class="fa fa-upload"></i> Upload</button>
                                  </span>
                </div>
                <br/>
                <div id="documents"></div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

<script>
    $('#documents').load('index.php?route=account/document/documents');

    $('#button-upload').on('click', function() {
        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        $('#form-upload input[name=\'file\']').on('change', function() {
            $.ajax({
                url: 'index.php?route=account/document/upload',
                type: 'post',
                dataType: 'json',
                data: new FormData($(this).parent()[0]),
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function() {
                    $('#button-upload').button('loading');
                },
                complete: function() {
                    $('#button-upload').button('reset');
                },
                success: function(json) {
                    if (json['error']) {
                        alert(json['error']);
                    }

                    if (json['success']) {
                        alert(json['success']);

                        $('#documents').load('index.php?route=account/document/documents');
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
    });
</script>
<?php echo $footer?>