<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       village.php                                                 ##
##  Developed by:  Dzoki & Advocatie                                           ##
##  License:       TravianX Project                                            ##
##  Thanks to:     Dzoki & itay2277(Edit some additions)                       ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##  Improved:      aggenkeech                                                  ##
#################################################################################
error_reporting(0);
$id = $_GET['did'];
if(isset($id))
{
	$village = $database->getVillage($id);
	$user = $database->getUserArray($village['owner'],1);
	$coor = $database->getCoor($village['wref']);
	$varray = $database->getProfileVillages($village['owner']);
	$type = $database->getVillageType($village['wref']);
	$fdata = $database->getResourceLevel($village['wref']);
	$units = $database->getUnit($village['wref']);
	if($type == 1){ $typ = array(3,3,3,9); }
	elseif($type == 2){ $typ = array(3,4,5,6); }
	elseif($type == 3){ $typ = array(4,4,4,6); }
	elseif($type == 4){ $typ = array(4,5,3,6); }
	elseif($type == 5){ $typ = array(5,3,4,6); }
	elseif($type == 6){ $typ = array(1,1,1,15); }
	elseif($type == 7){ $typ = array(4,4,3,7); }
	elseif($type == 8){ $typ = array(3,4,4,7); }
	elseif($type == 9){ $typ = array(4,3,4,7); }
	elseif($type == 10){ $typ = array(3,5,4,6); }
	elseif($type == 11){ $typ = array(4,5,3,6); }
	elseif($type == 12){ $typ = array(5,4,3,6); }
	$refreshicon  = "<img src=\"data:image/png;base64,
	iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAIAAADpZ+PpAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
	jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEQSURBVChTY/gPBkevHfRrtjMsU9bJ05+5eylE
	kAGI117fKFsqYzhTNeSQY8xhP8vJJmVrK3eeP8Bw58kt03rTkHnRxdvrnKd4m83SCTtsaLZI1K7H
	mGH2xpnHLh+GGPL7/7/S1dVKU2Usd6roTZBh+Pj3M0QCCL78+Fw6v1ooR1myWU2zzpjBb2Ko8xwf
	91l+gRNDLzw6f+nepcsPrl14cPXW8wcMWqVaEYdtPdZYubUHww0AMs5cusygU68UtVUr87CPWbdd
	9Ly83TcO7Lq2I7ozoXfZTAalCjWZemnlaYo2u0wVFkoJdwoyZDOZNDi//vqRwbkjac+dC827p2h3
	Gyh3S6m0a0Qszrnz6RnQWAAxV5tT/VAiNQAAAABJRU5ErkJggg==\">";
	$refreshiconfrm = "data:image/png;base64,
	iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAIAAADpZ+PpAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
	jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAEQSURBVChTY/gPBkevHfRrtjMsU9bJ05+5eylE
	kAGI117fKFsqYzhTNeSQY8xhP8vJJmVrK3eeP8Bw58kt03rTkHnRxdvrnKd4m83SCTtsaLZI1K7H
	mGH2xpnHLh+GGPL7/7/S1dVKU2Usd6roTZBh+Pj3M0QCCL78+Fw6v1ooR1myWU2zzpjBb2Ko8xwf
	91l+gRNDLzw6f+nepcsPrl14cPXW8wcMWqVaEYdtPdZYubUHww0AMs5cusygU68UtVUr87CPWbdd
	9Ly83TcO7Lq2I7ozoXfZTAalCjWZemnlaYo2u0wVFkoJdwoyZDOZNDi//vqRwbkjac+dC827p2h3
	Gyh3S6m0a0Qszrnz6RnQWAAxV5tT/VAiNQAAAABJRU5ErkJggg==";
	class Generator
	{
		public function getMapCheck($wref)
		{
			return substr(md5($wref),5,2);
		}
	};
	$generator = new Generator;
	if($village and $user)
	{
		include("search2.tpl"); ?>
		<style>
			.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
		</style>
		<link href="../<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css">
		<br />

		<table id="profile" cellpadding="1" cellspacing="1" >
			<thead>
				<tr>
					<th colspan="3">Village Information</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Village owner:</td>
					<td><a href="admin.php?p=player&uid=<?php echo $village['owner']; ?>"><?php echo $user['username']; ?></a></td>
					<td>
						<form action="../GameEngine/Admin/mods/editVillageOwner.php" method="POST" accept-charset="UTF-8">
							<input type="hidden" name="did" value="<?php echo $_GET['did']; ?>">
							<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
							Owner(uid): <input class="text" type="text" name="newowner" value="<?php echo $user['id']; ?>"><input type="image" value="submit" src="../img/admin/edit.gif">
						</form>
					</td>
				<tr>
					<td>Village name:</td>
					<form action="../GameEngine/Admin/mods/renameVillage.php" method="POST" accept-charset="UTF-8">
						<input type="hidden" name="did" value="<?php echo $_GET['did']; ?>">
						<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
						<td colspan="2">
							<input class="text" type="text" name="villagename" value="<?php echo $village['name']; ?>"> <input type="image" value="submit" src="../img/admin/edit.gif">
						</td>
					</form>
				</tr>
				<tr>
					<td>Population <a href="admin.php?action=recountPop&did=<?php echo $_GET['did']; ?>"><?php echo $refreshicon; ?></a></td>
					<td colspan="2"><?php echo $village['pop'];?></td>
				</tr>
				<tr>
					<td>Coordinates:</td>
					<td colspan="2"><a href="<?php echo HOMEPAGE ?>karte.php?d=<?php echo $village['wref']; ?>&c=<?php echo $generator->getMapCheck($village['wref']); ?>" target="blank">(<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</a></td>
				</tr>
				<tr>
					<td>Village ID</td>
					<td colspan="2"><?php echo $village['wref'];?></td>
				</tr>
				<tr>
					<td>Field type</td>
					<td colspan="2">
						<?php
							for ($i = 0; $i <= 3; $i++)
							{
								$a = $i+1;
								if($i != 3)
								{
									echo $typ[$i].'x <img src="../img/admin/r/'.$a.'.gif">| ';
								}
								else
								{
									echo $typ[$i].'x <img src="../img/admin/r/'.$a.'.gif"> ';
								}
							}
						?>
					</td>
				</tr>
			</tbody>
		</table>

		<table id="member">
			<thead>
				<tr>
					<th colspan="8">Resources</th>
				</tr>
				<tr>
					<td>Resource</td>
					<form action="../GameEngine/Admin/mods/recalcWH.php" method="POST" accept-charset="UTF-8">
					<input type="hidden" name="did" value="<?php echo $_GET['did']; ?>">
					<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
					<?php
						if($fdata['f'.$i.'t'] == 0)
						{
							$bu = "-";
						}
					?>
					<td colspan="2">Warehouse <input type="image" src="<?php echo $refreshiconfrm; ?>" value="submit"></form></td>
					<td>Production</td>
					<td><a href="admin.php?p=editResources&did=<?php echo $_GET['did']; ?>"><img src="../img/admin/edit.gif" title="Edit Resources and Capacity"></a></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img class="r1" src="../img/x.gif"> Lumber</td>
					<td><center><?php echo floor($village['wood']); ?></center></td>
					<td rowspan="3"><center><?php echo $village['maxstore'];?></center></td>
					<td><center>???</td>
					<td><a href="admin.php?p=editResources&did=<?php echo $_GET['did']; ?>"><img src="../img/admin/edit.gif" title="Edit Resources and Capacity"></a></td>
				</tr>
				</tr>
				<tr>
					<td><img class="r2" src="../img/x.gif"> Clay</td>
					<td><center><?php echo floor($village['clay']); ?></center></td>
					<td><center>???</center></td>
					<td><a href="admin.php?p=editResources&did=<?php echo $_GET['did']; ?>"><img src="../img/admin/edit.gif" title="Edit Resources and Capacity"></a></td>
				</tr>
				<tr>
					<td><img class="r3" src="../img/x.gif"> Iron</td>
					<td><center><?php echo floor($village['iron']); ?></center></td>
					<td><center>???</center></td>
					<td><a href="admin.php?p=editResources&did=<?php echo $_GET['did']; ?>"><img src="../img/admin/edit.gif" title="Edit Resources and Capacity"></a></td>
				</tr>
				<tr>
					<td><img class="r4" src="../img/x.gif"> Crop</td>
					<td><center><?php echo floor($village['crop']); ?></center></td>
					<td><center><?php echo $village['maxcrop'];?></center></td>
					<td><center>???</center></td>
					<td><a href="admin.php?p=editResources&did=<?php echo $_GET['did']; ?>"><img src="../img/admin/edit.gif" title="Edit Resources and Capacity"></a></td>
				</tr>
			</tbody>
		</table>


		<table id="member">
			<thead>
				<tr>
					<th colspan="5">Village Expansion</th>
				</tr>
				<tr>
					<td class="hab">Village</td>
					<td class="hab">Inhabitants</td>
					<td class="hab">CP Production</td>
				</tr>
			</thead>
			<tbody>
				<?php
					for($e=1; $e<4; $e++)
					{
						$exp = $village['exp'.$e.''];
						if($exp['wref'] == 0)
						{
							echo '
								<tr>
									<td class="hab"><center> - </center></td>
									<td class="hab"><center> - </center></td>
									<td class="hab"><center> - </center></td>
								</tr>';
						}
						else
						{
							$vill = $database->getVillage($exp);
							$link = '<a href="admin.php?=village&did='.$vill['wref'].'">'.$vill['name'].'</a>';
							echo '
								<tr>
									<td class="hab">'.$link.'</td>
									<td class="ra"><center>'.$vill['pop'].'<center></td>
									<td class="ra"><center>'.$vill['cp'].'</center></td>
								</tr>';
						}
					}
				?>
					</td>
				</tr>
			</tbody>
		</table>

		<table id="member" cellpadding="1" cellspacing="1" >
			<thead>
				<tr>
					<th colspan="6">Oases</th>
				</tr>
				<tr>
					<td class="ra"></td>
					<td class="hab">Name</td>
					<td class="hab">Coordinates</td>
					<td class="hab">Loyalty</td>
					<td class="hab">Resources</td>
				</tr>
			</thead>
			<tbody>
				<?php
				/*
					$oasisarray = $database->getOasis($id);
					$oases = count($oasisarray);
					for($o=0; $o<$oases; $o++)
					{
						$oasiscoor = $database->getCoor($oasisarray['$o']['wref']);
						$type = $oasisarray['type'];
						if($type==1) 	 { $type = '<img src="../img/admin/r/1.gif"> + 25%'; }
						elseif($type==2) { $type = '<img src="../img/admin/r/1.gif"> + 25%'; }
						elseif($type==3) { $type = '<img src="../img/admin/r/1.gif"> + 25%<br /><img src="../img/admin/r/4.gif"> + 25%'; }
						elseif($type==4) { $type = '<img src="../img/admin/r/2.gif"> + 25%'; }
						elseif($type==5) { $type = '<img src="../img/admin/r/2.gif"> + 25%'; }
						elseif($type==6) { $type = '<img src="../img/admin/r/2.gif"> + 25%<br /><img src="../img/admin/r/4.gif"> + 25%'; }
						elseif($type==7) { $type = '<img src="../img/admin/r/3.gif"> + 25%'; }
						elseif($type==8) { $type = '<img src="../img/admin/r/3.gif"> + 25%'; }
						elseif($type==9) { $type = '<img src="../img/admin/r/3.gif"> + 25%<br /><img src="../img/admin/r/4.gif"> + 25%'; }
						elseif($type==10){ $type = '<img src="../img/admin/r/4.gif"> + 25%'; }
						elseif($type==11){ $type = '<img src="../img/admin/r/4.gif"> + 25%'; }
						elseif($type==12){ $type = '<img src="../img/admin/r/4.gif"> + 50%'; }
						echo '
						<tr>
							<td></td>
							<td>'.$oasisarray['name'].'</td>
							<td><a href="../karte.php?d='.$oasisarray['wref'].'&c='.$generator->getMapCheck($oasisarray['wref']).'" target="blank">('.$oasiscoor['x'].'|'.$oasiscoor['y'].')</a></td>
							<td>'.$oasisarray['loyalty'].'</td>
							<td>'.$type.'</td>
						</tr>';
					} */
				?>
				<?php
					$oasisarray = $database->getOasis($village['wref']);
					$isthere = count($oasisarray);
					if($isthere >0)
					{
						$query = "SELECT * FROM ".TB_PREFIX."odata WHERE conqured = ".$village['wref']."";
						$result = mysql_query($query);
						while($row = mysql_fetch_assoc($result))
						{
							$oasiswref = $row['wref'];
							$oasisx = mysql_result(mysql_query("SELECT x FROM ".TB_PREFIX."wdata WHERE id = ".$oasiswref.""), 0);
							$oasisy = mysql_result(mysql_query("SELECT y FROM ".TB_PREFIX."wdata WHERE id = ".$oasiswref.""), 0);

							$type = $row['type'];
							if($type==1) 	 { $type = '<img src="../img/admin/r/1.gif"> + 25%'; }
							elseif($type==2) { $type = '<img src="../img/admin/r/1.gif"> + 25%'; }
							elseif($type==3) { $type = '<img src="../img/admin/r/1.gif"> + 25%<br /><img src="../img/admin/r/4.gif"> + 25%'; }
							elseif($type==4) { $type = '<img src="../img/admin/r/2.gif"> + 25%'; }
							elseif($type==5) { $type = '<img src="../img/admin/r/2.gif"> + 25%'; }
							elseif($type==6) { $type = '<img src="../img/admin/r/2.gif"> + 25%<br /><img src="../img/admin/r/4.gif"> + 25%'; }
							elseif($type==7) { $type = '<img src="../img/admin/r/3.gif"> + 25%'; }
							elseif($type==8) { $type = '<img src="../img/admin/r/3.gif"> + 25%'; }
							elseif($type==9) { $type = '<img src="../img/admin/r/3.gif"> + 25%<br /><img src="../img/admin/r/4.gif"> + 25%'; }
							elseif($type==10){ $type = '<img src="../img/admin/r/4.gif"> + 25%'; }
							elseif($type==11){ $type = '<img src="../img/admin/r/4.gif"> + 25%'; }
							elseif($type==12){ $type = '<img src="../img/admin/r/4.gif"> + 50%'; }
							echo "
							<tr>
								<td><a href=\"?delOas&oid=\" onClick=\"return del(\'oas\','.$varray[$i]['wref'].');\"><img src=\"../img/admin/del.gif\"></a></td>
								<td class=\"hab\">".$row['name']."</td>
								<td class=\"hab\"><a href=\"../karte.php?d=".$row['wref']."&c=".$generator->getMapCheck($row['wref'])."\" target=\"blank\">(".$oasisx."|".$oasisy.")</a></td>
								<td class=\"hab\">".$row['loyalty']."%</td>
								<td class=\"hab\">$type</td>
							</tr>";
						}	  ##<td class=\"hab\">".$row['wood']." <img src=\"../img/admin/r/1.gif\"><br />".$row['clay']." <img src=\"../img/admin/r/2.gif\"><br />".$row['iron']." <img src=\"../img/admin/r/3.gif\"><br />".$row['crop']." <img src=\"../img/admin/r/4.gif\"></td>
					}
					elseif($isthere ==0)
					{
						echo '<td colspan="5"><center>This village has no oases</center></td>';
					}
				?>
			</tbody>
		</table>

		<?php
			include('troops.tpl');
		?>

		<?php
			##include('troopUpgrades.tpl');
		?>


		<a href="admin.php?p=editVillage&did=<?php echo $_GET['did']; ?>" title="Edit Village">
		<div id="content" class="village1" style="min-height: 264px;">
			<div id="village_map" class="f<?php echo $database->getVillageType($village['wref']); ?>" style="float: left;">
				<?php
					for($f = 1; $f <19; $f++)
					{
						$gid = $fdata['f'.($f).'t'];
						$level = $fdata['f'.($f)];
						echo "<img src=\"../img/x.gif\" class=\"reslevel rf".$f." level".$level."\">";
					}
				?>
			</div>
			<div id="map_details">
				<!--<table>
					<tbody>
						<tr>
							<td class="ico"><img class="r1" src="../img/x.gif"></td>
							<td class="res">Lumber:</td>
							<td class="num">Coming</td>
							<td class="per">/hr</td>
						</tr>
						<tr>
							<td class="ico"><img class="r2" src="../img/x.gif"></td>
							<td class="res">Clay:</td>
							<td class="num">Coming</td>
							<td class="per">/hr</td>
						</tr>
						<tr>
							<td class="ico"><img class="r3" src="../img/x.gif"></td>
							<td class="res">Iron:</td>
							<td class="num">Coming</td>
							<td class="per">/hr</td>
						</tr>
						<tr>
							<td class="ico"><img class="r4" src="../img/x.gif"></td>
							<td class="res">Crop:</td>
							<td class="num">Coming</td>
							<td class="per">/hr</td>
						</tr>
					</tbody>
				</table> -->
			</div>
		</div></a>
	<div id="content" class="village2" style="padding: 0; margin-left: -20px;">
		<h1><?php echo $village['name']; ?></h1>
		<div id="village_map" class="d2_0">
			<?php
			for($b =1; $b <21; $b++)
			{
				$gid = $fdata['f'.($b + 18).'t'];
				if($gid >0)
				{
					echo "<img src=\"../img/x.gif\" class=\"building d".$b." g".$gid."\">";
				}
				elseif($gid ==0)
				{
					echo "<img src=\"../img/x.gif\" class=\"building d".$b." iso\">";
				}
			}
			$rp=16;
			$rplevel = $fdata['f'.$rp];
			if($rplevel > 0)
			{
				echo "<img src=\"../img/x.gif\" class=\"dx1 g16\">";
			}
			elseif($rplevel ==0)
			{
				echo "<img src=\"../img/x.gif\" class=\"dx1 g16e\">";
			}
			?>
			<div id="levels" class="on">
				<?php
					for($b =1; $b <21; $b++)
					{
						$level = $fdata['f'.($b + 18)];
						if($level >0)
						{
							echo "<div class=\"d$b\">$level</div>";
						}
					}
					if($rplevel >0)
					{
						echo "<div class=\"l39\">".$fdata['f'.($b + 18)]."</div>";
					}
				?>
	</div>
</div>
</div>


<!--<table id="member" cellpadding="1" cellspacing="1" >
	<thead>
		<tr>
			<th colspan="4">Resources</th>
		</tr>

		<tr>
			<td class="hab">Resource</td>
			<td class="hab" colspan="2">Warehouse</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><img src="../img/admin/r/1.gif"> Lumber</td>
			<td class="hab"><?php echo floor($village['wood']);?></td>
			<td class="hab" rowspan="3"><?php echo $village['maxstore'];?></td>
		</tr>
		<tr>
			<td><img src="../img/admin/r/2.gif"> Clay</td>
			<td class="hab"><?php echo floor($village['clay']);?></td>
		</tr>
		<tr>
			<td><img src="../img/admin/r/3.gif"> Iron</td>
			<td class="hab"><?php echo floor($village['iron']);?></td>
		</tr>
		<tr>
			<td><img src="../img/admin/r/4.gif"> Crop</td>
			<td class="hab"><?php echo floor($village['crop']);?></td>
			<td class="hab"><?php echo $village['maxcrop'];?></td>
		</tr>
	</tbody>
</table>-->









<table id="member" cellpadding="1" cellspacing="1" >
	<thead>
		<tr>
			<th colspan="5">Buildings</th>
		</tr>
		<tr>
			<td class="on">ID</td>
			<td class="on">GID</td>
			<td class="hab">Name</td>
			<td class="on">Level</td>
			<td class="on">Edit</td>
		</tr>
	</thead>
	<tbody>
	<?php
	for ($i = 1; $i <= 40; $i++)
	{
		if($fdata['f'.$i.'t'] == 0)
		{
			$bu = "-";
		}
		else
		{
			$bu = $funct->procResType($fdata['f'.$i.'t']);
		}
		echo '
			<tr>
				<td class="on">'.$i.'</td>
				<td class="on">'.$fdata['f'.$i.'t'].'</td>
				<td class="hab">'.$bu.'</td>
				<td class="on">'.$fdata['f'.$i].'</td>
				<td class="on"><a href="admin.php?p=editVillage&did='.$_GET['did'].'"><img src="../img/admin/edit.gif" title="Edit Building & Level"></a></td>
			</tr>';
	}
	?>
	</tbody>
</table>

<br /><br />

	<a href="admin.php?p=villagelog&did=<?php echo $_GET['did']; ?>">Village Build Log</a>
	<br />
</div>
<?php
}
else
{
	include("404.tpl");
}
}
?>