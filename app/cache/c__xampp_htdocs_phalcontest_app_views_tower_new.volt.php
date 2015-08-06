<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<?php echo $this->assets->outputCss('headercss'); ?>
<?php echo $this->assets->outputJs('headerjs'); ?>
 
</head>
    <body>
     
<div class="well row">

	<?php echo $this->getContent(); ?>
    <?php echo $this->tag->form(array('tower/create', 'method' => 'post')); ?>

        <div class="span6 offset4">
			     <?php echo $form->label('companyid'); ?>
            <?php echo $form->render('companyid'); ?>
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
