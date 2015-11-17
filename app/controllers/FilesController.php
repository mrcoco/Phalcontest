<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use ActionForm as ActionForm;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

/**
 * @RoutePrefix("/action")
 */
class FilesController extends ControllerBase
{
  public $crud_params =array();
  public function onConstruct()
    {
        $this->crud_params['route_list']         = 'files/list';
        $this->crud_params['entityname']         = 'File';
        $this->crud_params['not_found_message']  = 'file.entity.notfound';
        $this->crud_params['controller']         = 'Files';
        $this->crud_params['action_list']        = 'actionlist';
        $this->crud_params['form_name']          = 'ActionForm';
        $this->crud_params['delete_message']     = 'files.delete.question';
        $this->crud_params['create_route']       = 'files/create';
        $this->crud_params['save_route']         = 'files/save/';
        $this->crud_params['delete_route']       = 'files/delete/';
        $this->crud_params['add_edit_view']      = 'files/addedit';
        $this->crud_params['show_view']          = 'files/show';
        $this->crud_params['new_title']          = 'files.title.new';
        $this->crud_params['edit_title']         = 'files.title.edit';
        $this->crud_params['form_columns']       = array(
        array('name' => 'name','label'=>'Name'
        ,'required'=>'<span class="required" aria-required="true">* </span>'
        ,'label_error'=>''),
        array('name' => 'type','label'=>'Type'
        ,'required'=>'<span class="required" aria-required="true">* </span>'
        ,'label_error'=>''),
        array('name' => 'size','label'=>'Size'
        ,'required'=>'<span class="required" aria-required="true">* </span>'
        ,'label_error'=>''),
        array('name' => 'path','label'=>'Path'
        ,'required'=>'<span class="required" aria-required="true">* </span>'
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
      $this->tag->setDefault("name", $entity_object->getName());
      $this->tag->setDefault("type", $entity_object->getType());
      $this->tag->setDefault("size", $entity_object->getSize());
      $this->tag->setDefault("path", $entity_object->getPath());
      }
    }

    public function set_post_values($entity)
    {
     $entity->setName($this->request->getPost("name"));
     $entity->setType($this->request->getPost("type"));
     $entity->setSize($this->request->getPost("size"));
     $entity->setPath($this->request->getPost("path"));
    }

  public function set_grid_parameters($routelist)
  {
    $grid_values =
    [
     'new_route'=>'files/new'
    ,'edit_route'=>'files/edit/'
    ,'show_route'=>'files/show/'
    ,'search_route'=>'files/search'
    ,'route_list'=>$routelist
    ,'view_name'=>'files/fileslist'
    ,'numberPage'=>1
    ,'pagelimit'=>10
    ,'noitems_message'=>'files.notfound'
    ,'title' =>'files.list.title'
    ,'header_columns'=>array(
      array('column_name' => 'name','title' => 'Name','class'=>''),
      array('column_name'=>'type','title' => 'Type','class'=>'')),
      array('column_name'=>'size','title' => 'Size','class'=>'')),
      array('column_name'=>'path','title' => 'Path','class'=>''))

    ,'search_columns'=>array(
      array('name' => 'name','title' => 'Name','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
      array('name' => 'type','title' => 'Type','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
      array('name' => 'size','title' => 'Size','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
      array('name' => 'path','title' => 'Path','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search')

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
    $grid_values =$this->set_grid_parameters('action/list');
    $query= $this->modelsManager->createBuilder()
             ->columns(array('f.id ','f.name','f.type','f.size','f.path'))
             ->from(array('f' => 'File'))
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
    ,'Create File'
    ,'Edit File'
    ,'Manage File'
    ,'Delete File');

  }


  /**
  * @Route("/search", methods={"GET","POST"}, name="actionsearch")
  */
  public function searchAction()

  {

    $order=$this->set_grid_order();

    $grid_values =$this->set_grid_parameters('action/search');

    $search_values =array(array('name'=>'name','value'=>$this->request->getPost("name"))
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
    ->addJs('js/validateaction/validate_action.js');
  }


  /**
  * @Route("/new", methods={"GET"}, name="actionenew")
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
  * @Route("/edit/{id}", methods={"GET"}, name="actionedit")
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
