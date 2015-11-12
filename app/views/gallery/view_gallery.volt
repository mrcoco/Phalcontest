{% extends "layouts/masterpage.volt" %}

{% block pageheader %}
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="{{static_url('metronic/assets/global/plugins/fancybox/source/jquery.fancybox.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{static_url('metronic/assets/admin/pages/css/portfolio.css')}}" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL STYLES -->
{% endblock %}
{% block javascripts %}
    <script type="text/javascript" src="{{static_url('metronic/assets/global/plugins/jquery-mixitup/jquery.mixitup.min.js')}}"></script>
    <script type="text/javascript" src="{{static_url('metronic/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js')}}"></script>
    <script src="{{static_url('metronic/assets/admin/pages/scripts/portfolio.js')}}"></script>

    <script>
        jQuery(document).ready(function()
        {
            Metronic.init(); // init metronic core components
            Layout.init(); // init current layout
            QuickSidebar.init(); // init quick sidebar
            Demo.init(); // init demo features
            Portfolio.init();

        });
    </script>

{% endblock %}
{% block pagetitle %}
    <h3 class="page-title" align ="left">
      {{gallery_data['title']|t}}<div align="right"><a href ="{{url('gallery/list')}}" class="btn btn blue">{{'Galleries'|t}} <i class="fa fa-arrow-right "></i> </a></div>
    </h3>
    <hr/>
{% endblock %}
{% block pagebar %}
{% endblock %}
{% block content %}
    {% if gallery_images %}
    <div class="margin-top-10">
    <div class="row mix-grid">
    {% for file in gallery_images %}
    <div style="display: block;  opacity: 1;" class="col-md-3 col-sm-4 mix category_1 mix_all">
      <div class="mix-inner">
      <img   height="200" width="270"src="{{static_url('files/galleries/'~gallery_data['name']~'_gallery/'~file['name'])}}" alt="">
      <div class="mix-details">
        <h4>{{file['title']}}</h4>
        <a class="mix-link" data-toggle="modal" data-id="{{file['imageid']}}" href="#basic">
          <i class="fa fa-remove"></i>
        </a>
        <a class="mix-preview fancybox-button" href="{{static_url('files/galleries/'~gallery_data['name']~'_gallery/'~file['name'])}}"  data-rel="fancybox-button">
          <i class="fa fa-search"></i>
        </a>
      </div>
      </div>
    </div>
    {% endfor %}
    </div>
    </div>
    <div style="display: none;" class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
     <div class="modal-dialog">
      <div class="modal-content">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">{{'¿ Esta seguro que desea borrar este archivo ?'  }}</h4>
       </div>
       <div class="modal-footer">
   			<input id="filename" type="hidden" name="filename" data-name ="{{gallery_data['id']}}" value="">
        <button id ="deletebutton" type="button" class="btn blue">{{ 'Eliminar'|t }}</button>
        <button type="button" class="btn default" data-dismiss="modal">{{ 'Cerrar'|t }}</button>

       </div>
      </div>
      <!-- /.modal-content -->
     </div>
     <!-- /.modal-dialog -->
    </div>
    <!--Scripts-->
    {{assets.outputJs('delete_modal_js')}}
  {% else %}
  <div class="alert alert-warning alert-dismissable">
   <strong><i class="glyphicon glyphicon-warning-sign"></i> {{noitems|t}}</strong>
  </div>
  {% endif %}
{% endblock%}
