<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       editLogSet.php                                              ##
##  Developed by:  ronix                                                       ##
##  License:       TravianZ Project                                            ##
##  Copyright:     TravianZ (c) 2010-2014. All rights reserved.                ##
##                                                                             ##
#################################################################################

if(!isset($_SESSION)) session_start();
if($_SESSION['access'] < 9) die(ACCESS_DENIED_ADMIN);
include_once("../../Database.php");
$id = $_POST['id'];

$myFile = "../../config.php";
$fh = fopen($myFile, 'w') or die("<br/><br/><br/>Can't open file: GameEngine\config.php");

		$ERRORREPORT=ERROR_REPORT;
		$T4=(T4_COMING==false)? "false":"true";
		$GP_ENABLE=(GP_ENABLE==false)? "false":"true";
		$QUEST=(QUEST==false)? "false":"true";
		$WW=(WW==false)? "false":"true";
		$SHOW_NATARS=(SHOW_NATARS==false)? "false":"true";
		$AUTH_EMAIL=(AUTH_EMAIL==false)? "false":"true";
		$GREAT_WKS=(GREAT_WKS==false)? "false":"true";
		$REG_OPEN=(REG_OPEN==false)? "false":"true";

		$NEWSBOX1=(NEWSBOX1==false)? "false":"true";
		$NEWSBOX2=(NEWSBOX2==false)? "false":"true";
		$NEWSBOX3=(NEWSBOX3==false)? "false":"true";
		$LIMIT_MAILBOX=(LIMIT_MAILBOX==false)? "false":"true";
		$INCLUDE_ADMIN=(INCLUDE_ADMIN==false)? "false":"true";

		$text = file_get_contents("constant_format.tpl");
		$text = preg_replace("'%ERRORREPORT%'", $ERRORREPORT, $text);
		$text = preg_replace("'%ERROR%'", $ERRORREPORT, $text);
		$text = preg_replace("'%SERVERNAME%'", SERVER_NAME, $text);
		$text = preg_replace("'%STIMEZONE%'", TIMEZONE, $text);
		$text = preg_replace("'%STARTTIME%'", COMMENCE, $text);
		$text = preg_replace("'%SSTARTDATE%'", START_DATE, $text);
		$text = preg_replace("'%SSTARTTIME%'", START_TIME, $text);
		$text = preg_replace("'%LANG%'", LANG, $text);
		$text = preg_replace("'%SPEED%'", SPEED, $text);
		$text = preg_replace("'%MAX%'", WORLD_MAX, $text);
		$text = preg_replace("'%GP%'", $GP_ENABLE, $text);
		$text = preg_replace("'%GP_LOCATE%'", "gpack/travian_default/", $text);
		$text = preg_replace("'%INCSPEED%'", INCREASE_SPEED, $text);
		$text = preg_replace("'%EVASIONSPEED%'", EVASION_SPEED, $text);
		$text = preg_replace("'%TRADERCAP%'", TRADER_CAPACITY, $text);
		$text = preg_replace("'%CRANNYCAP%'", CRANNY_CAPACITY, $text);
		$text = preg_replace("'%TRAPPERCAP%'", TRAPPER_CAPACITY, $text);
		$text = preg_replace("'%VILLAGE_EXPAND%'", CP, $text);
		$text = preg_replace("'%DEMOLISH%'", DEMOLISH_LEVEL_REQ, $text);
		$text = preg_replace("'%STORAGE_MULTIPLIER%'", STORAGE_MULTIPLIER, $text);
		$text = preg_replace("'%QUEST%'", $QUEST, $text);
		$text = preg_replace("'%QTYPE%'", QTYPE, $text);
		$text = preg_replace("'%BEGINNER%'", PROTECTION, $text);
		$text = preg_replace("'%WW%'", $WW, $text);
		$text = preg_replace("'%SHOW_NATARS%'", $SHOW_NATARS, $text);
		$text = preg_replace("'%NATARS_UNITS%'", NATARS_UNITS, $text);
		$text = preg_replace("'%NATURE_REGTIME%'", NATURE_REGTIME, $text);
		$text = preg_replace("'%T4_COMING%'", $T4, $text);
		$text = preg_replace("'%ACTIVATE%'", $AUTH_EMAIL, $text);
		$text = preg_replace("'%PLUS_TIME%'", PLUS_TIME, $text);
		$text = preg_replace("'%PLUS_PRODUCTION%'", PLUS_PRODUCTION, $text);
		$text = preg_replace("'%MEDALINTERVAL%'", MEDALINTERVAL, $text);
		$text = preg_replace("'%GREAT_WKS%'", $GREAT_WKS, $text);
		$text = preg_replace("'%TS_THRESHOLD%'", TS_THRESHOLD, $text);
		$text = preg_replace("'%REG_OPEN%'", $REG_OPEN, $text);
		$text = preg_replace("'%PEACE%'", PEACE, $text);
		//update
		$text = preg_replace("'%LOGBUILD%'", $_POST['log_build'], $text);
		$text = preg_replace("'%LOGTECH%'", $_POST['log_tech'], $text);
		$text = preg_replace("'%LOGLOGIN%'", $_POST['log_login'], $text);
		$text = preg_replace("'%LOGGOLDFIN%'", $_POST['log_gold_fin'], $text);
		$text = preg_replace("'%LOGADMIN%'", $_POST['log_admin'], $text);
		$text = preg_replace("'%LOGWAR%'", $_POST['log_war'], $text);
		$text = preg_replace("'%LOGMARKET%'", $_POST['log_market'], $text);
		$text = preg_replace("'%LOGILLEGAL%'", $_POST['log_illegal'], $text);
		//end update
		$text = preg_replace("'%BOX1%'", $NEWSBOX1, $text);
		$text = preg_replace("'%BOX2%'", $NEWSBOX2, $text);
		$text = preg_replace("'%BOX3%'", $NEWSBOX3, $text);
		$text = preg_replace("'%SSERVER%'", SQL_SERVER, $text);
		$text = preg_replace("'%SUSER%'", SQL_USER, $text);
		$text = preg_replace("'%SPASS%'", SQL_PASS, $text);
		$text = preg_replace("'%SDB%'", SQL_DB, $text);
		$text = preg_replace("'%PREFIX%'", TB_PREFIX, $text);
		$text = preg_replace("'%CONNECTT%'", DB_TYPE, $text);
		$text = preg_replace("'%LIMIT_MAILBOX%'", $LIMIT_MAILBOX, $text);
		$text = preg_replace("'%MAX_MAILS%'", MAX_MAIL, $text);
		$text = preg_replace("'%ARANK%'", $INCLUDE_ADMIN, $text);
		$text = preg_replace("'%AEMAIL%'", ADMIN_EMAIL, $text);
		$text = preg_replace("'%ANAME%'", ADMIN_NAME, $text);
		$text = preg_replace("'%UTRACK%'", "", $text);
		$text = preg_replace("'%UTOUT%'", "", $text);
		$text = preg_replace("'%DOMAIN%'", DOMAIN, $text);
		$text = preg_replace("'%HOMEPAGE%'", HOMEPAGE, $text);
		$text = preg_replace("'%SERVER%'", SERVER, $text);

		fwrite($fh, $text);
		fclose($fh);

$database->query("Insert into ".TB_PREFIX."admin_log values (0,".$id.",'Changed server setting',".time().")");

header("Location: ../../../Admin/admin.php?p=config");

?>
