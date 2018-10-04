<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       medals.php                                                  ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
#################################################################################
if (!isset($_SESSION)) session_start();
if($_SESSION['access'] < 9) die("Access Denied: You are not Admin!");
include_once("../../Account.php");

$GLOBALS["link"] = mysqli_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysqli_select_db($GLOBALS["link"], SQL_DB);

if (!isset($_SESSION)) session_start();
if($_SESSION['access'] < ADMIN) die("Access Denied: You are not Admin!");

$medalid = (int) $_POST['medalid'];
$uid = (int) $_POST['uid'];
$admid = (int) $_POST['admid'];

mysqli_query($GLOBALS["link"], "UPDATE ".TB_PREFIX."medal set del = 1 WHERE id = ".$medalid."");

$name = mysqli_fetch_array(mysqli_query($GLOBALS["link"], "SELECT name FROM ".TB_PREFIX."users WHERE id= ".$uid.""), MYSQLI_ASSOC);
$name = $name['name'];

mysqli_query($GLOBALS["link"], "Insert into ".TB_PREFIX."admin_log values (0,$admid,'Deleted medal id [#".$medalid."] from the user <a href=\'admin.php?p=player&uid=$uid\'>$name</a> ',".time().")");


$deleteweek = (int) $_POST['medalweek'];
mysqli_query($GLOBALS["link"], "UPDATE ".TB_PREFIX."medal set del = 1 WHERE week = ".$deleteweek."");

header("Location: ../../../Admin/admin.php?p=player&uid=".$uid."");
?>