<h5><img src="img/en/t2/newsbox2.gif" alt="newsbox 2"></h5>
<?php

$online = mysqli_query($GLOBALS['link'],"SELECT Count(*) as Total FROM " . TB_PREFIX . "users WHERE timestamp > ".(time() - (60*10))." AND tribe!=0 AND tribe!=4 AND tribe!=5");

?>

<div class="news">
<table width="100%" border="0">
<tr>
<td align="left"><b>Online Users</td>
<td>: <font color="Red"><?php

	if (!empty($online)) {
    	echo mysqli_fetch_assoc($online)['Total'];
    } else {
    	echo 0;
    }

?> users</font></b></td>
</tr>
<tr>
<td><b>Server Speed</td>
<td>: <font color="Red"><?php echo ''.SPEED.'x';?></font></b></td>
</tr>
<tr>
<td><b>Troop Speed</td>
<td>: <font color="Red"><?php echo INCREASE_SPEED;?>x</font></b></td>
</tr>
<tr>
<td><b>Evasion Speed</td>
<td>: <font color="Red"><?php echo EVASION_SPEED;?></font></b></td>
</tr>
<tr>
<td><b>Map Size</td>
<td>: <font color="Red"><?php echo WORLD_MAX;?>x<?php echo WORLD_MAX;?></font></b></td>
</tr>
<tr>
<td><b>Village Exp.</td>
<td>: <font color="Red"><?php if(CP == 0){ echo "Fast"; } else if(CP == 1){ echo "Slow"; } ?></font></b></td>
</tr>
<tr>
<td><b>Beginners Prot.</td>
<td>: <font color="Red"><?php echo (PROTECTION/3600);?> hrs</font></b></td>
</tr>
<tr>
<td><b>Medal Interval</td>
<td>: <font color="Red"><?php if(MEDALINTERVAL >= 86400){ echo ''.(MEDALINTERVAL/86400).' Days'; } else if(MEDALINTERVAL < 86400){ echo ''.(MEDALINTERVAL/3600).' Hours'; } ?></font></b></td>
</tr>
<tr>
<td><b>Server Start</td>
<td>: <font color="Red"><?php echo START_DATE;?></font></b></td>
</tr>
</table>
</div>
