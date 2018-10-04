<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       editPlusSet.php                                             ##
##  Developed by:  martinambrus                                                ##
##  License:       TravianZ Project                                            ##
##  Copyright:     TravianZ (c) 2010-2017. All rights reserved.                ##
##                                                                             ##
#################################################################################

if(!isset($_SESSION)) session_start();
if($_SESSION['access'] < 9) die(ACCESS_DENIED_ADMIN);
include_once("../../Database.php");
include_once("../../config.php");
$id = (int) $_POST['id'];

$myFile = "../../config.php";
$fh = fopen($myFile, 'w') or die("<br/><br/><br/>Can't open file: GameEngine\config.php");

		$text = file_get_contents("constant_format.tpl");
		
		$SUPPORT_MSGS_IN_ADMIN = (ADMIN_RECEIVE_SUPPORT_MESSAGES == false ? 'false' : 'true');
		$ADMINS_RAIDABLE = (ADMIN_ALLOW_INCOMING_RAIDS == false ? 'false' : 'true');

		// SERVER SETTINGS - we need to keep these intact
		$text = preg_replace("'%ERRORREPORT%'", ERROR_REPORT, $text);
		$text = preg_replace("'%ERROR%'", ERROR_REPORT, $text);
		$text = preg_replace("'%SERVERNAME%'", SERVER_NAME, $text);
		$text = preg_replace("'%STIMEZONE%'", TIMEZONE, $text);
		$text = preg_replace("'%STARTTIME%'", COMMENCE, $text);
		$text = preg_replace("'%SSTARTDATE%'", START_DATE, $text);
		$text = preg_replace("'%SSTARTTIME%'", START_TIME, $text);
		$text = preg_replace("'%LANG%'", LANG, $text);
		$text = preg_replace("'%SPEED%'", SPEED, $text);
		$text = preg_replace("'%MAX%'", WORLD_MAX, $text);
		$text = preg_replace("'%GP%'", GP_ENABLE, $text);
		$text = preg_replace("'%GP_LOCATE%'", GP_LOCATE, $text);
		$text = preg_replace("'%INCSPEED%'", INCREASE_SPEED, $text);
		$text = preg_replace("'%EVASIONSPEED%'", EVASION_SPEED, $text);
		$text = preg_replace("'%TRADERCAP%'", TRADER_CAPACITY, $text);
		$text = preg_replace("'%CRANNYCAP%'", CRANNY_CAPACITY, $text);
		$text = preg_replace("'%TRAPPERCAP%'", TRAPPER_CAPACITY, $text);
		$text = preg_replace("'%VILLAGE_EXPAND%'", CP, $text);
		$text = preg_replace("'%DEMOLISH%'", DEMOLISH_LEVEL_REQ, $text);
		$text = preg_replace("'%STORAGE_MULTIPLIER%'", STORAGE_MULTIPLIER, $text);
		$text = preg_replace("'%QUEST%'", QUEST, $text);
		$text = preg_replace("'%QTYPE%'", QTYPE, $text);
		$text = preg_replace("'%BEGINNER%'", PROTECTION, $text);
		$text = preg_replace("'%WW%'", (WW ? 'true' : 'false'), $text);
		$text = preg_replace("'%SHOW_NATARS%'", (SHOW_NATARS ? 'true' : 'false'), $text);
		$text = preg_replace("'%NATARS_UNITS%'", NATARS_UNITS, $text);
		$text = preg_replace("'%NATURE_REGTIME%'", NATURE_REGTIME, $text);
		$text = preg_replace("'%T4_COMING%'", (T4_COMING ? 'true' : 'false'), $text);
		$text = preg_replace("'%ACTIVATE%'", (AUTH_EMAIL ? 'true' : 'false'), $text);
		$text = preg_replace("'%MEDALINTERVAL%'", MEDALINTERVAL, $text);
		$text = preg_replace("'%GREAT_WKS%'", (GREAT_WKS ? 'true' : 'false'), $text);
		$text = preg_replace("'%TS_THRESHOLD%'", TS_THRESHOLD, $text);
		$text = preg_replace("'%REG_OPEN%'", REG_OPEN, $text);
		$text = preg_replace("'%PEACE%'", PEACE, $text);
		$text = preg_replace("'%LOGBUILD%'", (LOG_BUILD ? 'true' : 'false'), $text);
		$text = preg_replace("'%LOGTECH%'", (LOG_TECH ? 'true' : 'false'), $text);
		$text = preg_replace("'%LOGLOGIN%'", (LOG_LOGIN ? 'true' : 'false'), $text);
		$text = preg_replace("'%LOGGOLDFIN%'", (LOG_GOLD_FIN ? 'true' : 'false'), $text);
		$text = preg_replace("'%LOGADMIN%'", (LOG_ADMIN ? 'true' : 'false'), $text);
		$text = preg_replace("'%LOGWAR%'", (LOG_WAR ? 'true' : 'false'), $text);
		$text = preg_replace("'%LOGMARKET%'", (LOG_MARKET ? 'true' : 'false'), $text);
		$text = preg_replace("'%LOGILLEGAL%'", (LOG_ILLEGAL ? 'true' : 'false'), $text);
		$text = preg_replace("'%BOX1%'", (NEWSBOX1 ? 'true' : 'false'), $text);
		$text = preg_replace("'%BOX2%'", (NEWSBOX2 ? 'true' : 'false'), $text);
		$text = preg_replace("'%BOX3%'", (NEWSBOX3 ? 'true' : 'false'), $text);
		$text = preg_replace("'%SSERVER%'", SQL_SERVER, $text);
		$text = str_replace("%SPORT%", SQL_PORT, $text);
		$text = preg_replace("'%SUSER%'", SQL_USER, $text);
		$text = preg_replace("'%SPASS%'", SQL_PASS, $text);
		$text = preg_replace("'%SDB%'", SQL_DB, $text);
		$text = preg_replace("'%PREFIX%'", TB_PREFIX, $text);
		$text = preg_replace("'%CONNECTT%'", DB_TYPE, $text);
		$text = preg_replace("'%LIMIT_MAILBOX%'", (LIMIT_MAILBOX ? 'true' : 'false'), $text);
		$text = preg_replace("'%MAX_MAILS%'", MAX_MAIL, $text);
		$text = preg_replace("'%ARANK%'", (INCLUDE_ADMIN ? 'true' : 'false'), $text);
		$text = preg_replace("'%AEMAIL%'", ADMIN_EMAIL, $text);
		$text = preg_replace("'%ANAME%'", ADMIN_NAME, $text);
		$text = preg_replace("'%ASUPPMSGS%'", $SUPPORT_MSGS_IN_ADMIN, $text);
		$text = preg_replace("'%ARAIDS%'", $ADMINS_RAIDABLE, $text);
		$text = preg_replace("'%UTRACK%'", "TRACK_USR", $text); // not in use, text only in a comment
		$text = preg_replace("'%UTOUT%'", "USER_TIMEOUT", $text); // not in use, text only in a comment
		$text = preg_replace("'%DOMAIN%'", DOMAIN, $text);
		$text = preg_replace("'%HOMEPAGE%'", HOMEPAGE, $text);
		$text = preg_replace("'%SERVER%'", SERVER, $text);

		// PLUS SETTINGS
		$text = preg_replace("'%PLUS_TIME%'", $_POST['plus_time'], $text);
		$text = preg_replace("'%PLUS_PRODUCTION%'", $_POST['plus_production'], $text);
		$text = preg_replace("'%PAYPAL_EMAIL%'", $_POST['paypal-email'], $text);
		$text = preg_replace("'%PAYPAL_CURRENCY%'", $_POST['paypal-currency'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_A_GOLD%'", $_POST['plus-a-gold'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_A_PRICE%'", $_POST['plus-a-price'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_B_GOLD%'", $_POST['plus-b-gold'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_B_PRICE%'", $_POST['plus-b-price'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_C_GOLD%'", $_POST['plus-c-gold'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_C_PRICE%'", $_POST['plus-c-price'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_D_GOLD%'", $_POST['plus-d-gold'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_D_PRICE%'", $_POST['plus-d-price'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_E_GOLD%'", $_POST['plus-e-gold'], $text);
		$text = preg_replace("'%PLUS_PACKAGE_E_PRICE%'", $_POST['plus-e-price'], $text);

		fwrite($fh, $text);
		fclose($fh);

$database->query("Insert into ".TB_PREFIX."admin_log values (0,".$id.",'Changed PLUS Settings',".time().")");

header("Location: ../../../Admin/admin.php?p=config");

?>
