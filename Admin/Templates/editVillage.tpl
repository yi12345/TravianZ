<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       editVillage.tpl                                             ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################

$id = $_GET['did'];
$village = $database->getVillage($id);
$user = $database->getUserArray($village['owner'],1);
$coor = $database->getCoor($village['wref']);
$varray = $database->getProfileVillages($village['owner']);
$type = $database->getVillageType($village['wref']);
$fdata = $database->getResourceLevel($village['wref']);
if(isset($id))
{
	include("search2.tpl"); ?>
	<link href="../<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css">
	<form action="../GameEngine/Admin/Mods/editBuildings.php" method="POST">
		<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
		<input type="hidden" name="id" value="<?php echo $_GET['did']; ?>" />
		<br />

		<a href="#" onclick="showStuff('instructions'); return false;">Show Instructions</a>
		<span id="instructions" style="display: none;">
			<h4>Building ID's (Position)</h4>
			<div id="content" class="village1" style="min-height: 264px;">
				<div id="village_map" class="f<?php echo $database->getVillageType($village['wref']); ?>" style="float: left;">
					<?php
						for($f = 1; $f <19; $f++)
						{
							##$gid = $fdata['f'.($f).'t'];
							##$level = $fdata['f'.($f)];
							echo "<img src=\"../img/x.gif\" class=\"reslevel rf".$f." level".$f."\">";
						}
					?>
				</div>
			</div>

			<div id="content" class="village2" style="padding: 0; margin-left: -20px;">
				<div id="village_map" class="d2_0">
					<?php
					for($b =1; $b <21; $b++)
					{

						echo "<img src=\"../img/x.gif\" class=\"building d".$b." iso\">";
					}
					?>
					<div id="levels" class="on">
						<?php
							for($b =1; $b <21; $b++)
							{
								echo "<div class=\"d$b\">".($b + 18)."</div>";
							}
						?>
					</div>
				</div>
			</div>

			<table id="member">
				<thead>
					<tr>
						<th colspan="2">Buildings</th>
					</tr>
					<tr>
						<td>GID</td>
						<td>Name</td>
					</tr>
				</thead>
				<tbody>
					<?php
						for($i =1; $i<=39; $i++)
						{
							$bu = $funct->procResType($i);
							echo '
							<tr>
								<td class="on">'.$i.'.</td>
								<td class="on">'.$bu.'</td>
							</tr>';
						}
					?>
					<tr>
						<td class="on">41.</td>
						<td class="on">Horse Drinking Trough</td>
					</tr>
				</tbody>
			</table>
			<a href="#" onclick="hideStuff('instructions'); return false;">Hide Instructions</a>
		</span>

		<br />

		<table id="member" cellpadding="1" cellspacing="1" >
			<thead>
				<tr>
					<th colspan="4">Modify Buildings</th>
				</tr>
				<tr>
					<td class="on">ID</td>
					<td class="on">GID</td>
					<td class="hab">Name</td>
					<td class="on">Level</td>
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
							<td class="on"><input class="fm" name="id'.$i.'gid" value="'.$fdata['f'.$i.'t'].'"></td>
							<td class="hab">'.$bu.'</td>
							<td class="on"><input class="fm" name="id'.$i.'level" value="'.$fdata['f'.$i].'"></td>
						</tr>';
				}
				?>
			</tbody>
		</table>

		<br /><br />
		<center><input type="image" src="../img/admin/b/ok1.gif" value="submit"></center>

		<br />
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
		</div>
		</div>
		<br />

		<br /><br />

		<div id="content" class="village2">
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
	</form><?php
}
else
{
include("404.tpl");
}
?>