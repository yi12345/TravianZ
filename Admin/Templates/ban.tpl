<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       ban.tpl                                                     ##
##  Developed by:  Dzoki                                                       ##
##  Reworked:      aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<style>
	.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
</style>

<form action="" method="get">
	<input name="action" type="hidden" value="addBan">
	<table id="member" cellpadding="1" cellspacing="1">
		<thead>
			<tr>
				<th colspan="6">Ban</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>User ID</td>
				<td>
					<input type="text" class="fm" name="uid" value="<?php echo $_GET['uid'];?>">
				</td>
			</tr>
			<tr>
				<td>Reason</td>
				<td>
					<select name="reason" class="fm">
						<?php
							$arr = array('Pushing','Cheat','Hack','Bug','Bad Name','Multi Account','Swearing');
							foreach($arr as $r)
							{
								echo '<option value="'.$r.'">'.$r.'</option>';
							}
						?>
					</select>
				</td>
			</tr>
			<tr>
				<td>Duration</td>
				<td>
					<select name="time" class="fm">
						<?php
							$arr = array(1,2,5,10,12);
							foreach($arr as $r)
							{
								echo '<option value="'.($r*3600).'">'.$r.' hour/s</option>';
							}
							$arr2 = array(1,2,5,10,30,50,90);
							foreach($arr2 as $r)
							{
								echo '<option value="'.($r*3600*24).'">'.$r.' day/s</option>';
							}
							echo '<option value="">Forever</option>';
						?>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="on"><input type="image" src="../img/admin/b/ok1.gif" value="submit"></td>
			</tr>
		</tbody>
	</table>
</form>

<?php
$bannedUsers = $admin->search_banned();
?>

<table id="member" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<th colspan="6">Bannned Players (<?php echo count($bannedUsers); ?>)</th>
		</tr>
		<tr>
			<td><b>Username</b></td>
			<td><b>Length (from/to)</b></td>
			<td><b>Reason</b></td>
			<td></td>
		</tr>
		</thead>
		<tbody>
		<?php
			if($bannedUsers)
			{
				for ($i = 0; $i <= count($bannedUsers)-1; $i++)
				{
					if($database->getUserField($bannedUsers[$i]['uid'],'username',0)=='')
					{
						$name = $bannedUsers[$i]['name'];
						$link = "<span class=\"c b\">[".$name."]</span>";
					}
					else
					{
						$name = $database->getUserField($bannedUsers[$i]['uid'],'username',0);
						$link = '<a href="?p=player&uid='.$bannedUsers[$i]['uid'].'">'.$name.'<a/>';
					}
					if($bannedUsers[$i]['end'])
					{
						$end = date("d.m.y H:i",$bannedUsers[$i]['end']);
					}
					else
					{
						$end = '*';
					}
					echo '
					<tr>
						<td>'.$link.'</td>
						<td ><span class="f7">'.date("d.m.y H:i",$bannedUsers[$i]['time']).' - '.$end.'</td>
						<td>'.$bannedUsers[$i]['reason'].'</td>
						<td class="on"><a href="?action=delBan&uid='.$bannedUsers[$i]['uid'].'&id='.$bannedUsers[$i]['id'].'" onClick="return del(\'unban\',\''.$name.'\')"><img src="../img/Admin/del.gif" class="del" title="cancel" alt="cancel"></img></a></td>
					</tr>';
				}
			}
			else
			{
				echo '<tr><td colspan="6" class="on">No Players are Banned</td></tr>';
			}
		?>
	</tbody>
</table>