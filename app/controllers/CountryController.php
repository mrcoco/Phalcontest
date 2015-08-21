<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
/**
 * @RoutePrefix("/country")
 */

class CountryController extends ControllerBase
{

  /**
  * @Route("/index", methods={"GET"}, name="countryindex")
 */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
    * @Route("/search", methods={"GET","POST"}, name="countrysearch")
   */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Country", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $country = Country::find($parameters);
        if (count($country) == 0) {
            $this->flash->notice("The search did not find any country");

            return $this->dispatcher->forward(array(
                "controller" => "country",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $country,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    /**
    * @Route("/new", methods={"GET"}, name="countrynew")
   */
    public function newAction()
    {

    }

    /**
     * Edits a country
     * @Route("/edit/{id}", methods={"GET"}, name="countrynew")
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $country = Country::findFirstByid($id);
            if (!$country) {
                $this->flash->error("country was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "country",
                    "action" => "index"
                ));
            }

            $this->view->id = $country->id;

            $this->tag->setDefault("id", $country->getId());
            $this->tag->setDefault("country", $country->getCountry());

        }
    }

    /**
    * @Route("/create", methods={"GET"}, name="countrycreate")
   */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "country",
                "action" => "index"
            ));
        }

        $country = new Country();

        $country->setCountry($this->request->getPost("country"));


        if (!$country->save()) {
            foreach ($country->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "country",
                "action" => "new"
            ));
        }

        $this->flash->success("country was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "country",
            "action" => "index"
        ));

    }

    /**
    * @Route("/save", methods={"GET"}, name="countrysave")
   */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "country",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $country = Country::findFirstByid($id);
        if (!$country) {
            $this->flash->error("country does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "country",
                "action" => "index"
            ));
        }

        $country->setCountry($this->request->getPost("country"));


        if (!$country->save()) {

            foreach ($country->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "country",
                "action" => "edit",
                "params" => array($country->id)
            ));
        }

        $this->flash->success("country was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "country",
            "action" => "index"
        ));

    }

    /**
     * @param string $id
    * @Route("/delete/{id}", methods={"GET"}, name="countrydelete")
    */
    public function deleteAction($id)
    {

        $country = Country::findFirstByid($id);
        if (!$country) {
            $this->flash->error("country was not found");

            return $this->dispatcher->forward(array(
                "controller" => "country",
                "action" => "index"
            ));
        }

        if (!$country->delete()) {

            foreach ($country->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "country",
                "action" => "search"
            ));
        }

        $this->flash->success("country was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "country",
            "action" => "index"
        ));
    }

}
