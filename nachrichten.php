<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       nachrichten.php                                             ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################


use App\Utils\AccessLogger;

include("GameEngine/Village.php");
AccessLogger::logRequest();

$start_timer = $generator->pageLoadTimeStart();
$message->procMessage($_POST);
if(isset($_GET['t']) && $_GET['t'] == 1){
	$automation->isWinner();
}
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
if(isset($_GET['t'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?t=".$_GET['t']);
	exit;
}else if($_GET['id']!=0) {
	header("Location: ".$_SERVER['PHP_SELF']."?id=".$_GET['id']);
	exit;
}else{
	header("Location: ".$_SERVER['PHP_SELF']);
	exit;
}
}
if(isset($_GET['delfriend']) && is_numeric($_GET['delfriend'])){
$friend = $database->getUserField($session->uid, "friend".$_GET['delfriend'], 0);
for($i=0;$i<=19;$i++) {
$friend1 = $database->getUserField($friend, "friend".$i, 0);
if($friend1 == $session->uid){
$database->deleteFriend($friend,"friend".$i);
}
$friendwait1 = $database->getUserField($friend, "friend".$i."wait", 0);
if($friendwait1 == $session->uid){
$database->deleteFriend($friend,"friend".$i."wait");
}
$database->checkFriends($friend);
}
$database->deleteFriend($session->uid,"friend".$_GET['delfriend']);
$database->deleteFriend($session->uid,"friend".$_GET['delfriend']."wait");
$database->checkFriends($session->uid);
header("Location: ".$_SERVER['PHP_SELF']."?t=1");
exit;
}
if(isset($_GET['confirm']) && is_numeric($_GET['confirm'])){
$myid = $database->getUserArray($session->uid, 1);
$wait = $database->getUserArray($myid['friend'.$_GET['confirm'].'wait'], 1);
$added = 0;
for($i=0;$i<20;$i++) {
$user = $database->getUserField($wait['id'], "friend".$i, 0);
if($user == $session->uid && $added == 0){
$database->addFriend($wait['id'],"friend".$i."wait",0);
$added = 1;
}
}
$database->addFriend($session->uid,"friend".$_GET['confirm'],$wait['id']);
$database->addFriend($session->uid,"friend".$_GET['confirm']."wait",0);
header("Location: ".$_SERVER['PHP_SELF']."?t=1");
exit;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title><?php echo SERVER_NAME ?> - Messages</title>
   <link rel="shortcut icon" href="favicon.ico"/>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="X-UA-Compatible" content="IE=8" />
	<script src="mt-full.js?f4b7d" type="text/javascript"></script>
	<script src="unx.js?f4b7d" type="text/javascript"></script>
	<script src="new.js?f4b7d" type="text/javascript"></script>
	<link href="<?php echo GP_LOCATE; ?>lang/en/lang.css?f4b7d" rel="stylesheet" type="text/css" />
	<link href="<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7g" rel="stylesheet" type="text/css" />
	<?php
	if($session->gpack == null || GP_ENABLE == false) {
	echo "
	<link href='".GP_LOCATE."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".GP_LOCATE."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	} else {
	echo "
	<link href='".$session->gpack."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".$session->gpack."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	}
	?>
	<script type="text/javascript">

		window.addEvent('domready', start);
	</script>
</head>


<body class="v35 ie ie8">
<div class="wrapper">
<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" />
<div id="dynamic_header">
	</div>
<?php include("Templates/header.tpl"); ?>

<div id="mid">
<?php include("Templates/menu.tpl");
if(isset($_GET['id']) && !isset($_GET['t'])) {
	$message->loadMessage($_GET['id']);
	include("Templates/Message/read.tpl");
}
else if(isset($_GET['t'])) {
	switch($_GET['t']) {
		case 1:
		if(isset($_GET['id'])) {
		$id = preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['id']);
		}
		include("Templates/Message/write.tpl");
		break;
		case 2:
		include("Templates/Message/sent.tpl");
		break;
		case 3:
		if($session->plus) {
			include("Templates/Message/archive.tpl");
		}
		break;
		case 4:
		if($session->plus) {
			$message->loadNotes();
			include("Templates/Message/notes.tpl");
		}
		break;
		default:
		include("Templates/Message/inbox.tpl");
		break;
	}
}
else {
	include("Templates/Message/inbox.tpl");
}
			?>

<br /><br /><br /><br /><div id="side_info">
<?php
include("Templates/multivillage.tpl");
include("Templates/quest.tpl");
include("Templates/news.tpl");
include("Templates/links.tpl");
?>
</div>
<div class="clear"></div>
</div>
<div class="footer-stopper"></div>
<div class="clear"></div>
<?php
include("Templates/footer.tpl");
include("Templates/res.tpl");
?>
<div id="stime">
<div id="ltime">
<div id="ltimeWrap">
Calculated in <b><?php
echo round(($generator->pageLoadTimeEnd()-$start_timer)*1000);
?></b> ms

<br />Server time: <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
</div>
	</div>
</div>
<div id="ce"></div>
</body>
</html>