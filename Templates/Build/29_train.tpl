<?php
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
    for ($i=($session->tribe-1)*10+1;$i<=($session->tribe-1)*10+4;$i++) {
        if ($i <> 4 && $i <> 23 && $i <> 24 && ($technology->getTech($i) || $i%10 == 1)) {

echo "<tr><td class=\"desc\">
<div class=\"tit\">
<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
<a href=\"#\" onClick=\"return Popup(".$i.",1);\"> ".$technology->getUnitName($i)."</a> <span class=\"info\">(Available: ".$village->unitarray['u'.$i].")</span>
</div>
<div class=\"details\">
<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".(${'u'.$i}['wood']*3)."|<img class=\"r2\" src=\"img/x.gif\" alt=\"磚塊\" title=\"磚塊\" />".(${'u'.$i}['clay']*3)."|<img class=\"r3\" src=\"img/x.gif\" alt=\"鋼鐵\" title=\"鋼鐵\" />".(${'u'.$i}['iron']*3)."|<img class=\"r4\" src=\"img/x.gif\" alt=\"穀物\" title=\"穀物\" />".(${'u'.$i}['crop']*3)."|<img class=\"r5\" src=\"img/x.gif\" alt=\"穀物消耗\" title=\"穀物消耗\" />".${'u'.$i}['pop']."|<img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />";
$dur=round(${'u'.$i}['time'] * ($bid29[$village->resarray['f'.$id]]['attri'] / 100) / SPEED * $artefact_bonus2 / $artefact_bonus);
					$foolartefact = $database->getFoolArtefactInfo(5,$village->wid,$session->uid);
					if(count($foolartefact) > 0){
					foreach($foolartefact as $arte){
					if($arte['bad_effect'] == 1){
					$dur *= $arte['effect2'];
					}else{
					$dur /= $arte['effect2'];
					$dur = round($dur);
					}
					}
					}
					$dur=$generator->getTimeFormat($dur);
echo ($dur=="0:00:00")? "0:00:01":$dur;
if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   echo "|<a href=\"build.php?gid=17&t=3&r1=".((${'u'.$i}['wood'])*$technology->maxUnitPlus($i))."&r2=".((${'u'.$i}['clay'])*$technology->maxUnitPlus($i))."&r3=".((${'u'.$i}['iron'])*$technology->maxUnitPlus($i))."&r4=".((${'u'.$i}['crop'])*$technology->maxUnitPlus($i))."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 }
echo "</div>
</td>
<td class=\"val\"><input type=\"text\" class=\"text\" name=\"t".$i."\" value=\"0\" maxlength=\"10\"></td>
<td class=\"max\"><a href=\"#\" onClick=\"document.snd.t".$i.".value=".$technology->maxUnit($i,true)."; return false;\">(".$technology->maxUnit($i,true).")</a></td></tr></tbody>";
        }
    }
?>
