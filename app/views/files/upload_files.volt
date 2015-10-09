{% extends "layouts/masterpage.volt" %}
{% block head %}
 {{super()}}
 {{assets.outputCss('upload_file_css')}}
{% endblock %}
{% block javascripts %}
 {{assets.outputJs('upload_file_javascripts')}}
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<script id="template-upload" type="text/x-tmpl">
{{'{%'}} for (var i=0, file; file=o.files[i]; i++) { {{'%}'}}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{{'{%=file.name%}'}}</p>
            <strong class="error text-danger label label-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
            <div class="progress-bar progress-bar-success" style="width:0%;"></div>
            </div>
        </td>
        <td>
            {{'{%'}} if (!i && !o.options.autoUpload) { {{'%}'}}
                <button class="btn blue start" disabled>
                    <i class="fa fa-upload"></i>
                    <span>Start</span>
                </button>
            {{'{%'}} } {{'%}'}}
            {{'{%'}}if (!i) { {{'%}'}}
                <button class="btn red cancel">
                    <i class="fa fa-ban"></i>
                    <span>Cancel</span>
                </button>
          {{'{%'}} } {{'%}'}}
        </td>
    </tr>
{{'{%'}} } {{'%}'}}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
      {{'{%'}} for (var i=0, file; file=o.files[i]; i++) { {{'%}'}}
            <tr class="template-download fade">
                <td>
                    <span class="preview">
                        {{'{%'}} if (file.thumbnailUrl) { {{'%}'}}
                            <a href="{{'{%=file.url%}'}}" title="{{'{%=file.name%}'}}" download="{{'{%=file.name%}'}}" data-gallery><img src="{{'{%=file.thumbnailUrl%}'}}"></a>
                          {{'{%'}} } {{'%}'}}
                    </span>
                </td>
                <td>
                    <p class="name">
                          {{'{%'}} if (file.url) { {{'%}'}}
                            <a href="{{'{%=file.url%}'}}" title="{{'{%=file.name%}'}}" download="{{'{%=file.name%}'}}" {{'{%=file.thumbnailUrl?data-gallery:'~'""'~'%}'}}>{{'{%=file.name%}'}}</a>
                        {{'{%'}} } else { {{'%}'}}
                            <span>{{'{%=file.name%}'}}</span>
                        {{'{%'}} } {{'%}'}}
                    </p>
                    {{'{%'}} if (file.error) { {{'%}'}}
                        <div><span class="label label-danger">Error</span>{{'{%=file.error%}'}}</div>
                      {{'{%'}} } {{'%}'}}
                </td>
                <td>
                    <span class="size">{{"{%=o.formatFileSize(file.size)%}"}}</span>
                </td>
                <td>
                    {{'{%'}} if (file.deleteUrl) { {{'%}'}}
                        <button class="btn red delete btn-sm" data-type="{{'{%=file.deleteType%}'}}" data-url="{{'{%=file.deleteUrl%}'}}" {{'{%'}} if (file.deleteWithCredentials) { {{'%}'}} data-xhr-fields='{"withCredentials":true}'  {{'{%'}} } {{'%}'}}>
                            <i class="fa fa-trash-o"></i>
                            <span>Delete</span>
                        </button>
                        <input type="checkbox" name="delete" value="1" class="toggle">
                    {{"{% }"}} else { {{'%}'}}
                        <button class="btn yellow cancel btn-sm">
                            <i class="fa fa-ban"></i>
                            <span>Cancel</span>
                        </button>
                  {{'{%'}} } {{'%}'}}
                </td>
            </tr>
        {{'{%'}} } {{'%}'}}
    </script>
<script>
jQuery(document).ready(function() {
Metronic.init();
Layout.init();
QuickSidebar.init();
Demo.init();
FormFileUpload.init();
});


</script>
{% endblock %}
{% block content %}

	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->

			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">Modal title</h4>
						</div>
						<div class="modal-body">
							 Widget settings form goes here
						</div>
						<div class="modal-footer">
							<button type="button" class="btn blue">Save changes</button>
							<button type="button" class="btn default" data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

			<!-- END STYLE CUSTOMIZER -->
       {#{{static_url('metronic/assets/global/plugins/jquery-file-upload/server/php/index.php')}}#}
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
          <h3 class="page-title" align ="left">
        	{{'Subir Archivos'|t}}
        	</h3>
        	<hr/>
					<form id="fileupload" action="{{url('file/upload_files')}}" method="POST" enctype="multipart/form-data">
						<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
						<div class="row fileupload-buttonbar">
							<div class="col-lg-7">
								<!-- The fileinput-button span is used to style the file input field as button -->
								<span class="btn green fileinput-button">
								<i class="fa fa-plus"></i>
								<span>
								Add files... </span>
								<input type="file" name="files[]" multiple="">
								</span>
								<button type="submit" class="btn blue start">
								<i class="fa fa-upload"></i>
								<span>
								Start upload </span>
								</button>
								<button type="reset" class="btn warning cancel">
								<i class="fa fa-ban-circle"></i>
								<span>
								Cancel upload </span>
								</button>
								<button type="button" class="btn red delete">
								<i class="fa fa-trash"></i>
								<span>
								Delete </span>
								</button>
								<input type="checkbox" class="toggle">
								<!-- The global file processing state -->
								<span class="fileupload-process">
								</span>
							</div>
							<!-- The global progress information -->
							<div class="col-lg-5 fileupload-progress fade">
								<!-- The global progress bar -->
								<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
									<div class="progress-bar progress-bar-success" style="width:0%;">
									</div>
								</div>
								<!-- The extended global progress information -->
								<div class="progress-extended">
									 &nbsp;
								</div>
							</div>
						</div>
						<!-- The table listing the files available for upload/download -->
						<table role="presentation" class="table table-striped clearfix">
						<tbody class="files">
						</tbody>
						</table>
					</form>
				</div>
			</div>

      <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
	<div class="slides">
	</div>
	<h3 class="title"></h3>
	<a class="prev">
	‹ </a>
	<a class="next">
	› </a>
	<a class="close white">
	</a>
	<a class="play-pause">
	</a>
	<ol class="indicator">
	</ol>
</div>

  {% endblock %}
