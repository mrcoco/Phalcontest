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


  /**
  * @Route("/list", methods={"GET","POST"}, name="statelist")
 */
  public function listAction()
  {

      $numberPage = 1;
      if ($this->request->isPost()) {

      } else {
          $numberPage = $this->request->getQuery("page", "int");
      }



      $state = $this->modelsManager->createBuilder()
                  ->columns(array('s.id as id','c.country as country','s.state as state'))
                  ->from(array('s' => 'State'))
                  ->join('Country', 'c.id = s.countryid', 'c')
                  ->getQuery()
                  ->execute();


      $paginator = new Paginator(array(
          "data" => $state,
          "limit"=> 10,
          "page" => $numberPage
      ));

      $this->view->page = $paginator->getPaginate();
    $this->view->pick("state/statelist");
  }


  /**
  * @Route("/search", methods={"POST"}, name="statesearch")
 */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {

        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $country =$this->request->getPost("country");
        $stateparam =$this->request->getPost("state");

        $state = $this->modelsManager->createBuilder()
                    ->columns(array('s.id as id','c.country as country','s.state as state'))
                    ->from(array('s' => 'State'))
                    ->join('Country', 'c.id = s.countryid', 'c')
                  ->andWhere('s.state LIKE :state:', array('state' => '%' . $stateparam. '%'))
                  ->andWhere('c.country LIKE :country:', array('country' => '%' . $country. '%'))
                    ->getQuery()
                    ->execute();
        if (count($state) == 0) {
            $this->flash->notice("The search did not find any state");

            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "list"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $state,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->pick("state/statelist");
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
    * @Route("/new", methods={"GET"}, name="statenew")
   */
    public function newAction()
    {
      $this->get_assets();
      $this->view->form = new StateForm();

    }

    /**
    * @Route("/edit/{id}", methods={"GET"}, name="stateedit")
   */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $state = State::findFirstByid($id);
            if (!$state) {
                $this->flash->error("state was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "state",
                    "action" => "index"
                ));
            }

            $this->get_assets();
            $this->view->form = new StateForm();
            $this->view->id = $state->id;

            $this->tag->setDefault("id", $state->getId());
            $this->tag->setDefault("state", $state->getState());
            $this->tag->setDefault("countryid", $state->getCountryid());

        }
    }

    /**
    * @Route("/create", methods={"POST"}, name="statecreate")
   */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "index"
            ));
        }

        $state = new State();

        $state->setState($this->request->getPost("state"));
        $state->setCountryid($this->request->getPost("countryid"));


        if (!$state->save()) {
            foreach ($state->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "new"
            ));
        }

        $this->response->redirect(array('for' => "statelist"));
    }

    /**
    * @Route("/save/{id}", methods={"POST"}, name="statesave")
   */
    public function saveAction($id)
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "index"
            ));
        }

        //$id = $this->request->getPost("id");

        $state = State::findFirstByid($id);
        if (!$state) {
            $this->flash->error("state does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "index"
            ));
        }

        $state->setState($this->request->getPost("state"));
        $state->setCountryid($this->request->getPost("countryid"));


        if (!$state->save()) {

            foreach ($state->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "edit",
                "params" => array($state->id)
            ));
        }

        $this->response->redirect(array('for' => "statelist"));

    }

    /**
    * @Route("/show/{id}", methods={"GET"}, name="stateshow")
   */
   public function showAction($id)
   {
     $this->get_assets();
     if (!$this->request->isPost()) {

         $state = State::findFirstByid($id);
         if (!$state) {
             $this->flash->error("state was not found");

             return $this->dispatcher->forward(array(
                 "controller" => "state",
                 "action" => "list"
             ));
         }
         $this->get_assets();
         $this->view->form = new StateForm();
         $this->view->id =$state->getId();

         $this->tag->setDefault("countryid", $state->getCountryid());
         $this->tag->setDefault("state", $state->getState());



     }

   }


    /**
    * @Route("/delete/{id}", methods={"GET"}, name="deletelist")
   */
    public function deleteAction($id)
    {

        $state = State::findFirstByid($id);
        if (!$state) {
            $this->flash->error("state was not found");

            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "index"
            ));
        }

        if (!$state->delete()) {

            foreach ($state->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "search"
            ));
        }

          $this->response->redirect(array('for' => "statelist"));
    }

}
