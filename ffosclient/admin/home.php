<style>
  #system-cover{
    width:100%;
    height:45em;
    object-fit:cover;
    object-position:center center;
  }
</style>
<h1 class="">Welcome, <?php echo $_settings->userdata('firstname')." ".$_settings->userdata('lastname') ?>!</h1>
<hr>
<div class="row">

  <!-- /.col -->

  <!-- /.col -->
  <?php if($_settings->userdata('type') !=2): ?>
  <!-- /.col -->
  <?php endif; ?>
  
  <?php if($_settings->userdata('type') ==1): ?>
  <!-- /.col -->
  <?php endif; ?>

  <?php if($_settings->userdata('type') ==2): ?>
  <!-- /.col -->
  <?php endif; ?>

</div>
<div class="container-fluid text-center">
  <img src="<?= validate_image($_settings->info('cover')) ?>" alt="system-cover" id="system-cover" class="img-fluid">
</div>
