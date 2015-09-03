<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
/**
 * @RoutePrefix("/index")
 */
class IndexController extends ControllerBase
{
  /**
  * @Route("/home", methods={"GET"}, name="home")
 */
    public function indexAction()
    {
     $this->view->pick("index/index");
    }

}
