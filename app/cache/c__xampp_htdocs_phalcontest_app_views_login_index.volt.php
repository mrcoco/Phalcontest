<div class="well row">

	<?php echo $this->getContent(); ?>
    <?php echo $this->tag->form(array('class' => 'form-login')); ?>

        <div class="span6 offset4">
            <h2>Formulario de login</h2>
        </div>
        <div class="span6 offset4">
			<?php echo $form->label('username'); ?>
            <?php echo $form->render('username'); ?>
        </div>
        <div class="span6 offset4">
            <?php echo $form->label('password'); ?>
            <?php echo $form->render('password'); ?>
        </div>
        <div class="span6 offset4">
            <?php echo $form->render('Login'); ?>
            <?php echo $form->render('csrf', array('value' => $this->security->getToken())); ?>
		</div>
    </form>
</div>
