<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       editExtraSet.php                                            ##
##  Developed by:  ronix                                                       ##
##  License:       TravianZ Project                                            ##
##  Copyright:     TravianZ (c) 2010-2014. All rights reserved.                ##
##                                                                             ##
#################################################################################

if(!isset($_SESSION)) session_start();
if($_SESSION['access'] < 9) die(ACCESS_DENIED_ADMIN);
include_once("../../Database.php");
$id = (int) $_POST['id'];

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

		$LOG_BUILD=(LOG_BUILD==false)? "false":"true";
		$LOG_TECH=(LOG_TECH==false)? "false":"true";
		$LOG_LOGIN=(LOG_LOGIN==false)? "false":"true";
		$LOG_GOLD_FIN=(LOG_GOLD_FIN==false)? "false":"true";
		$LOG_ADMIN=(LOG_ADMIN==false)? "false":"true";
		$LOG_WAR=(LOG_WAR==false)? "false":"true";
		$LOG_MARKET=(LOG_MARKET==false)? "false":"true";
		$LOG_ILLEGAL=(LOG_ILLEGAL==false)? "false":"true";
		$INCLUDE_ADMIN=(INCLUDE_ADMIN==false)? "false":"true";
		$SUPPORT_MSGS_IN_ADMIN = (ADMIN_RECEIVE_SUPPORT_MESSAGES == false ? 'false' : 'true');
		$ADMINS_RAIDABLE = (ADMIN_ALLOW_INCOMING_RAIDS == false ? 'false' : 'true');
		
		$text = file_get_contents("constant_format.tpl");
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
		$text = preg_replace("'%LIMIT_MAILBOX%'", $_POST['limit_mailbox'], $text);
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
		
		// PLUS settings need to be kept intact
		$text = preg_replace("'%PLUS_TIME%'", PLUS_TIME, $text);
		$text = preg_replace("'%PLUS_PRODUCTION%'", PLUS_PRODUCTION, $text);
		$text = preg_replace("'%PAYPAL_EMAIL%'", (defined('PAYPAL_EMAIL') ? PAYPAL_EMAIL : 'martin@martinambrus.com'), $text);
		$text = preg_replace("'%PAYPAL_CURRENCY%'", (defined('PAYPAL_CURRENCY') ? PAYPAL_CURRENCY : 'EUR'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_A_PRICE%'", (defined('PLUS_PACKAGE_A_PRICE') ? PLUS_PACKAGE_A_PRICE : '1,99'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_A_GOLD%'", (defined('PLUS_PACKAGE_A_GOLD') ? PLUS_PACKAGE_A_GOLD : '60'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_B_PRICE%'", (defined('PLUS_PACKAGE_B_PRICE') ? PLUS_PACKAGE_B_PRICE : '4,99'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_B_GOLD%'", (defined('PLUS_PACKAGE_B_GOLD') ? PLUS_PACKAGE_B_GOLD : '120'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_C_PRICE%'", (defined('PLUS_PACKAGE_C_PRICE') ? PLUS_PACKAGE_C_PRICE : '9,99'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_C_GOLD%'", (defined('PLUS_PACKAGE_C_GOLD') ? PLUS_PACKAGE_C_GOLD : '360'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_D_PRICE%'", (defined('PLUS_PACKAGE_D_PRICE') ? PLUS_PACKAGE_D_PRICE : '19,99'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_D_GOLD%'", (defined('PLUS_PACKAGE_D_GOLD') ? PLUS_PACKAGE_D_GOLD : '1000'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_E_PRICE%'", (defined('PLUS_PACKAGE_E_PRICE') ? PLUS_PACKAGE_E_PRICE : '49,99'), $text);
		$text = preg_replace("'%PLUS_PACKAGE_E_GOLD%'", (defined('PLUS_PACKAGE_E_GOLD') ? PLUS_PACKAGE_E_GOLD : '2000'), $text);
	
		fwrite($fh, $text);
		fclose($fh);

$database->query("Insert into ".TB_PREFIX."admin_log values (0,".$id.",'Changed Extra server settings',".time().")");

header("Location: ../../../Admin/admin.php?p=config");

?>
