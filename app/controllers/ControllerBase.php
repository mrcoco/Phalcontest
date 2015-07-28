<?php

use Phalcon\Mvc\Controller;
use Phalcon\Translate\Adapter\NativeArray;
defined('APP_PATH') || define('APP_PATH', realpath('..'));
class ControllerBase extends Controller
{
public function initialize()
{
  $this->assets
      ->collection('headercss')
      ->addCss('bootstrap/dist/css/bootstrap.min.css');


  // and some local javascript resources
  $this->assets
     ->collection('headerjs')
      ->addJs('js/jquery/jquery-2.1.4.min.js')
      ->addJs('bootstrap/dist/js/bootstrap.min.js');

}

protected function getTranslation()
  {


      $language =$this->dispatcher->getParam('language');
    // Ask browser what is the best language
    //$language = $this->request->getBestLanguage();

    // Check if we have a translation file for that lang
    if (file_exists(APP_PATH ."/app/messages/" . $language . ".php")) {
       require APP_PATH ."/app/messages/" . $language . ".php";
    } else {
       // fallback to some default
       require APP_PATH ."/app/messages/en.php";
    }

    // Return a translation object
    return new NativeArray(array(
       "content" => $messages
    ));
  }

  public function Set_language($urlpath)
  {
    $this->view->trans = $this->getTranslation();
    $this->view->currenturl = $this->url->get($urlpath);
  }


}
