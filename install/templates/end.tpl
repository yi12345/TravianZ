<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Project:       TravianZ                                                    ##
##  Version:       22.06.2015                    			       ## 
##  Filename       end.tpl                                                ##
##  Developed by:  Mr.php , Advocaite , brainiacX , yi12345 , Shadow , ronix   ## 
##  Fixed by:      Shadow - STARVATION , HERO FIXED COMPL.  		       ##
##  Fixed by:      InCube - double troops				       ##
##  License:       TravianZ Project                                            ##
##  Copyright:     TravianZ (c) 2010-2015. All rights reserved.                ##
##  URLs:          http://travian.shadowss.ro                		       ##
##  Source code:   https://github.com/Shadowss/TravianZ		               ## 
##                                                                             ##
#################################################################################
?>
<p>
Thanks for installing TravianZ.
<h4>Please remove/rename the installation folder.</h4>
All the files are placed. The database is created, so you can now start playing on your own Travian.
</p>

<ul>
    <li><h4>After Installation</h4></li>
    <li>Delete install folder (sudo rm -R install)</li>
    <li>CHMOD GameEngine back to 755 (sudo chmod -R 755 GameEngine)</li>
    <li>CHMOD Prevention to 777 (sudo chmod -R 777 GameEngine/Prevention)</li>
    <li>CHMOD Notes to 777 (sudo chmod -R 777 GameEngine/Notes)</li>
    <li>CHMOD var/log to 777 (sudo chmod -R 777 var/log)</li>
</ul>

<ul>
    <li><h4>After Installation</h4></li>
    <li>Protect folder /Admin with password protect directory</li>
</ul>

<?php include("../GameEngine/config.php"); 
$time = time();
rename("../install/","../installed_".$time);
touch('../var/installed');
?>
<p>
<center><font size="4"><a href="<?php echo HOMEPAGE; ?>">> My TravianZ homepage <</font></a></center>
</p>
</br>
<center>
<h2>Please support our developers and donate.</h2>
</br>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="QHUTVY5MLECFQ">
<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
</form>
</center>
</div>
