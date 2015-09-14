<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use CityForm as CityForm;

/**
 * @RoutePrefix("/city")
 */
class CityController extends ControllerBase
{
  public $crud_params =array();
  public function onConstruct()
    {
        $this->crud_params['route_list']         = 'city/list';
        $this->crud_params['entityname']         = 'City';
        $this->crud_params['not_found_message']  = 'No se encontro una entidad llamada City';
        $this->crud_params['controller']         = 'City';
        $this->crud_params['action_list']        = 'citylist';
        $this->crud_params['form_name']          = 'CityForm';
        $this->crud_params['delete_message']     = 'Esta seguro que desea eliminar esta Ciudad?';
        $this->crud_params['create_route']       = 'city/create';
        $this->crud_params['save_route']         = 'city/save/';
        $this->crud_params['delete_route']       = 'city/delete/';
        $this->crud_params['add_edit_view']      = 'city/addedit';
        $this->crud_params['show_view']          = 'city/show';
        $this->crud_params['new_title']          = 'Nueva Ciudad';
        $this->crud_params['edit_title']         = 'Editar Ciudad';
        $this->crud_params['form_columns']       = array(
        array('name' => 'countryid','label'=>'País'
        ,'required'=>'<span class="required" aria-required="true">* </span>'    
        ,'div_control_class'=>'input-control select full-size'
        ,'div_cell_class'=>'cell colspan3'
        ,'div_row_class'=>'row cells1'
        ,'label_error'=>''),
          array('name' => 'stateid','label'=>'Estado'
        ,'required'=>'<span class="required" aria-required="true">* </span>'      
        ,'div_control_class'=>'input-control select full-size'
        ,'div_cell_class'=>'cell colspan3'
        ,'div_row_class'=>'row cells1'
        ,'label_error'=>''),    
        array('name' => 'city','label'=>'Ciudad'
        ,'required'=>'<span class="required" aria-required="true">* </span>'    
        ,'div_control_class'=>'input-control select full-size'
        ,'div_cell_class'=>'cell colspan3'
        ,'div_row_class'=>'row cells1'
        ,'label_error'=>'<span id ="cityerror" name ="stateerror" class="has-error"></span>')
        );
        $this->crud_params['save_button_name']       ='Guardar';
        $this->crud_params['cancel_button_name']     ='Cancelar';
        $this->crud_params['delete_button_name']     ='Eliminar';
    }

    public function set_tags($mode,$entity_object)
    {
      $this->tag->setDefault("countryid", $entity_object->getCountryid());
      $this->tag->setDefault("stateid", $entity_object->getStateid());
      $this->tag->setDefault("city", $entity_object->getCity());
    }

    public function set_post_values($entity)
    {
      $entity->setCountryid($this->request->getPost("countryid"));
       $entity->setStateid($this->request->getPost("stateid"));
      $entity->setCity($this->request->getPost("city"));
    }

  public function set_grid_parameters($routelist)
  {
    $grid_values =
    [
     'new_route'=>'city/new'
    ,'edit_route'=>'city/edit/'
    ,'show_route'=>'city/show/'
    ,'search_route'=>'city/search'
    ,'route_list'=>$routelist
    ,'view_name'=>'city/citylist'
    ,'numberPage'=>1
    ,'pagelimit'=>5
    ,'noitems_message'=>'No se encontraron Ciudades'
    ,'title' =>'Ciudades'
    ,'header_columns'=>array(
      array('column_name' => 'country','title' => 'País','class'=>''),
      array('column_name' => 'state','title' => 'Estado','class'=>''),  
      array('column_name'=>'city','title' => 'Ciudad','class'=>''))
    ,'search_columns'=>array(
      array('name' => 'country','title' => 'País','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
      array('name' => 'state','title' => 'Estado','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
      array('name' => 'city','title' => 'Ciudad','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search')
    )
  ];
    return $grid_values;
  }


  /**
  * @Route("/list", methods={"GET","POST"}, name="citylist")
  */
  public function listAction()
  {
    $order=$this->set_grid_order();
    $grid_values =$this->set_grid_parameters('city/list');
    $query= $this->modelsManager->createBuilder()
                ->columns(array('c2.id as id','c.country as country','s.state as state' ,'c2.city as city'))
                ->from(array('c2' => 'City'))
                ->join('Country', 'c.id = c2.countryid', 'c')
                ->join('State', 's.id = c2.stateid', 's')
                ->getQuery()
                ->execute();
    $this->set_grid_values($query,$grid_values);

  }



  /**
  * @Route("/search", methods={"GET","POST"}, name="Citysearch")
  */
  public function searchAction()

  {

    $order=$this->set_grid_order();

    $grid_values =$this->set_grid_parameters('city/search');

    $search_values =array(
     array('name'=>'country','value'=>$this->request->getPost("country"))
    ,array('name'=>'state','value'=>$this->request->getPost("state"))
    ,array('name'=>'city','value'=>$this->request->getPost("city"))    
     );

    $params_query =$this->set_search_grid_post_values($search_values);

    $query = $this->modelsManager->createBuilder()
                ->columns(array('c2.id as id','c.country as country','s.state as state' ,'c2.city as city'))
                ->from(array('c2' => 'City'))
                ->join('Country', 'c.id = c2.countryid', 'c')
                ->join('State', 's.id = c2.stateid', 's')
                ->where('c.country LIKE :country:', array('country' => '%' . $params_query['country'] . '%'))
                ->andWhere('s.state LIKE :state:', array('state' => '%' . $params_query['state'] . '%'))
                ->andWhere('c2.city LIKE :city:', array('city' => '%' . $params_query['city'] . '%'))
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
          ->addJs('js/validatecity/city_dependent_combobox.js')
          ->addJs('js/validatecity/validatecity.js');

    }


  /**
  * @Route("/new", methods={"GET"}, name="Cityenew")
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
    ,$this->crud_params['form_columns']
    ,$this->crud_params['save_button_name']
    ,$this->crud_params['cancel_button_name']
    ,'');
  }

  /**
  * @Route("/edit/{id}", methods={"GET"}, name="Cityedit")
  */
  public function editAction($id)
  {
    $entity =$this->set_entity(
    $id
    ,$this->crud_params['entityname']
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
    ,'edit',$entity,$this->crud_params['form_name']
    ,$this->crud_params['form_columns']
    ,$this->crud_params['save_button_name']
    ,$this->crud_params['cancel_button_name']
    ,''
    );
  }

  /**
  * @Route("/create", methods={"POST"}, name="Citycreate")
  */
  public function createAction()
  {
    $entity = $this->set_entity(
    ''
    ,$this->crud_params['entityname']
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
  * @Route("/save/{id}", methods={"POST"}, name="Citysave")
  */
  public function saveAction($id)
  {
    $entity =$this->set_entity(
    $id
    ,$this->crud_params['entityname']
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
  * @Route("/show/{id}", methods={"GET"}, name="Cityshow")
  */
  public function showAction($id)
  {
    $entity =$this->set_entity(
    $id
    ,$this->crud_params['entityname']
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
    ,$this->crud_params['form_name']
    ,$this->crud_params['form_columns']
    ,$this->crud_params['save_button_name']
    ,$this->crud_params['cancel_button_name']
    ,$this->crud_params['delete_button_name']
    );
    $this->set_tags('delete',$entity,'Y');
  }

  /**
  * @Route("/delete/{id}", methods={"POST"}, name="Citydelete")
  */
  public function deleteAction($id)
  {
    $entity =$this->set_entity(
    $id
    ,$this->crud_params['entityname']
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
  
   // FUNCION QUE RECIBE DEL LLAMADO DE AJAX
 /**
* @Route("/get_state/{countryid}", methods={"POST"}, name="get_state")
*/
 public function get_stateAction($countryid)
{

 $state= State::findBycountryid($countryid)->toArray();

 echo '<select id="stateid" name ="stateid">';
 echo '<option value ="0" >Seleccione un Estado</option>';
 foreach ( $state as  $stateitem)
 {
   echo '<option value ="'. $stateitem["id"].'" >'. $stateitem["state"].'</option>';
 }
 echo '</select>';
}

}





