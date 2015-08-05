<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Mvc\Model\Query as Query;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;

/**
 * @RoutePrefix("/apartment")
 */
class ApartmentController extends ControllerBase
{

  /**
  * @Route("/index", methods={"GET","POST"}, name="apartmentlist")
 */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for apartment
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Apartment", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $apartment = Apartment::find($parameters);
        if (count($apartment) == 0) {
            $this->flash->notice("The search did not find any apartment");

            return $this->dispatcher->forward(array(
                "controller" => "apartment",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $apartment,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    /**
    * @Route("/new", methods={"GET","POST"}, name="apartmentnew")
   */
    public function newAction()
    {
      $form = new Form();

      $form->add(new Text("name"));
      $form->add(new Select('companyid', Company::find(array(
              "columns"   =>  "id, name"

          )), array(
              'useEmpty'  =>  true,
              'emptyText' =>  'Select a company',
              'using'     => array('id', 'name')
          )));
      $this->view->form = $form;
    }

    /**
    * @Route("/gettower/{companyid}", methods={"POST"}, name="apartmentnew")
   */
    public function gettowerction($companyid)
    {


      $apartment = Tower::findBycompanyid($id);
      $this->view->form = $form;
    }
    /**
     * Edits a apartment
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $apartment = Apartment::findFirstByid($id);
            if (!$apartment) {
                $this->flash->error("apartment was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "apartment",
                    "action" => "index"
                ));
            }

            $this->view->id = $apartment->id;

            $this->tag->setDefault("id", $apartment->getId());
            $this->tag->setDefault("companyid", $apartment->getCompanyid());
            $this->tag->setDefault("towerid", $apartment->getTowerid());
            $this->tag->setDefault("name", $apartment->getName());

        }
    }

    /**
     * Creates a new apartment
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "apartment",
                "action" => "index"
            ));
        }

        $apartment = new Apartment();

        $apartment->setId($this->request->getPost("id"));
        $apartment->setCompanyid($this->request->getPost("companyid"));
        $apartment->setTowerid($this->request->getPost("towerid"));
        $apartment->setName($this->request->getPost("name"));


        if (!$apartment->save()) {
            foreach ($apartment->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "apartment",
                "action" => "new"
            ));
        }

        $this->flash->success("apartment was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "apartment",
            "action" => "index"
        ));

    }

    /**
     * Saves a apartment edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "apartment",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $apartment = Apartment::findFirstByid($id);
        if (!$apartment) {
            $this->flash->error("apartment does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "apartment",
                "action" => "index"
            ));
        }

        $apartment->setId($this->request->getPost("id"));
        $apartment->setCompanyid($this->request->getPost("companyid"));
        $apartment->setTowerid($this->request->getPost("towerid"));
        $apartment->setName($this->request->getPost("name"));


        if (!$apartment->save()) {

            foreach ($apartment->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "apartment",
                "action" => "edit",
                "params" => array($apartment->id)
            ));
        }

        $this->flash->success("apartment was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "apartment",
            "action" => "index"
        ));

    }

    /**
     * Deletes a apartment
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $apartment = Apartment::findFirstByid($id);
        if (!$apartment) {
            $this->flash->error("apartment was not found");

            return $this->dispatcher->forward(array(
                "controller" => "apartment",
                "action" => "index"
            ));
        }

        if (!$apartment->delete()) {

            foreach ($apartment->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "apartment",
                "action" => "search"
            ));
        }

        $this->flash->success("apartment was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "apartment",
            "action" => "index"
        ));
    }

}
