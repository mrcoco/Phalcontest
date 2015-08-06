<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<?php echo $this->assets->outputCss('headercss'); ?>
<?php echo $this->assets->outputJs('headerjs'); ?>
 
</head>
    <body>
     
<h1><?php echo 'APARTMENTS'; ?></h1>
<?php echo $this->tag->form(array('apartment/search', 'method' => 'post', 'autocomplete' => 'off')); ?>

<table>
    <tr>
        <td align="right">
            <label for="username">Company</label>
        </td>
        <td align="left">
            <?php echo $this->tag->textField(array('company', 'size' => 30)); ?>
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="tower">Tower</label>
        </td>
        <td align="left">
            <?php echo $this->tag->textField(array('tower', 'size' => 30)); ?>
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="number">Number</label>
        </td>
        <td align="left">
            <?php echo $this->tag->textField(array('name', 'size' => 30)); ?>
        </td>
    </tr>
    <tr>
        <td></td>
        <td><?php echo $this->tag->submitButton(array('Search')); ?></td>
    </tr>
</table>

</form>

<table  width="50%" align="center" class="table">
    <thead>
      <tr>
        <td><?php echo $this->tag->linkTo(array('apartment/new', $this->tag->image(array('img/new.png')))); ?> <?php echo ' '; ?><?php echo 'Page ' . $page->current . 'of ' . $page->total_pages; ?></td>
      </tr>
        <tr>
            <th>Company</th>
            <th>Tower</th>
            <th>Number</th>
            <th></th>
            <th></th>
         </tr>
    </thead>
    <tbody>
    <?php if (isset($page->items)) { ?>
    <?php foreach ($page->items as $apartment) { ?>
        <tr>
            <td><?php echo $apartment->company; ?></td>
            <td><?php echo $apartment->tower; ?></td>
            <td><?php echo $apartment->name; ?></td>
            <td><?php echo $this->tag->linkTo(array('apartment/edit/' . $apartment->id, $this->tag->image(array('img/edit32.png')))); ?></td>

            <td><?php echo $this->tag->linkTo(array('apartment/delete/' . $apartment->id, $this->tag->image(array('img/delete32.png')))); ?></td>
        </tr>

    <?php } ?>
    <?php } ?>
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="left">
              <ul class="pagination">
                <li><?php echo $this->tag->linkTo(array('apartment/list', 'First')); ?></li>
                <li><?php echo $this->tag->linkTo(array('apartment/list?page=' . $page->before, 'Previous')); ?></li>

                 <?php foreach (range(1, $page->total_pages) as $i) { ?>
                 <li><?php echo $this->tag->linkTo(array('apartment/list?page=' . $i, $i)); ?></li>
                <?php } ?>
                <li><?php echo $this->tag->linkTo(array('apartment/list?page=' . $page->next, 'Next')); ?></li>
                <li><?php echo $this->tag->linkTo(array('apartment/list?page=' . $page->last, 'Last')); ?></li>
             </ul>
            </td>
        </tr>
    </tbody>

</table>

</body>
</html>
