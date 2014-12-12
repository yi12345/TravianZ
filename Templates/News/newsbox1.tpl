<h5><img src="img/en/t2/newsbox1.gif" alt="newsbox 1"></h5>
<?php

$online = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users WHERE " . time() . "-timestamp < (60*10) AND tribe!=0 AND tribe!=4 AND tribe!=5"));


?>

<div class="news">
<table width="100%" border="0">
<tr>
<td align="left"><b>在線玩家</td>
<td>: <font color="Red"><?php echo $online ?> users</font></b></td>
</tr>
<tr>
<td><b>伺服器速度</td>
<td>: <font color="Red"><?php echo ''.SPEED.'x';?></font></b></td>
</tr>
<tr>
<td><b>行軍速度</td>
<td>: <font color="Red"><?php echo INCREASE_SPEED;?>x</font></b></td>
</tr>
<tr>
<td><b>閃避速度</td>
<td>: <font color="Red"><?php echo EVASION_SPEED;?></font></b></td>
</tr>
<tr>
<td><b>地圖大小</td>
<td>: <font color="Red"><?php echo WORLD_MAX;?>x<?php echo WORLD_MAX;?></font></b></td>
</tr>
<tr>
<td><b>村莊拓展速度</td>
<td>: <font color="Red"><?php if(CP == 0){ echo "Fast"; } else if(CP == 1){ echo "Slow"; } ?></font></b></td>
</tr>
<tr>
<td><b>新手保護</td>
<td>: <font color="Red"><?php echo (PROTECTION/3600);?> hrs</font></b></td>
</tr>
<tr>
<td><b>獎牌持續時間</td>
<td>: <font color="Red"><?php if(MEDALINTERVAL >= 86400){ echo ''.(MEDALINTERVAL/86400).' Days'; } else if(MEDALINTERVAL < 86400){ echo ''.(MEDALINTERVAL/3600).' Hours'; } ?></font></b></td>
</tr>
<tr>
<td><b>開服日期</td>
<td>: <font color="Red"><?php echo START_DATE;?></font></b></td>
</tr>
</table>
</div>
