<?php
use Phalcon\Mvc\Model\Validator;
use Phalcon\Mvc\Model\Validator\Email as Email;
use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;


class City extends \Phalcon\Mvc\Model
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
    protected $city;

    /**
     *
     * @var integer
     */
    protected $countryid;

    /**
     *
     * @var integer
     */
    protected $stateid;

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
     * Method to set the value of field city
     *
     * @param string $city
     * @return $this
     */
    public function setCity($city)
    {
        $this->city = $city;

        return $this;
    }

    /**
     * Method to set the value of field countryid
     *
     * @param integer $countryid
     * @return $this
     */
    public function setCountryid($countryid)
    {
        $this->countryid = $countryid;

        return $this;
    }

    /**
     * Method to set the value of field stateid
     *
     * @param integer $stateid
     * @return $this
     */
    public function setStateid($stateid)
    {
        $this->stateid = $stateid;

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
     * Returns the value of field city
     *
     * @return string
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Returns the value of field countryid
     *
     * @return integer
     */
    public function getCountryid()
    {
        return $this->countryid;
    }

    /**
     * Returns the value of field stateid
     *
     * @return integer
     */
    public function getStateid()
    {
        return $this->stateid;
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'Address', 'cityid', array('alias' => 'Address'));
        $this->hasMany('id', 'Neighborhood', 'cityid', array('alias' => 'Neighborhood'));
        $this->hasMany('id', 'Township', 'cityid', array('alias' => 'Township'));
        $this->belongsTo('countryid', 'Country', 'id', array('alias' => 'Country'));
        $this->belongsTo('stateid', 'State', 'id', array('alias' => 'State'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'city';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return City[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return City
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
            'city' => 'city',
            'countryid' => 'countryid',
            'stateid' => 'stateid'
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
                  'field'    => 'countryid'

              )
          )
      );
      $this->validate(
          new PresenceOf(
              array(
                  'field'    => 'stateid'

              )
          )
      );
      $this->validate(
          new PresenceOf(
              array(
                  'field'    => 'city'
              )
          )
      );

      $this->validate(new Uniqueness(array(
         'field' => array('countryid', 'stateid','city')


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
                    case 'countryid':
                     $txtmessage = 'Debe seleccionar un país';
                    break;
                    case 'stateid':
                     $txtmessage = 'Debe seleccionar un estado';
                    break;
                    case 'city':
                     $txtmessage = 'Debe ingresar una ciudad';
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
                    case 'countryid-stateid-city':
                       $txtmessage ='Ya existe una ciudad con ese nombre para el país y estado seleccionados ';
                  break;
                }
                $messages[] =$txtmessage;
               break;
           }
       }

       return $messages;
   }




}
