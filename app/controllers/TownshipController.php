<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class TownshipController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for township
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Township", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $township = Township::find($parameters);
        if (count($township) == 0) {
            $this->flash->notice("The search did not find any township");

            return $this->dispatcher->forward(array(
                "controller" => "township",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $township,
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
     * Edits a township
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $township = Township::findFirstByid($id);
            if (!$township) {
                $this->flash->error("township was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "township",
                    "action" => "index"
                ));
            }

            $this->view->id = $township->id;

            $this->tag->setDefault("id", $township->getId());
            $this->tag->setDefault("township", $township->getTownship());
            $this->tag->setDefault("cityid", $township->getCityid());
            
        }
    }

    /**
     * Creates a new township
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "township",
                "action" => "index"
            ));
        }

        $township = new Township();

        $township->setTownship($this->request->getPost("township"));
        $township->setCityid($this->request->getPost("cityid"));
        

        if (!$township->save()) {
            foreach ($township->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "township",
                "action" => "new"
            ));
        }

        $this->flash->success("township was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "township",
            "action" => "index"
        ));

    }

    /**
     * Saves a township edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "township",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $township = Township::findFirstByid($id);
        if (!$township) {
            $this->flash->error("township does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "township",
                "action" => "index"
            ));
        }

        $township->setTownship($this->request->getPost("township"));
        $township->setCityid($this->request->getPost("cityid"));
        

        if (!$township->save()) {

            foreach ($township->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "township",
                "action" => "edit",
                "params" => array($township->id)
            ));
        }

        $this->flash->success("township was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "township",
            "action" => "index"
        ));

    }

    /**
     * Deletes a township
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $township = Township::findFirstByid($id);
        if (!$township) {
            $this->flash->error("township was not found");

            return $this->dispatcher->forward(array(
                "controller" => "township",
                "action" => "index"
            ));
        }

        if (!$township->delete()) {

            foreach ($township->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "township",
                "action" => "search"
            ));
        }

        $this->flash->success("township was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "township",
            "action" => "index"
        ));
    }

}
