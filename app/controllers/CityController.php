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

  /**
  * @Route("/list", methods={"GET","POST"}, name="citylist")
 */
  public function listAction()
  {

      $numberPage = 1;
      if ($this->request->isPost()) {
          $query = Criteria::fromInput($this->di, "City", $_POST);
          $this->persistent->parameters = $query->getParams();
      } else {
          $numberPage = $this->request->getQuery("page", "int");
      }

      $parameters = $this->persistent->parameters;
      if (!is_array($parameters)) {
          $parameters = array();
      }
      $parameters["order"] = "id";

      $city = $this->modelsManager->createBuilder()
                  ->columns(array('c2.id as id','c.country as country','s.state as state' ,'c2.city as city'))
                  ->from(array('c2' => 'City'))
                  ->join('Country', 'c.id = c2.countryid', 'c')
                  ->join('State', 's.id = c2.stateid', 's')
                  ->getQuery()
                  ->execute();
      //$apartment = Apartment::find();

      $paginator = new Paginator(array(
          "data" => $city,
          "limit"=> 10,
          "page" => $numberPage
      ));

      $this->view->page = $paginator->getPaginate();
    $this->view->pick("city/citylist");
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
  * @Route("/search", methods={"GET","POST"}, name="citysearch")
 */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "City", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $city = City::find($parameters);
        if (count($city) == 0) {
            $this->flash->notice("The search did not find any city");

            return $this->dispatcher->forward(array(
                "controller" => "city",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $city,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    /**
    * @Route("/new", methods={"GET"}, name="citynew")
   */
    public function newAction()
    {
         $this->get_assets();

         $this->view->form = new CityForm();
    }


    public function get_assets()
    {
      //echo ;
      $this->assets
         ->collection('validatejs')
          ->addJs('js/jqueryvalidate/jquery.validate.js')
          ->addJs('js/jqueryvalidate/additional-methods.min.js')
          ->addJs('js/validatecity/city_dependent_combobox.js')
          ->addJs('js/validatecity/validatecity.js');
    }

    /**
    * @Route("/edit/{id}", methods={"GET"}, name="cityedit")
   */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $city = City::findFirstByid($id);
            if (!$city) {
                $this->flash->error("city was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "city",
                    "action" => "index"
                ));
            }

            $this->view->id = $city->id;

            $this->tag->setDefault("id", $city->getId());
            $this->tag->setDefault("city", $city->getCity());
            $this->tag->setDefault("countryid", $city->getCountryid());
            $this->tag->setDefault("stateid", $city->getStateid());

        }
    }

    /**
    * @Route("/create", methods={"POST"}, name="citycreate")
   */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "city",
                "action" => "index"
            ));
        }

        $city = new City();

        $city->setCity($this->request->getPost("city"));
        $city->setCountryid($this->request->getPost("countryid"));
        $city->setStateid($this->request->getPost("stateid"));


        if (!$city->save()) {
            foreach ($city->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "city",
                "action" => "new"
            ));
        }

        $this->flash->success("city was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "city",
            "action" => "index"
        ));

    }

    /**
    * @Route("/save", methods={"POST"}, name="citysave")
   */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "city",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $city = City::findFirstByid($id);
        if (!$city) {
            $this->flash->error("city does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "city",
                "action" => "index"
            ));
        }

        $city->setCity($this->request->getPost("city"));
        $city->setCountryid($this->request->getPost("countryid"));
        $city->setStateid($this->request->getPost("stateid"));


        if (!$city->save()) {

            foreach ($city->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "city",
                "action" => "edit",
                "params" => array($city->id)
            ));
        }

        $this->flash->success("city was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "city",
            "action" => "index"
        ));

    }

    /**
    * @Route("/delete/{id}", methods={"POST"}, name="citydelete")
   */
    public function deleteAction($id)
    {

        $city = City::findFirstByid($id);
        if (!$city) {
            $this->flash->error("city was not found");

            return $this->dispatcher->forward(array(
                "controller" => "city",
                "action" => "index"
            ));
        }

        if (!$city->delete()) {

            foreach ($city->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "city",
                "action" => "search"
            ));
        }

        $this->flash->success("city was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "city",
            "action" => "index"
        ));
    }

}
