<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       movement.tpl                                                ##
##  Developed by:  Dzoki                                                       ##
##  Updated by:    Shadow                                                      ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

$aantal = (count($database->getMovement(4,$village->wid,1))+count($database->getMovement(3,$village->wid,1))+count($database->getMovement(3,$village->wid,0))+count($database->getMovement(7,$village->wid,1))+count($database->getMovement(5,$village->wid,0))+count($database->getMovement(6,$village->wid,0))-count($database->getMovement(8,$village->wid,1))-count($database->getMovement(9,$village->wid,0)));

if($aantal > 0){
	echo	'<table id="movements" cellpadding="1" cellspacing="1"><thead><tr><th colspan="3">'.TROOP_MOVEMENTS.'</th></tr></thead><tbody>';
}

$NextArrival = array();
$NextArrival1 = array();
$NextArrival2 = array();
$NextArrival3 = array();

/* Units coming back from Reinf,attack,raid,evasion or reinf to my town */
$aantal = count($database->getMovement(4,$village->wid,1))+count($database->getMovement(7,$village->wid,1));
$aantal2 = $database->getMovement(4,$village->wid,1);
$aantal3 = $database->getMovement(7,$village->wid,1);
$aantal4 = count($database->getMovement(3,$village->wid,1));
$lala = $aantal4;
$aantal5 = $database->getMovement(3,$village->wid,1);
for($i=0;$i<$aantal4;$i++){
	if(($aantal5[$i]['attack_type']==1) or ($aantal5[$i]['attack_type']==3) or ($aantal5[$i]['attack_type']==4)) { $lala -= 1; }
}
$aantal = $aantal+$lala;
if($aantal > 0){
	foreach($aantal2 as $receive) {
		$action = 'def1';
		$aclass = 'd1';
		$title = ''.ARRIVING_REINF_TROOPS.'';
		$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
		$NextArrival[] = $receive['endtime'];
	}
	foreach($aantal3 as $receive) {
		$action = 'def1';
		$aclass = 'd1';
		$title = ''.ARRIVING_REINF_TROOPS.'';
		$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
		$NextArrival[] = $receive['endtime'];
	}
	foreach($aantal5 as $receive) {
	if ($receive['attack_type'] == 2) {
		$action = 'def1';
		$aclass = 'd1';
		$title = ''.OWN_REINFORCING_TROOPS.'';
		$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
		$NextArrival[] = $receive['endtime'];
	}
	}
	echo '<tr><td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
	<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">in&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat(min($NextArrival)-time()).'</span>&nbsp;'.HOURS.'</div></div></td></tr>';
	$timer += 1;
}

/* attack/raid on you! */
$aantal = count($database->getMovement(3,$village->wid,1));
$aantal1 = count($database->getMovement(3,$village->wid,1));
$aantal2 = $database->getMovement(3,$village->wid,1);
for($i=0;$i<$aantal1;$i++){
	if($aantal2[$i]['attack_type'] == 2) { $aantal -= 1; }
	if($aantal2[$i]['attack_type'] == 1) { $aantal -= 1; }
}

if($aantal > 0){
	if(!empty($NextArrival1)) { reset($NextArrival1); }
	foreach($aantal2 as $receive) {
		if ($receive['attack_type'] != 2 && $receive['attack_type'] != 1) {
			$action = 'att1';
			$aclass = 'a1';
			$title = ''.OWN_ATTACKING_TROOPS.'';
			$short = ''.ATTACK.'';
			$NextArrival1[] = $receive['endtime'];
		}
	}
	echo '<tr><td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
	<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">in&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat(min($NextArrival1)-time()).'</span>&nbsp;'.HOURS.'</div></div></td></tr>';
	$timer += 1;
}

/* on attack, raid */
$aantal = count($database->getMovement(3,$village->wid,0));
$aantal1 = count($database->getMovement(3,$village->wid,0));
$aantal2 = $database->getMovement(3,$village->wid,0);
for($i=0;$i<$aantal1;$i++){
	if($aantal2[$i]['attack_type'] == 2) { $aantal -= 1; }
}
if($aantal > 0){
	if(!empty($NextArrival2)) { reset($NextArrival2); }
		foreach($aantal2 as $receive) {
			if ($receive['attack_type'] != 2) {
				$action = 'att2';
				$aclass = 'a2';
				$title = ''.OWN_ATTACKING_TROOPS.'';
				$short = ''.ATTACK.'';
				$NextArrival2[] = $receive['endtime'];
			}
		}
	echo '<tr><td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
	<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">in&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat(min($NextArrival2)-time()).'</span>&nbsp;'.HOURS.'</div></div></td></tr>';
	$timer += 1;
}

/* Units send to reinf. (to other town) */
$aantal = count($database->getMovement(3,$village->wid,0));
$lala=$aantal;
$aantal2 = $database->getMovement(3,$village->wid,0);
for($i=0;$i<$aantal;$i++){
	if(($aantal2[$i]['attack_type']==1) or ($aantal2[$i]['attack_type']==3) or ($aantal2[$i]['attack_type']==4)) { $lala -= 1; }
}
if($lala > 0){
	if(!empty($NextArrival3)) { reset($NextArrival3); }
		foreach($aantal2 as $receive) {
			if ($receive['attack_type'] == 2) {
				$action = 'def2';
				$aclass = 'd2';
				$title = ''.OWN_REINFORCING_TROOPS.'';
				$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
				$NextArrival3[] = $receive['endtime'];
			}
		}
	echo '<tr><td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
	<td><div class="mov"><span class="'.$aclass.'">'.$lala.'&nbsp;'.$short.'</span></div><div class="dur_r">in&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat(min($NextArrival3)-time()).'</span>&nbsp;'.HOURS.'</div></div></td></tr>';
	$timer += 1;
}

/* Found NEW VILLAGE by Shadow */

$aantal = count($database->getMovement(5,$village->wid,0));
$aantal2 = $database->getMovement(5,$village->wid,0);
if($aantal > 0){
	if(!empty($NextArrival5)) { reset($NextArrival5); }	
			foreach($aantal2 as $receive) {
				$action = 'att3';
				$aclass = 'a3';
				$title = ''.FOUNDNEWVILLAGE.'';
				$short = ''.NEWVILLAGE.'';
				$NextArrival5[] = $receive['endtime'];
			}
			
	echo '<tr><td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
	<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>&nbsp;'.HOURS.'</div></div></td></tr>';
	$timer += 1;

}

/* Attacks on Oasis (to my oasis) by Shadow */

$aantal = count($database->getMovement(6,$village->wid,0));
$aantal2 = $database->getMovement(6,$village->wid,0);
if($aantal > 0){
	if(!empty($NextArrival6)) { reset($NextArrival6); }	
			foreach($aantal2 as $receive) {
				$action = 'att3';
				$aclass = 'a1';
				$title = ''.OASISATTACK.'';
				$short = ''.OASISATTACKS.'';
				$NextArrival6[] = $receive['endtime'];
			}
			
	echo '<tr><td class="typ"><a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a><span class="'.$aclass.'">&raquo;</span></td>
	<td><div class="mov"><span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span></div><div class="dur_r">&nbsp;<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>&nbsp;'.HOURS.'</div></div></td></tr>';
	$timer += 1;

}
