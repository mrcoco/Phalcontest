

<?php echo $this->tag->form(array('apartment/create', 'method' => 'post')); ?>


<table width="100%">
    <tr>
        <td align="left"><?php echo $this->tag->linkTo(array('apartment', 'Go Back')); ?></td>
        <td align="right"><?php echo $this->tag->submitButton(array('Save')); ?></td>
    </tr>
</table>

<?php echo $this->getContent(); ?>

<div align="center">
    <h1>Create apartment</h1>
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
            <?php echo $form->render('companyid'); ?>

        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="towerid">Towerid</label>
        </td>
        <td align="left">
            <?php echo $this->tag->textField(array('towerid', 'type' => 'numeric')); ?>
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="name">Name</label>
        </td>
        <td align="left">
            <?php echo $form->render('name'); ?>
        </td>
    </tr>

    <tr>
        <td></td>
        <td><?php echo $this->tag->submitButton(array('Save')); ?></td>
    </tr>
</table>

</form>
