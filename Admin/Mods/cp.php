<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       gold.php                                                    ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
include_once("../../Account.php");
mysqli_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysqli_select_db(SQL_DB);
if (!isset($_SESSION)) session_start();
if($_SESSION['access'] < ADMIN) die("Access Denied: You are not Admin!");  

$id = (int) $_POST['id'];
$admid = (int) $_POST['admid'];
mysqli_query($GLOBALS["link"], "UPDATE ".TB_PREFIX."users SET cp = cp + ".$_POST['cp']." WHERE id = ".$id."");

$name = $database->getUserField($id,"username",0);
mysqli_query($GLOBALS["link"], "Insert into ".TB_PREFIX."admin_log values (0,$admid,'Added ".$_POST['cp']." Cultural Points to user <a href=\'admin.php?p=player&uid=$id\'>$name</a> ',".time().")");

header("Location: ../../../Admin/admin.php?p=player&uid=".$id."&cp=ok");
?>