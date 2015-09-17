<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use UserRoleForm as UserRoleForm;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

/**
 * @RoutePrefix("/userrole")
 */
class UserRoleController extends ControllerBase
{
  public $crud_params =array();
  public function onConstruct()
    {
        $this->crud_params['route_list']         = 'userrole/list';
        $this->crud_params['entityname']         = 'UserRole';
        $this->crud_params['not_found_message']  = 'No se encontro una entidad llamada UserRole';
        $this->crud_params['controller']         = 'UserRole';
        $this->crud_params['action_list']        = 'userrolelist';
        $this->crud_params['form_name']          = 'UserRoleForm';
        $this->crud_params['delete_message']     = 'Esta seguro que desea quitar ese rol?';
        $this->crud_params['create_route']       = 'userrole/create';
        $this->crud_params['save_route']         = 'userrole/save/';
        $this->crud_params['delete_route']       = 'userrole/delete/';
        $this->crud_params['add_edit_view']      = 'user_role/addedit';
        $this->crud_params['show_view']          = 'user_role/show';
        $this->crud_params['new_title']          = 'Nuevo Rol del usuario';
        $this->crud_params['edit_title']         = 'Editar Rol del Usuario';
        $this->crud_params['form_columns']       = array(

        array('name' => 'roleid','label'=>'Rol'
        ,'required'=>'<span class="required" aria-required="true">*</span>'
        ,'div_control_class'=>'input-control select full-size'
        ,'div_cell_class'=>'cell colspan3'
        ,'div_row_class'=>'row cells1'
        ,'label_error'=>'<span id ="userroleerror" name ="stateerror" class="has-error"></span>')
        );
        $this->crud_params['save_button_name']       ='Guardar';
        $this->crud_params['cancel_button_name']     ='Cancelar';
        $this->crud_params['delete_button_name']     ='Eliminar';
    }

    public function set_tags($mode,$entity_object)
    {
      if($entity_object)
      {
      $this->tag->setDefault("roleid", $entity_object->getRoleid());
      }
    }

    public function set_post_values($entity)
    {

      $entity->setRoleid($this->request->getPost("roleid"));
    }

  public function set_grid_parameters($userid,$routelist)
  {
    $grid_values =
    [
     'new_route'=>'userrole/new'
    ,'edit_route'=>'userrole/edit/'
    ,'show_route'=>'userrole/show/'
    ,'search_route'=>'userrole/search'
    ,'route_list'=>$routelist
    ,'view_name'=>'user_role/userrolelist'
    ,'numberPage'=>1
    ,'pagelimit'=>10
    ,'noitems_message'=>'No se encontraron roles asociados al usuario'
    ,'title' =>'Roles del Usuario'
    ,'header_columns'=>array(
      array('column_name'=>'role','title' => 'Rol','class'=>''))
    ,'search_columns'=>array(
     array('name' => 'role','title' => 'Rol','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search')
    )
  ];
    return $grid_values;
  }


  /**
  * @Route("/list/{userid}", methods={"GET","POST"}, name="userrolelist")
  */
  public function listAction($userid)
  {
    $order=$this->set_grid_order();
    $grid_values =$this->set_grid_parameters('userrole/list/'.$userid);
    $query= $this->modelsManager->createBuilder()
             ->columns(array('ur.userid as userid','ur.roleid as roleid','u.username as username','r.role as role'))
             ->from(array('ur' => 'UserRole'))
             ->join('User', 'u.id = ur.userid', 'u')
             ->join('Role', 'r.id = ur.roleid', 'r')
             ->where('ur.userid = :userid:', array('userid' => $userid))
              ->orderBy($order)
             ->getQuery()
             ->execute();

    $this->set_grid_values($query,$grid_values);
    $this->view->userid =$userid;
    $user= User::findFirstByid($userid);
    $this->view->username =$user->username;
  }



  /**
  * @Route("/search", methods={"GET","POST"}, name="userrolesearch")
  */
  public function searchAction()

  {

    $order=$this->set_grid_order();

    $grid_values =$this->set_grid_parameters('userrole/search');

    $search_values =array(array('name'=>'code','value'=>$this->request->getPost("code"))
    ,array('name'=>'country','value'=>$this->request->getPost("userrole")));

    $params_query =$this->set_search_grid_post_values($search_values);

    $query = $this->modelsManager->createBuilder()
              ->columns(array('ur.userid as userid','ur.roleid as roleid','u.username as username','r.role as role'))
              ->from(array('ur' => 'UserRole'))
              ->join('User', 'u.id = ur.userid', 'u')
              ->join('Role', 'r.id = ur.roleid', 'r')
             ->Where('u.username LIKE :username:', array('username' => '%' . $params_query['username']. '%'))
             ->AndWhere('r.role LIKE :role:', array('role' => '%' . $params_query['role']. '%'))
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
    ->addJs('js/validateuserrole/validate_country.js');
  }


  /**
  * @Route("/new/{userid}", methods={"GET"}, name="userroleenew")
  */
  public function newAction($userid)
  {
    $user= User::findFirstByid($userid);

    $this->get_assets();
    $this->set_form_routes(
    $this->crud_params['create_route'].'/'.$userid
    ,$this->crud_params['route_list'].'/'.$userid
    ,$this->crud_params['new_title'].' '.$user->username
    ,$this->crud_params['add_edit_view']
    ,'new'
    ,null
    ,$this->crud_params['form_name']
    ,$this->crud_params['form_columns']
    ,$this->crud_params['save_button_name']
    ,$this->crud_params['cancel_button_name']
    ,'');
  }

  /**
  * @Route("/edit/{id}", methods={"GET"}, name="userroleedit")
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
  * @Route("/create/{userid}", methods={"POST"}, name="userrolecreate")
  */
  public function createAction($userid)
  {
    $entity = $this->set_entity(
    ''
    ,$this->crud_params['entityname']
    ,$this->crud_params['not_found_message']
    ,$this->crud_params['controller']
    ,$this->crud_params['action_list']
    ,'create');

    $this->set_post_values($entity);
    $entity->SetUserid($userid);
    $this->execute_entity_action($entity
    ,$this->crud_params['controller']
    ,'new',array($entity),$this->crud_params['action_list'].'/'.$userid
    ,'create');
  }

  /**
  * @Route("/save/{id}", methods={"POST"}, name="userrolesave")
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
  * @Route("/show/{id}", methods={"GET"}, name="userroleshow")
  */
  public function showAction($id)
  {
    $userid =explode('-',$id,0);
    $roleid =explode('-',$id,1);

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
  * @Route("/delete/{id}", methods={"POST"}, name="userroledelete")
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
