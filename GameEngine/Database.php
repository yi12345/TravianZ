<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Edited by:     akshay9, ZZJHONS, songeriux                                 ##
##  Filename       Database.php                                                ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

include_once("config.php");

switch(DB_TYPE) {
	case 1:
	include("Database/db_MYSQLi.php");
	break;
	//case 2:
	//include("Database/db_MSSQL.php");
	//break;
	default:
	include("Database/db_MYSQL.php");
	break;
}
## Security
include("Protection.php");
?>
