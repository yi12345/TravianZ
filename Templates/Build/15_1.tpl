 <?php
$ty=(isset($_GET['ty']))? $_GET['ty']:"";
if($_REQUEST["cancel"] == "1") {
if($session->access != BANNED){
    $database->delDemolition($village->wid);
    header("Location: build.php?gid=15&ty=$ty&cancel=0&demolish=0");
}else{
header("Location: banned.php");
}
}

if(!empty($_REQUEST["demolish"]) && $_REQUEST["c"] == $session->mchecker) {
if($session->access != BANNED){
    if($_REQUEST["type"] != null)     {
        $type = $_REQUEST['type'];
        $database->addDemolition($village->wid,$type);
        $session->changeChecker();
        header("Location: build.php?gid=15&ty=$type&cancel=0&demolish=0");
    }
}else{
header("Location: banned.php");
}
}

if($village->resarray['f'.$id] >= DEMOLISH_LEVEL_REQ) {
    echo "<h2>Demolition of the building:</h2><p>If you no longer need a building, you can order the demolition of the building.</p>";
    $VillageResourceLevels = $database->getResourceLevel($village->wid);
    $DemolitionProgress = $database->getDemolition($village->wid);
    if (!empty($DemolitionProgress)) {
        $Demolition = $DemolitionProgress[0];
        echo "<b>";
        echo "<a href='build.php?id=".$_GET['id']."&ty=".$ty."&cancel=1'><img src='img/x.gif' class='del' title='cancel' alt='cancel'></a> ";
        echo "Demolition of ".$building->procResType($VillageResourceLevels['f'.$Demolition['buildnumber'].'t']).": <span id=timer1>".$generator->getTimeFormat($Demolition['timetofinish']-time())."</span>";
            if($session->gold >= 2) {
            if($session->access!=BANNED){
            ?> <a href="?id=15&buildingFinish=1&ty=<?php echo $ty;?>" title="Finish all construction and research orders in this village immediately for 2 Gold?"><img class="clock" alt="Finish all construction and research orders in this village immediately for 2 Gold?" src="img/x.gif"/></a>
            <?php
            }else{
            ?> <a href="banned.php" title="Finish all construction and research orders in this village immediately for 2 Gold?"><img class="clock" alt="Finish all construction and research orders in this village immediately for 2 Gold?" src="img/x.gif"/></a>
        <?php
            }
            }
        echo "</b>";
    } else {
        echo "
        <form action=\"build.php?gid=15&amp;demolish=1&amp;cancel=0&amp;c=".$session->mchecker."\" method=\"POST\" style=\"display:inline\">
        <select name=\"type\" class=\"dropdown\">";
        for ($i=19; $i<=41; $i++) {
            $select=($i==$ty)? " SELECTED":"";
            if ($VillageResourceLevels['f'.$i] >= 1 && !$building->isCurrent($i) && !$building->isLoop($i)) {
                echo "<option value=".$i.$select.">".$i.". ".$building->procResType($VillageResourceLevels['f'.$i.'t'])." (lvl ".$VillageResourceLevels['f'.$i].")</option>";
            }
        }
        if ($village->natar==1) {
            $select=($ty==99)? " SELECTED":"";
            if ($VillageResourceLevels['f99'] >= 1 && !$building->isCurrent(99) && !$building->isLoop(99)) {
                echo "<option value=99".$select.">99. ".$building->procResType(40)." (lvl ".$VillageResourceLevels['f99'].")</option>";
            }
        }
        echo "</select><input id=\"btn_demolish\" name=\"demolish\" class=\"dynamic_img\" value=\"Demolish\" type=\"image\" src=\"img/x.gif\" alt=\"Demolish\" title=\"Demolish\" /></form>";
    }
}
?>
