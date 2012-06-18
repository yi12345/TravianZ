<?php
#################################################################################
##                                                                             ##
##              -= YOU MUST NOT REMOVE OR CHANGE THIS NOTICE =-                ##
##                                                                             ##
## --------------------------------------------------------------------------- ##
##                                                                             ##
##  Project:       ZravianX                                                    ##
##  Version:       2011.11.07                                                  ##
##  Filename:      GameEngine/Admin/database.php                               ##
##  Developed by:  Dzoki                                                       ##
##  Edited by:     ZZJHONS                                                     ##
##  License:       Creative Commons BY-NC-SA 3.0                               ##
##  Copyright:     ZravianX (c) 2011 - All rights reserved                     ##
##  URLs:          http://zravianx.zzjhons.com                                 ##
##  Source code:   http://www.github.com/ZZJHONS/ZravianX                      ##
##                                                                             ##
#################################################################################
if(!file_exists('GameEngine/config.php') && !file_exists('../../GameEngine/config.php') && !file_exists('../../config.php')){
include("../../GameEngine/config.php");
include("../../GameEngine/Data/buidata.php");
}else{
include("../GameEngine/config.php");
include("../GameEngine/Data/buidata.php");
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
	}
  }

	function recountPop($vid){
	global $database;
	$fdata = $database->getResourceLevel($vid);
	$popTot = 0;
	for ($i = 1; $i <= 40; $i++) {
	  $lvl = $fdata["f".$i];
	  $building = $fdata["f".$i."t"];
	  if($building){
		$popTot += $this->buildingPOP($building,$lvl);
	  }
	}
	$q = "UPDATE ".TB_PREFIX."vdata set pop = $popTot where wref = $vid";
	mysql_query($q, $this->connection);
  }

  function buildingPOP($f,$lvl){
	$name = "bid".$f;
		global $$name;
		$popT = 0;
		$dataarray = $$name;
	for ($i = 0; $i <= $lvl; $i++) {
	  $popT += $dataarray[$i]['pop'];
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
			$this->DelVillage($villages[$i]['wref']);
		  }
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

	function DelVillage($wref){
	  $q = "SELECT * FROM ".TB_PREFIX."vdata WHERE `wref` = $wref and capital = 0";
	  $result = mysql_query($q, $this->connection);
	if(mysql_num_rows($result) > 0){
	mysql_query("Insert into ".TB_PREFIX."admin_log values (0,".$_SESSION['id'].",'Deleted village <b>$wref</b>',".time().")");
	$q = "DELETE FROM ".TB_PREFIX."vdata WHERE `wref` = $wref";
	  mysql_query($q, $this->connection);
	$q = "DELETE FROM ".TB_PREFIX."units WHERE `vref` = $wref";
	mysql_query($q, $this->connection);
	$q = "DELETE FROM ".TB_PREFIX."bdata WHERE `wid` = $wref";
	mysql_query($q, $this->connection);
	$q = "DELETE FROM ".TB_PREFIX."abdata WHERE `wid` = $wref";
	mysql_query($q, $this->connection);
	$q = "DELETE FROM ".TB_PREFIX."fdata WHERE `vref` = $wref";
	mysql_query($q, $this->connection);
	$q = "DELETE FROM ".TB_PREFIX."training WHERE `vref` = $wref";
	mysql_query($q, $this->connection);
	$q = "DELETE FROM ".TB_PREFIX."movement WHERE `from` = $wref";
	mysql_query($q, $this->connection);
	$q = "UPDATE ".TB_PREFIX."wdata SET `occupied` = '0' WHERE `id` = $wref";
	mysql_query($q, $this->connection);
	}
  }

	function DelBan($uid,$id){
	 global $database;
	$name = $database->getUserField($uid,"username",0);
	mysql_query("Insert into ".TB_PREFIX."admin_log values (0,".$_SESSION['id'].",'Unbanned user <a href=\'admin.php?p=player&uid=$uid\'>$name</a>',".time().")");
	$q = "UPDATE ".TB_PREFIX."users SET `access` = '".USER."' WHERE `id` = $uid;";
	mysql_query($q, $this->connection);
	$q = "UPDATE ".TB_PREFIX."banlist SET `active` = '0' WHERE `id` = $id;";
	mysql_query($q, $this->connection);
  }

  function AddBan($uid,$end,$reason){
	global $database;
	$name = $database->getUserField($uid,"username",0);
	mysql_query("Insert into ".TB_PREFIX."admin_log values (0,".$_SESSION['id'].",'Banned user <a href=\'admin.php?p=player&uid=$uid\'>$name</a>',".time().")");
	$q = "UPDATE ".TB_PREFIX."users SET `access` = '0' WHERE `id` = $uid;";
	mysql_query($q, $this->connection);
	$time = time();
	$admin = $_SESSION['id'];  //$database->getUserField($_SESSION['username'],'id',1);
	$name = $database->getUserField($uid,'username',0);
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


};

$admin = new adm_DB;
include("function.php");
?>