<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<?php echo $this->assets->outputCss('headercss'); ?>
<?php echo $this->assets->outputJs('headerjs'); ?>
 
<?php echo $this->assets->outputJs('ajaxjs'); ?>

</head>
    <body>
     
<div class="well row">

	<?php echo $this->getContent(); ?>
	<?php echo $password; ?>
    <?php echo $this->tag->form(array('apartment/create', 'method' => 'post')); ?>

        <div class="span6 offset4">
			     <?php echo $form->label('companyid'); ?>
            <?php echo $form->render('companyid'); ?>
        </div>
        <div class="span6 offset4">
            <?php echo $form->label('towerid'); ?>
            <?php echo $form->render('towerid'); ?>
        </div>
        <div class="span6 offset4">
            <?php echo $form->label('name'); ?>
            <?php echo $form->render('name'); ?>
        </div>
        <div class="span6 offset4">
            <?php echo $form->render('save'); ?>

		</div>
    </form>
</div>

</body>
</html>
