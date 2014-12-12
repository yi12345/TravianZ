<?php
// Temp

$eigen = $database->getCoor($village->wid);

$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);

$to = array('x'=>$coor['x'], 'y'=>$coor['y']);

      		$artefact = count($database->getOwnUniqueArtefactInfo2($session->uid,2,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($village->wid,2,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($session->uid,2,2,0));
			if($artefact > 0){
			$fastertroops = 3;
			}else if($artefact1 > 0){
			$fastertroops = 2;
			}else if($artefact2 > 0){
			$fastertroops = 1.5;
			}else{
			$fastertroops = 1;
			}
$time = round($generator->procDistanceTime($from,$to,300,0)/$fastertroops);
$foolartefact = $database->getFoolArtefactInfo(2,$village->wid,$seesion->uid);
if(count($foolartefact) > 0){
foreach($foolartefact as $arte){
if($arte['bad_effect'] == 1){
$time *= $arte['effect2'];
}else{
$time /= $arte['effect2'];
$time = round($time);
}
}
}

// Temp

$ckey= $generator->generateRandStr(6);


 if (!isset($process['t1']) || $process['t1'] == ''){  $t1='0'; }else{  $t1=$process['t1']; }
 if (!isset($process['t2']) || $process['t2'] == ''){  $t2='0'; }else{  $t2=$process['t2']; }
 if (!isset($process['t3']) || $process['t3'] == ''){  $t3='0'; }else{  $t3=$process['t3']; if ($session->tribe == 3){ $scout=1; } }
 if (!isset($process['t4']) || $process['t4'] == ''){  $t4='0'; }else{  $t4=$process['t4']; if ($session->tribe == 1 || $session->tribe == 2 || $session->tribe == 4 || $session->tribe == 5){ $scout=1;} }
 if (!isset($process['t5']) || $process['t5'] == ''){  $t5='0'; }else{  $t5=$process['t5']; }
 if (!isset($process['t6']) || $process['t6'] == ''){  $t6='0'; }else{  $t6=$process['t6']; }
 if (!isset($process['t7']) || $process['t7'] == ''){  $t7='0'; }else{  $t7=$process['t7']; }
 if (!isset($process['t8']) || $process['t8'] == ''){  $t8='0'; }else{  $t8=$process['t8']; }
 if (!isset($process['t9']) || $process['t9'] == ''){  $t9='0'; }else{  $t9=$process['t9']; }
 if (!isset($process['t10']) || $process['t10'] == ''){  $t10='0'; }else{  $t10=$process['t10']; }
 if (!isset($process['t11']) || $process['t11'] == ''){  $t11='0'; }else{  $t11=$process['t11']; $showhero=1;}
 if ($session->tribe == 3){
 $totalunits =$process['t1']+$process['t2']+$process['t4']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];

 }else{
 $totalunits =$process['t1']+$process['t2']+$process['t3']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];
 }
 if ($scout==1 && $totalunits==0) {
if ($process['c'] != 2){
$process['c'] = 1;
}
}
    $id = $database->addA2b($ckey,time(),$process['0'],$t1,$t2,$t3,$t4,$t5,$t6,$t7,$t8,$t9,$t10,$t11,$process['c']);



if ($process['c']==1){

$actionType = "偵查";

}else if ($process['c']==2){

$actionType = "增援";

}elseif ($process['c']==3){

$actionType = "攻擊";

}else{

$actionType = "搶劫";

}

$uid = $session->uid;

$tribe = $session->tribe;
$start = ($tribe-1)*10+1;
$end = ($tribe*10);
?>

<h1><?php echo "對 ".$process[1]." 的".$actionType; ?></h1>
<form method="post" action="a2b.php">

            <table id="short_info" cellpadding="1" cellspacing="1">

                <tbody>

                    <tr>

                        <th>目標:</th>

                        <td><a href="karte.php?d=<?php echo $process[0]; ?>&c=<?php echo $generator->getMapCheck($process[0]); ?>"><?php echo $process[1]; ?> (<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</a></td>

                    </tr>

                    <tr>

                        <th>玩家:</th>

                        <td><a href="spieler.php?uid=<?php echo $process['2']; ?>"><?php echo $database->getUserField($process['2'],'username',0); ?></a></td>

                    </tr>

                </tbody>

            </table>



            <table class="troop_details" cellpadding="1" cellspacing="1">

                <thead>

                    <tr>

                        <td><?php echo $process[1]; ?></td>

                        <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>"><?php echo "對 ".$process['1']." 的".$actionType; ?></td>

                    </tr>

                </thead>

                <tbody class="units">

                    <tr>

                        <td></td>
                 <?php
                for($i=$start;$i<=($end);$i++) {
                      echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
                  } if ($process['t11'] != ''){
                  echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Hero\" alt=\"Hero\" /></td>";

                  }?>

                    </tr>

                    <tr>

                        <th>數量</th>

                        <td <?php if (!isset($process['t1']) || $process['t1'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t1'];} ?></td>

                        <td <?php if (!isset($process['t2']) || $process['t2'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t2'];} ?></td>

                        <td <?php if (!isset($process['t3']) || $process['t3'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t3'];} ?></td>

                        <td <?php if (!isset($process['t4']) || $process['t4'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t4'];} ?></td>

                        <td <?php if (!isset($process['t5']) || $process['t5'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t5'];} ?></td>

                        <td <?php if (!isset($process['t6']) || $process['t6'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t6'];} ?></td>

                        <td <?php if (!isset($process['t7']) || $process['t7'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t7'];} ?></td>

                        <td <?php if (!isset($process['t8']) || $process['t8'] == ''){ echo "class=\"none\">0"; }else{ $kata='1'; echo ">".$process['t8'];} ?></td>

                        <td <?php if (!isset($process['t9']) || $process['t9'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t9'];} ?></td>

                        <td <?php if (!isset($process['t10']) || $process['t10'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t10'];} ?></td>

                        <?php if (!isset($process['t11']) || $process['t11'] == ''){ echo ""; }else{ echo "<td>".$process['t11']."</td>";} ?>

                     </tr>

                </tbody>
                                         <?php                if ($process['c']==1){

?>
                <tbody class="options">
        <tr>
            <th>Options</th>
            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>"><input class="radio" name="spy" value="1" checked="checked" type="radio">偵查兵種及資源<br>
            <input class="radio" name="spy" value="2" type="radio">偵查防禦及兵種                                            </td>
        </tr>
    </tbody>
    <?php } ?>


        <?php if(isset($kata) AND $process['c']!='2'){?><tr>

            <?php if($process['c']=='3'){ ?><tbody class="cata">
                <tr>
                    <th>目標:</th>
                    <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">

                        <select name="ctar1" class="dropdown">
                            <option value="0">Random</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                <optgroup label="Resources">
                                <option value="1">伐木場</option>
                                <option value="2">泥坑</option>
                                <option value="3">鐵礦場</option>
                                <option value="4">農田</option>
                                <option value="5">鋸木廠</option>
                                <option value="6">磚廠</option>

                                <option value="7">鋼鐵鑄造廠</option>
                                <option value="8">麵粉廠</option>
                                <option value="9">麵包店</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="Infrastructure">
                                <option value="10">倉庫</option>
                                <option value="11">糧倉</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">村莊大樓</option>
                                <option value="17">市場</option>
                                <option value="18">大使館</option>
                                <option value="24">城鎮廳</option>
                                <option value="25">行宮</option>
                                <option value="26">皇宮</option>
                                <option value="27">寶物庫</option>
                                <option value="28">交易所</option>
                                <?php } ?>
                                <option value="38">大倉庫</option>
                                <option value="39">大糧倉</option>
                                <option value="40">世界奇觀</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="Military">
                                <option value="12">鐵匠</option>
                                <option value="13">盔甲廠</option>
                                <option value="14">競技場</option>
                                <option value="16">集結點</option>
                                <option value="19">兵營</option>
                                <option value="20">馬廄</option>
                                <option value="21">工場</option>

                                <option value="22">研究院</option>
                                <option value="29">大兵營</option>
                                <option value="30">大馬廄</option>
                                <option value="37">英雄宅</option>
                            </optgroup>
                            <?php } ?>
                        </select>

            <?php if($building->getTypeLevel(16) == 20 && $process['t8'] >= 20) { ?>
                     <select name="ctar2" class="dropdown">
                <option value="0">-</option>
                <option value="99">Random</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                            <optgroup label="Resources">
                                <option value="1">伐木場</option>
                                <option value="2">泥坑</option>
                                <option value="3">鐵礦場</option>
                                <option value="4">農田</option>
                                <option value="5">鋸木廠</option>
                                <option value="6">磚廠</option>

                                <option value="7">鋼鐵鑄造廠</option>
                                <option value="8">麵粉廠</option>
                                <option value="9">麵包店</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="Infrastructure">
                                <option value="10">倉庫</option>
                                <option value="11">糧倉</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">村莊大樓</option>
                                <option value="17">市場</option>
                                <option value="18">大使館</option>
                                <option value="24">城鎮廳</option>
                                <option value="25">行宮</option>
                                <option value="26">皇宮</option>

                                <option value="27">寶物庫</option>
                                <option value="28">交易所</option>
                                <?php } ?>
                                <option value="38">大倉庫</option>
                                <option value="39">大糧倉</option>
								<option value="40">世界奇觀</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="Military">
                                <option value="12">鐵匠</option>
                                <option value="13">盔甲廠</option>
                                <option value="14">競技場</option>
                                <option value="16">集結點</option>
                                <option value="19">兵營</option>
                                <option value="20">馬廄</option>
                                <option value="21">工場</option>

                                <option value="22">研究院</option>
                                <option value="29">大兵營</option>
                                <option value="30">大馬廄</option>
                                <option value="37">英雄宅</option>
                            </optgroup>
                            <?php } ?>
                        </select>
                    <?php }?>

                    <span class="info">(將會被投石車攻擊)</span>
                     </td>
                </tr>
            </tbody><?PHP
            }
            else if($process['c']=='4')
            {
                ?><tbody class="infos">
                <th>目標:</th>

            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">
                <?PHP

                echo"警告: 投石車<b>只能</b>使用於普通攻擊 (請勿使用於搶奪中)";
                ?>
                </td>

        </tr>
                <?PHP
            }
            ?>

        <?php } ?>



             <tbody class="infos">
    <tr>

   <th>到達時間</th>



            <?php
            $speeds = array();

            $scout = 1;

                //find slowest unit.

                for($i=1;$i<=11;$i++)

                {

                    if (isset($process['t'.$i]))

                    {

                        if( $process['t'.$i] != '' && $process['t'.$i] > 0)

                        {

                            if ($i<11)
                $speeds[] = ${'u'.(($session->tribe-1)*10+$i)}['speed'];
                else
                {
                //$uid
                $q = "SELECT * FROM ".TB_PREFIX."hero WHERE uid = $uid";
                $result = mysql_query($q);
                $hero_f=mysql_fetch_array($result);
                $hero_unit=$hero_f['unit'];
                $speeds[] = ${'u'.$hero_unit}['speed'];
                }

                            if($i != 4)

                                $scout = 0;

                        }



                    }

                }





            if($scout)

                $process['c'] = 1;

            $artefact = count($database->getOwnUniqueArtefactInfo2($session->uid,2,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($village->wid,2,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($session->uid,2,2,0));
			if($artefact > 0){
			$fastertroops = 3;
			}else if($artefact1 > 0){
			$fastertroops = 2;
			}else if($artefact2 > 0){
			$fastertroops = 1.5;
			}else{
			$fastertroops = 1;
			}
                $time = round($generator->procDistanceTime($from,$to,min($speeds),1)/$fastertroops);
				$foolartefact = $database->getFoolArtefactInfo(2,$village->wid,$seesion->uid);
				if(count($foolartefact) > 0){
				foreach($foolartefact as $arte){
				if($arte['bad_effect'] == 1){
				$time *= $arte['effect2'];
				}else{
				$time /= $arte['effect2'];
				$time = round($time);
				}
				}
				}

            ?>



            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">

            <div class="in">剩餘 <?php echo $generator->getTimeFormat($time); ?></div>

            <div class="at">預計 <span id="tp2"> <?php echo $generator->procMtime(date('U')+$time,9)?></span><span> 到達</span></div>

            </td>

        </tr>

    </tbody>

</table>

<input name="timestamp" value="<?php echo time(); ?>" type="hidden">

<input name="timestamp_checksum" value="<?php echo $ckey; ?>" type="hidden">

<input name="ckey" value="<?php echo $id; ?>" type="hidden">

<input name="id" value="39" type="hidden">

<input name="a" value="533374" type="hidden">
<input name="c" value="3" type="hidden">

<?php
    if(($database->hasBeginnerProtection($village->wid)==1)&&($database->hasBeginnerProtection($process['0'])==0)){
  	echo"<span style=\"color: #DD0000\"><b>注意:</b> 攻擊其他玩家將取消您的新手保護。</span>";
    }
    if($database->hasBeginnerProtection($process['0'])==1) {
        echo"<b>該玩家正在新手保護期。</b>";
    } else {
?>
        <p class="btn"><input value="ok" name="s1" id="btn_ok"

class="dynamic_img " src="img/x.gif" alt="OK" type="image" onclick="if (this.disabled==false) {document.getElementsByTagName('form')[0].submit();} this.disabled=true;" onLoad="this.disabled=false;"></p>

<?php } ?>
</form>
</div>
