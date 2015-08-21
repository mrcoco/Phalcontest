<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;

class StateController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for state
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "State", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $state = State::find($parameters);
        if (count($state) == 0) {
            $this->flash->notice("The search did not find any state");

            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $state,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * Displays the creation form
     */
    public function newAction()
    {

    }

    /**
     * Edits a state
     *
     * @param string $id
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

            $this->view->id = $state->id;

            $this->tag->setDefault("id", $state->getId());
            $this->tag->setDefault("state", $state->getState());
            $this->tag->setDefault("countryid", $state->getCountryid());

        }
    }

    /**
     * Creates a new state
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

        $this->flash->success("state was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "state",
            "action" => "index"
        ));

    }

    /**
     * Saves a state edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "state",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

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

        $this->flash->success("state was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "state",
            "action" => "index"
        ));

    }

    /**
     * Deletes a state
     *
     * @param string $id
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

        $this->flash->success("state was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "state",
            "action" => "index"
        ));
    }

}
