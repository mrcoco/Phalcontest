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

    $this->set_grid_values($entity,'city/new','city/edit/','city/show/','city/search',
    'city/list','city/citylist',1,10,"No se encontraron Ciudades","Ciudades");

  }

  public function set_search_grid_post_values()
  {
    if ($this->request->isPost()) {


        $searchparams =array();
        $searchparams['country'] =$this->request->getPost("country");
        $searchparams['state'] =$this->request->getPost("state");
        $searchparams['city'] =$this->request->getPost("city");
        $this->persistent->params =$searchparams;

    } else {


        $searchparams=$this->persistent->params;
        $country =$searchparams['country'];
        $countryparam =$searchparams['state'];
        $cityparam =$searchparams['city'];
        $numberPage = $this->request->getQuery("page", "int");

    }
    $this->tag->setDefault("country", $searchparams['country'] );
    $this->tag->setDefault("state", $searchparams['state']);
    $this->tag->setDefault("city", $searchparams['city']);


    return $searchparams;


    //$params_query['country'] =$this->request->getPost("country");
    //$params_query['state'] =$this->request->getPost("state");
    //$params_query['city'] =$this->request->getPost("city");
    //return $params_query;

  }

  private function set_list_query($entityname,$parameters)
  {
    $entity = $this->modelsManager->createBuilder()
                ->columns(array('c2.id as id','c.country as country','s.state as state' ,'c2.city as city'))
                ->from(array('c2' => 'City'))
                ->join('Country', 'c.id = c2.countryid', 'c')
                ->join('State', 's.id = c2.stateid', 's')
                ->getQuery()
                ->execute();
    return $entity;
  }
  private function set_search_query($params_query)
  {
    $entity = $this->modelsManager->createBuilder()
                ->columns(array('c2.id as id','c.country as country','s.state as state' ,'c2.city as city'))
                ->from(array('c2' => 'City'))
                ->join('Country', 'c.id = c2.countryid', 'c')
                ->join('State', 's.id = c2.stateid', 's')
                ->where('c.country LIKE :country:', array('country' => '%' . $params_query['country'] . '%'))
                ->andWhere('s.state LIKE :state:', array('state' => '%' . $params_query['state'] . '%'))
                ->andWhere('c2.city LIKE :city:', array('city' => '%' . $params_query['city'] . '%'))
                ->getQuery()
                ->execute();
      return $entity;
  }


 private function set_tags($mode,$entity_object)

 {
   $this->tag->setDefault("city", $entity_object->getCity());
   $this->tag->setDefault("countryid", $entity_object->getCountryid());
   $this->tag->setDefault("stateid", $entity_object->getStateid());


}
private function set_post_values($entity)
{
  $entity->setCity($this->request->getPost("city"));
  $entity->setCountryid($this->request->getPost("countryid"));
  $entity->setStateid($this->request->getPost("stateid"));
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

  /**
  * @Route("/list", methods={"GET","POST"}, name="citylist")
 */
  public function listAction()
  {

    $this->listsearch('list','',array(
      'order' => 'country,state,city ASC'
  ));

  }


  /**
  * @Route("/search", methods={"POST"}, name="Countrysearch")
 */
    public function searchAction()
    {
     $this->listsearch('search','',array(
       'order' => 'country,state,city ASC'
   ));
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
    * @Route("/new", methods={"GET"}, name="Countryenew")
   */
    public function newAction($entity=null)
    {
      $this->get_assets();
      $this->set_form_routes('city/create','city/list','Nueva Ciudad','city/addedit','new',$entity,'CityForm');

    }


    /**
    * @Route("/edit/{id}", methods={"GET"}, name="Countryedit")
   */
    public function editAction($id)
    {
            $entity =$this->set_entity($id,'City','No se encontro una entidad llamada City','City','citylist','edit');
            $this->get_assets();
            $this->set_tags('edit',$entity);
            $this->view->id = $entity->id;
            $this->set_form_routes('city/save/'.$id,'city/list','Editar País','city/addedit','edit',$entity,'CityForm');
    }

    /**
    * @Route("/create", methods={"POST"}, name="Countrycreate")
   */
    public function createAction()
    {
        $entity = $this->set_entity('','City','No se encontro una entidad llamada City','City','citylist','create');
        $this->set_post_values($entity);
        $this->execute_entity_action($entity,'City','new',array($entity),'citylist','create');
    }

    /**
    * @Route("/save/{id}", methods={"POST"}, name="Countrysave")
   */
    public function saveAction($id)
    {

        $entity =$this->set_entity($id,'City','No se encontro una entidad llamada City','City','citylist','update');
        $this->set_post_values($entity);
        $this->execute_entity_action($entity,'City','edit',array($entity->id),'citylist','update');

    }

    /**
    * @Route("/show/{id}", methods={"GET"}, name="Countryshow")
   */
   public function showAction($id)
   {
         $entity =$this->set_entity($id,'City','No se encontro una entidad llamada City','City','citylist','show_delete');
         $this->get_assets();
         $this->set_form_routes('city/delete/'.$id,'city/list'
         ,'Esta seguro que desea eliminar esta Ciudad?','city/show','delete',$entity,'CityForm');
         $this->set_tags('delete',$entity,'Y');



   }

    /**
    * @Route("/delete/{id}", methods={"POST"}, name="citydelete")
   */
    public function deleteAction($id)
    {

      $entity =$this->set_entity($id,'City','No se encontro una entidad llamada City','City','citylist','delete');
      $this->execute_entity_action($entity,'City','show',array(),'citylist','delete');
    }

}
