<?php

class UserRole extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    protected $userid;

    /**
     *
     * @var integer
     */
    protected $roleid;

    /**
     * Method to set the value of field userid
     *
     * @param integer $userid
     * @return $this
     */
    public function setUserid($userid)
    {
        $this->userid = $userid;

        return $this;
    }

    /**
     * Method to set the value of field roleid
     *
     * @param integer $roleid
     * @return $this
     */
    public function setRoleid($roleid)
    {
        $this->roleid = $roleid;

        return $this;
    }

    /**
     * Returns the value of field userid
     *
     * @return integer
     */
    public function getUserid()
    {
        return $this->userid;
    }

    /**
     * Returns the value of field roleid
     *
     * @return integer
     */
    public function getRoleid()
    {
        return $this->roleid;
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->belongsTo('userid', 'User', 'id', array('alias' => 'User'));
        $this->belongsTo('roleid', 'Role', 'id', array('alias' => 'Role'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'user_role';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return UserRole[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return UserRole
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
            'userid' => 'userid',
            'roleid' => 'roleid'
        );
    }

}
