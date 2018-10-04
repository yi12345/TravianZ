<?php

#################################################################################
## -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =- 			        ##
## ---------------------------------------------------------------------------  ##
## Project:      TravianZ 							##
## Version:      01.09.2013 							##
## Filename :    37_train.tpl 							##
## Developed by: Dzok			 					##
## Fixed by:     Shadow / Skype : cata7007 					##
## License:      TravianZ Project	 					##
## Copyright:    TravianZ (c) 2010-2013. All rights reserved. 			##
## URLs:         http://travian.shadowss.ro 					##
## Source code:  http://github.com/yi12345/TravianZ		 		##
## 										##
#################################################################################

			$artefact = count($database->getOwnUniqueArtefactInfo2($session->uid,5,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($village->wid,5,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($session->uid,5,2,0));
			if($artefact > 0){
			$artefact_bonus = 2;
			$artefact_bonus2 = 1;
			}else if($artefact1 > 0){
			$artefact_bonus = 2;
			$artefact_bonus2 = 1;
			}else if($artefact2 > 0){
			$artefact_bonus = 4;
			$artefact_bonus2 = 3;
			}else{
			$artefact_bonus = 1;
			$artefact_bonus2 = 1;
			}

//check if there is unit needed in the village

$result = mysqli_query($GLOBALS['link'],"SELECT * FROM ".TB_PREFIX."units WHERE `vref` = ".(int) $village->wid."");
$units = mysqli_fetch_array($result);

$count_hero = mysqli_fetch_array(mysqli_query($GLOBALS['link'],"SELECT Count(*) as Total FROM " . TB_PREFIX . "hero WHERE `uid` = " . $database->escape($session->uid) . ""), MYSQLI_ASSOC);
$count_hero = $count_hero['Total'];

if ($count_hero < 3) {

$output="<table cellpadding=1 cellspacing=1 class=\"build_details\">
        <thead>
            <tr>
                <th colspan=2>".TRAIN_HERO."</th>
            </tr>
        </thead>";
        
if($session->tribe == 1) {
    $output.=" <tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u1\" src=\"img/x.gif\" alt=\"".U1."\" title=\"".U1."\" />
						".U1."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u1['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u1['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u1['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u1['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />";
     $output.=$generator->getTimeFormat(round($u1['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        	if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   				$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u1['wood']."&r2=".$u1['clay']."&r3=".$u1['iron']."&r4=".$u1['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 			}
     $output.="</div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

                
    if($village->awood < $u1['wood'] || $village->aclay < $u1['clay'] || $village->airon < $u1['iron'] || $village->acrop < $u1['crop'])      
        $output.="<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>";    
    elseif($units['u1'] == 0) 
        $output.="<span class=\"none\">".NOT_UNITS."</span>";      
    else $output.="<a href=\"build.php?id=".$id."&train=1\">".TRAIN."</a>";
        
    
    $output.="</center></td>
</tr>";
  
        
    
    if($database->checkIfResearched($village->wid, 't2') != 0){ 
        $output.="<tr>
                    <td class=\"desc\">
        				<div class=\"tit\">
        					<img class=\"unit u2\" src=\"img/x.gif\" alt=\"".U2."\" title=\"".U2."\" />
        					".U2."
        				</div>
        				<div class=\"details\">
        					<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u2['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u2['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u2['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u2['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />";
        $output.=$generator->getTimeFormat(round($u2['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
        
        					if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   				$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u2['wood']."&r2=".$u2['clay']."&r3=".$u2['iron']."&r4=".$u2['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 			}
        
        $output.="</div>
        				</td>
        				
                        <td class=\"val\" width=\"20%\"><center>";
                        
        if($village->awood < $u2['wood'] OR $village->aclay < $u2['clay'] OR $village->airon < $u2['iron'] OR $village->acrop < $u2['crop']) 
           $output.="<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        elseif($units['u2'] == 0)
            $output.="<span class=\"none\">".NOT_UNITS."</span>"; 
        else 
            $output.="<a href=\"build.php?id=".$id."&train=2\">".TRAIN."</a>";
                         
        $output.="</center></td>
                    </tr>";
    } 
        
    if($database->checkIfResearched($village->wid, 't3') != 0){
            
        $output.="<tr>
                        <td class=\"desc\">
        					<div class=\"tit\">
        						<img class=\"unit u3\" src=\"img/x.gif\" alt=\"".U3."\" title=\"".U3."\" />
        						".U3."
        					</div>
        					<div class=\"details\">
        						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u3['wood']."|
                                <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u3['clay']."|
                                <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u3['iron']."|
                                <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u3['crop']."|
                                <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                                <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />";
                                
         $output.=  $generator->getTimeFormat(round($u3['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
        
        					if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   				$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u3['wood']."&r2=".$u3['clay']."&r3=".$u3['iron']."&r4=".$u3['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 			}
        
        $output.= "</div>
        				</td>
        				
                        <td class=\"val\" width=\"20%\"><center>";
        
        if($village->awood < $u3['wood'] OR $village->aclay < $u3['clay'] OR $village->airon < $u3['iron'] OR $village->acrop < $u3['crop']) { 
            $output.="<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u3'] == 0){ 
            $output.="<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.="<a href=\"build.php?id=".$id."&train=3\">".TRAIN."</a>";
        }  
                 "</center></td>
                    </tr> " ;     
    }         
    
    if($database->checkIfResearched($village->wid, 't5') != 0){  
        $output.= "<tr>
                    <td class=\"desc\">
    					<div class=\"tit\">
    						<img class=\"unit u5\" src=\"img/x.gif\" alt=\"".U5."\" title=\"".U5."\" />
    						".U5."
    					</div>
    					<div class=\"details\">
    						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u5['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u5['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u5['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u5['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
    				        $generator->getTimeFormat(round($u5['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
    				        
    				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   				$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u5['wood']."&r2=".$u5['clay']."&r3=".$u5['iron']."&r4=".$u5['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 			}
    				        
    				        $output .= "
                        </div>
    				</td>
    				
                    <td class=\"val\" width=\"20%\"><center>";
        
        if($village->awood < $u5['wood'] OR $village->aclay < $u5['clay'] OR $village->airon < $u5['iron'] OR $village->acrop < $u5['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u5'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=5\">".TRAIN."</a>";
        } 
        $output.="</center></td>
                </tr>";
    }      
    
    if($database->checkIfResearched($village->wid, 't6') != 0){ 
        $output.="<tr>
                    <td class=\"desc\">
    					<div class=\"tit\">
    						<img class=\"unit u6\" src=\"img/x.gif\" alt=\"".U6."\" title=\"".U6."\" />
    						".U6."
    					</div>
    					<div class=\"details\">
    						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u6['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u6['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u6['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u6['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
    				        $generator->getTimeFormat(round($u6['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
    				        
    				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   				$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u6['wood']."&r2=".$u6['clay']."&r3=".$u6['iron']."&r4=".$u6['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 			}
    				        
    				        $output .= "
                        </div>
    				</td>
    				
                    <td class=\"val\" width=\"20%\"><center>   ";
      
        if($village->awood < $u6['wood'] OR $village->aclay < $u6['clay'] OR $village->airon < $u6['iron'] OR $village->acrop < $u6['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u6'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=6\">".TRAIN."</a>";
        }  
        
        $output.="</center></td>
                </tr>";
    }    
}    

if($session->tribe == 2) {

$output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u11\" src=\"img/x.gif\" alt=\"".U11."\" title=\"".U11."\" />
						".U11."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u11['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u11['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u11['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u11['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u11['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u11['wood']."&r2=".$u11['clay']."&r3=".$u11['iron']."&r4=".$u11['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u11['wood'] OR $village->aclay < $u11['clay'] OR $village->airon < $u11['iron'] OR $village->acrop < $u11['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u11'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=11\">".TRAIN."</a>";
        }  
    $output.="</center></td>
            </tr>";
            
            
    if($database->checkIfResearched($village->wid, 't12') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u12\" src=\"img/x.gif\" alt=\"".U12."\" title=\"".U12."\" />
						".U12."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u12['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u12['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u12['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u12['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u12['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u12['wood']."&r2=".$u12['clay']."&r3=".$u12['iron']."&r4=".$u12['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u12['wood'] OR $village->aclay < $u12['clay'] OR $village->airon < $u12['iron'] OR $village->acrop < $u12['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u12'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=12\">".TRAIN."</a>";
        }  
        $output.="</center></td>
            </tr>";
    }    

  
    if($database->checkIfResearched($village->wid, 't13') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u13\" src=\"img/x.gif\" alt=\"".U13."\" title=\"".U13."\" />
						".U13."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u13['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u13['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u13['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u13['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />";

				        $generator->getTimeFormat(round($u13['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);

				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u13['wood']."&r2=".$u13['clay']."&r3=".$u13['iron']."&r4=".$u13['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}

				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u13['wood'] OR $village->aclay < $u13['clay'] OR $village->airon < $u13['iron'] OR $village->acrop < $u13['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u13'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=13\">".TRAIN."</a>";
        }  
        $output.="</center></td>
            </tr>";
    }   
    
    if($database->checkIfResearched($village->wid, 't15') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u15\" src=\"img/x.gif\" alt=\"".U15."\" title=\"".U15."\" />
						".U15."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u15['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u15['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u15['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u15['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u15['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u15['wood']."&r2=".$u15['clay']."&r3=".$u15['iron']."&r4=".$u15['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u15['wood'] OR $village->aclay < $u15['clay'] OR $village->airon < $u15['iron'] OR $village->acrop < $u15['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u15'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=15\">".TRAIN."</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
    
    
    if($database->checkIfResearched($village->wid, 't16') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u16\" src=\"img/x.gif\" alt=\"".U16."\" title=\"".U16."\" />
						".U16."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u16['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u16['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u16['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u16['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u16['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u16['wood']."&r2=".$u16['clay']."&r3=".$u16['iron']."&r4=".$u16['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u16['wood'] OR $village->aclay < $u16['clay'] OR $village->airon < $u16['iron'] OR $village->acrop < $u16['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u16'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=16\">".TRAIN."</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
}


if($session->tribe == 3) {

$output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u21\" src=\"img/x.gif\" alt=\"".U21."\" title=\"".U21."\" />
						".U21."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u21['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u21['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u21['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u21['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u21['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u21['wood']."&r2=".$u21['clay']."&r3=".$u21['iron']."&r4=".$u21['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u21['wood'] OR $village->aclay < $u21['clay'] OR $village->airon < $u21['iron'] OR $village->acrop < $u21['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u21'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=21\">".TRAIN."</a>";
        }  
    $output.="</center></td>
            </tr>";
            
            
    if($database->checkIfResearched($village->wid, 't22') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u22\" src=\"img/x.gif\" alt=\"".U22."\" title=\"".U22."\" />
						".U22."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u22['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u22['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u22['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u22['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u22['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u22['wood']."&r2=".$u22['clay']."&r3=".$u22['iron']."&r4=".$u22['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u22['wood'] OR $village->aclay < $u22['clay'] OR $village->airon < $u22['iron'] OR $village->acrop < $u22['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u22'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=22\">".TRAIN."</a>";
        }  
        $output.="</center></td>
            </tr>";
    }    

  
    if($database->checkIfResearched($village->wid, 't24') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u24\" src=\"img/x.gif\" alt=\"".U24."\" title=\"".U24."\" />
						".U24."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u24['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u24['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u24['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u24['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u24['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u24['wood']."&r2=".$u24['clay']."&r3=".$u24['iron']."&r4=".$u24['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u24['wood'] OR $village->aclay < $u24['clay'] OR $village->airon < $u24['iron'] OR $village->acrop < $u24['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u24'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=24\">".TRAIN."</a>";
        }  
        $output.="</center></td>
            </tr>";
    }   
    
    if($database->checkIfResearched($village->wid, 't25') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u25\" src=\"img/x.gif\" alt=\"".U25."\" title=\"".U25."\" />
						".U25."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u25['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u25['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u25['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u25['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u25['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u25['wood']."&r2=".$u25['clay']."&r3=".$u25['iron']."&r4=".$u25['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u25['wood'] OR $village->aclay < $u25['clay'] OR $village->airon < $u25['iron'] OR $village->acrop < $u25['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u25'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=25\">".TRAIN."</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
    
    
    if($database->checkIfResearched($village->wid, 't26') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u26\" src=\"img/x.gif\" alt=\"".U26."\" title=\"".U26."\" />
						".U26."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"".LUMBER."\" />".$u26['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"".CLAY."\" />".$u26['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"".IRON."\" />".$u26['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"".CROP."\" />".$u26['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"".CROP_COM."\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"".DURATION."\" />".
				        $generator->getTimeFormat(round($u26['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
				        
				        if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   			$output .= "|<a href=\"build.php?gid=17&t=3&r1=".$u26['wood']."&r2=".$u26['clay']."&r3=".$u26['iron']."&r4=".$u26['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 		}
				        
				        $output .= "
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u26['wood'] OR $village->aclay < $u26['clay'] OR $village->airon < $u26['iron'] OR $village->acrop < $u26['crop']) { 
            $output.= "<span class=\"none\">".NOT."".ENOUGH_RESOURCES."</span>"; 
        }else if($units['u26'] == 0){ 
            $output.= "<span class=\"none\">".NOT_UNITS."</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=26\">".TRAIN."</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
}



        //HERO TRAINING
        if($session->tribe == 1){
                if(isset($_GET['train']) && $_GET['train'] == 1){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '1', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u1['time'] / SPEED)*3))."', '50', '1')");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u1` = `u1` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u1['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u1['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u1['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u1['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit;
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 2){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '2', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u1['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u2` = `u2` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u2['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u2['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u2['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u2['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 3){
				if($session->access != BANNED){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '3', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u3['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u3` = `u3` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u3['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u3['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u3['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u3['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 5){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '5', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u5['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u5` = `u5` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u5['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u5['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u5['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u5['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 6){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '6', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u6['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u6` = `u6` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u6['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u6['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u6['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u6['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
				}
			}
        if($session->tribe == 2){
                if(isset($_GET['train']) && $_GET['train'] == 11){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '11', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u11['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u11` = `u11` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u11['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u11['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u11['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u11['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
                    header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
                }
                if(isset($_GET['train']) && $_GET['train'] == 12){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '12', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u12['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u12` = `u12` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u12['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u12['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u12['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u12['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 13){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '13', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u13['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u13` = `u13` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u13['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u13['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u13['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u13['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 15){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '15', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u15['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u15` = `u15` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u15['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u15['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u15['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u15['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 16){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '16', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u16['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u16` = `u16` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u16['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u16['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u16['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u16['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
            }
        if($session->tribe == 3){
                if(isset($_GET['train']) && $_GET['train'] == 21){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '21', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u21['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u21` = `u21` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u21['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u21['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u21['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u21['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 22){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '22', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u22['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u22` = `u22` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u22['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u22['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u22['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u22['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 24){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '24', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u24['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u24` = `u24` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u24['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u24['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u24['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u24['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 25){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '25', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u25['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u25` = `u25` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u25['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u25['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u25['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u25['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
                if(isset($_GET['train']) && $_GET['train'] == 26){
				if($session->access != BANNED){
					if($count_hero < 3){
					mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$database->escape($session->uid)."', '" . (int) $village->wid . "', '0', '26', '".$database->escape($session->username)."', '0', '5', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u26['time'] / SPEED)*3))."', '50', '1')");
                    mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "units SET `u26` = `u26` - 1 WHERE `vref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".(int) $u26['wood']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".(int) $u26['clay']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `iron` = `iron` - ".(int) $u26['iron']." WHERE `wref` = '" . (int) $village->wid . "'");
					mysqli_query($GLOBALS['link'],"UPDATE " . TB_PREFIX . "vdata SET `crop` = `crop` - ".(int) $u26['crop']." WHERE `wref` = '" . (int) $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					exit;
					}else{
					header("Location: banned.php");
					exit; 
					}
					}
			}
            
        
        

	echo  $output;  
}
?>
</table>
