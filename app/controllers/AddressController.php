<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class AddressController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for address
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Address", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $address = Address::find($parameters);
        if (count($address) == 0) {
            $this->flash->notice("The search did not find any address");

            return $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $address,
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
     * Edits a addres
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $addres = Address::findFirstByid($id);
            if (!$addres) {
                $this->flash->error("addres was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "address",
                    "action" => "index"
                ));
            }

            $this->view->id = $addres->id;

            $this->tag->setDefault("id", $addres->getId());
            $this->tag->setDefault("countryid", $addres->getCountryid());
            $this->tag->setDefault("cityid", $addres->getCityid());
            $this->tag->setDefault("townshipid", $addres->getTownshipid());
            $this->tag->setDefault("neighborhoodid", $addres->getNeighborhoodid());
            $this->tag->setDefault("stateid", $addres->getStateid());
            $this->tag->setDefault("description", $addres->getDescription());
            $this->tag->setDefault("address", $addres->getAddress());
            
        }
    }

    /**
     * Creates a new addres
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));
        }

        $addres = new Address();

        $addres->setCountryid($this->request->getPost("countryid"));
        $addres->setCityid($this->request->getPost("cityid"));
        $addres->setTownshipid($this->request->getPost("townshipid"));
        $addres->setNeighborhoodid($this->request->getPost("neighborhoodid"));
        $addres->setStateid($this->request->getPost("stateid"));
        $addres->setDescription($this->request->getPost("description"));
        $addres->setAddress($this->request->getPost("address"));
        

        if (!$addres->save()) {
            foreach ($addres->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "new"
            ));
        }

        $this->flash->success("addres was created successfully");

        return $this->dispatcher->forward(array(
            "controller" => "address",
            "action" => "index"
        ));

    }

    /**
     * Saves a addres edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $addres = Address::findFirstByid($id);
        if (!$addres) {
            $this->flash->error("addres does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));
        }

        $addres->setCountryid($this->request->getPost("countryid"));
        $addres->setCityid($this->request->getPost("cityid"));
        $addres->setTownshipid($this->request->getPost("townshipid"));
        $addres->setNeighborhoodid($this->request->getPost("neighborhoodid"));
        $addres->setStateid($this->request->getPost("stateid"));
        $addres->setDescription($this->request->getPost("description"));
        $addres->setAddress($this->request->getPost("address"));
        

        if (!$addres->save()) {

            foreach ($addres->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "edit",
                "params" => array($addres->id)
            ));
        }

        $this->flash->success("addres was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "address",
            "action" => "index"
        ));

    }

    /**
     * Deletes a addres
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $addres = Address::findFirstByid($id);
        if (!$addres) {
            $this->flash->error("addres was not found");

            return $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "index"
            ));
        }

        if (!$addres->delete()) {

            foreach ($addres->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "address",
                "action" => "search"
            ));
        }

        $this->flash->success("addres was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "address",
            "action" => "index"
        ));
    }

}
