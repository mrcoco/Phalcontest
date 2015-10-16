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
        $this->file_params['download_files_path'] =$this->url->getBaseUri().'files/';
        $this->file_params['thumbnail_path']= $this->get_thumbnail_path();
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
    * @Route("/index", methods={"GET"}, name="index")
    */
    public function file_indexAction()
    {
      $this->view->pick('files/files_index');
    }

    public function get_modal_assets()
    {
        $this->assets->collection('delete_modal_js')->addJs('js/validate_files/delete_file_modal.js');
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
      $file_formats =$this->get_file_formats();
      //error_reporting(E_ALL | E_STRICT);
      $upload_handler = new  UploadHandler(
      array('image_versions' => array()
      ,'accept_file_types' => $file_formats['accept_file_types'] /*'/\.(gif|jpe?g|png|zip|odt|pdf|docx|wmv|exe|msi|rar)$/i'*/
      ,'max_file_size' => 95000000
      ,'min_file_size' => 0
      ,'max_number_of_files' => 10));

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

    public function get_file_folder($file_type)

    {
      switch ($file_type)
      {
        case 'image':
         $file_dir = $this->file_params['upload_files_path'].'images'.SEP;
        break;
        case 'video':
         $file_dir = $this->file_params['upload_files_path'].'videos'.SEP;
        break;
        case 'document':
         $file_dir = $this->file_params['upload_files_path'].'documents'.SEP;
        break;
        case 'other':
         $file_dir = $this->file_params['upload_files_path'].'other'.SEP;
        break;
      }
      return $file_dir;

    }

    /**
    * @Route("/list/{file_type}", methods={"GET"}, name="list")
    */
    public function list_filesAction($file_type)
    {
        $numberPage =1;
        if ($this->request->isPost()) {

        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

      $file_names =array();


      $dir = $this->get_file_folder($file_type);


        if (is_dir($dir)) {
         if ($dh = opendir($dir)) {

             while (($file = readdir($dh)) !== false) {

                  if( $file == '.' || $file == '..' || $file =='thumbnail' || is_dir($dir.$file)==true)continue;

                  $file_data = $this->get_file_data($dir,$file);
                  $file_names[]=$file_data;

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
            "limit"=> 10,
            "page" => $numberPage
        ));
        if (count($file_names) == 0)
        {
            $no_items ="No se encontraron archivos";

        }
        else {
            $no_items ="";
        }

     $this->get_modal_assets();
     $this->view->noitems =$no_items;
     $this->view->searchroute = 'file/search/'.$file_type;
     $this->view->file_names = $file_names;
     $this->view->searchcolumns =$search_columns;
     $this->view->showroute ='file/show/';
     $this->view->title ='Archivos';
     $this->view->listroute ='file/list/'.$file_type;
     $this->view->page = $paginator->getPaginate();
     $this->view->download_path =$this->file_params['download_files_path'];

     $this->view->pick('files/filelist');
   }


    /**
     * @Route("/search/{file_type}", methods={"GET","POST"}, name="search")
     */
    public function search_filesAction($file_type)
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
        $dir = $this->get_file_folder($file_type);
        if (is_dir($dir))
        {
            if ($dh = opendir($dir)) {

                while (($file = readdir($dh)) !== false) {
                    if( $file == '.' || $file == '..' || $file =='thumbnail')continue;

                    $file_data = $this->get_file_data($dir,$file);
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
                             var_dump(is_numeric(strpos( $file_data['type'], $type)));
                             $type_value = is_numeric(strpos( $file_data['type'], $type));
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


                             $file_names[]=$file_data;
                         }

                     }
                      else
                      {

                          $file_names[]=$file_data;
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
            "limit"=> 10,
            "page" => $numberPage
        ));

        if (count($file_names) == 0)
        {
            $no_items ="No se encontraron archivos";

        }
        else {
            $no_items ="";
        }
        $this->get_modal_assets();
        $this->view->noitems =$no_items;
        $this->view->searchroute = 'file/search/'.$file_type;
        $this->view->file_names = $file_names;
        $this->view->searchcolumns =$search_columns;
        $this->view->showroute ='file/show/';
        $this->view->title ='Archivos';
        $this->view->listroute ='file/search/'.$file_type;
        $this->view->page = $paginator->getPaginate();
        $this->view->download_path =$this->file_params['download_files_path'];
        $this->view->pick('files/filelist');

    }

     public function get_path_by_extension($file_name)
     {
       $file_extensions=$this->get_file_formats(); /*array('image_ext' => array('gif','png','jpg','gif')
       ,'document_ext'=>array('rtf','doc','docx','csv','xls','xlsx','pptx','ppt','odt','pdf','txt','html','xml','php','css','js')
       ,'video_ext'=>array('mpg','mpeg','rm','avi','mkv','flv','mov','wmv','asf','mp4'));*/
       $path = $this->get_folder_by_extension($file_name,$file_extensions);
       return $path;
     }

     public function get_file_formats()
     {
       $file_formats = FileFormat::find(array("conditions"=>  "accept ='T'"))->toArray();

       $image_ext =array();
       $video_ext =array();
       $document_ext =array();
       $other_ext =array();
       foreach ( $file_formats as  $file)
       {
          switch ($file['type'])
          {
            case 'image':
            array_push($image_ext,$file['extension']);
            break;
            case 'video':
            array_push($video_ext,$file['extension']);
            break;
            case 'document':
            array_push($document_ext,$file['extension']);
            break;
            case 'other':
            array_push($other_ext,$file['extension']);
            break;
          }

       }

       $file_extensions =array('image_ext' =>$image_ext
       ,'document_ext'=>$document_ext
       ,'video_ext'=>$video_ext
       ,'other_ext'=>$other_ext
       ,'accept_file_types'=> $this->get_accept_file_types($file_formats)
       );

       return $file_extensions;
     }

     public function get_accept_file_types($file_formats)

     {
        $reg_exp ='/\.(';
       foreach ( $file_formats as  $file)
       {
         $reg_exp .= $file['extension'].'|';
       }
       $reg_exp  =$reg_exp.')$/i';
       return $reg_exp;
     }

    /**
     * @Route("/delete/{filename}", methods={"POST"}, name="delete")
     */
    public function delete_file_Action($file_name)
    {

        $dir = $this->get_path_by_extension($file_name);
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {

                while (($file = readdir($dh)) !== false) {
                  if ($file ==$file_name)
                  {
                      unlink($this->get_path_by_extension($file_name).$file);
                      break;
                  }

                }
                closedir($dh);
            }
        }
    }

    /**
     * @Route("/image_gallery", methods={"GET"}, name="image_gallery")
     */
    public function image_gallery_Action()
    {
      $this->view->title ="Imágenes";
      $this->view->pick('files/image_gallery');
    }
    public function get_file_size($file)
    {
        $size =round(filesize($this->file_params['upload_files_path'].$file)/1024/1024,3);
        return $size;
    }

}
