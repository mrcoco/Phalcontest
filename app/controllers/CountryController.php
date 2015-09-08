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
  public $crud_params =array();
  public function onConstruct()
    {
        $this->crud_params['route_list']         = 'country/list';
        $this->crud_params['entityname']         = 'Country';
        $this->crud_params['not_found_message']  = 'No se encontro una entidad llamada Country';
        $this->crud_params['controller']         = 'Country';
        $this->crud_params['action_list']        = 'countrylist';
        $this->crud_params['form_name']          = 'CountryForm';
        $this->crud_params['delete_message']     = 'Esta seguro que desea eliminar este País?';
        $this->crud_params['create_route']       = 'country/create';
        $this->crud_params['save_route']         = 'country/save/';
        $this->crud_params['delete_route']       = 'country/delete/';
        $this->crud_params['add_edit_view']      = 'country/addedit';
        $this->crud_params['show_view']          = 'country/show';
        $this->crud_params['new_title']          = 'Nuevo País';
        $this->crud_params['edit_title']         = 'Editar País';
    }

  public function set_grid_parameters($routelist)
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
    ,'noitems_message'=>'No se encontraron Paises'
    ,'title' =>'Paises'
    ,'header_columns'=>array(
      array('column_name' => 'code','title' => 'Code','class'=>'sortable-column'),
      array('column_name'=>'country','title' => 'Country','class'=>'sortable-column')
    )
  ];
    return $grid_values;
  }


  /**
  * @Route("/list", methods={"GET","POST"}, name="countrylist")
  */
  public function listAction()
  {
    $order=$this->set_grid_order();
    $grid_values =$this->set_grid_parameters('country/list');
    $query= $this->modelsManager->createBuilder()
             ->columns(array('c.id as id','c.code as code','c.country as country'))
             ->from(array('c' => 'Country'))
             ->orderBy($order)
             ->getQuery()
             ->execute();
    $this->set_grid_values($query,$grid_values);

  }



  /**
  * @Route("/search", methods={"GET","POST"}, name="Countrysearch")
  */
  public function searchAction()

  {

    $order=$this->set_grid_order();

    $grid_values =$this->set_grid_parameters('country/search');

    $search_values =array(array('name'=>'code','value'=>$this->request->getPost("code"))
    ,array('name'=>'country','value'=>$this->request->getPost("country")));

    $params_query =$this->set_search_grid_post_values($search_values);

    $query = $this->modelsManager->createBuilder()
             ->columns(array('c.id as id','c.code as code','c.country as country'))
             ->from(array('c' => 'Country'))
             ->Where('c.code LIKE :code:', array('code' => '%' . $params_query['code']. '%'))
             ->AndWhere('c.country LIKE :country:', array('country' => '%' . $params_query['country']. '%'))
             ->orderBy($order)
             ->getQuery()
             ->execute();
    $this->set_grid_values($query,$grid_values);

  }


  public function get_assets()
  {
    $this->assets
    ->collection('validatejs')
    ->addJs('js/jqueryvalidate/jquery.validate.js')
    ->addJs('js/jqueryvalidate/additional-methods.min.js')
    ->addJs('js/validatecountry/validate_country.js');
  }

  public function set_tags($mode,$entity_object)
  {
    $this->tag->setDefault("country", $entity_object->getCountry());
    $this->tag->setDefault("code", $entity_object->getCode());
  }

  public function set_post_values($entity)
  {
    $entity->setCode($this->request->getPost("code"));
    $entity->setCountry($this->request->getPost("country"));
  }
  /**
  * @Route("/new", methods={"GET"}, name="Countryenew")
  */
  public function newAction($entity=null)
  {
    $this->get_assets();
    $this->set_form_routes(
    $this->crud_params['create_route']
    ,$this->crud_params['route_list']
    ,$this->crud_params['new_title']
    ,$this->crud_params['add_edit_view']
    ,'new'
    ,$entity
    ,$this->crud_params['form_name']
    );
  }

  /**
  * @Route("/edit/{id}", methods={"GET"}, name="Countryedit")
  */
  public function editAction($id)
  {
    $entity =$this->set_entity(
    $id
    ,$this->entityname
    ,$this->crud_params['not_found_message']
    ,$this->crud_params['controller']
    ,$this->crud_params['action_list']
    ,'edit');

    $this->get_assets();
    $this->set_tags('edit',$entity);
    $this->view->id = $entity->id;

    $this->set_form_routes(
    $this->crud_params['save_route'].$id
    ,$this->crud_params['route_list']
    ,$this->crud_params['edit_title']
    ,$this->crud_params['add_edit_view']
    ,'edit',$entity,$this->crud_params['form_name']  );
  }

  /**
  * @Route("/create", methods={"POST"}, name="Countrycreate")
  */
  public function createAction()
  {
    $entity = $this->set_entity(
    ''
    ,$this->entityname
    ,$this->crud_params['not_found_message']
    ,$this->crud_params['controller']
    ,$this->crud_params['action_list']
    ,'create');

    $this->set_post_values($entity);

    $this->execute_entity_action($entity
    ,$this->crud_params['controller']
    ,'new',array($entity),$this->crud_params['action_list']
    ,'create');
  }

  /**
  * @Route("/save/{id}", methods={"POST"}, name="Countrysave")
  */
  public function saveAction($id)
  {
    $entity =$this->set_entity(
    $id
    ,$this->entityname
    ,$this->crud_params['not_found_message']
    ,$this->crud_params['controller']
    ,$this->crud_params['action_list']
    ,'update');

    $this->set_post_values($entity);

    $this->execute_entity_action(
    $entity
    ,$this->crud_params['controller']
    ,'edit',array($entity->id)
    ,$this->crud_params['action_list'],'update');
  }

  /**
  * @Route("/show/{id}", methods={"GET"}, name="Countryshow")
  */
  public function showAction($id)
  {
    $entity =$this->set_entity(
    $id
    ,$this->entityname
    ,$this->crud_params['not_found_message']
    ,$this->crud_params['controller']
    ,$this->crud_params['action_list']
    ,'show');

    $this->get_assets();

    $this->set_form_routes(
    $this->crud_params['delete_route'].$id
    ,$this->crud_params['route_list']
    ,$this->crud_params['delete_message']
    ,$this->crud_params['show_view'] ,'delete'
    ,$entity
    ,$this->crud_params['form_name'] );
    $this->set_tags('delete',$entity,'Y');
  }

  /**
  * @Route("/delete/{id}", methods={"POST"}, name="Countrydelete")
  */
  public function deleteAction($id)
  {
    $entity =$this->set_entity(
    $id
    ,$this->entityname
    ,$this->crud_params['not_found_message']
    ,$this->crud_params['controller']
    ,$this->crud_params['action_list']
    ,'delete');
    $this->execute_entity_action(
    $entity
    ,$this->crud_params['controller']
    ,'show'
    ,array()
    ,$this->crud_params['action_list']
    ,'delete');
  }

}
