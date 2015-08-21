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

class CityForm extends Form
{
  public function initialize()
	{

    $country = new Select('countryid',Country::find(), array(
      'using' => array('id','country')));
    $country->setLabel('Pais');
    $this->add($country);


  $state = new Select('stateid', array(
    '0' =>"Seleccione un Estado"));
  $state->setLabel('Estado');
  $this->add($state);


  $city = new Text('city');
  $city->setLabel('Ciudad');
  $city->addValidators(array(
			new PresenceOf(array(
				'message' => 'Debe ingresar una ciudad'
			))));

  $this->add($city);
  //añadimos un botón de tipo submit
$submit = $this->add(new Submit('Guardar', array(
  'class' => 'btn btn-success'
)));


  }

}
