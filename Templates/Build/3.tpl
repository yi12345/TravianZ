<?php
include("next.tpl");
?>
<div id="build" class="gid3"><a href="#" onClick="return Popup(3,4);" class="build_logo">
<img class="building g3" src="img/x.gif" alt="<?php echo B3; ?>" title="<?php echo B3; ?>" />
</a>
<h1><?php echo B3; ?> <span class="level"><?php echo LEVEL." "; echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo B3_DESC; ?></p>



<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th><?php echo CUR_PROD; ?></th>
		<td><b><?php echo $bid3[$village->resarray['f'.$id]]['prod']* SPEED; ?></b> per hour</td>
	</tr>
	 <?php
    if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
	$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
	if($village->capital == 1) {
	if($next<=20){
    ?>
	<tr>
		<th><?php echo NEXT_PROD; echo $next; ?>:</th>
		<td><b><?php echo $bid3[$next]['prod']* SPEED; ?></b> <?php echo PER_HR; ?></td>
	</tr>
    <?php
    }else{
	?>
	<tr>
		<th><?php echo NEXT_PROD; echo 20; ?>:</th>
		<td><b><?php echo $bid3[20]['prod']* SPEED; ?></b> <?php echo PER_HR; ?></td>
	</tr>
	<?php
	}}else{
	if($next<=10){
    ?>
	<tr>
		<th><?php echo NEXT_PROD; echo $next; ?>:</th>
		<td><b><?php echo $bid3[$next]['prod']* SPEED; ?></b> <?php echo PER_HR; ?></td>
	</tr>
    <?php
    }else{
	?>
	<tr>
		<th><?php echo NEXT_PROD; echo 10; ?>:</th>
		<td><b><?php echo $bid3[10]['prod']* SPEED; ?></b> <?php echo PER_HR; ?></td>
	</tr>
	<?php
	}}}
    ?>
</table>

<?php
include("upgrade.tpl");
?></p></div>
