<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>Metronic | Page Layouts - Full Height Content</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
{% block head %}
{{assets.outputCss('metroniccss')}}
{{assets.outputJs('metronicjs')}}
 {% endblock %}

<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-fixed page-sidebar-closed-hide-logo">
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
<!-- BEGIN HEADER INNER -->
<div class="page-header-inner">
<!-- BEGIN LOGO -->
<div class="page-logo">
{{ link_to("index/home",'<i class="fa fa-cutlery"></i> RESTAURANT MAKER','class':'btn btn-lg black','style':'color:white;')}}
</div>
<!-- END LOGO -->
<!-- BEGIN RESPONSIVE MENU TOGGLER -->

<!-- END RESPONSIVE MENU TOGGLER -->
<!-- BEGIN TOP NAVIGATION MENU -->
<div class="top-menu">

<ul class="nav navbar-nav pull-right">
    <li>	<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
           </a>
    </li>
    <li class="dropdown dropdown-user">
        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
        {{image('metronic/assets/admin/layout/img/avatar.png')}}
        <span class="username username">
        {{session.get('username')}}</span>
        <i class="fa fa-angle-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-default">
        <li>
                <a href="extra_profile.html">
                <i class="icon-user"></i>{{ 'Perfil'}}</a>
        </li>

        <li class="divider">
        </li>
        <li>
                {{ link_to("login/logout",'<i class="icon-logout"></i> Salir')}}

        </li>
        </ul>
    </li>
    <!-- END USER LOGIN DROPDOWN -->
    <!-- BEGIN QUICK SIDEBAR TOGGLER -->
    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

    <!-- END QUICK SIDEBAR TOGGLER -->
</ul>
</div>
<!-- END TOP NAVIGATION MENU -->
</div>
<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
        <!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->

<div class="page-sidebar navbar-collapse collapse">

<!-- BEGIN SIDEBAR MENU -->
<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
<ul class="page-sidebar-menu page-sidebar-menu-closed" data-slide-speed="200" data-auto-scroll="true" data-keep-expanded="false">

  <li class="{% for key,name in ['country','state','city','township','neighborhood'] %}
    {% if name  in router.getRewriteUri() %}
        active open
    {% else %}
    start
    {% endif%}
    {% endfor %}">
    <a href="" style="padding-left:20px;">
    <span class="arrow "></span>
    <p align="left"><i class="icon-home"></i> Direcciones</p>
    </a>
    <ul class="sub-menu">
        <li class="{% if 'country' in router.getRewriteUri() %}active{% endif %}"> <a href="{{ url("country/list") }}" ><p align="left"><i class="icon-flag" ></i> Paises</p></a></li>
        <li class="{% if 'state' in router.getRewriteUri()%}active{% endif %}"> <a href="{{ url("state/list") }}" ><p align="left"><i class="icon-flag" ></i> Estados<p></a></li>
        <li class="{% if 'city' in router.getRewriteUri()%}active{% endif %}"> <a href="{{ url("city/list") }}" ><p align="left"><i class="icon-flag" ></i> Ciudades</p></a></li>
        <li class="{% if 'township' in router.getRewriteUri()%}active{% endif %}"> <a href="{{ url("township/list") }}" ><p align="left"><i class="icon-flag" ></i> Sectores</p></a></li>
        <li class="{% if 'neighborhood' in router.getRewriteUri()%}active{% endif %}"> <a href="{{ url("neighborhood/list") }}" ><p align="left"><i class="icon-flag"></i> Barrios</p></a></li>
        <li> <a href="{{ url("index/list") }}"><p align="left"><i class="icon-flag"></i> Direcciones</p></a></li>
    </ul>
  </li>
</ul>
<!-- END SIDEBAR MENU -->
</div>
</div>
<!-- END SIDEBAR -->

<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
<div class="page-content">
<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

<!-- /.modal -->
<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

<!-- END STYLE CUSTOMIZER -->
<!-- BEGIN PAGE HEADER-->
{% block pagetitle %}
{% endblock %}
{% block pagebar %}

{% endblock %}
<!-- END PAGE HEADER-->

<!-- BEGIN PAGE CONTENT-->

    {% block content %}
<!--CONTENT-->
    {% endblock %}

<!-- END PAGE CONTENT-->
</div>
</div>
<!-- END CONTENT -->
<!-- END QUICK SIDEBAR -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer" style="background-color:#2b3643;">
<div class="page-footer-inner">
         <p style="color:white;" align="center">{{'2015 &copy; Restaurant Maker'}}</p>
</div>
<div class="scroll-to-top">
        <i class="icon-arrow-up"></i>
</div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
{% block javascripts %}

<script>
jQuery(document).ready(function()
{
Metronic.init(); // init metronic core components
Layout.init(); // init current layout
QuickSidebar.init(); // init quick sidebar
Demo.init(); // init demo features
});
</script>
{% endblock %}
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
