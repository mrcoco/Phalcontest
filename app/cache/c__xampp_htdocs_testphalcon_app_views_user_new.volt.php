<!DOCTYPE html>

<html>
<head>



<?php echo $this->assets->outputCss('headercss'); ?>
<?php echo $this->assets->outputJs('headerjs'); ?>
 
<?php echo $this->assets->outputJs('validatejs'); ?>

</head>
    <body>
     

<br><br>
  <a href="<?php echo $this->url->get('setlang') . '/en'; ?>">English</a>|<a href="<?php echo $this->url->get('setlang') . '/es'; ?>">Spanish</a>
     
<br><br>
<?php echo $this->tag->form(array('user/create', 'method' => 'post', 'class' => 'form-horizontal', 'id' => 'appform')); ?>

<table width="100%">
    <tr>
        <td align="left"><?php echo $this->tag->linkTo(array('user/list', 'Go Back', 'class' => 'btn btn-primary')); ?></td>

    </tr>
</table>

<div class="col sm-12">
<div class="form-group">
  <h1 class="control-label col-sm-4">Create user</h1>
  <br><hr class="control-label col-sm-12"><br>
</div>
</div>

<label class="col-sm-offset-2 col-sm-12 error" style ="color:red"><?php echo $this->getContent(); ?></label>
<br>
<br>
<div class="form-group">
    <label class="control-label col-sm-2" for="username"><?php echo $this->getDI()->get("translate")->_('Username'); ?></label>
    <div class="col-sm-3">
    <?php echo $this->tag->textField(array('username', 'size' => 30, 'class' => 'form-control')); ?>
    </div>
 </div>
 <div class="form-group">
     <label class="control-label col-sm-2" for="username">Email</label>
     <div class="col-sm-3">
     <?php echo $this->tag->textField(array('email', 'size' => 30, 'class' => 'form-control')); ?>
     </div>
  </div>
  <div class="form-group">
      <label class="control-label col-sm-2" for="username"><?php echo $this->getDI()->get("translate")->_('Password'); ?></label>
      <div class="col-sm-3">
        <?php echo $this->tag->textField(array('password', 'size' => 30, 'class' => 'form-control')); ?>
      </div>
   </div>
   <div class="form-group">
 <div class="col-sm-offset-2 col-sm-8">
   <?php echo $this->tag->submitButton(array('Save', 'class' => 'btn btn-primary')); ?>
 </div>
 </div>
</div>


</form>


    </body>
</html>
