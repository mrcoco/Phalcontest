<?php

class ActionRole extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    protected $actionid;

    /**
     *
     * @var integer
     */
    protected $roleid;

    /**
     * Method to set the value of field actionid
     *
     * @param integer $actionid
     * @return $this
     */
    public function setActionid($actionid)
    {
        $this->actionid = $actionid;

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
     * Returns the value of field actionid
     *
     * @return integer
     */
    public function getActionid()
    {
        return $this->actionid;
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
        $this->belongsTo('actionid', 'Action', 'id', array('alias' => 'Action'));
        $this->belongsTo('roleid', 'Role', 'id', array('alias' => 'Role'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'action_role';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return ActionRole[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return ActionRole
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
            'actionid' => 'actionid',
            'roleid' => 'roleid'
        );
    }

}
