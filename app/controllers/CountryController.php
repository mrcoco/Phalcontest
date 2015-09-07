<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use CountryForm as CountryForm;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

/**
 * @RoutePrefix("/country")
 */
class CountryController extends ControllerBase
{
  public function listsearch($param,$entityname,$parameters,$grid_values,$search_values)
  {
    $order=$this->set_grid_order();
    switch ($param)
    {
     case 'list':
     $entity =$this->set_list_query($order);
     break;
     case 'search':
     $params_query =$this->set_search_grid_post_values($search_values);
     $entity = $this->set_search_query($params_query,$order);
     break;
    }
    $this->set_grid_values($entity,$grid_values);
  }
  private function set_grid_parameters($routelist)
  {
    $grid_values =
    [
     'new_route'=>'country/new'
    ,'edit_route'=>'country/edit/'
    ,'show_route'=>'country/show/'
    ,'search_route'=>'country/search'
    ,'route_list'=>$routelist
    ,'view_name'=>'country/countrylist'
    ,'numberPage'=>1
    ,'pagelimit'=>10
    ,'noitems_message'=>"No se encontraron Paises"
    ,'title' =>"Paises"
    ,'header_columns'=>array(
      array('column_name' => 'code','title' => 'Code','class'=>'sortable-column'),
      array('column_name'=>'country','title' => 'Country','class'=>'sortable-column')
    )
  ];
    return $grid_values;
  }

  private function set_list_query($order)
  {
    $entity =$this->modelsManager->createBuilder()
             ->columns(array('c.id as id','c.code as code','c.country as country'))
             ->from(array('c' => 'Country'))
             ->orderBy($order)
             ->getQuery()
             ->execute();
    return $entity;
  }

  private function set_search_query($params_query,$order)
  {
    $entity = $this->modelsManager->createBuilder()
             ->columns(array('c.id as id','c.code as code','c.country as country'))
             ->from(array('c' => 'Country'))
             ->Where('c.code LIKE :code:', array('code' => '%' . $params_query['code']. '%'))
             ->AndWhere('c.country LIKE :country:', array('country' => '%' . $params_query['country']. '%'))
             ->orderBy($order)
             ->getQuery()
             ->execute();
    return $entity;
  }


  private function set_tags($mode,$entity_object)
  {
    $this->tag->setDefault("country", $entity_object->getCountry());
    $this->tag->setDefault("code", $entity_object->getCode());
  }

  private function set_post_values($entity)
  {
    $entity->setCode($this->request->getPost("code"));
    $entity->setCountry($this->request->getPost("country"));
  }

  /**
  * @Route("/list", methods={"GET","POST"}, name="countrylist")
  */
  public function listAction()
  {

    $this->listsearch(
    'list'
    ,'Country'
    ,array('order' => $order)
    ,$this->set_grid_parameters('country/list')
    ,array());
  }



  /**
  * @Route("/search", methods={"GET","POST"}, name="Countrysearch")
  */
  public function searchAction()
  {
    $this->listsearch('search'
    ,''
    ,array('order' => $order)
    ,$this->set_grid_parameters('country/search')
    ,array(array('name'=>'code','value'=>$this->request->getPost("code"))
    ,array('name'=>'country','value'=>$this->request->getPost("country"))));
  }

  public function get_assets()
  {
    $this->assets
    ->collection('validatejs')
    ->addJs('js/jqueryvalidate/jquery.validate.js')
    ->addJs('js/jqueryvalidate/additional-methods.min.js')
    ->addJs('js/validatecountry/validate_country.js');
  }

  /**
  * @Route("/new", methods={"GET"}, name="Countryenew")
  */
  public function newAction($entity=null)
  {
    $this->get_assets();
    $this->set_form_routes('country/create','country/list','Nuevo País','country/addedit','new',$entity,'CountryForm');
  }

  /**
  * @Route("/edit/{id}", methods={"GET"}, name="Countryedit")
  */
  public function editAction($id)
  {
    $entity =$this->set_entity($id,'Country','No se encontro una entidad llamada Country','Country','countrylist','edit');
    $this->get_assets();
    $this->set_tags('edit',$entity);
    $this->view->id = $entity->id;
    $this->set_form_routes('country/save/'.$id,'country/list','Editar País','country/addedit','edit',$entity,'CountryForm');
  }

  /**
  * @Route("/create", methods={"POST"}, name="Countrycreate")
  */
  public function createAction()
  {
    $entity = $this->set_entity('','Country','No se encontro una entidad llamada Country','Country','countrylist','create');
    $this->set_post_values($entity);
    $this->execute_entity_action($entity,'Country','new',array($entity),'countrylist','create');
  }

  /**
  * @Route("/save/{id}", methods={"POST"}, name="Countrysave")
  */
  public function saveAction($id)
  {
    $entity =$this->set_entity($id,'Country','No se encontro una entidad llamada Country','Country','countrylist','update');
    $this->set_post_values($entity);
    $this->execute_entity_action($entity,'Country','edit',array($entity->id),'countrylist','update');
  }

  /**
  * @Route("/show/{id}", methods={"GET"}, name="Countryshow")
  */
  public function showAction($id)
  {
    $entity =$this->set_entity($id,'Country','No se encontro una entidad llamada Country','Country','countrylist','show_delete');
    $this->get_assets();
    $this->set_form_routes('country/delete/'.$id,'country/list'
    ,'Esta seguro que desea eliminar este País?','country/show','delete',$entity,'CountryForm');
    $this->set_tags('delete',$entity,'Y');
  }

  /**
  * @Route("/delete/{id}", methods={"POST"}, name="Countrydelete")
  */
  public function deleteAction($id)
  {
    $entity =$this->set_entity($id,'Country','No se encontro una entidad llamada Country','Country','countrylist','delete');
    $this->execute_entity_action($entity,'Country','show',array(),'countrylist','delete');
  }

}
