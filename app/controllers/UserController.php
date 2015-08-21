<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use UserForm as UserForm;
/**
 * @RoutePrefix("/user")
 */
class UserController extends ControllerBase
{


    public function indexAction()
    {

        $this->persistent->parameters = null;


    }
    /**
    * @Route("/list", methods={"GET","POST"}, name="userlist")
   */
    public function userlistAction()
    {
      // Add some local JS sources
      // and some local javascript resources

      //


        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "User", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $user = User::find();

        $paginator = new Paginator(array(
            "data" => $user,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();

    }

    /**
    * @Route("/search", methods={"POST"}, name="searchuser")
   */
    public function searchAction()
    {
      // Add some local CSS resources
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "User", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $user = User::find($parameters);
        if (count($user) == 0) {
            $this->flash->notice("The search did not find any user");

            return $this->dispatcher->forward(array(
                "controller" => "user",
                "action" => "userlist"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $user,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
        $this->view->pick("user/userlist");
    }

    /**
      * @param string $language
    * @Route("/new", methods={"GET"}, name="newuser")
   */
    public function newAction()
    {

      //echo ;
      $this->assets
         ->collection('validatejs')
          ->addJs('js/jqueryvalidate/jquery.validate.js')
          ->addJs('js/jqueryvalidate/additional-methods.min.js')
          ->addJs('js/validateuser/validateuser.js');

    $this->view->form =  new UserForm();

    }

    /**
     * Edits a user
      * @param string $id
     * @Route("/edit/{id}", methods={"GET"}, name="edituser")
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $user = User::findFirstByid($id);
            if (!$user) {
                $this->flash->error("user was not found");

                return $this->dispatcher->forward(array(
                    "controller" => "user",
                    "action" => "index"
                ));
            }

            $this->view->id = $user->id;

            $this->tag->setDefault("id", $user->getId());
            $this->tag->setDefault("username", $user->getUsername());
            $this->tag->setDefault("email", $user->getEmail());
            $this->tag->setDefault("password", $user->getPassword());



        }
    }

    /**
    * @Route("/create", methods={"POST"}, name="createuser")
   */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "user",
                "action" => "index"
            ));
        }

        $user = new User();

        $user->setUsername($this->request->getPost("username"));
        $user->setEmail($this->request->getPost("email", "email"));
        $user->setPassword($this->request->getPost("password"));


        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "user",
                "action" => "new"
            ));
        }
          $this->response->redirect(array('for' => "userlist"));
        //$this->flash->success("user was created successfully");

        //return $this->dispatcher->forward(array(
            //"controller" => "user",
            //"action" => "search"
        //));

    }

    public function validateuser($username,$password)
    {

    }

    /**
    * @Route("/update", methods={"POST"}, name="updateuser")
   */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "user",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $user = User::findFirstByid($id);
        if (!$user) {
            $this->flash->error("user does not exist " . $id);

            return $this->dispatcher->forward(array(
                "controller" => "user",
                "action" => "index"
            ));
        }

        $user->setUsername($this->request->getPost("username"));
        $user->setEmail($this->request->getPost("email", "email"));
        $user->setPassword($this->request->getPost("password"));


        if (!$user->save()) {

            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "user",
                "action" => "edit",
                "params" => array($user->id)
            ));
        }

        $this->flash->success("user was updated successfully");

        return $this->dispatcher->forward(array(
            "controller" => "user",
            "action" => "userlist"
        ));

    }

    /**
     * Deletes a user
     *
     * @param string $id
     * @Route("/delete/{id}", methods={"GET"}, name="newuser")
     */
    public function deleteAction($id)
    {

        $user = User::findFirstByid($id);
        if (!$user) {
            $this->flash->error("user was not found");

            return $this->dispatcher->forward(array(
                "controller" => "user",
                "action" => "index"
            ));
        }

        if (!$user->delete()) {

            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "user",
                "action" => "search"
            ));
        }

        $this->flash->success("user was deleted successfully");

        return $this->dispatcher->forward(array(
            "controller" => "user",
            "action" => "userlist"
        ));
    }

    public function testuserAction()
    {
      echo 'testuser';
    }

}
