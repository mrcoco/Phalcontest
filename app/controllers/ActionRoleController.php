<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class ActionRoleController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for action_role
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "ActionRole", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "actionid";

        $action_role = ActionRole::find($parameters);
        if (count($action_role) == 0) {
            $this->flash->notice("The search did not find any action_role");

            return $this->dispatcher->forward(array(
                "controller" => "action_role",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $action_role,
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
     * Edits a action_role
     *
     * @param string $actionid
     */
    public function editAction($actionid)
    {

        if (!$this->request->isPost()) {

            $action_role = ActionRole::findFirstByactionid($actionid);
            if (!$action_role) {
                $this->flash->error("action_role was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "action_role",
                    "action" => "index"
                ));
            }

            $this->view->actionid = $action_role->actionid;

            $this->tag->setDefault("actionid", $action_role->getActionid());
            $this->tag->setDefault("roleid", $action_role->getRoleid());
            
        }
    }

    /**
     * Creates a new action_role
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "action_role",
                "action" => "index"
            ));
        }

        $action_role = new ActionRole();

        $action_role->setActionid($this->request->getPost("actionid"));
        $action_role->setRoleid($this->request->getPost("roleid"));
        

        if (!$action_role->save()) {
            foreach ($action_role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "action_role",
                "action" => "new"
            ));
        }

        $this->flash->success("action_role was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "action_role",
            "action" => "index"
        ));

    }

    /**
     * Saves a action_role edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "action_role",
                "action" => "index"
            ));
        }

        $actionid = $this->request->getPost("actionid");

        $action_role = ActionRole::findFirstByactionid($actionid);
        if (!$action_role) {
            $this->flash->error("action_role does not exist " . $actionid);

            return $this->dispatcher->forward(array(
                "controller" => "action_role",
                "action" => "index"
            ));
        }

        $action_role->setActionid($this->request->getPost("actionid"));
        $action_role->setRoleid($this->request->getPost("roleid"));
        

        if (!$action_role->save()) {

            foreach ($action_role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "action_role",
                "action" => "edit",
                "params" => array($action_role->actionid)
            ));
        }

        $this->flash->success("action_role was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "action_role",
            "action" => "index"
        ));

    }

    /**
     * Deletes a action_role
     *
     * @param string $actionid
     */
    public function deleteAction($actionid)
    {

        $action_role = ActionRole::findFirstByactionid($actionid);
        if (!$action_role) {
            $this->flash->error("action_role was not found");

            return $this->dispatcher->forward(array(
                "controller" => "action_role",
                "action" => "index"
            ));
        }

        if (!$action_role->delete()) {

            foreach ($action_role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "action_role",
                "action" => "search"
            ));
        }

        $this->flash->success("action_role was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "action_role",
            "action" => "index"
        ));
    }

}
