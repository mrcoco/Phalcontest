<?php
use Phalcon\Mvc\Model\Validator\Email as Email;
use Phalcon\Mvc\Model\Validator\PresenceOf;

class User extends Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var string
     */
    protected $username;

    /**
     *
     * @var string
     */
    protected $email;

    /**
     *
     * @var string
     */
    protected $password;

    /**

        /**
         *
         * @var string
         */
        protected $confirm_password;

        /**

     * Method to set the value of field id
     *
     * @param integer $id
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }
    public function initialize()
    {
         $this->skipAttributesOnCreate(array('confirm_password'));
         $this->skipAttributesOnUpdate(array('confirm_password'));
    }
    /**
     * Method to set the value of field username
     *
     * @param string $username
     * @return $this
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Method to set the value of field email
     *
     * @param string $email
     * @return $this
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Method to set the value of field password
     *
     * @param string $password
     * @return $this
     */
    public function setPassword($password)
    {
        $this->password = $password;

        return $this;
    }
    /**
     * Method to set the value of field confirm_password
     *
     * @param string $confirm_password
     * @return $this
     */
    public function setConfirm_password($confirm_password)
    {
        $this->confirm_password = $confirm_password;

        return $this;
    }

    /**
     * Returns the value of field id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns the value of field username
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Returns the value of field email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Returns the value of field password
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Returns the value of field confirm_password
     *
     * @return string
     */
    public function getConfirm_password()
    {
        return $this->confirm_password;
    }


    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
      $this->validate(
          new PresenceOf(
              array(
                  'field'    => 'username',
                  'message'  => 'Debe ingresar un nombre de usuario'
              )
          )
      );
      $this->validate(
          new PresenceOf(
              array(
                  'field'    => 'password',
                  'message'  => 'Debe ingresar un password'
              )
          )
      );

        $this->validate(
            new Email(
                array(
                    'field'    => 'email',
                    'message'=>'El e-mail debe ser válido'
                )
            )
        );





        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'user';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return User[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return User
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function beforeCreate()
   {
    $this->password =  $this->getDI()->getSecurity()->hash($this->password);
    }

    public function beforeValidationOnCreate(){
        $confirm_data = [
            'password' => $this->getPassword(),
            'confirm_password' => $this->getConfirm_password()
        ];
        $validator = new Phalcon\Validation();
        $validator->add('password', new \Phalcon\Validation\Validator\Confirmation(array(
            'message' => 'El password y la confirmación de password deben ser iguales',
            'with' => 'confirm_password'
        )));

        $messages = $validator->validate($confirm_data);
        if (count($messages)) {
            foreach ($messages as $message) {
                $model_message = new Phalcon\Mvc\Model\Message(
                    $message->getMessage(),
                    'password',
                    'confirm_password'
                );
                $this->appendMessage($model_message);
            }
            return false;
        }
        else {
          return true;
        }

    }
    

}
