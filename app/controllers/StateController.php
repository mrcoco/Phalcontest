<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use StateForm as StateForm;

/**
 * @RoutePrefix("/state")
 */
class StateController extends ControllerBase
{

    private function listsearch($param,$entityname,$parameters)
    {

        if ($param =='list')
        {

        $entity =$this->set_list_query($entityname,$parameters);
        }
        else {

         $params_query =$this->set_search_grid_post_values();
         $entity = $this->set_search_query($params_query);
        }

      $this->set_grid_values($entity,'state/new','state/edit/','state/show/','state/search'
      ,'state/list','state/statelist',1,10,"No se encontraron Estados","Estados");

    }

    private function set_search_grid_post_values()
    {
      $params_query['countryid'] =$this->request->getPost("countryid");
      $params_query['state'] =$this->request->getPost("state");
      return $params_query;

    }

    private function set_list_query($entityname,$parameters)
    {
      $entity = $this->modelsManager->createBuilder()
                   ->columns(array('s.id as id','s.state as state','c.country as country'))
                   ->from(array('s' => 'State'))
                   ->join('Country', 'c.id = s.countryid', 'c')
                   ->getQuery()
                   ->execute();
      return $entity;
    }
    private function set_search_query($params_query)
    {
      $entity = $this->modelsManager->createBuilder()
                   ->columns(array('s.id as id','s.state as state','c.country as country'))
                   ->from(array('s' => 'State'))
                   ->join('Country', 'c.id = s.countryid', 'c')
                   ->Where('s.state LIKE :state:', array('state' => '%' . $params_query['state']. '%'))
                   ->AndWhere('c.country LIKE :country:', array('country' => '%' . $params_query['country']. '%'))
                   ->getQuery()
                   ->execute();
        return $entity;
    }


   private function set_tags($mode,$entity_object)

   {
     $this->tag->setDefault("countryid", $entity_object->getCountryid());
     $this->tag->setDefault("state", $entity_object->getstate());

  }
  private function set_post_values($entity)
  {
  $entity->setState($this->request->getPost("state"));
  $entity->setCountryid($this->request->getPost("countryid"));
  }


    /**
    * @Route("/list", methods={"GET","POST"}, name="countrylist")
   */
    public function listAction()
    {

      $this->listsearch('list','State',array(
        'order' => 'state,country ASC'
    ));

    }


    /**
    * @Route("/search", methods={"POST"}, name="Countrysearch")
   */
      public function searchAction()
      {
       $this->listsearch('search','',array(
         'order' => 'state,country ASC'
     ));
      }

      public function get_assets()
      {

        $this->assets
           ->collection('validatejs')
            ->addJs('js/jqueryvalidate/jquery.validate.js')
            ->addJs('js/jqueryvalidate/additional-methods.min.js')
            ->addJs('js/validatestate/validate_state.js');

      }


      /**
      * @Route("/new", methods={"GET"}, name="Countryenew")
     */
      public function newAction($entity=null)
      {
        $this->get_assets();
        $this->set_form_routes('state/create','state/list','Nuevo Estado','state/addedit','new',$entity,'StateForm');

      }


      /**
      * @Route("/edit/{id}", methods={"GET"}, name="Countryedit")
     */
      public function editAction($id)
      {
              $entity =$this->set_entity($id,'State','No se encontro una entidad llamada State','State','statelist','edit');
              $this->get_assets();
              $this->set_tags('edit',$entity);
              $this->view->id = $entity->id;
              $this->set_form_routes('state/save/'.$id,'state/list','Editar Estado','state/addedit','edit',$entity,'StateForm');
      }

      /**
      * @Route("/create", methods={"POST"}, name="Countrycreate")
     */
      public function createAction()
      {
          $entity = $this->set_entity('','State','No se encontro una entidad llamada Estado','State','statelist','create');
          $this->set_post_values($entity);
          $this->execute_entity_action($entity,'State','new',array($entity),'statelist','create');
      }

      /**
      * @Route("/save/{id}", methods={"POST"}, name="Countrysave")
     */
      public function saveAction($id)
      {

          $entity =$this->set_entity($id,'State','No se encontro una entidad llamada Estado','State','statelist','update');
          $this->set_post_values($entity);
          $this->execute_entity_action($entity,'State','edit',array($entity->id),'statelist','update');

      }

      /**
      * @Route("/show/{id}", methods={"GET"}, name="Countryshow")
     */
     public function showAction($id)
     {
           $entity =$this->set_entity($id,'State','No se encontro una entidad llamada Estado','State','statelist','show_delete');
           $this->get_assets();
           $this->set_form_routes('state/delete/'.$id,'state/list'
           ,'Esta seguro que desea eliminar este Estado?','state/show','delete',$entity,'StateForm');
           $this->set_tags('delete',$entity,'Y');


     }

      /**
      * @Route("/delete/{id}", methods={"POST"}, name="Countrydelete")
     */
      public function deleteAction($id)
      {

        $entity =$this->set_entity($id,'State','No se encontro una entidad llamada Estado','State','statelist','delete');
        $this->execute_entity_action($entity,'State','show',array(),'statelist','delete');
      }
}
