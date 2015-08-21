<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class RoleController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for role
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Role", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $role = Role::find($parameters);
        if (count($role) == 0) {
            $this->flash->notice("The search did not find any role");

            return $this->dispatcher->forward(array(
                "controller" => "role",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $role,
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
     * Edits a role
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $role = Role::findFirstByid($id);
            if (!$role) {
                $this->flash->error("role was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "role",
                    "action" => "index"
                ));
            }

            $this->view->id = $role->id;

            $this->tag->setDefault("id", $role->getId());
            $this->tag->setDefault("role", $role->getRole());
            $this->tag->setDefault("description", $role->getDescription());
            
        }
    }

    /**
     * Creates a new role
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "role",
                "action" => "index"
            ));
        }

        $role = new Role();

        $role->setRole($this->request->getPost("role"));
        $role->setDescription($this->request->getPost("description"));
        

        if (!$role->save()) {
            foreach ($role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "role",
                "action" => "new"
            ));
        }

        $this->flash->success("role was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "role",
            "action" => "index"
        ));

    }

    /**
     * Saves a role edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "role",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $role = Role::findFirstByid($id);
        if (!$role) {
            $this->flash->error("role does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "role",
                "action" => "index"
            ));
        }

        $role->setRole($this->request->getPost("role"));
        $role->setDescription($this->request->getPost("description"));
        

        if (!$role->save()) {

            foreach ($role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "role",
                "action" => "edit",
                "params" => array($role->id)
            ));
        }

        $this->flash->success("role was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "role",
            "action" => "index"
        ));

    }

    /**
     * Deletes a role
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $role = Role::findFirstByid($id);
        if (!$role) {
            $this->flash->error("role was not found");

            return $this->dispatcher->forward(array(
                "controller" => "role",
                "action" => "index"
            ));
        }

        if (!$role->delete()) {

            foreach ($role->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "role",
                "action" => "search"
            ));
        }

        $this->flash->success("role was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "role",
            "action" => "index"
        ));
    }

}
