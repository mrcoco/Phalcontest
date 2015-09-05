<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use NeighborhoodForm as NeighborhoodForm;
/**
 * @RoutePrefix("/neighborhood")
 */
class NeighborhoodController extends ControllerBase
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

      $this->set_grid_values($entity,'neighborhood/new','neighborhood/edit/'
      ,'neighborhood/show/','neighborhood/search','neighborhood/neighborhoodlist',1,10
      ,"No se encontraron Barrios","Barrios");

    }

    private function set_search_grid_post_values()
    {
      $params_query['country'] =$this->request->getPost("country");
      $params_query['state'] =$this->request->getPost("state");
      $params_query['city'] =$this->request->getPost("city");
      $params_query['township'] =$this->request->getPost("township");
      $params_query['neighborhood'] =$this->request->getPost("neighborhood");
      return $params_query;

    }

    private function set_list_query($entityname,$parameters)
    {
      $entity =$entityname::find($parameters);
      return $entity;
    }
    private function set_search_query($params_query)
    {
      $entity = $this->modelsManager->createBuilder()
                   ->columns(array('n.id as id','c.city as city','c2.country as country','s.state as state','t.township as township','n.neighborhood as neighborhood'))
                   ->from(array('n' => 'Neighborhood'))
                   ->join('City', 'c.id =n.cityid', 'c')
                   ->join('Country', 'c2.id =c.countryid', 'c2')
                   ->join('State', 's.id =c.stateid', 's')
                   ->join('Township', 't.id =n.townshipid', 't')
                   ->where('c.city LIKE :city:', array('city' => '%' . $params_query['city']. '%'))
                   ->andWhere('t.township LIKE :township:', array('township' => '%' . $params_query['township']. '%'))
                   ->andWhere('n.neighborhood LIKE :neighborhood:', array('neighborhood' => '%' . $params_query['neighborhood']. '%'))
                   ->andWhere('c2.country LIKE :country:', array('country' => '%' . $params_query['country']. '%'))
                   ->andWhere('s.state LIKE :state:', array('state' => '%' . $params_query['state'] . '%'))
                   ->getQuery()
                   ->execute();
        return $entity;
    }


   private function set_tags($mode,$entity_object)

   {
     $this->tag->setDefault("neighborhood", $entity_object->getNeighborhood());
     $this->tag->setDefault("cityid", $entity_object->getCityid());
     $this->tag->setDefault("townshipid", $entity_object->getTownshipid());
     $this->tag->setDefault("country", $entity_object->getCity()->getCountry()->getCountry());
     $this->tag->setDefault("state", $entity_object->getCity()->getState()->getState());

  }
  private function set_post_values($entity)
  {
  $entity->setNeighborhood($this->request->getPost("neighborhood"));
  $entity->setTownshipid($this->request->getPost("townshipyid"));
  $entity->setCityid($this->request->getPost("cityid"));
  }


    /**
    * @Route("/list", methods={"GET","POST"}, name="townshiplist")
   */
    public function listAction()
    {

      $this->listsearch('list','Neighborhoodview',array(
        'order' => 'country,state,city,township,neighborhood ASC'
    ));

    }


    /**
    * @Route("/search", methods={"POST"}, name="townshipsearch")
   */
      public function searchAction()
      {
       $this->listsearch('search','',array(
         'order' => 'c2.country,s.state,c.city,t.township,n.neighborhood ASC'
     ));
      }

      public function get_assets()
      {

        $this->assets
           ->collection('validatejs')
            ->addJs('js/jqueryvalidate/jquery.validate.js')
            ->addJs('js/jqueryvalidate/additional-methods.min.js')
            ->addJs('js/validateneighborhood/validate_neighborhood.js')
            ->addJs('js/validateneighborhood/get_township_data.js');
      }

      /**
      * @Route("/get_township_data/{cityid}", methods={"POST"}, name="get_township_data")
     */
      public function get_township_dataAction($cityid)
      {

        $township= Township::findBycityid($cityid)->toArray();

        echo '<select id="townshipid" name ="townshipid">';
        echo '<option value ="0" >Seleccione un Sector</option>';
        foreach ($township as $townshipitem)
        {
          echo '<option value ="'.$townshipitem["id"].'" >'.$townshipitem["township"].'</option>';
        }
        echo '</select>';

      }
      /**
      * @Route("/new", methods={"GET"}, name="neighborhoodenew")
     */
      public function newAction($entity=null)
      {
        $this->get_assets();
        $this->set_form_routes('neighborhood/create','neighborhood/list','Nuevo Barrio','neighborhood/addedit','new',$entity,'NeighborhoodForm');

      }


      /**
      * @Route("/edit/{id}", methods={"GET"}, name="neighborhoodedit")
     */
      public function editAction($id)
      {
              $entity =$this->set_entity($id,'Neighborhood','No se encontro una entidad llamada Neighborhood','neighborhood','neighborhoodlist','edit');
              $this->get_assets();
              $this->set_tags('edit',$entity);
              $this->view->id = $entity->id;
              $this->set_form_routes('neighborhood/save/'.$id,'neighborhood/list','Editar Barrio','neighborhood/addedit','edit',$entity,'NeighborhoodForm');
      }

      /**
      * @Route("/create", methods={"POST"}, name="neighborhoodcreate")
     */

     //set_entity($id,$entityname,$errormessage,$controller,$action,$mode)
     //execute_entity_action($entity,$controller,$action,$params,$redirect_route,$mode)

     
      public function createAction()
      {
          $entity = $this->set_entity('','Neighborhood','No se encontro una entidad llamada Neighborhood','neighborhood','neighborhoodlist','create');
          $this->set_post_values($entity);
          $this->execute_entity_action($entity,'neighborhood','new',array($entity),'neighborhoodlist','create');
      }

      /**
      * @Route("/save/{id}", methods={"POST"}, name="neighborhoodsave")
     */
      public function saveAction($id)
      {

          $entity =$this->set_entity($id,'Neighborhood','No se encontro una entidad llamada Neighborhood','neighborhood','neighborhoodlist','update');
          $this->set_post_values($entity);
          $this->execute_entity_action($entity,'neighborhood','edit',array($entity->id),'neighborhoodlist','update');

      }

      /**
      * @Route("/show/{id}", methods={"GET"}, name="neighborhoodshow")
     */
     public function showAction($id)
     {
           $entity =$this->set_entity($id,'neighborhood','No se encontro una entidad llamada  Neighborhood','neighborhood','neighborhoodlist','show_delete');
           $this->get_assets();
           $this->set_form_routes('neighborhood/delete/'.$id,'neighborhood/list'
           ,'Esta seguro que desea eliminar este barrio?','neighborhood/show','delete',$entity,'NeighborhoodForm');
           $this->set_tags('delete',$entity,'Y');


     }

      /**
      * @Route("/delete/{id}", methods={"POST"}, name="neighborhooddelete")
     */
      public function deleteAction($id)
      {

        $entity =$this->set_entity($id,'neighborhood','No se encontro una entidad llamada Neighborhood','neighborhood','neighborhoodlist','delete');
        $this->execute_entity_action($entity,'neighborhood','show',array(),'neighborhoodlist','delete');
      }


}
