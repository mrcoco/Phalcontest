<?php
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Query;

class ArticleForm extends Form
{
    public function initialize($entity =null , $options=null)
    {


        $title = new Text('title',array(
        'class'   =>'form-control'
        ));
        $title->setLabel('Title');
        $this->add($title);

        $author = new Text('author',array(
            'class'   =>'form-control'
        ));
        $author->setLabel('Author');
        $this->add($author);

        $content = new TextArea('content',array(
            'id' =>'summernote'
             ,'name'=>'content',
            'class'   =>'summernote'
        ));
        $content->setLabel('Content');
        $this->add($content);



    }

}
