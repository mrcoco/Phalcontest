<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use RoleForm as RoleForm;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

/**
 * @RoutePrefix("/role")
 */
class RoleController extends ControllerBase
{
  public $crud_params =array();
  public function onConstruct()
    {
        $this->crud_params['route_list']         = 'role/list';
        $this->crud_params['entityname']         = 'Role';
        $this->crud_params['not_found_message']  = 'role.entity.notfound';
        $this->crud_params['controller']         = 'Role';
        $this->crud_params['action_list']        = 'rolelist';
        $this->crud_params['form_name']          = 'RoleForm';
        $this->crud_params['delete_message']     = 'role.delete.question';
        $this->crud_params['create_route']       = 'role/create';
        $this->crud_params['save_route']         = 'role/save/';
        $this->crud_params['delete_route']       = 'role/delete/';
        $this->crud_params['add_edit_view']      = 'role/addedit';
        $this->crud_params['show_view']          = 'role/show';
        $this->crud_params['new_title']          = 'role.title.new';
        $this->crud_params['edit_title']         = 'role.title.edit';
        $this->crud_params['form_columns']       = array(
        array('name' => 'role','label'=>'Rol'
        ,'required'=>'<span class="required" aria-required="true">* </span>'
        ,'div_control_class'=>'input-control select full-size'
        ,'div_cell_class'=>'cell colspan3'
        ,'div_row_class'=>'row cells1'
        ,'label_error'=>'<span id ="roleerror" name ="codeerror" class="has-error"></span>'),
        array('name' => 'description','label'=>'Descripción'
        ,'required'=>''
        ,'div_control_class'=>'input-control select full-size'
        ,'div_cell_class'=>'cell colspan3'
        ,'div_row_class'=>'row cells1'
        ,'label_error'=>'')
        );
        $this->crud_params['save_button_name']       ='button.save';
        $this->crud_params['cancel_button_name']     ='button.cancel';
        $this->crud_params['delete_button_name']     ='button.delete';
    }

    public function set_tags($mode,$entity_object)
    {
      if($entity_object)
      {
      $this->tag->setDefault("role", $entity_object->getRole());
      $this->tag->setDefault("description", $entity_object->getDescription());
      }
    }

    public function set_post_values($entity)
    {
      $entity->setRole($this->request->getPost("role"));
      $entity->setDescription($this->request->getPost("description"));
    }

  public function set_grid_parameters($routelist)
  {
    $grid_values =
    [
     'new_route'=>'role/new'
    ,'edit_route'=>'role/edit/'
    ,'show_route'=>'role/show/'
    ,'search_route'=>'role/search'
    ,'route_list'=>$routelist
    ,'view_name'=>'role/rolelist'
    ,'numberPage'=>1
    ,'pagelimit'=>10
    ,'noitems_message'=>'role.notfound'
    ,'title' =>'role.list.title'
    ,'header_columns'=>array(
      array('column_name' => 'role','title' => 'Rol','class'=>''),
      array('column_name'=>'description','title' => 'Descripción','class'=>''))
    ,'search_columns'=>array(
      array('name' => 'role','title' => 'Rol','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
      array('name' => 'description','title' => 'Descripción','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search')
    )
  ];
    return $grid_values;
  }


  /**
  * @Route("/list", methods={"GET","POST"}, name="rolelist")
  */
  public function listAction()
  {
    $order=$this->set_grid_order();
    $grid_values =$this->set_grid_parameters('role/list');
    $query= $this->modelsManager->createBuilder()
             ->columns(array('r.id ','r.role','r.description'))
             ->from(array('r' => 'Role'))
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
    ,'Create Role'
    ,'Edit Role'
    ,'Manage Role'
    ,'Delete Role');
    $this->view->special_permission =$this->check_role_special_actions(
    $userid
    ,'Manage Role Actions');
  }

  public function check_role_special_actions($userid,$add_role_action)
  {
    $special_permission =array();
    $special_permission['add_role_action'] ='N';
    $actions = $this->get_user_actions($userid);
    foreach ($actions as $item)
    {
     if ($item->action ==$add_role_action)
     {
      $special_permission['add_role_action'] ='Y';
     }

    }
     return $special_permission;
  }


  /**
  * @Route("/search", methods={"GET","POST"}, name="rolesearch")
  */
  public function searchAction()

  {

    $order=$this->set_grid_order();

    $grid_values =$this->set_grid_parameters('role/search');

    $search_values =array(array('name'=>'role','value'=>$this->request->getPost("role"))
    ,array('name'=>'description','value'=>$this->request->getPost("description")));

    $params_query =$this->set_search_grid_post_values($search_values);

    $query = $this->modelsManager->createBuilder()
              ->columns(array('r.id ','r.role','r.description'))
              ->from(array('r' => 'Role'))
             ->Where('r.role LIKE :role:', array('role' => '%' . $params_query['role']. '%'))
             ->AndWhere('r.description LIKE :desc:', array('desc' => '%' . $params_query['description']. '%'))
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
    ->addJs('js/validaterole/validate_role.js');
  }


  /**
  * @Route("/new", methods={"GET"}, name="roleenew")
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
  * @Route("/edit/{id}", methods={"GET"}, name="roleedit")
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
  * @Route("/create", methods={"POST","GET"}, name="rolecreate")
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
  * @Route("/save/{id}", methods={"POST"}, name="rolesave")
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
  * @Route("/show/{id}", methods={"GET"}, name="roleshow")
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
  * @Route("/delete/{id}", methods={"POST","GET"}, name="roledelete")
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
