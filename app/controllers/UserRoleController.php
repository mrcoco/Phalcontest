<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class UserRoleController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for user_role
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "UserRole", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "userid";

        $user_role = UserRole::find($parameters);
        if (count($user_role) == 0) {
            $this->flash->notice("The search did not find any user_role");

            return $this->dispatcher->forward(array(
                "controller" => "user_role",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $user_role,
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
     * Edits a user_role
     *
     * @param string $userid
     */
    public function editAction($userid)
    {

        if (!$this->request->isPost()) {

            $user_role = UserRole::findFirstByuserid($userid);
            if (!$user_role) {
                $this->flash->error("user_role was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "user_role",
                    "action" => "index"
                ));
            }

            $this->view->userid = $user_role->userid;

            $this->tag->setDefault("userid", $user_role->getUserid());
            $this->tag->setDefault("roleid", $user_role->getRoleid());
            
        }
    }

    /**
     * Creates a new user_role
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "user_role",
                "action" => "index"
            ));
        }

        $user_role = new UserRole();

        $user_role->setUserid($this->request->getPost("userid"));
        $user_role->setRoleid($this->request->getPost("roleid"));
        

        if (!$user_role->save()) {
            foreach ($user_role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "user_role",
                "action" => "new"
            ));
        }

        $this->flash->success("user_role was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "user_role",
            "action" => "index"
        ));

    }

    /**
     * Saves a user_role edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "user_role",
                "action" => "index"
            ));
        }

        $userid = $this->request->getPost("userid");

        $user_role = UserRole::findFirstByuserid($userid);
        if (!$user_role) {
            $this->flash->error("user_role does not exist " . $userid);

            return $this->dispatcher->forward(array(
                "controller" => "user_role",
                "action" => "index"
            ));
        }

        $user_role->setUserid($this->request->getPost("userid"));
        $user_role->setRoleid($this->request->getPost("roleid"));
        

        if (!$user_role->save()) {

            foreach ($user_role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "user_role",
                "action" => "edit",
                "params" => array($user_role->userid)
            ));
        }

        $this->flash->success("user_role was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "user_role",
            "action" => "index"
        ));

    }

    /**
     * Deletes a user_role
     *
     * @param string $userid
     */
    public function deleteAction($userid)
    {

        $user_role = UserRole::findFirstByuserid($userid);
        if (!$user_role) {
            $this->flash->error("user_role was not found");

            return $this->dispatcher->forward(array(
                "controller" => "user_role",
                "action" => "index"
            ));
        }

        if (!$user_role->delete()) {

            foreach ($user_role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "user_role",
                "action" => "search"
            ));
        }

        $this->flash->success("user_role was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "user_role",
            "action" => "index"
        ));
    }

}
