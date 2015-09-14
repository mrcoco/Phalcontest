<?php
use Phalcon\Mvc\Model\Validator;
use Phalcon\Mvc\Model\Validator\Email as Email;
use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;
class Country extends \Phalcon\Mvc\Model
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
    protected $code;

    /**
     *
     * @var string
     */
    protected $country;

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

    /**
     * Method to set the value of field code
     *
     * @param string $code
     * @return $this
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Method to set the value of field country
     *
     * @param string $country
     * @return $this
     */
    public function setCountry($country)
    {
        $this->country = $country;

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
     * Returns the value of field code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Returns the value of field country
     *
     * @return string
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'Address', 'countryid', array('alias' => 'Address'));
        $this->hasMany('id', 'City', 'countryid', array('alias' => 'City',"foreignKey" => array(
                    "message" => "No se Puede eliminar,Existe una ciudad que tien ese pais asociado")));
        $this->hasMany('id', 'State', 'countryid', array('alias' => 'State',"foreignKey" => array(
                    "message" => "No se Puede eliminar,Existe un estado  que tien ese pais asociado")));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'country';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Country[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Country
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * Independent Column Mapping.
     * Keys are the real names in the table and the values their names in the application
     *
     * @return array
     */
    public function columnMap()
    {
        return array(
            'id' => 'id',
            'code' => 'code',
            'country' => 'country'
        );
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
                  'field'    => 'code'

              )
          )
      );
      $this->validate(
          new PresenceOf(
              array(
                  'field'    => 'country'

              )
          )
      );

      $this->validate(new Uniqueness(array(
         'field' => array('code', 'country')


     )));
     $this->validate(new Uniqueness(array(
        'field' => 'code'


    )));

        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }
    public function getMessages()
   {
       $messages = array();
       $txtmessage ="";
       foreach (parent::getMessages() as $message) {

           switch ($message->getType()) {
               case 'PresenceOf':
                   switch ($message->getField()) {
                    case 'code':
                     $txtmessage = 'Debe Ingresar un código de País';
                    break;
                    case 'country':
                     $txtmessage = 'Debe ingresar un País';
                    break;

                   }
                    $messages[] =$txtmessage;
                   break;
              case 'Unique':

              if (is_array($message->getField()))
              {
                $field =implode("-", $message->getField());
              }
              else {
                $field =$message->getField();
              }

              switch ($field) {
                case 'code':
                   $txtmessage ='Ya Existe un país con ese código';
                break;
               case 'code-country':
                  $txtmessage ='Ya Existe un país con el código y nombre ingresados';
               break;
             
           }
           $messages[] =$txtmessage;
          break;
          case 'ConstraintViolation':
               $txtmessage ='No se puede eliminar este país por que tiene registros asociados';
               $messages[] =$txtmessage;    
               break;
       }

       return $messages;
   }
 }

}
