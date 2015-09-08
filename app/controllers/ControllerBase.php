<?php
use Phalcon\Mvc\Controller;
use Phalcon\Translate\Adapter\NativeArray;
use Phalcon\Paginator\Adapter\Model as Paginator;
defined('APP_PATH') || define('APP_PATH', realpath('..'));
class ControllerBase extends Controller
{


public function initialize()
{

  // Login Assests
  $this->assets
        ->collection('mastercss')
        ->addCss('metro/build/css/metro.min.css')
        ->addCss('metro/build/css/metro-responsive.min.css')
        ->addCss('metro/build/css/metro-icons.min.css')
        ->addCss('css/masterpage/masterpage.css')
        ->addCss('css/masterpage/search.css');

  $this->assets
    ->collection('masterjs')
   ->addJs('js/jquery/jquery-2.1.4.min.js')
   ->addJs('metro/build/js/metro.min.js');


  // Login Assests
  $this->assets
        ->collection('logincss')
        ->addCss('metro/build/css/metro.min.css')
        ->addCss('metro/build/css/metro-responsive.min.css')
        ->addCss('css/login/login.css');

  $this->assets
    ->collection('loginjs')
   ->addJs('js/jquery/jquery-2.1.4.min.js')
   ->addJs('metro/build/js/metro.min.js')
   ->addJs('js/jqueryvalidate/jquery.validate.js')
   ->addJs('js/login/validatelogin.js');

   $this->view->globalobj =$this;
}
public function checkuser($userid)
{
  if ($userid =="")
  {
    $this->response->redirect('login');
  }

}

protected function getTranslation()
  {


      $language =$this->dispatcher->getParam('language');
    // Ask browser what is the best language
    //$language = $this->request->getBestLanguage();

    // Check if we have a translation file for that lang
    if (file_exists(APP_PATH ."/app/messages/" . $language . ".php")) {
       require APP_PATH ."/app/messages/" . $language . ".php";
    } else {
       // fallback to some default
       require APP_PATH ."/app/messages/en.php";
    }

    // Return a translation object
    return new NativeArray(array(
       "content" => $messages
    ));
  }

  public function Set_language($urlpath)
  {
    $this->view->trans = $this->getTranslation();
    $this->view->currenturl = $this->url->get($urlpath);
  }
// CRUD FUNCTIONS ---------------------------------------------------------------------------------------------------------------------


public function get_search_params($search_values)
{
  $searchparams=array();
  foreach ($search_values as $key => $val)
  {
  $searchparams[$val['name']] =$val['value'];
  }
  return $searchparams;
}

public function set_search_grid_post_values($search_values)
{
  $searchparams=$this->get_search_params($search_values);
  if ($this->request->isPost())
  {
    $this->persistent->params =$searchparams;
    $this->persistent->searchvalues =$search_values;
  }
  else
  {
    $searchparams=$this->persistent->params;
    $search_values =$this->persistent->searchvalues;
    $numberPage = $this->request->getQuery("page", "int");
  }

  $this->bind_search_values($search_values);
  return $searchparams;
}

public function bind_search_values($search_values)
{
  foreach ($search_values as $key => $val)
  {
    $this->tag->setDefault($val['name'],$val['value'] );
  }
}


  public function set_grid_values($entity,$grid_values)
  {
    $numberPage=$grid_values['numberPage'];
    if ($this->request->isPost()) {

    } else {
        $numberPage = $this->request->getQuery("page", "int");
    }

    if (count($entity) == 0)
    {
     $no_items =$grid_values['noitems_message'];

    }
    else {
      $no_items ="";
    }
    $paginator = new Paginator(array(
         "data" => $entity,
         "limit"=> $grid_values['pagelimit'],
         "page" => $numberPage
     ));
    $this->view->title         = $grid_values['title'];
    $this->view->noitems       = $no_items;
    $this->view->newroute      = $grid_values['new_route'];
    $this->view->editroute     = $grid_values['edit_route'];
    $this->view->showroute     = $grid_values['show_route'];
    $this->view->searchroute   = $grid_values['search_route'];
    $this->view->listroute     = $grid_values['route_list'];
    $this->view->headercolumns = $grid_values['header_columns'];
    $this->view->searchcolumns = $grid_values['search_columns'];
    $this->view->page          = $paginator->getPaginate();
    $this->view->pick($grid_values['view_name']);
  }



  public function set_grid_order()
  {
    if($this->request->getQuery("order"))
    {
       $this->persistent->order =$this->request->getQuery("order");
    }
       $order =$this->persistent->order;
       $ordertype = trim(substr($order,-4));
       $this->view->order = $ordertype ;

       return $order;
  }

  public function set_entity($id,$entityname,$errormessage,$controller,$action,$mode)
  {
        if ($mode =='create')
        {
          $entity = new $entityname();
        }
        else
        {


       $entity = $entityname::findFirstByid($id);


        if (!$entity) {
            $this->flash->error($errormessage);

            return $this->dispatcher->forward(array(
                "controller" => $controller,
                "action" => $action
            ));
        }
        }

    return $entity;
 }

 public function execute_entity_action($entity,$controller,$action,$params,$redirect_route,$mode)
 {
 $form_action =$entity->save();
  if ($mode =='delete')
  {
    $form_action = $entity->delete();
  }
  if (!$form_action)
    {

        foreach ($entity->getMessages() as $message) {
            $this->flash->error($message);
        }
        return $this->dispatcher->forward(array(
            "controller" => $controller,
            "action" => $action,
            "params"=>$params
        ));
  }
  $this->response->redirect(array('for' => $redirect_route));
 }

 public function set_form_routes($routeform,$routelist,$title
 ,$view_name,$mode,$entity,$form_name,$form_columns
 ,$save_button_name,$cancel_button_name,$delete_button_name)
 {
   $this->view->form = new $form_name($entity,array());
   $this->view->routelist =$routelist;
   $this->view->routeform =$routeform;
   $this->view->title =$title;
   $this->view->formcolumns =$form_columns;
   $this->view->save_button_name =$save_button_name;
   $this->view->cancel_button_name =$cancel_button_name;
   $this->view->delete_button_name =$delete_button_name;
   $this->view->pick($view_name);
 }
  //--------------------------------------------------------------------------END CRUD FUNCTIONS ------------------------

}
