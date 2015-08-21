<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class ActionController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for action
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Action", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $action = Action::find($parameters);
        if (count($action) == 0) {
            $this->flash->notice("The search did not find any action");

            return $this->dispatcher->forward(array(
                "controller" => "action",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $action,
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
     * Edits a action
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $action = Action::findFirstByid($id);
            if (!$action) {
                $this->flash->error("action was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "action",
                    "action" => "index"
                ));
            }

            $this->view->id = $action->id;

            $this->tag->setDefault("id", $action->getId());
            $this->tag->setDefault("action", $action->getAction());
            $this->tag->setDefault("description", $action->getDescription());
            
        }
    }

    /**
     * Creates a new action
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "action",
                "action" => "index"
            ));
        }

        $action = new Action();

        $action->setAction($this->request->getPost("action"));
        $action->setDescription($this->request->getPost("description"));
        

        if (!$action->save()) {
            foreach ($action->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "action",
                "action" => "new"
            ));
        }

        $this->flash->success("action was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "action",
            "action" => "index"
        ));

    }

    /**
     * Saves a action edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "action",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $action = Action::findFirstByid($id);
        if (!$action) {
            $this->flash->error("action does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "action",
                "action" => "index"
            ));
        }

        $action->setAction($this->request->getPost("action"));
        $action->setDescription($this->request->getPost("description"));
        

        if (!$action->save()) {

            foreach ($action->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "action",
                "action" => "edit",
                "params" => array($action->id)
            ));
        }

        $this->flash->success("action was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "action",
            "action" => "index"
        ));

    }

    /**
     * Deletes a action
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $action = Action::findFirstByid($id);
        if (!$action) {
            $this->flash->error("action was not found");

            return $this->dispatcher->forward(array(
                "controller" => "action",
                "action" => "index"
            ));
        }

        if (!$action->delete()) {

            foreach ($action->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "action",
                "action" => "search"
            ));
        }

        $this->flash->success("action was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "action",
            "action" => "index"
        ));
    }

}
