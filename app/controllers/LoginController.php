<?php
use LoginForm as FormLogin;
/**
 * @RoutePrefix("/login")
 */
class LoginController extends ControllerBase
{

  /**
  * @Route("/", methods={"POST","GET"}, name="loginindex")
 */
	public function indexAction()
	{
  $form = new FormLogin();
  $username = $this->request->getPost('username', array('striptags', 'trim'));
  $password = $this->request->getPost('password', array('striptags', 'trim'));

//si es una petición post
if ($this->request->isPost())
{

  //si el formulario no pasa la validación que le hemos impuesto
  if ($form->isValid($this->request->getPost()) == false)
  {
    //mostramos los mensajes con la clase error que hemos personalizado en los mensajes flash
    foreach ($form->getMessages() as $message)
    {
      $this->flash->error($message);
    }
    
  }
  else
  {

    //obtenemos al usuario por su email
    $user = User::findFirstByUsername($username);

    //si existe el usuario buscado por email
        if ($user)
        {
          //si el password que hay en la base de datos coincide con el que ha
          //ingresado encriptado, le damos luz verde, los datos son correctos
            if ($this->security->checkHash($password, $user->password))
            {
              //creamos la sesión del usuario con su email
              $this->session->set("userid", $user->id);
              $this->session->set("username", $user->username);
              return $this->response->redirect('apartment/list');
            }
            else
            {
              //esto es horrible, nunca le déis esta información a un usuario, es para el tuto
              $this->flash->error("No hay ningún usuario con ese password en la base de datos");
            }
        }
        else
        {
          //esto es horrible, nunca le déis esta información a un usuario, es para el tuto
          $this->flash->error("El usuario no ha sido encontrado en la base de datos");
        }
  }
}

$this->view->form = new FormLogin();
}

}
