<?php
use Phalcon\Mvc\Model\Validator\PresenceOf;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class Language extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     */
    protected $code;

    /**
     *
     * @var string
     */
    protected $language;

    /**
     *
     * @var string
     */
    protected $flag;

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
     * Method to set the value of field language
     *
     * @param string $language
     * @return $this
     */
    public function setLanguage($language)
    {
        $this->language = $language;

        return $this;
    }

    /**
     * Method to set the value of field flag
     *
     * @param string $flag
     * @return $this
     */
    public function setFlag($flag)
    {
        $this->flag = $flag;

        return $this;
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
     * Returns the value of field language
     *
     * @return string
     */
    public function getLanguage()
    {
        return $this->language;
    }

    /**
     * Returns the value of field flag
     *
     * @return string
     */
    public function getFlag()
    {
        return $this->flag;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'language';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Language[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Language
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
            'code' => 'code',
            'language' => 'language',
            'flag' => 'flag'
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
                  'field'    => 'code',
                  'message'  => $this->di->get('translate')->_('language.code.required')

              )
          )
      );
      if(!$this->getId())
      {
      $this->validate(
          new PresenceOf(
              array(
                  'field'    => 'language',
                  'message'  => $this->di->get('translate')->_('language.required')
              )
          )
      );
     }
        $this->validate(
            new PresenceOf(
                array(
                    'field'    => 'flag',
                    'message'=> $this->di->get('translate')->_('flag.required')
                )
            )
        );

        $this->validate(new Uniqueness(array(
           'field' => 'code',
           'message'=>$this->di->get('translate')->_('language.code.unique')
       )));

       $this->validate(new Uniqueness(array(
          'field' => 'language',
          'message'=>$this->di->get('translate')->_('language.unique')
      )));
        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }


}
