<?php
use Phalcon\Mvc\Router\Annotations as RouterAnnotations;
use Phalcon\Mvc\Router;
$router = new RouterAnnotations(false);

$router->notFound(
    [

      "controller" => "Error",
      "action" => "error404"
    ]
  );

$router->add(
"/setlang/{lang}",
array(
  "controller" => "Manager",
  "action"     => "setlanguage"
)
);
$router->add(
"/error404",
array(
  "controller" => "Error",
  "action"     => "error404"
)
)->setName("error404");

$router->addResource('Apartment', '/apartment');
$router->addResource('Tower', '/tower');
$router->addResource('Login', '/login');
$router->addResource('Country', '/country');
$router->addResource('State', '/state');
$router->addResource('City', '/city');
$router->addResource('Township', '/township');
$router->addResource('Neighborhood', '/neighborhood');
$router->addResource('Index', '/index');
$router->addResource('Test', '/test');
$router->addResource('Address', '/address');
$router->addResource('Error', '/error');
$router->addResource('User', '/user');
$router->addResource('Role', '/role');
$router->addResource('Action', '/action');
$router->addResource('UserRole', '/userrole');
$router->addResource('ActionRole', '/actionrole');
$router->addResource('Language', '/language');


return $router;
