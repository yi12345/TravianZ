<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       berichte.php                                                 ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
$message->noticeType($_GET);
$message->procNotice($_POST);
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
if(isset($_GET['t'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?t=".$_GET['t']);
}else if(isset($_GET['vill']) && isset($_GET['id'])) {
	header("Location: ".$_SERVER['PHP_SELF']."?id=".$_GET['id']."&vill=".$_GET['vill']."");
}else if($_GET['id']!=0) {
	header("Location: ".$_SERVER['PHP_SELF']."?id=".$_GET['id']);
}else{
	header("Location: ".$_SERVER['PHP_SELF']);
}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title><?php echo SERVER_NAME ?></title>
	<link REL="shortcut icon" HREF="favicon.ico"/>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="mt-full.js?0faaa" type="text/javascript"></script>
	<script src="unx.js?0faaa" type="text/javascript"></script>
	<script src="new.js?0faaa" type="text/javascript"></script>
	<link href="<?php echo GP_LOCATE; ?>lang/en/lang.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" />
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
<?php include("Templates/menu.tpl"); ?>
		<div id="content"  class="reports">
<h1>Reports</h1>
<div id="textmenu">
   <a href="berichte.php" <?php if (!isset($_GET['t'])) { echo "class=\"selected \""; } ?>>All</a>
 | <a href="berichte.php?t=2" <?php if (isset($_GET['t']) && $_GET['t'] == 2) { echo "class=\"selected \""; } ?>>Trade</a>
 | <a href="berichte.php?t=1" <?php if (isset($_GET['t']) && $_GET['t'] == 1) { echo "class=\"selected \""; } ?>>Reinforcement</a>
 | <a href="berichte.php?t=3" <?php if (isset($_GET['t']) && $_GET['t'] == 3) { echo "class=\"selected \""; } ?>>Attacks</a>
 | <a href="berichte.php?t=4" <?php if (isset($_GET['t']) && $_GET['t'] == 4) { echo "class=\"selected \""; } ?>>Miscellaneous</a>
 <?php if($session->plus) {
 echo "| <a href=\"berichte.php?t=5\"";
 if (isset($_GET['t']) && $_GET['t'] == 5) { echo "class=\"selected \""; }
 echo ">Archive</a>";
 }
 ?>
</div>
<?php
if(isset($_GET['aid'])){
if($_GET['aid']!=0){
	if($session->alliance==$_GET['aid']){

		if(isset($_GET['id'])) {
		$ally = $database->getNotice2(preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['id']), 'ally');
		if($session->alliance==$ally){
			$type = $database->getNotice2(preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['id']), 'ntype');
		if($type!=10 or $type!=11 or $type!=12 or $type!=13	or $type!=14 or $type!=15 or $type!=16 or $type!=17){
			include("Templates/Notice/".$type."x.tpl");
		}
		}
		}
	}
}
}else if(isset($_GET['vill'])){

		if(isset($_GET['id'])) {
		$ally = $database->getNotice2($_GET['id'], 'ally');
		if($database->getNotice2(preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['id']), 'uid') == $session->uid){
		$type = ($message->readingNotice['ntype'] == 9)? $message->readingNotice['archive'] : $message->readingNotice['ntype'];
		include("Templates/Notice/".$type.".tpl");
		}else if($session->alliance==$ally){
		$type = $database->getNotice2($_GET['id'], 'ntype');
		if($type!=10 or $type!=11 or $type!=12 or $type!=13	or $type!=14 or $type!=15 or $type!=16 or $type!=17){
			include("Templates/Notice/".$type."x.tpl");
		}
		}
		}

	}else if(isset($_GET['id'])) {
		if($database->getNotice2(preg_replace("/[^a-zA-Z0-9_-]/","",$_GET['id']), 'uid') == $session->uid){
		$type = ($message->readingNotice['ntype'] == 9)? $message->readingNotice['archive'] : $message->readingNotice['ntype'];
		include("Templates/Notice/".$type.".tpl");
		}
	} else {
		include("Templates/Notice/all.tpl");
	}
?>
</div>

</br></br></br></br><div id="side_info">
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
<?php echo CALCULATED_IN;?> <b><?php
echo round(($generator->pageLoadTimeEnd()-$start)*1000);
?></b> ms
<br /><?php echo SEVER_TIME;?> <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
</div>
	</div>
</div>

<div id="ce"></div>
</body>
</html>
