<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       config.tpl                                                  ##
##  Developed by:  Dzoki                                                       ##
##  Rework by:     ronix                                                       ##
##  License:       TravianZ Project                                            ##
##  Copyright:     TravianZ (c) 2010-2014. All rights reserved.                ##
##                                                                             ##
#################################################################################
if(!isset($_SESSION)) session_start();
if($_SESSION['access'] < 9) die(ACCESS_DENIED_ADMIN);
?>
<style>
	.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
</style>
<h2><center>Server Configuration</center></h2>
<table id="member">
	<thead>
		<tr>
		<th>伺服器設定 <a href="admin.php?p=editServerSet"><img src="../img/admin/edit.gif" title="Edit Setting"></a></th>
		</tr>
	</thead>
</table>

<table id="profile">
	<tr>
		<td class="b">變數</td>
		<td class="b">內容</td>
	</tr>
	<tr>
		<td>伺服器名稱</td>
		<td><?php echo SERVER_NAME;?></td>
	</tr>
	<tr>
		<td>伺服器啟動時間</td>
		<td><?php echo "日期:".START_DATE." 時間:".START_TIME; //date("d.m.y H:i",COMMENCE);?></td>
	</tr>
	<tr>
		<td>伺服器時區</td>
		<td><?php echo TIMEZONE;?></td>
	</tr>
        	<td>語言</td>
        	<td><?php if(LANG == 'en'){ echo "English"; } ?>
        	<?php if(LANG == 'nl'){ echo "Dutch"; } ?>
        	<?php if(LANG == 'es'){ echo "Spain"; } ?>
        	<?php if(LANG == 'my'){ echo "Malay"; } ?>
        	<?php if(LANG == 'ru'){ echo "Russian"; } ?>
        	</td>
	<tr>
		<td>伺服器速度</td>
		<td><?php echo ''.SPEED.'x';?></td>
	</tr>
	<tr>
		<td>Troop Speed</td>
		<td><?php echo INCREASE_SPEED;?>x</td>
	</tr>
	<tr>
		<td>Evasion Speed</td>
		<td><?php echo EVASION_SPEED;?></td>
	</tr>
	<tr>
		<td>Storage Multipler</td>
		<td><?php echo STORAGE_MULTIPLIER;?></td>
	</tr>
	<tr>
		<td>Trader Capacity</td>
		<td><?php echo TRADER_CAPACITY;?></td>
	</tr>
	<tr>
		<td>Cranny Capacity</td>
		<td><?php echo CRANNY_CAPACITY;?></td>
	</tr>
	<tr>
		<td>Trapper Capacity</td>
		<td><?php echo TRAPPER_CAPACITY;?></td>
	</tr>
	<tr>
		<td>Natars Units Multiplier</td>
		<td><?php echo NATARS_UNITS;?></td>
	</tr>
	<tr>
		<td>地圖尺寸</td>
		<td><?php echo WORLD_MAX;?>x<?php echo WORLD_MAX;?></td>
	</tr>
	<tr>
		<td>Village Expanding Speed</td>
		<td><?php if(CP == 0){ echo "Fast"; } else if(CP == 1){ echo "Slow"; } ?></td>
	</tr>
	<tr>
		<td>Beginners Protection</td>
		<td><?php echo (PROTECTION/3600);?> hour/s</td>
	</tr>
	<tr>
		<td>Register Open</td>
		<td><?php if(REG_OPEN == true) { echo "<b><font color='blue'>True</font></b>"; } else { echo "<b><font color='Red'>False</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Activation Mail</td>
		<td><?php if(AUTH_EMAIL == true) { echo "<b><font color='Green'>啟用</font></b>"; } else { echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Quest</td>
		<td><?php if(QUEST == true) { echo "<b><font color='Green'>啟用</font></b>"; } else { echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Quest Type</td>
		<td><?php if(QTYPE == 25) { echo "<b><font color='Blue'>Travian Official</font></b>"; } else { echo "<b><font color='Blue'>TravianZ Extended</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Demolish - Level required</td>
		<td><?php echo DEMOLISH_LEVEL_REQ; ?></td>
	</tr>
	<tr>
		<td>World Wonder - Statistics</td>
		<td><?php if(WW == true) { echo "<b><font color='Green'>啟用</font></b>"; } else if(WW == false) { echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td><b><font color='#71D000'>P</font><font color='#FF6F0F'>l</font><font color='#71D000'>u</font><font color='#FF6F0F'>s</font></b> account duration</td>
		<td><?php if(PLUS_TIME >= 86400){ echo ''.(PLUS_TIME/86400).' Days'; } else if(PLUS_TIME < 86400){ echo ''.(PLUS_TIME/3600).' Hours'; } ?></td>
	</tr>
	<tr>
		<td>+25% production duration</td>
		<td><?php if(PLUS_PRODUCTION >= 86400){ echo ''.(PLUS_PRODUCTION/86400).' Days'; } else if(PLUS_PRODUCTION < 86400){ echo ''.(PLUS_PRODUCTION/3600).' Hours'; } ?></td>
	</tr>
	<tr>
		<td>Nature Troops Regeneration Time</td>
		<td><?php if(NATURE_REGTIME >= 86400){ echo ''.(NATURE_REGTIME/86400).' Days'; } else if(NATURE_REGTIME < 86400){ echo ''.(NATURE_REGTIME/3600).' Hours'; } ?></td>
	</tr>
    <tr>
		<td>Medal Interval</td>
		<td><?php if(MEDALINTERVAL >= 86400){ echo ''.(MEDALINTERVAL/86400).' Days'; } else if(MEDALINTERVAL < 86400){ echo ''.(MEDALINTERVAL/3600).' Hours'; } ?></td>
    </tr>
	<tr>
		<td>Tourn Threshold</td>
		<td><?php echo TS_THRESHOLD;?></td>
	</tr>
	<tr>
		<td>Great Workshop</td>
		<td><?php if(GREAT_WKS == true) { echo "<b><font color='Green'>啟用</font></b>"; } else { echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Show Natars in Statistics</td>
		<td><?php if(SHOW_NATARS == true) { echo "<b><font color='blue'>True</font></b>"; } else { echo "<b><font color='Red'>False</font></b>"; } ?></td>
	<tr>
		<td>和平系統</td>
		<td>
			<?php
			$peace_array=array("None","Normal","Christmas","New Year","Easter");
			echo $peace_array[intval(PEACE)];
			?>
		</td>
	</tr>
	<tr>
		<td>Graphic Pack</td>
		<td><?php if(GP_ENABLE == true) { echo "<b><font color='Green'>啟用</font></b>"; } else { echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
	<tr>
		<td>錯誤顯示</td>
		<td><b><?php echo (ERROR_REPORT=="error_reporting (0);")? "否": "是";?></b></td>
	</tr>
	</table>

	<table id="member">
		<thead>
			<tr>
				<th>Log 設定 <a href="admin.php?p=editLogSet"><img src="../img/admin/edit.gif" title="Edit Log Setting"></a></th>
			</tr>
		</thead>
	</table>

  <table id="profile">
  <tr>
		<td class="b">變數</td>
		<td class="b">內容</td>
	</tr>
	<tr>
		<td>記錄建築行為</td>
		<td><?php if(LOG_BUILD == true) { echo "<b><font color='Green'>啟用</font></b>"; } else if(LOG_BUILD == false){ echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>記錄科技研發</td>
		<td><?php if(LOG_TECH == true) { echo "<b><font color='Green'>啟用</font></b>"; } else if(LOG_TECH == false){ echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>記錄登入行為</td>
		<td><?php if(LOG_LOGIN == true) { echo "<b><font color='Green'>啟用</font></b>"; } else if(LOG_LOGIN == false){ echo "<b><font color='Red'>停用</font></b>";  } ?></td>
	</tr>
	<tr>
		<td>紀錄黃金</td>
		<td><?php if(LOG_GOLD_FIN == true) { echo "<b><font color='Green'>啟用</font></b>"; } else if(LOG_GOLD_FIN == false){ echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>記錄管理行為</td>
		<td><?php if(LOG_ADMIN == true) { echo "<b><font color='Green'>啟用</font></b>"; } else if(LOG_ADMIN == false){ echo "<b><font color='Red'>停用</font></b>";  } ?></td>
	</tr>
	<tr>
		<td>記錄戰爭行為</td>
		<td><?php if(LOG_WAR == true) {	echo "<b><font color='Green'>啟用</font></b>"; } else if(LOG_WAR == false){ echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>記錄市場行為</td>
		<td><?php if(LOG_MARKET == true) { echo "<b><font color='Green'>啟用</font></b>"; } else if(LOG_MARKET == false){ echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>記錄非法行為</td>
		<td><?php if(LOG_ILLEGAL == true) { echo "<b><font color='Green'>啟用</font></b>"; } else if(LOG_ILLEGAL == false){ echo "<b><font color='Red'>停用</font></b>";  } ?></td>
	</tr>
</table>

<table id="member">
	<thead>
		<tr>
			<th>資訊設定<a href="admin.php?p=editNewsboxSet"><img src="../img/admin/edit.gif" title="Edit 資訊 Setting"></a></th>
		</tr>
	</thead>
</table>

<table id="profile">
	<tr>
		<td class="b">變數</td>
		<td class="b">內容</td>
	</tr>
	<tr>
		<td>資訊 1</td>
		<td><?php if(NEWSBOX1 == true){ echo "<b><font color='Green'>啟用</font></b>"; } else if(NEWSBOX1 == false){ echo "<b><font color='Red'>停用</font></b>"; } ?> </td>
	</tr>
	<tr>
		<td>資訊 2</td>
		<td><?php if(NEWSBOX2 == true){ echo "<b><font color='Green'>啟用</font></b>"; } else if(NEWSBOX2 == false){ echo "<b><font color='Red'>停用</font></b>"; } ?> </td>
	</tr>
	<tr>
		<td>資訊 3</td>
		<td><?php if(NEWSBOX3 == true){ echo "<b><font color='Green'>啟用</font></b>"; } else if(NEWSBOX3 == false){ echo "<b><font color='Red'>停用</font></b>"; } ?> </td>
	</tr>
	<tr>
	<!--<td>Home 1</td>
		<td><?php if(HOME1 == true){ echo "<b><font color='Green'>啟用</font></b>"; } else if(HOME1 == false){ echo "<b><font color='Red'>停用</font></b>"; } ?> </td>
	</tr>
	<tr>
	<td>Home 2</td>
		<td><?php if(HOME2 == true){ echo "<b><font color='Green'>啟用</font></b>"; } else if(HOME2 == false){ echo "<b><font color='Red'>停用</font></b>"; } ?> </td>
	</tr>
	<tr>
	<td>Home 3</td>
		<td><?php if(HOME3 == true){ echo "<b><font color='Green'>啟用</font></b>"; } else if(HOME3 == false){ echo "<b><font color='Red'>停用</font></b>"; } ?> </td>
	</tr>-->
</table>

<table id="member">
	<thead>
		<tr>
			<th>SQL 設定</th>
		</tr>
	</thead>
</table>

<table id="profile">
	<tr>
		<td class="b">變數</td>
		<td class="b">內容</td>
	</tr>
	<tr>
		<td>主機名稱</td>
		<td><?php echo SQL_SERVER;?></td>
	</tr>
	<tr>
		<td>DB 使用者</td>
		<td><?php echo SQL_USER;?></td>
	</tr>
	<tr>
		<td>DB 密碼</td>
		<td>*********</td>
	</tr>
	<tr>
		<td>DB 名稱</td>
		<td><?php echo SQL_DB;?></td>
	</tr>
	<tr>
		<td>Table 前綴</td>
		<td><?php echo TB_PREFIX;?></td>
	</tr>
	<tr>
		<td>DB 類型</td>
		<td><?php if(DB_TYPE == 0) { echo "MYSQL"; } else if(DB_TYPE == 1) { echo "MYSQLi"; } ?></td>
	</tr>
</table>

<table id="member">
  <thead>
		<tr>
			<th>額外設定 <a href="admin.php?p=editExtraSet"><img src="../img/admin/edit.gif" title="Edit Extra Settings"></a></th>
		</tr>
	</thead>
</table>

<table id="profile">
	<tr>
		<td class="b">變數</td>
		<td class="b">內容</td>
	</tr>
	<tr>
		<td>限制郵箱</td>
		<td><?php if(LIMIT_MAILBOX == true){ echo "<b><font color='Green'>啟用</font></b>"; } else if(LIMIT_MAILBOX == false){ echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>最大郵件數量</td>
		<td><?php if(LIMIT_MAILBOX == true){ echo MAX_MAIL; } else if(LIMIT_MAILBOX == false){ echo "<font color='Gray'>郵件數量限制停用</font>"; } ?></td>
	</tr>
</table>

<table id="member">
	<thead>
		<tr>
			<th>管理資訊 <a href="admin.php?p=editAdminInfo"><img src="../img/admin/edit.gif" title="Edit Admin Info"></a></th>
		</tr>
	</thead>
</table>
<table id="profile">
  <tr>
		<td class="b">變數</td>
		<td class="b">內容</td>
	</tr>
	<tr>
		<td>管理員郵件位址</td>
		<td><?php if(ADMIN_EMAIL == ''){ echo "<b><font color='Red'>沒有指定管理員郵件位址!</b></font>"; } else if(ADMIN_EMAIL != ''){ echo ADMIN_EMAIL; } ?></td>
	</tr>
	<tr>
		<td>管理員名稱</td>
		<td><?php if(ADMIN_NAME == ''){ echo "<b><font color='Red'>沒有指定管理員名稱!</b></font>"; } else if(ADMIN_NAME != ''){ echo ADMIN_NAME; } ?></td>
	</tr>
	<tr>
		<td>管理員參與排名</td>
		<td><?php if(INCLUDE_ADMIN == true){ echo "<b><font color='Green'>啟用</font></b>"; } else if(INCLUDE_ADMIN == false){ echo "<b><font color='Red'>停用</font></b>"; } ?></td>
	</tr>
</table>

<?php
function define_array( $array, $keys = NULL )
{
	foreach( $array as $key => $value )
	{
		$keyname = ($keys ? $keys . "_" : "") . $key;
		if( is_array( $array[$key] ) )
			define_array( $array[$key], $keyname );
		else
			define( $keyname, $value );
	}
}
//define_array($array);
?>
