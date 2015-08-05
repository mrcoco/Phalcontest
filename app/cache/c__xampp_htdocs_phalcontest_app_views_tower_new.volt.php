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






<table width="100%">
    <tr>
        <td align="left"><?php echo $this->tag->linkTo(array('tower', 'Go Back')); ?></td>
        <td align="right"><?php echo $this->tag->submitButton(array('Save')); ?></td>
    </tr>
</table>

<?php echo $this->getContent(); ?>

<div align="center">
    <h1>Create tower</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="id">Id</label>
        </td>
        <td align="left">
            <?php echo $this->tag->textField(array('id', 'type' => 'numeric')); ?>
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="companyid">Companyid</label>
        </td>
        <td align="left">
            <?php echo $this->tag->textField(array('companyid', 'type' => 'numeric')); ?>
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="number">Number</label>
        </td>
        <td align="left">
            <?php echo $this->tag->textField(array('number', 'size' => 30)); ?>
        </td>
    </tr>

    <tr>
        <td></td>
        <td><?php echo $this->tag->submitButton(array('Save')); ?></td>
    </tr>
</table>

</form>
