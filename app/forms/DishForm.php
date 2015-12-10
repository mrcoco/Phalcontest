<?php
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Query;

class DishForm extends Form
{
  public function initialize($entity =null , $options=null,$restaurantid)
	{

    $menu = new Select('menuid',Menu::findbyRestaurantid($restaurantid), array(
    'using' => array('id','name')
    ,'useEmpty' => TRUE,'emptyText' => 'Seleccione un Menú'));
    $menu->setLabel('Menu');
    $this->add($menu);

    $category = new Select('categoryid',DishCategory::find(), array(
    'using' => array('id','category')
    ,'useEmpty' => TRUE,'emptyText' => 'Seleccione una Categoria'));
    $category->setLabel('Category');
    $this->add($category);

    $gallery= new Select('galleryid',Gallery::find(), array(
    'using' => array('id','name')
    ,'useEmpty' => TRUE,'emptyText' => 'Seleccione una galeria'));
    $country->setLabel('Galeria');
    $this->add($country);

    $name= new Text('name');
    $name->setLabel('Ciudad');
    $this->add($name);



    $city = new Text('city');
    $city->setLabel('Ciudad');
    $this->add($city);

  }

}
