<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       editUser.php                                                ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################
if (!isset($_SESSION)) session_start();
if($_SESSION['access'] < 9) die("Access Denied: You are not Admin!");
include_once("../../config.php");

$GLOBALS["link"] = mysqli_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysqli_select_db($GLOBALS["link"], SQL_DB);

$session = (int) $_POST['admid'];
$id = (int) $_POST['id'];

$sql = mysqli_query($GLOBALS["link"], "SELECT * FROM ".TB_PREFIX."users WHERE id = ".$session."");
$access = mysqli_fetch_array($sql);
$sessionaccess = $access['access'];

if($sessionaccess != 9) die("<h1><font color=\"red\">Access Denied: You are not Admin!</font></h1>");

$pdur =  (int) $_POST['plus'] * 86400;
$b1dur = (int) $_POST['wood'] * 86400;
$b2dur = (int) $_POST['clay'] * 86400;
$b3dur = (int) $_POST['iron'] * 86400;
$b4dur = (int) $_POST['crop'] * 86400;

$sql1 = mysqli_query($GLOBALS["link"], "SELECT * FROM ".TB_PREFIX."users WHERE id = ".$id."");
$user = mysqli_fetch_array($sql1);

if($user['plus'] < time()){
if($pdur > 1){ $plus = (time() + $pdur); } else { $plus = time(); }
}else{
if($pdur > 1){ $plus = ($user['plus'] + $pdur); } else { $plus = $user['plus']; }
}
if($user['b1'] < time()){
if($b1dur > 1){ $wood = (time() + $b1dur); } else { $wood = time(); }
}else{
if($b1dur  > 1){ $wood = ($user['b1'] + $b1dur); } else { $wood = $user['b1']; }
}
if($user['b2'] < time()){
if($b2dur > 1){ $clay = (time() + $b2dur); } else { $clay = time(); }
}else{
if($b2dur > 1){ $clay = ($user['b2'] + $b2dur); } else { $clay = $user['b2']; }
}
if($user['b3'] < time()){
if($b3dur > 1){ $iron = (time() + $b3dur); } else { $iron = time(); }
}else{
if($b3dur > 1){ $iron = ($user['b3'] + $b3dur); } else { $iron = $user['b3']; }
}
if($user['b4'] < time()){
if($b4dur > 1){ $crop = (time() + $b4dur); } else { $crop = time(); }
}else{
if($b4dur > 1){ $crop = ($user['b4'] + $b4dur); } else { $crop = $user['b4']; }
}

mysqli_query($GLOBALS["link"], "UPDATE ".TB_PREFIX."users SET 
	plus = '".$plus."',
	b1 = '".$wood."', 
	b2 = '".$clay."',
	b3 = '".$iron."',
	b4 = '".$crop."' 
	WHERE id = $id") or die(mysqli_error($database->dblink));

header("Location: ../../../Admin/admin.php?p=player&uid=".$id."");
?>