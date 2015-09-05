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

class UserForm extends Form
{
  public function initialize()
	{
  // Company


  $username = new Text('username');
  $username->setLabel('UserName');
  $username->addValidators(array(
			new PresenceOf(array(
				'message' => 'Debe ingresar un username'
			))));
        $this->add($username);
  $email = new Text('email');
  $email->setLabel('Email');
  $email->addValidators(array(
      new PresenceOf(array(
        'message' => 'Debe ingresar un Email3'
      ))));
  $this->add($email);

  $password= new Password('password');
  $password->setLabel('Password');
  $password->addValidators(array(
      new PresenceOf(array(
        'message' => 'Debe ingresar un Password'
      ))));
  $this->add($password);
  $password2= new Password('password2');
  $password2->setLabel('Confirmar Password');
  $password2->addValidators(array(
      new PresenceOf(array(
        'message' => 'Debe ingresar nuevamente el password'
      ))));
  $this->add($password2);
  //añadimos un botón de tipo submit
  $submit = $this->add(new Submit('Guardar', array(
  'class' => 'btn btn-success'
  )));


  }

}
