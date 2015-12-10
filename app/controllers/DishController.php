<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use DishForm as DishForm;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

/**
 * @RoutePrefix("/dish")
 */
class DishController extends ControllerBase
{
  public $crud_params =array();
  public function onConstruct()
    {
        $this->crud_params['route_list']         = 'dish/list';
        $this->crud_params['entityname']         = 'Dish';
        $this->crud_params['not_found_message']  = 'dish.entity.notfound';
        $this->crud_params['controller']         = 'Dish';
        $this->crud_params['action_list']        = 'actionlist';
        $this->crud_params['form_name']          = 'DishForm';
        $this->crud_params['delete_message']     = 'dish.delete.question';
        $this->crud_params['create_route']       = 'dish/create';
        $this->crud_params['save_route']         = 'dish/save/';
        $this->crud_params['delete_route']       = 'dish/delete/';
        $this->crud_params['add_edit_view']      = 'dish/addedit';
        $this->crud_params['show_view']          = 'dish/show';
        $this->crud_params['new_title']          = 'dish.title.new';
        $this->crud_params['edit_title']         = 'dish.title.edit';
        $this->crud_params['form_columns']       = array(
        array('name' => 'action','label'=>'Acción'
        ,'required'=>'<span class="required" aria-required="true">* </span>'
        ,'div_control_class'=>'input-control select full-size'
        ,'div_cell_class'=>'cell colspan3'
        ,'div_row_class'=>'row cells1'
        ,'label_error'=>'<span id ="actionerror" name ="codeerror" class="has-error"></span>'),
        array('name' => 'description','label'=>'Descripción'
        ,'required'=>''
        ,'div_control_class'=>'input-control select full-size'
        ,'div_cell_class'=>'cell colspan3'
        ,'div_row_class'=>'row cells1'
        ,'label_error'=>'')
        );
        $this->crud_params['save_button_name']       ='Guardar';
        $this->crud_params['cancel_button_name']     ='Cancelar';
        $this->crud_params['delete_button_name']     ='Eliminar';
    }

    public function set_tags($mode,$entity_object)
    {
      if($entity_object)
      {
      $this->tag->setDefault("action", $entity_object->getAction());
      $this->tag->setDefault("description", $entity_object->getDescription());
      }
    }

    public function set_post_values($entity)
    {
      $entity->setAction($this->request->getPost("action"));
      $entity->setDescription($this->request->getPost("description"));
    }

  public function set_grid_parameters($routelist)
  {
    $grid_values =
    [
     'new_route'=>'dish/new'
    ,'edit_route'=>'dish/edit/'
    ,'show_route'=>'dish/show/'
    ,'search_route'=>'dish/search'
    ,'route_list'=>$routelist
    ,'view_name'=>'dish/actionlist'
    ,'numberPage'=>1
    ,'pagelimit'=>10
    ,'noitems_message'=>'dish.notfound'
    ,'title' =>'dish.list.title'
    ,'header_columns'=>array(
      array('column_name' => 'action','title' => 'Acción','class'=>''),
      array('column_name'=>'description','title' => 'Descripción','class'=>''))
    ,'search_columns'=>array(
      array('name' => 'action','title' => 'Acción','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
      array('name' => 'description','title' => 'Descripción','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search')
    )
  ];
    return $grid_values;
  }


  /**
  * @Route("/list", methods={"GET","POST"}, name="actionlist")
  */
  public function listAction()
  {
    $order=$this->set_grid_order();
    $grid_values =$this->set_grid_parameters('dish/list');
    $query= $this->modelsManager->createBuilder()
             ->columns(array('a.id ','a.action','a.description'))
             ->from(array('a' => 'Action'))
             ->orderBy($order)
             ->getQuery()
             ->execute();
    $this->set_grid_values($query,$grid_values);
    $this->check_all_permissions($this->session->get('userid'));

  }

  public function check_all_permissions($userid)
  {
    $this->view->permissions =$this->check_user_actions(
    $userid
    ,'Create Action'
    ,'Edit Action'
    ,'Manage Action'
    ,'Delete Action');

  }


  /**
  * @Route("/search", methods={"GET","POST"}, name="actionsearch")
  */
  public function searchAction()

  {

    $order=$this->set_grid_order();

    $grid_values =$this->set_grid_parameters('dish/search');

    $search_values =array(array('name'=>'action','value'=>$this->request->getPost("action"))
    ,array('name'=>'description','value'=>$this->request->getPost("description")));

    $params_query =$this->set_search_grid_post_values($search_values);

    $query = $this->modelsManager->createBuilder()
              ->columns(array('a.id ','a.action','a.description'))
              ->from(array('a' => 'Action'))
             ->Where('a.action LIKE :action:', array('action' => '%' . $params_query['action']. '%'))
             ->AndWhere('a.description LIKE :desc:', array('desc' => '%' . $params_query['description']. '%'))
             ->orderBy($order)
             ->getQuery()
             ->execute();
    $this->set_grid_values($query,$grid_values);
    $this->check_all_permissions($this->session->get('userid'));

  }


  public function get_assets()
  {
    $this->assets
    ->collection('validatejs')
    ->addJs('js/jqueryvalidate/jquery.validate.js')
    ->addJs('js/jqueryvalidate/additional-methods.min.js')
    ->addJs('js/validatedish/validate_dish.js');
  }

  public function set_form_routes($routeform,$routelist,$title
  ,$view_name,$mode,$entity,$form_name,$form_columns
  ,$save_button_name,$cancel_button_name,$delete_button_name,$restaurantid)
  {
    $this->view->form = new $form_name($entity,array(),$restaurantid);
    $this->view->routelist =$routelist;
    $this->view->routeform =$routeform;
    $this->view->title =$title;
    $this->view->formcolumns =$form_columns;
    $this->view->save_button_name =$save_button_name;
    $this->view->cancel_button_name =$cancel_button_name;
    $this->view->delete_button_name =$delete_button_name;
    $this->view->pick($view_name);
  }

  /**
  * @Route("/new/{restaurantid}", methods={"GET"}, name="actionenew")
  */
  public function newAction($entity=null,$restaurantid)
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
    ,''
    ,$restaurantid);
  }

  /**
  * @Route("/edit/{id}/{restaurantid}", methods={"GET"}, name="actionedit")
  */
  public function editAction($id,$restaurantid)
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
    ,$restaurantid
    );
  }

  /**
  * @Route("/create", methods={"POST"}, name="actioncreate")
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
    $this->audit_fields($entity,'create');

    $this->execute_entity_action($entity
    ,$this->crud_params['controller']
    ,'new',array($entity),$this->crud_params['action_list']
    ,'create');
  }

  /**
  * @Route("/save/{id}", methods={"POST"}, name="actionsave")
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
    $this->audit_fields($entity,'edit');

    $this->execute_entity_action(
    $entity
    ,$this->crud_params['controller']
    ,'edit',array($entity->id)
    ,$this->crud_params['action_list'],'update');
  }

  /**
  * @Route("/show/{id}", methods={"GET"}, name="actionshow")
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
  * @Route("/delete/{id}", methods={"POST"}, name="actiondelete")
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
    ,array('id'=>$id)
    ,$this->crud_params['action_list']
    ,'delete');
  }

}
