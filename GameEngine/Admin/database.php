<?php
#################################################################################
##                                                                             ##
##              -= YOU MUST NOT REMOVE OR CHANGE THIS NOTICE =-                ##
##                                                                             ##
## --------------------------------------------------------------------------- ##
##                                                                             ##
##  Project:       TravianZ                                                    ##
##  Version:       05.03.2014                                                  ##
##  Filename:      GameEngine/Admin/database.php                               ##
##  Developed by:  Dzoki                                                       ##
##  Edited by:     Shadow and ronix                                            ##
##  License:       Creative Commons BY-NC-SA 3.0                               ##
##  Copyright:     TravianZ (c) 2014 - All rights reserved                     ##
##  URLs:          http://travian.shadowss/ro                                  ##
##  Source code:   https://github.com/Shadowss/TravianZ	                       ##
##                                                                             ##
#################################################################################
if(isset($gameinstall) && $gameinstall == 1){
include_once("../../GameEngine/config.php");
include_once("../../GameEngine/Data/buidata.php");
}else{
include_once("../GameEngine/Data/unitdata.php");
include_once("../GameEngine/Technology.php");
include_once("../GameEngine/Data/buidata.php");
}
class adm_DB {
	var $connection;

  function adm_DB(){
	global $database;
		$this->connection = mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS) or die(mysql_error());
		mysql_select_db(SQL_DB, $this->connection) or die(mysql_error());
	}

	function Login($username,$password){
		$q = "SELECT password FROM ".TB_PREFIX."users where username = '$username' and access >= ".MULTIHUNTER;
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		if($dbarray['password'] == md5($password)) {
			mysql_query("Insert into ".TB_PREFIX."admin_log values (0,'X','$username logged in (IP: <b>".$_SERVER['REMOTE_ADDR']."</b>)',".time().")");
			return true;
		}
		else {
			mysql_query("Insert into ".TB_PREFIX."admin_log values (0,'X','<font color=\'red\'><b>IP: ".$_SERVER['REMOTE_ADDR']." tried to log in with username <u> $username</u> but access was denied!</font></b>',".time().")");
			return false;
		}
	}

	function recountPopUser($uid){
	 global $database;
	 $villages = $database->getProfileVillages($uid);
	for ($i = 0; $i <= count($villages)-1; $i++) {
	  $vid = $villages[$i]['wref'];
	  $this->recountPop($vid);
	  $this->recountCP($vid);
	}
  }

    function recountPop($vid){
    global $database;
    $fdata = $database->getResourceLevel($vid);
    $popTot = 0;
    for ($i = 1; $i <= 40; $i++) {
        $lvl = $fdata["f".$i];
        $building = $fdata["f".$i."t"];
        if($building>0 && $lvl>0){
            $popTot += $this->buildingPOP($building,$lvl);
        }
    }

    $q = "UPDATE ".TB_PREFIX."vdata set pop = $popTot where wref = $vid";
    mysql_query($q, $this->connection);
  }

    function recountCP($vid){
    global $database;
    $fdata = $database->getResourceLevel($vid);
    $popTot = 0;
    for ($i = 1; $i <= 40; $i++) {
        $lvl = $fdata["f".$i];
        $building = $fdata["f".$i."t"];
        if($building>0 && $lvl>0){
            $popTot += $this->buildingCP($building,$lvl);
        }
    }
    $q = "UPDATE ".TB_PREFIX."vdata set cp = $popTot where wref = $vid";
    mysql_query($q, $this->connection);
    }

  function buildingPOP($f,$lvl){
    $name = "bid".$f;
    global $$name;
    $popT = 0;
    $dataarray = $$name;

    for ($i = 1; $i <= $lvl; $i++) {
        $popT += $dataarray[$i]['pop'];
    }
    return $popT;
  }

    function buildingCP($f,$lvl){
        $name = "bid".$f;
        global $$name;
        $popT = 0;
        $dataarray = $$name;

        for ($i = 1; $i <= $lvl; $i++) {
            $popT += $dataarray[$i]['cp'];
        }
        return $popT;
    }

	function getWref($x,$y) {
		$q = "SELECT id FROM ".TB_PREFIX."wdata where x = $x and y = $y";
		$result = mysql_query($q, $this->connection);
		$r = mysql_fetch_array($result);
		return $r['id'];
	}

	function AddVillage($post){
	global $database;
	  $wid = $this->getWref($post['x'],$post['y']);
	  $uid = $post['uid'];
	$status = $database->getVillageState($wid);
	$status = 0;
	if($status == 0){
	mysql_query("Insert into ".TB_PREFIX."admin_log values (0,".$_SESSION['id'].",'Added new village <b><a href=\'admin.php?p=village&did=$wid\'>$wid</a></b> to user <b><a href=\'admin.php?p=player&uid=$uid\'>$uid</a></b>',".time().")");
	  $database->setFieldTaken($wid);
		  $database->addVillage($wid,$uid,'new village','0');
		  $database->addResourceFields($wid,$database->getVillageType($wid));
		  $database->addUnits($wid);
		  $database->addTech($wid);
		  $database->addABTech($wid);
	}
  }

	function Punish($post){
	 global $database;
	   $villages = $database->getProfileVillages($post['uid']);
	   $admid = $post['admid'];
	   $user = $database->getUserArray($post['uid'],1);
		  for ($i = 0; $i <= count($villages)-1; $i++) {
			$vid = $villages[$i]['wref'];
			if($post['punish']){
			  $popOld = $villages[$i]['pop'];
			  $proc = 100-$post['punish'];
			  $pop = floor(($popOld/100)*($proc));
				if($pop <= 1 ){$pop = 2;}
				$this->PunishBuilding($vid,$proc,$pop);

			}
			if($post['del_troop']){
				if($user['tribe'] == 1) {
				  $unit = 1;
				}else if($user['tribe'] == 2) {
				  $unit = 11;
				}else if($user['tribe'] == 3) {
				  $unit = 21;
				}
				  $this->DelUnits($villages[$i]['wref'],$unit);
			}
			if($post['clean_ware']){
			  $time = time();
			  $q = "UPDATE ".TB_PREFIX."vdata SET `wood` = '0', `clay` = '0', `iron` = '0', `crop` = '0', `lastupdate` = '$time' WHERE wref = $vid;";
			  mysql_query($q, $this->connection);
			}
		  }
			mysql_query("Insert into ".TB_PREFIX."admin_log values (0,".$_SESSION['id'].",'Punished user: <a href=\'admin.php?p=player&uid=".$post['uid']."\'>".$post['uid']."</a> with <b>-".$post['punish']."%</b> population',".time().")");
  }

  function PunishBuilding($vid,$proc,$pop){
	global $database;
	$q = "UPDATE ".TB_PREFIX."vdata set pop = $pop where wref = $vid;";
	mysql_query($q, $this->connection);
	$fdata = $database->getResourceLevel($vid);
	for ($i = 1; $i <= 40; $i++) {
	  if($fdata['f'.$i]>1){
		$zm = ($fdata['f'.$i]/100)*$proc;
		if($zm < 1){$zm = 1;}else{$zm = floor($zm);}
		$q = "UPDATE ".TB_PREFIX."fdata SET `f$i` = '$zm' WHERE `vref` = $vid;";
		mysql_query($q, $this->connection);
	  }
	}
  }

  function DelUnits($vid,$unit){
	for ($i = $unit; $i <= 9+$unit; $i++) {
	  $this->DelUnits2($vid,$unit);
	}
  }

  function DelUnits2($vid,$unit){
	  $q = "UPDATE ".TB_PREFIX."units SET `u$unit` = '0' WHERE `vref` = $vid;";
	  mysql_query($q, $this->connection);
  }

	function DelPlayer($uid,$pass){
	 global $database;
	$ID = $_SESSION['id'];//$database->getUserField($_SESSION['username'],'id',1);
	   if($this->CheckPass($pass,$ID)){
		 $villages = $database->getProfileVillages($uid);
		  for ($i = 0; $i <= count($villages)-1; $i++) {
			$this->DelVillage($villages[$i]['wref'], 1);
		  }
 		$q = "DELETE FROM ".TB_PREFIX."hero where uid = $uid";
		mysql_query($q, $this->connection);

		$name = $database->getUserField($uid,"username",0);
		mysql_query("Insert into ".TB_PREFIX."admin_log values (0,$ID,'Deleted user <a>$name</a>',".time().")");
		$q = "DELETE FROM ".TB_PREFIX."users WHERE `id` = $uid;";
		 mysql_query($q, $this->connection);
	}
  }

  function getUserActive() {
	$time = time() - (60*5);
		$q = "SELECT * FROM ".TB_PREFIX."users where timestamp > $time and username != 'support'";
		$result = mysql_query($q, $this->connection);
	return $this->mysql_fetch_all($result);
	}

  function CheckPass($password,$uid){
	$q = "SELECT password FROM ".TB_PREFIX."users where id = '$uid' and access = ".ADMIN;
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		if($dbarray['password'] == md5($password)) {
		  return true;
	}else{
	  return false;
	}
  }

	function DelVillage($wref, $mode=0){
		global $database;
		if($mode==0){
			$q = "SELECT * FROM ".TB_PREFIX."vdata WHERE `wref` = $wref and capital = 0";
	  }else{
		$q = "SELECT * FROM ".TB_PREFIX."vdata WHERE `wref` = $wref";
	  }
		$result = mysql_query($q, $this->connection);
		if(mysql_num_rows($result) > 0){
			mysql_query("Insert into ".TB_PREFIX."admin_log values (0,".$_SESSION['id'].",'Deleted village <b>$wref</b>',".time().")");

			$database->clearExpansionSlot($wref);

			$q = "DELETE FROM ".TB_PREFIX."abdata where vref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."bdata where wid = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."market where vref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."odata where wref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."research where vref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."tdata where vref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."fdata where vref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."training where vref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."units where vref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."farmlist where wref = $wref";
			mysql_query($q, $this->connection);
			$q = "DELETE FROM ".TB_PREFIX."raidlist where towref = $wref";
			mysql_query($q, $this->connection);

			$q = "DELETE FROM ".TB_PREFIX."movement where `from` = $wref and proc=0";
			mysql_query($q, $this->connection);

			$getmovement = $database->getMovement(3,$wref,1);
			foreach($getmovement as $movedata) {
				$time = microtime(true);
				$time2 = $time - $movedata['starttime'];
				$database->setMovementProc($movedata['moveid']);
				$database->addMovement(4,$movedata['to'],$movedata['from'],$movedata['ref'],$time,$time+$time2);
			//$database->setMovementProc($movedata['moveid']);
			}

			//check	return enforcement from del village
			$this->returnTroops($wref);

			$q = "DELETE FROM ".TB_PREFIX."vdata WHERE `wref` = $wref";
			mysql_query($q, $this->connection);

			if (mysql_affected_rows()>0) {
				$q = "UPDATE ".TB_PREFIX."wdata set occupied = 0 where id = $wref";
				mysql_query($q, $this->connection);

				$getprisoners = $database->getPrisoners($wref);
				foreach($getprisoners as $pris) {
					$troops = 0;
					for($i=1;$i<12;$i++){
						$troops += $pris['t'.$i];
					}
					$database->modifyUnit($pris['wref'],array("99o"),array($troops),array(0));
					$database->deletePrisoners($pris['id']);
				}
				$getprisoners = $database->getPrisoners3($wref);
				foreach($getprisoners as $pris) {
					$troops = 0;
					for($i=1;$i<12;$i++){
						$troops += $pris['t'.$i];
					}
					$database->modifyUnit($pris['wref'],array("99o"),array($troops),array(0));
					$database->deletePrisoners($pris['id']);
				}
			}
		}
	}

	function DelBan($uid,$id){
	 global $database;
	$name = addslashes($database->getUserField($uid,"username",0));
	mysql_query("Insert into ".TB_PREFIX."admin_log values (0,".$_SESSION['id'].",'Unbanned user <a href=\'admin.php?p=player&uid=$uid\'>$name</a>',".time().")");
	$q = "UPDATE ".TB_PREFIX."users SET `access` = '".USER."' WHERE `id` = $uid;";
	mysql_query($q, $this->connection);
	$q = "UPDATE ".TB_PREFIX."banlist SET `active` = '0' WHERE `id` = $id;";
	mysql_query($q, $this->connection);
  }

  function AddBan($uid,$end,$reason){
	global $database;
	$name = addslashes($database->getUserField($uid,"username",0));
	mysql_query("Insert into ".TB_PREFIX."admin_log values (0,".$_SESSION['id'].",'Banned user <a href=\'admin.php?p=player&uid=$uid\'>$name</a>',".time().")");
	$q = "UPDATE ".TB_PREFIX."users SET `access` = '0' WHERE `id` = $uid;";
	mysql_query($q, $this->connection);
	$time = time();
	$admin = $_SESSION['id'];  //$database->getUserField($_SESSION['username'],'id',1);
	$name = addslashes($database->getUserField($uid,'username',0));
	$q = "INSERT INTO ".TB_PREFIX."banlist (`uid`, `name`, `reason`, `time`, `end`, `admin`, `active`) VALUES ($uid, '$name' , '$reason', '$time', '$end', '$admin', '1');";
	mysql_query($q, $this->connection);
  }

  function search_player($player){
	$q = "SELECT id,username FROM ".TB_PREFIX."users WHERE `username` LIKE '%$player%' and username != 'support'";
	$result = mysql_query($q, $this->connection);
	return $this->mysql_fetch_all($result);
  }

  function search_email($email){
	$q = "SELECT id,email FROM ".TB_PREFIX."users WHERE `email` LIKE '%$email%' and username != 'support'";
	$result = mysql_query($q, $this->connection);
	return $this->mysql_fetch_all($result);
  }

  function search_village($village){
	$q = "SELECT * FROM ".TB_PREFIX."vdata WHERE `name` LIKE '%$village%' or `wref` LIKE '%$village%'";
	$result = mysql_query($q, $this->connection);
	return $this->mysql_fetch_all($result);
  }

  function search_alliance($alliance){
	$q = "SELECT * FROM ".TB_PREFIX."alidata WHERE `name` LIKE '%$alliance%' or `tag` LIKE '%$alliance%' or `id` LIKE '%$alliance%'";
	$result = mysql_query($q, $this->connection);
	return $this->mysql_fetch_all($result);
  }

  function search_ip($ip){
	$q = "SELECT * FROM ".TB_PREFIX."login_log WHERE `ip` LIKE '%$ip%'";
	$result = mysql_query($q, $this->connection);
	return $this->mysql_fetch_all($result);
  }

  function search_banned(){
	$q = "SELECT * FROM ".TB_PREFIX."banlist where active = '1'";
	$result = mysql_query($q, $this->connection);
	return $this->mysql_fetch_all($result);
  }

  function Del_banned(){
	//$q = "SELECT * FROM ".TB_PREFIX."banlist";
	$result = mysql_query($q, $this->connection);
	return $this->mysql_fetch_all($result);
  }

	/***************************
	Function to process MYSQLi->fetch_all (Only exist in MYSQL)
	References: Result
	***************************/
	function mysql_fetch_all($result) {
		$all = array();
		if($result) {
		while ($row = mysql_fetch_assoc($result)){ $all[] = $row; }
		return $all;
		}
	}

	function query_return($q) {
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}

	/***************************
	Function to do free query
	References: Query
	***************************/
	function query($query) {
		return mysql_query($query, $this->connection);
	}

	public function getTypeLevel($tid,$vid) {
		global $village,$database;
		$keyholder = array();

		if($vid == 0) {
			$resourcearray = $village->resarray;
		} else {
			$resourcearray = $database->getResourceLevel($vid);
		}
		foreach(array_keys($resourcearray,$tid) as $key) {
			if(strpos($key,'t')) {
				$key = preg_replace("/[^0-9]/", '', $key);
				array_push($keyholder, $key);
			}
		}
		$element = count($keyholder);
		if($element >= 2) {
			if($tid <= 4) {
				$temparray = array();
				for($i=0;$i<=$element-1;$i++) {
					array_push($temparray,$resourcearray['f'.$keyholder[$i]]);
				}
				foreach ($temparray as $key => $val) {
					if ($val == max($temparray))
					$target = $key;
				}
			}
			else {
				$target = 0;
				for($i=1;$i<=$element-1;$i++) {
					if($resourcearray['f'.$keyholder[$i]] > $resourcearray['f'.$keyholder[$target]]) {
						$target = $i;
					}
				}
			}
		}
		else if($element == 1) {
			$target = 0;
		}
		else {
			return 0;
		}
		if($keyholder[$target] != "") {
			return $resourcearray['f'.$keyholder[$target]];
		}
		else {
			return 0;
		}
	}

	   public function procDistanceTime($coor,$thiscoor,$ref,$vid) {
		global $bid28,$bid14;

		$xdistance = ABS($thiscoor['x'] - $coor['x']);
		if($xdistance > WORLD_MAX) {
			$xdistance = (2 * WORLD_MAX + 1) - $xdistance;
		}
		$ydistance = ABS($thiscoor['y'] - $coor['y']);
		if($ydistance > WORLD_MAX) {
			$ydistance = (2 * WORLD_MAX + 1) - $ydistance;
		}
		$distance = SQRT(POW($xdistance,2)+POW($ydistance,2));
		$speed = $ref;
		if($this->getTypeLevel(14,$vid) != 0 && $distance >= TS_THRESHOLD) {
			$speed = $speed * ($bid14[$this->getTypeLevel(14,$vid)]['attri']/100) ;
		}

		if($speed!=0){
		return round(($distance/$speed) * 3600 / INCREASE_SPEED);
		}else{
		return round($distance * 3600 / INCREASE_SPEED);
		}
	}
    public function returnTroops($wref) {
        global $database;

        $getenforce=$database->getEnforceVillage($wref,0);

		//if(($enforce['from']==$village->wid) || ($enforce['vref']==$village->wid)){
        foreach($getenforce as $enforce) {

			$to = $database->getVillage($enforce['from']);
			$Gtribe = "";
			if ($database->getUserField($to['owner'],'tribe',0) ==  '2'){ $Gtribe = "1"; }
			else if ($database->getUserField($to['owner'],'tribe',0) == '3'){ $Gtribe =  "2"; }
			else if ($database->getUserField($to['owner'],'tribe',0) ==  '4'){ $Gtribe = "3"; }
			else if  ($database->getUserField($to['owner'],'tribe',0) == '5'){ $Gtribe =  "4"; }

			$start = ($database->getUserField($to['owner'],'tribe',0)-1)*10+1;
			$end = ($database->getUserField($to['owner'],'tribe',0)*10);

			$from = $database->getVillage($enforce['from']);
			$fromcoor = $database->getCoor($enforce['from']);
			$tocoor = $database->getCoor($enforce['vref']);
			$fromCor = array('x'=>$tocoor['x'], 'y'=>$tocoor['y']);
			$toCor = array('x'=>$fromcoor['x'], 'y'=>$fromcoor['y']);

			$speeds = array();

			//find slowest unit.
			for($i=$start;$i<=$end;$i++){

				if(intval($enforce['u'.$i]) > 0){
					if($unitarray) { reset($unitarray); }
					$unitarray = $GLOBALS["u".$i];
					$speeds[] = $unitarray['speed'];
					//echo print_r(array_keys($speeds))."unitspd\n".$i."trib\n";


				} else {
					$enforce['u'.$i]='0';
				}

			}

			if( intval($enforce['hero']) > 0){
				$q = "SELECT * FROM ".TB_PREFIX."hero WHERE uid = ".$from['owner']."";
				$result = mysql_query($q);
				$hero_f=mysql_fetch_array($result);
				$hero_unit=$hero_f['unit'];
				$speeds[] = $GLOBALS['u'.$hero_unit]['speed'];
			} else {
				$enforce['hero']='0';
			}

			$artefact = count($database->getOwnUniqueArtefactInfo2($from['owner'],2,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($enforce['from'],2,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($from['owner'],2,2,0));
			if($artefact > 0){
				$fastertroops = 3;
			}else if($artefact1 > 0){
				$fastertroops = 2;
			}else if($artefact2 > 0){
				$fastertroops = 1.5;
			}else{
				$fastertroops = 1;
			}
			$time = round($this->procDistanceTime($fromCor,$toCor,min($speeds),$enforce['from'])/$fastertroops);

			$foolartefact2 = $database->getFoolArtefactInfo(2,$enforce['from'],$from['owner']);
			if(count($foolartefact2) > 0){
				foreach($foolartefact2 as $arte){
					if($arte['bad_effect'] == 1){
						$time *= $arte['effect2'];
					}else{
						$time /= $arte['effect2'];
						$time = round($time);
					}
				}
			}
			$reference =  $database->addAttack($enforce['from'],$enforce['u'.$start],$enforce['u'.($start+1)],$enforce['u'.($start+2)],$enforce['u'.($start+3)],$enforce['u'.($start+4)],$enforce['u'.($start+5)],$enforce['u'.($start+6)],$enforce['u'.($start+7)],$enforce['u'.($start+8)],$enforce['u'.($start+9)],$enforce['hero'],2,0,0,0,0);
			$database->addMovement(4,$wref,$enforce['from'],$reference,time(),($time+time()));
			$database->deleteReinf($enforce['id']);
		}
	}


	public function calculateProduction($wid,$uid,$b1,$b2,$b3,$b4,$fdata,$ocounter,$pop) {
		global $technology,$database;
		$normalA = $database->getOwnArtefactInfoByType($wid,4);
		$largeA = $database->getOwnUniqueArtefactInfo($uid,4,2);
		$uniqueA = $database->getOwnUniqueArtefactInfo($uid,4,3);
		$upkeep = $this->getUpkeep($this->getAllUnits($wid),0,$wid,$uid);


		$production=array();
		$production['wood'] = $this->getWoodProd($fdata, $ocounter,$b1);
		$production['clay'] = $this->getClayProd($fdata, $ocounter,$b2);
		$production['iron'] = $this->getIronProd($fdata, $ocounter,$b3);
		if ($uniqueA['size']==3 && $uniqueA['owner']==$uid){
			$production['crop'] = $this->getCropProd($fdata, $ocounter,$b4)-$pop-(($upkeep)-round($upkeep*0.50));
		}elseif ($normalA['type']==4 && $normalA['size']==1 && $normalA['owner']==$uid){
			$production['crop'] = $this->getCropProd($fdata, $ocounter,$b4)-$pop-(($upkeep)-round($upkeep*0.25));
		}else if ($largeA['size']==2 && $largeA['owner']==$uid){
			$production['crop'] = $this->getCropProd($fdata, $ocounter,$b4)-$pop-(($upkeep)-round($upkeep*0.25));
		}else{
			$production['crop'] = $this->getCropProd($fdata, $ocounter,$b4)-$pop-$upkeep;
		}
		return $production;
	}

	private function getWoodProd($fdata,$ocounter,$b1) {
		global $bid1,$bid5;
		$basewood = $sawmill = 0;
		$woodholder = array();
		for($i=1;$i<=38;$i++) {
			if($fdata['f'.$i.'t'] == 1) {
				array_push($woodholder,'f'.$i);
			}
			if($fdata['f'.$i.'t'] == 5) {
				$sawmill = $fdata['f'.$i];
			}
		}
		for($i=0;$i<=count($woodholder)-1;$i++) { $basewood+= $bid1[$fdata[$woodholder[$i]]]['prod']; }
		$wood = $basewood + $basewood * 0.25 * $ocounter[0];
		if($sawmill >= 1) {
			$wood += $basewood / 100 * $bid5[$sawmill]['attri'];
		}
		if($b1 > time()) {
			$wood *= 1.25;
		}
		$wood *= SPEED;
		return round($wood);
	}

	private function getClayProd($fdata,$ocounter,$b2) {
		global $bid2,$bid6,$session;
		$baseclay = $clay = $brick = 0;
		$clayholder = array();
		for($i=1;$i<=38;$i++) {
			if($fdata['f'.$i.'t'] == 2) {
				array_push($clayholder,'f'.$i);
			}
			if($fdata['f'.$i.'t'] == 6) {
				$brick = $fdata['f'.$i];
			}
		}
		for($i=0;$i<=count($clayholder)-1;$i++) { $baseclay+= $bid2[$fdata[$clayholder[$i]]]['prod']; }
		$clay = $baseclay + $baseclay * 0.25 * $ocounter[1];
		if($brick >= 1) {
			$clay += $baseclay / 100 * $bid6[$brick]['attri'];
		}
		if($b2 > time()) {
			$clay *= 1.25;
		}
		$clay *= SPEED;
		return round($clay);
	}

	private function getIronProd($fdata,$ocounter,$b3) {
		global $bid3,$bid7;
		$baseiron = $foundry = 0;
		$ironholder = array();
		for($i=1;$i<=38;$i++) {
			if($fdata['f'.$i.'t'] == 3) {
				array_push($ironholder,'f'.$i);
			}
			if($fdata['f'.$i.'t'] == 7) {
				$foundry = $fdata['f'.$i];
			}
		}
		for($i=0;$i<=count($ironholder)-1;$i++) { $baseiron+= $bid3[$fdata[$ironholder[$i]]]['prod']; }
		$iron = $baseiron + $baseiron * 0.25 * $ocounter[2];
		if($foundry >= 1) {
			$iron += $baseiron / 100 * $bid7[$foundry]['attri'];
		}
		if($b3 > time()) {
			$iron *= 1.25;
		}
		$iron *= SPEED;
		return round($iron);
	}

	private function getCropProd($fdata,$ocounter,$b4) {
		global $bid4,$bid8,$bid9;
		$basecrop = $grainmill = $bakery = 0;
		$cropholder = array();
		for($i=1;$i<=38;$i++) {
			if($fdata['f'.$i.'t'] == 4) {
				array_push($cropholder,'f'.$i);
			}
			if($fdata['f'.$i.'t'] == 8) {
				$grainmill = $fdata['f'.$i];
			}
			if($fdata['f'.$i.'t'] == 9) {
				$bakery = $fdata['f'.$i];
			}
		}
		for($i=0;$i<=count($cropholder)-1;$i++) { $basecrop+= $bid4[$fdata[$cropholder[$i]]]['prod']; }
		$crop = $basecrop + $basecrop * 0.25 * $ocounter[3];
		$jcrop=0;
		if($grainmill >= 1) $jcrop=$bid8[$grainmill]['attri'];
		if($bakery >= 1) $jcrop+=$bid9[$bakery]['attri'];
		$crop += $basecrop /100 * $jcrop;
		if($b4 > time()) {
			$crop *= 1.25;
		}
		$crop *= SPEED;
		return round($crop);
	}

		function getAllUnits($base,$InVillageOnly=False,$mode=0) {
		global $database;
		$ownunit = $database->getUnit($base);
		$ownunit['u99'] -= $ownunit['u99'];
		$ownunit['u99o'] -= $ownunit['u99o'];
		$enforcementarray = $database->getEnforceVillage($base,0);
		if(count($enforcementarray) > 0) {
			foreach($enforcementarray as $enforce) {
				for($i=1;$i<=50;$i++) {
					$ownunit['u'.$i] += $enforce['u'.$i];
				}
				$ownunit['hero'] += $enforce['hero'];
			}
		}
		if ($mode==0) {
			$enforceoasis=$database->getOasisEnforce($base,0);
			if(count($enforceoasis) > 0) {
				foreach($enforceoasis as $enforce) {
					for($i=1;$i<=50;$i++) {
						$ownunit['u'.$i] += $enforce['u'.$i];
					}
					$ownunit['hero'] += $enforce['hero'];
				}
			}
			//$enforcementarray = $database->getEnforceVillage($base,1);
			$enforceoasis1=$database->getOasisEnforce($base,1);
			if(count($enforceoasis1) > 0) {
				foreach($enforceoasis1 as $enforce) {
					for($i=1;$i<=50;$i++) {
						$ownunit['u'.$i] += $enforce['u'.$i];
					}
					$ownunit['hero'] += $enforce['hero'];
				}
			}


			$prisoners = $database->getPrisoners($base,1);
			if(!empty($prisoners)) {
				foreach($prisoners as $prisoner){
					$owner = $database->getVillageField($base,"owner");
					$ownertribe = $database->getUserField($owner,"tribe",0);
					$start = ($ownertribe-1)*10+1;
					$end = ($ownertribe*10);
					for($i=$start;$i<=$end;$i++) {
						$j = $i-$start+1;
						$ownunit['u'.$i] += $prisoner['t'.$j];
					}
					$ownunit['hero'] += $prisoner['t11'];
				}
			}
		}

		if(!$InVillageOnly) {
			$movement = $database->getVillageMovement($base);
			if(!empty($movement)) {
				for($i=1;$i<=50;$i++) {
					if (isset($movement['u'.$i])) {
						$ownunit['u'.$i] += $movement['u'.$i];
					}
				}
				$ownunit['hero'] += $movement['hero'];
			}
		}
		return $ownunit;
	}

	public function getUpkeep($array,$type,$vid,$uid,$prisoners=0) {
		global $database;
		$buildarray = array();
		$buildarray = $database->getResourceLevel($vid);
		$upkeep = 0;
		switch($type) {
			case 0:
			$start = 1;
			$end = 50;
			break;
			case 1:
			$start = 1;
			$end = 10;
			break;
			case 2:
			$start = 11;
			$end = 20;
			break;
			case 3:
			$start = 21;
			$end = 30;
			break;
			case 4:
			$start = 31;
			$end = 40;
			break;
			case 5:
			$start = 41;
			$end = 50;
			break;
		}
		for($i=$start;$i<=$end;$i++) {
			$k = $i-$start+1;
			$unit = "u".$i;
			$unit2 = "t".$k;
			global $$unit;
			$dataarray = $$unit;
			for($j=19;$j<=38;$j++) {
			if($buildarray['f'.$j.'t'] == 41) {
			$horsedrinking = $j;
			}
			}
			if($prisoners == 0){
			if(isset($horsedrinking)){
			if(($i==4 && $buildarray['f'.$horsedrinking] >= 10)
			|| ($i==5 && $buildarray['f'.$horsedrinking] >= 15)
			|| ($i==6 && $buildarray['f'.$horsedrinking] == 20)) {
			$upkeep += ($dataarray['pop']-1) * $array[$unit];
			} else {
			$upkeep += $dataarray['pop'] * $array[$unit];
			}}else{
			$upkeep += $dataarray['pop'] * $array[$unit];
			}
			}else{
			if(isset($horsedrinking)){
			if(($i==4 && $buildarray['f'.$horsedrinking] >= 10)
			|| ($i==5 && $buildarray['f'.$horsedrinking] >= 15)
			|| ($i==6 && $buildarray['f'.$horsedrinking] == 20)) {
			$upkeep += ($dataarray['pop']-1) * $array[$unit2];
			} else {
			$upkeep += $dataarray['pop'] * $array[$unit2];
			}}else{
			$upkeep += $dataarray['pop'] * $array[$unit2];
			}
			}
		}
		 //   $unit = "hero";
		 //   global $$unit;
		 //   $dataarray = $$unit;
		 if($prisoners == 0){
			$upkeep += (isset($array['hero'])? $array['hero'] * 6:0);
		 }else{
			$upkeep += (isset($array['t11'])? $array['t11'] * 6:0);
		 }
			$artefact = count($database->getOwnUniqueArtefactInfo2($uid,4,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($vid,4,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($uid,4,2,0));
			if($artefact > 0){
			$upkeep /= 2;
			$upkeep = round($upkeep);
			}else if($artefact1 > 0){
			$upkeep /= 2;
			$upkeep = round($upkeep);
			}else if($artefact2 > 0){
			$upkeep /= 4;
			$upkeep = round($upkeep);
			$upkeep *= 3;
			}
			$foolartefact = $database->getFoolArtefactInfo(4,$vid,$uid);
			if(count($foolartefact) > 0){
			foreach($foolartefact as $arte){
			if($arte['bad_effect'] == 1){
			$upkeep *= $arte['effect2'];
			}else{
			$upkeep /= $arte['effect2'];
			$upkeep = round($upkeep);
			}
			}
			}
		return $upkeep;
	}

};

$admin = new adm_DB;
include("function.php");
?>
