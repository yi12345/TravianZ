<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       ajax.php                                                    ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

// even with autoloader created, we can't use it here yet, as it's not been created
// ... so, let's see where it is and include it
$autoloader_found = false;
// go max 5 levels up - we don't have folders that go deeper than that
for ($i = 0; $i < 5; $i++) {
    $autoprefix = str_repeat('../', $i);
    if (file_exists($autoprefix.'autoloader.php')) {
        $autoloader_found = true;
        include_once $autoprefix.'autoloader.php';
        break;
    }
}

if (!$autoloader_found) {
    die('Could not find autoloading class.');
}

// we need config to determine whether to log access or not
include_once($autoprefix.'GameEngine/config.php');

use App\Utils\AccessLogger;
AccessLogger::logRequest();

switch($_GET['f']) {
	case 'k7':
	    header('Content-Type: application/json');
		$x = preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['x']);
		$y = preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['y']);
		$xx = preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['xx']);
		$yy = preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['yy']);
		$howmany = $x - $xx;
		if($howmany == 12 || $howmany == -12) {
			include("Templates/Ajax/mapscroll2.tpl");
		}
		else {
		include("Templates/Ajax/mapscroll.tpl");
		}
		break;
	case 'kp':
		$z = preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['z']);
		//include("Templates/Ajax/plusmap.tpl");
		break;
	case 'qst':

	if (isset($_GET['qact'])){
	$qact=preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['qact']);
	}else {
	$qact=null;
	}
	if (isset($_GET['qact2'])){
	$qact2=preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['qact2']);
	}else {
	$qact2=null;
	}
	if (isset($_GET['qact3'])){
        $qact3=preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['qact3']);
    	}else {
        $qact3=null;
    	}  
    if (!isset($_SESSION)) {
        session_start();
    }
    if (isset($_SESSION['qtyp']) && $_SESSION['qtyp']==37) {
        include("Templates/Ajax/quest_core.tpl");
    }else{
        include("Templates/Ajax/quest_core25.tpl");
    }    
        break;
}
?>
