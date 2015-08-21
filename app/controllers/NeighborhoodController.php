<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class NeighborhoodController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for neighborhood
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Neighborhood", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $neighborhood = Neighborhood::find($parameters);
        if (count($neighborhood) == 0) {
            $this->flash->notice("The search did not find any neighborhood");

            return $this->dispatcher->forward(array(
                "controller" => "neighborhood",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $neighborhood,
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
     * Edits a neighborhood
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $neighborhood = Neighborhood::findFirstByid($id);
            if (!$neighborhood) {
                $this->flash->error("neighborhood was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "neighborhood",
                    "action" => "index"
                ));
            }

            $this->view->id = $neighborhood->id;

            $this->tag->setDefault("id", $neighborhood->getId());
            $this->tag->setDefault("neighborhood", $neighborhood->getNeighborhood());
            $this->tag->setDefault("townshipid", $neighborhood->getTownshipid());
            $this->tag->setDefault("cityid", $neighborhood->getCityid());
            
        }
    }

    /**
     * Creates a new neighborhood
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "neighborhood",
                "action" => "index"
            ));
        }

        $neighborhood = new Neighborhood();

        $neighborhood->setNeighborhood($this->request->getPost("neighborhood"));
        $neighborhood->setTownshipid($this->request->getPost("townshipid"));
        $neighborhood->setCityid($this->request->getPost("cityid"));
        

        if (!$neighborhood->save()) {
            foreach ($neighborhood->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "neighborhood",
                "action" => "new"
            ));
        }

        $this->flash->success("neighborhood was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "neighborhood",
            "action" => "index"
        ));

    }

    /**
     * Saves a neighborhood edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "neighborhood",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $neighborhood = Neighborhood::findFirstByid($id);
        if (!$neighborhood) {
            $this->flash->error("neighborhood does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "neighborhood",
                "action" => "index"
            ));
        }

        $neighborhood->setNeighborhood($this->request->getPost("neighborhood"));
        $neighborhood->setTownshipid($this->request->getPost("townshipid"));
        $neighborhood->setCityid($this->request->getPost("cityid"));
        

        if (!$neighborhood->save()) {

            foreach ($neighborhood->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "neighborhood",
                "action" => "edit",
                "params" => array($neighborhood->id)
            ));
        }

        $this->flash->success("neighborhood was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "neighborhood",
            "action" => "index"
        ));

    }

    /**
     * Deletes a neighborhood
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $neighborhood = Neighborhood::findFirstByid($id);
        if (!$neighborhood) {
            $this->flash->error("neighborhood was not found");

            return $this->dispatcher->forward(array(
                "controller" => "neighborhood",
                "action" => "index"
            ));
        }

        if (!$neighborhood->delete()) {

            foreach ($neighborhood->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "neighborhood",
                "action" => "search"
            ));
        }

        $this->flash->success("neighborhood was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "neighborhood",
            "action" => "index"
        ));
    }

}
