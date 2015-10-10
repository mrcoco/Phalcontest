<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Validation;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
use  UploadHandler as  UploadHandler;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
/**
 * @RoutePrefix("/file")
 */
class FileController extends ControllerBase
{
  public $file_params =array();
  public function onConstruct()
    {

        $this->file_params['upload_files_path']= $this->get_upload_files_path();
    }



public function get_assets()
{
  $this->assets
  ->collection('upload_file_css')
    ->addCss('metronic/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css')
    ->addCss('metronic/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css')
    ->addCss('metronic/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css');

   $this->assets
    ->collection('upload_file_javascripts')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/vendor/tmpl.min.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/vendor/load-image.min.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-image.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-audio.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-video.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js')
      ->addJs('metronic/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js')
      ->addJs('metronic/assets/admin/pages/scripts/form-fileupload.js');
    }

    /**
    * @Route("/set_files", methods={"GET"}, name="set_files")
    */
    public function view_upload_files_Action()
    {
     $this->get_assets();
     $this->view->pick('files/upload_files');
    }

    /**
    * @Route("/upload_files", methods={"GET","POST"}, name="upload_files")
    */
    public function upload_filesAction()
    {
      error_reporting(E_ALL | E_STRICT);
      $upload_handler = new  UploadHandler();

      //return json_encode($upload_handler);

    }

    /**
    * @Route("/uploadfiles", methods={"GET","POST"}, name="uploadfiles")
    */
    public function uploadviewAction()
    {
      $this->view->pick('files/fileupload');
    }

    /**
    * @Route("/upload", methods={"GET","POST"}, name="upload")
    */
    public function uploadAction()
    {
      #check if there is any file
  //  define('DS', DIRECTORY_SEPARATOR);
    $realpath = realpath('..');

    if($this->request->hasFiles() == true)
    {
    $uploads = $this->request->getUploadedFiles();
    $isUploaded = false;
    #do a loop to handle each file individually
    foreach($uploads as $upload){
    #define a “unique” name and a path to where our file must go
    $path =  $this->file_params['upload_files_path'].md5(uniqid(rand(), true)).'-'.strtolower($upload->getname());
    #move the file and simultaneously check if everything was ok
   ($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
   }
    #if any file couldn’t be moved, then throw an message
   ($isUploaded) ? die('Files successfully uploaded') : die('Some error ocurred');
   }
   else{
   #if no files were sent, throw a message warning user
   die('You must choose at least one file to send. Please try again.');
    }

    }

    /**
    * @Route("/list", methods={"GET","POST"}, name="list")
    */
    public function list_filesAction()
    {
        $numberPage =1;
        if ($this->request->isPost()) {

        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

      $file_names =array();
      $dir = $this->file_params['upload_files_path'];
        if (is_dir($dir)) {
         if ($dh = opendir($dir)) {
                $files=array();
             while (($file = readdir($dh)) !== false) {
                  if( $file == '.' || $file == '..' || $file =='thumbnail')continue;
                  $files['name'] = $file;
                  $files['type'] = pathinfo($file, PATHINFO_EXTENSION);
                  $files['size'] = round(filesize($this->file_params['upload_files_path'].$file)/1024/1024,3);
                  $file_names[]=$files;

             }
             closedir($dh);
         }
     }

     $search_columns= array(
       array('name' => 'name','title' => 'File Name','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
       array('name' => 'type','title' => 'Type','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
       array('name' => 'size','title' => 'Size','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search')
     );


        $paginator = new PaginatorArray(array(
            "data" => $file_names,
            "limit"=> 1,
            "page" => $numberPage
        ));
     $this->view->searchroute = 'file/search';
     $this->view->file_names = $file_names;
     $this->view->searchcolumns =$search_columns;
     $this->view->showroute ='file/show/';
     $this->view->title ='Archivos';
     $this->view->listroute ='file/list';
     $this->view->page = $paginator->getPaginate();

     $this->view->pick('files/filelist');
   }

    public function set_grid_values()
    {

    }
    /**
     * @Route("/search", methods={"GET","POST"}, name="search")
     */
    public function search_filesAction()
    {
        $numberPage =1;
        if ($this->request->isPost()) {

            $name =$this->request->getPost("name");
            $type =$this->request->getPost("type");
            $size =$this->request->getPost("size");

            $this->persistent->name=$name;
            $this->persistent->type=$type;
            $this->persistent->size=$size;

        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }
        if($this->request->getPost("name"))
        {
            $this->persistent->name =$this->request->getPost("name");
        }

        $this->tag->setDefault("name",$this->persistent->name);
        $this->tag->setDefault("type",$this->persistent->type);
        $this->tag->setDefault("size",$this->persistent->size);



        $file_names =array();
        $dir = $this->file_params['upload_files_path'];
        if (is_dir($dir))
        {
            if ($dh = opendir($dir)) {
                $files=array();
                while (($file = readdir($dh)) !== false) {
                    if( $file == '.' || $file == '..' || $file =='thumbnail')continue;

                     if (empty($name)==false or empty($type)==false or empty($size)==false)
                     {

                         if (empty($name)==false)
                         {
                           $name_value = is_numeric(strpos($file, $name));
                         }
                         else
                         {
                             $name_value = false;
                         }

                         if (empty($type)==false)
                         {
                             $type_value = is_numeric(strpos(pathinfo($file, PATHINFO_EXTENSION), $type));
                         }
                         else
                         {
                             $type_value = false;
                         }

                         if (empty($size)==false)
                         {
                             $size_value = is_numeric(strpos(strval($this->get_file_size($file)), $size));
                         }
                         else
                         {
                             $size_value = false;
                         }

                         if ( $name_value == true or $type_value == true or $size_value == true )
                         {

                             $files['name'] = $file;

                             $files['type'] = pathinfo($file, PATHINFO_EXTENSION);
                             $files['size'] = $this->get_file_size($file);
                             $file_names[] = $files;
                         }

                     }
                      else
                      {
                          $files['name'] = $file;

                          $files['type'] = pathinfo($file, PATHINFO_EXTENSION);
                          $files['size'] = $this->get_file_size($file);
                          $file_names[] = $files;
                      }




                }
                closedir($dh);
            }
        }




        //var_dump('name: '.$name .' type: '.$type.' size: '.$size);

        $search_columns= array(
            array('name' => 'name','title' => 'File Name','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
            array('name' => 'type','title' => 'Type','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search'),
            array('name' => 'size','title' => 'Size','size'=>30,'div_class'=>"input-control full-size",'label_class'=>'search')
        );


        $paginator = new PaginatorArray(array(
            "data" => $file_names,
            "limit"=> 1,
            "page" => $numberPage
        ));

        if (count($file_names) == 0)
        {
            $no_items ="No se encontraron archivos";

        }
        else {
            $no_items ="";
        }
        $this->view->noitems =$no_items;
        $this->view->searchroute = 'file/search';
        $this->view->file_names = $file_names;
        $this->view->searchcolumns =$search_columns;
        $this->view->showroute ='file/show/';
        $this->view->title ='Archivos';
        $this->view->listroute ='file/search';
        $this->view->page = $paginator->getPaginate();

        $this->view->pick('files/filelist');
    }


    public function get_file_size($file)
    {
        $size =round(filesize($this->file_params['upload_files_path'].$file)/1024/1024,3);
        return $size;
    }

}
