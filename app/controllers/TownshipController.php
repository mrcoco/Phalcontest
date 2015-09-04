<?php


use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use TownshipForm as TownshipForm;

/**
 * @RoutePrefix("/township")
 */
class TownshipController extends ControllerBase
{

  private function listsearch($param,$entityname,$parameters)
  {

      if ($param =='list')
      {

        $entity = $this->modelsManager->createBuilder()
                     ->columns(array('t.id as id','c.city as city','c2.country as country','s.state as state','t.township as township'))
                     ->from(array('t' => 'Township'))
                     ->join('City', 'c.id =t.cityid', 'c')
                     ->join('Country', 'c2.id =c.countryid', 'c2')
                     ->join('State', 's.id =c.stateid', 's')
                     ->getQuery()
                     ->execute();
      }
      else {

       $params_query =$this->set_search_grid_post_values();
       $entity = $this->set_search_query($params_query);
      }

    $this->set_grid_values($entity,'township/new','township/edit/','township/show/','township/search'
    ,'township/list','township/townshiplist',1,10,"No se encontraron Sectores","Sectores");

  }

  private function set_search_grid_post_values()
  {
    $params_query['country'] =$this->request->getPost("country");
    $params_query['state'] =$this->request->getPost("state");
    $params_query['city'] =$this->request->getPost("city");
    $params_query['township'] =$this->request->getPost("township");
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
                 ->columns(array('t.id as id','c.city as city','c2.country as country','s.state as state','t.township as township'))
                 ->from(array('t' => 'Township'))
                 ->join('City', 'c.id =t.cityid', 'c')
                 ->join('Country', 'c2.id =c.countryid', 'c2')
                 ->join('State', 's.id =c.stateid', 's')
                 ->where('c.city LIKE :city:', array('city' => '%' . $params_query['city']. '%'))
                 ->andWhere('t.township LIKE :township:', array('township' => '%' . $params_query['township']. '%'))
                 ->andWhere('c2.country LIKE :country:', array('country' => '%' . $params_query['country']. '%'))
                 ->andWhere('s.state LIKE :state:', array('state' => '%' . $params_query['state'] . '%'))
                 ->getQuery()
                 ->execute();
      return $entity;
  }


 private function set_tags($mode,$entity_object)

 {
   $this->tag->setDefault("township", $entity_object->getTownship());
   $this->tag->setDefault("cityid", $entity_object->getCityid());
   $this->tag->setDefault("country", $entity_object->getCity()->getCountry()->getCountry());
   $this->tag->setDefault("state", $entity_object->getCity()->getState()->getState());

}
private function set_post_values($entity)
{
$entity->setTownship($this->request->getPost("township"));
$entity->setCityid($this->request->getPost("cityid"));
}


  /**
  * @Route("/list", methods={"GET","POST"}, name="townshiplist")
 */
  public function listAction()
  {

    $this->listsearch('list','Townshipview',array(
      'order' => 'country,state,city,township ASC'
  ));

  }


  /**
  * @Route("/search", methods={"POST"}, name="townshipsearch")
 */
    public function searchAction()
    {
     $this->listsearch('search','',array(
       'order' => 'c2.country,s.state,c.city,t.township ASC'
   ));
    }

    public function get_assets()
    {

      $this->assets
         ->collection('validatejs')
          ->addJs('js/jqueryvalidate/jquery.validate.js')
          ->addJs('js/jqueryvalidate/additional-methods.min.js')
          ->addJs('js/validatetownship/validate_township.js')
          ->addJs('js/validatetownship/get_city_data.js');
    }

    /**
    * @Route("/get_citydata/{cityid}", methods={"POST"}, name="township_citydata")
   */
    public function get_citydataAction($cityid)
    {
       $this->view->disable();
      $city = $this->modelsManager->createBuilder()
                  ->columns(array('c.id as idcity','s.state as state','c2.country as country'))
                  ->from(array('c' => 'City'))
                  ->join('State', 's.id =c.stateid', 's')
                  ->join('Country', 'c2.id =c.countryid', 'c2')
                  ->where('c.id = :cityid:', array('cityid' =>$cityid ))
                  ->getQuery()
                  ->execute();
        $data = array();
                foreach ($city as $cityitem) {
                    $data= array(
                        'country'   => $cityitem->country,
                        'state' => $cityitem->state
                    );
                }

      echo json_encode($data);

    }
    /**
    * @Route("/new", methods={"GET"}, name="townshipenew")
   */
    public function newAction($entity=null)
    {
      $this->get_assets();
      $this->set_form_routes('township/create','township/list','Nuevo Sector','township/addedit','new',$entity,'TownshipForm');

    }


    /**
    * @Route("/edit/{id}", methods={"GET"}, name="townshipedit")
   */
    public function editAction($id)
    {
            $entity =$this->set_entity($id,'Township','No se encontro una entidad llamada Township','township','townshiplist','edit');
            $this->get_assets();
            $this->set_tags('edit',$entity);
            $this->view->id = $entity->id;
            $this->set_form_routes('township/save/'.$id,'township/list','Editar Sector','township/addedit','edit',$entity,'TownshipForm');
    }

    /**
    * @Route("/create", methods={"POST"}, name="townshipcreate")
   */
    public function createAction()
    {
        $entity = $this->set_entity('','Township','No se encontro una entidad llamada Township','township','townshiplist','create');
        $this->set_post_values($entity);
        $this->execute_entity_action($entity,'township','new',array($entity),'townshiplist','create');
    }

    /**
    * @Route("/save/{id}", methods={"POST"}, name="townshipsave")
   */
    public function saveAction($id)
    {

        $entity =$this->set_entity($id,'Township','No se encontro una entidad llamada Township','township','townshiplist','update');
        $this->set_post_values($entity);
        $this->execute_entity_action($entity,'township','edit',array($entity->id),'townshiplist','update');

    }

    /**
    * @Route("/show/{id}", methods={"GET"}, name="townshipshow")
   */
   public function showAction($id)
   {
         $entity =$this->set_entity($id,'Township','No se encontro una entidad llamada Township','township','townshiplist','show_delete');
         $this->get_assets();
         $this->set_form_routes('township/delete/'.$id,'township/list'
         ,'Esta seguro que desea eliminar este sector?','township/show','delete',$entity,'TownshipForm');
         $this->set_tags('delete',$entity,'Y');


   }

    /**
    * @Route("/delete/{id}", methods={"POST"}, name="townshipdelete")
   */
    public function deleteAction($id)
    {

      $entity =$this->set_entity($id,'Township','No se encontro una entidad llamada Township','township','townshiplist','delete');
      $this->execute_entity_action($entity,'township','show',array(),'townshiplist','delete');
    }

}
