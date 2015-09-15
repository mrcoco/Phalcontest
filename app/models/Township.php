<?php
use Phalcon\Mvc\Model\Validator;
use Phalcon\Mvc\Model\Validator\Email as Email;
use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class Township extends \Phalcon\Mvc\Model
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
    protected $township;

    /**
     *
     * @var integer
     */
    protected $cityid;

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
     * Method to set the value of field township
     *
     * @param string $township
     * @return $this
     */
    public function setTownship($township)
    {
        $this->township = $township;

        return $this;
    }

    /**
     * Method to set the value of field cityid
     *
     * @param integer $cityid
     * @return $this
     */
    public function setCityid($cityid)
    {
        $this->cityid = $cityid;

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
     * Returns the value of field township
     *
     * @return string
     */
    public function getTownship()
    {
        return $this->township;
    }

    /**
     * Returns the value of field cityid
     *
     * @return integer
     */
    public function getCityid()
    {
        return $this->cityid;
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'Address', 'townshipid', array('alias' => 'Address'));
        $this->hasMany('id', 'Neighborhood', 'townshipid', array('alias' => 'Neighborhood',"foreignKey" => array(
                    "message" => "No se Puede eliminar,existe un sector que tiene esta ciudad asociado"
                )));
        $this->belongsTo('cityid', 'City', 'id', array('alias' => 'City'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'township';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Township[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Township
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
            'township' => 'township',
            'cityid' => 'cityid'
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
                  'field'    => 'cityid'

              )
          )
      );
      $this->validate(
          new PresenceOf(
              array(
                  'field'    => 'township'

              )
          )
      );
      $this->validate(new Uniqueness(array(
         'field' => array('cityid', 'township')


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
                    case 'cityid':
                     $txtmessage = 'Debe seleccionar una ciudad';
                    break;
                    case 'township':
                     $txtmessage = 'Debe ingresar un sector';
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
               case 'cityid-township':
                  $txtmessage ='Ya Existe un sector con ese nombre para la ciudad seleccionada';
             break;
           }
           $messages[] =$txtmessage;
          break;
           case 'ConstraintViolation':
               $txtmessage ='No se puede eliminar este sector por que existen registros asociados';
               $messages[] =$txtmessage;    
               break;      
       }

       return $messages;
   }
 }

}
