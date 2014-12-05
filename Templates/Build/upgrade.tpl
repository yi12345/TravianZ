<?php
//fix by ronix
$bid = $village->resarray['f'.$id.'t'];
$bindicate = $building->canBuild($id,$bid);
if($bindicate == 1) {
    echo "<p><span class=\"none\">建築物已達最高等級。</span></p>";
} else if($bindicate == 10) {
    echo "<p><span class=\"none\">建築物即將升至最高等級。</span></p>";
} else if($bindicate == 11) {
    echo "<p><span class=\"none\">建築物即將摧毀。</span></p>";
} else {
    $loopsame = ($building->isCurrent($id) || $building->isLoop($id))?1:0;
    $doublebuild = ($building->isCurrent($id) && $building->isLoop($id))?1:0;
    $master = count($database->getMasterJobsByField($village->wid,$id));
    $uprequire = $building->resourceRequired($id,$village->resarray['f'.$id.'t'],1+$loopsame+$doublebuild+$master);
    $mastertime = $uprequire['time'];
    $_SESSION['mas'][$bid]=$bid.",".$id.",".$mastertime;
?>
<p id="contract">升級到等級 <?php echo $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master; ?> <b>所需資源</b>:<br />
<img class="r1" src="img/x.gif" alt="Lumber" title="Lumber" /><span class="little_res"><?php echo $uprequire['wood']; ?></span> | <img class="r2" src="img/x.gif" alt="Clay" title="Clay" /><span class="little_res"><?php echo $uprequire['clay']; ?></span> | <img class="r3" src="img/x.gif" alt="Iron" title="Iron" /><span class="little_res"><?php echo $uprequire['iron']; ?></span> | <img class="r4" src="img/x.gif" alt="Crop" title="Crop" /><span class="little_res"><?php echo $uprequire['crop']; ?></span> | <img class="r5" src="img/x.gif" alt="Crop consumption" title="Crop consumption" /><?php echo $uprequire['pop']; ?> | <img class="clock" src="img/x.gif" alt="duration" title="duration" /><?php echo $generator->getTimeFormat($uprequire['time']); 
if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
    echo "|<a href=\"build.php?gid=17&t=3&r1=".$uprequire['wood']."&r2=".$uprequire['clay']."&r3=".$uprequire['iron']."&r4=".$uprequire['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                 } ?><br />
<?php
    if($bindicate == 2) {
           echo "<span class=\"none\">所有的工人皆已有工作。</span>";
    if($session->goldclub == 1){
?>    </br>
<?php
    if($id <= 18) {
    if($session->gold >= 1 && $village->master == 0){
        echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime&c=$session->checker\">雇用大師進行建造 </a>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }else{
        echo "<span class=\"none\">雇用大師進行建造</span>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }
    }else{
    if($session->gold >= 1 && $village->master == 0){
        echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime&c=$session->checker\">雇用大師進行建造 </a>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }else{
        echo "<span class=\"none\">雇用大師進行建造</span>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }
    }
    }
    }
    else if($bindicate == 3) {
        echo "<span class=\"none\">所有的工人皆已有工作。 (排入建築貯列)</span>";
    if($session->goldclub == 1){
?>    </br>
<?php
    if($id <= 18) {
    if($session->gold >= 1 && $village->master == 0){
        echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime&c=$session->checker\">雇用大師進行建造 </a>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }else{
        echo "<span class=\"none\">雇用大師進行建造</span>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }
    }else{
    if($session->gold >= 1 && $village->master == 0){
        echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime&c=$session->checker\">雇用大師進行建造 </a>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }else{
        echo "<span class=\"none\">雇用大師進行建造</span>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }
    }
    }
    }
    else if($bindicate == 4) {
        echo "<span class=\"none\">食物不足，請升級農田。</span>";
    }
    else if($bindicate == 5) {
        echo "<span class=\"none\">請先升級倉庫。</span>";
    }
    else if($bindicate == 6) {
        echo "<span class=\"none\">請先升級糧倉。</span>";
    }
    else if($bindicate == 7) {
    if($village->allcrop - $village->pop - $automation->getUpkeep($village->unitall, 0) > 0){
        $neededtime = $building->calculateAvaliable($id,$village->resarray['f'.$id.'t'],1+$loopsame+$doublebuild+$master);
        echo "<span class=\"none\">於 ".$neededtime[0]." 的 ".$neededtime[1]." 足夠資源"."</span>";
    }else{
        echo "<span class=\"none\">你的糧食生產量為負，您將無法建造任何東西。</span>";
    }
    if($session->goldclub == 1){
?>    </br>
<?php
    if($id <= 18) {
    if($session->gold >= 1 && $village->master == 0){
        echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime&c=$session->checker\">雇用大師進行建造 </a>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }else{
        echo "<span class=\"none\">雇用大師進行建造 </span>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }
    }else{
    if($session->gold >= 1 && $village->master == 0){
        echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime&c=$session->checker\">雇用大師進行建造 </a>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }else{
        echo "<span class=\"none\">雇用大師進行建造</span>";
        echo '<font color="#B3B3B3">(需要花費: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Gold" title="Gold"/>1)</font>';
    }
    }
    }
    }
    else if($bindicate == 8) {
        if($session->access==BANNED){
        echo "<a class=\"build\" href=\"banned.php\">升級到等級 ";
        }
        else if($id <= 18) {
        echo "<a class=\"build\" href=\"dorf1.php?a=$id&c=$session->checker\">升級到等級 ";
        }
        else {
        echo "<a class=\"build\" href=\"dorf2.php?a=$id&c=$session->checker\">升級到等級 ";
        }
        echo $village->resarray['f'.$id]+1;
        echo ".</a>";
        }
    else if($bindicate == 9) {
        if($session->access==BANNED){
        echo "<a class=\"build\" href=\"banned.php\">升級到等級 ";
        }
        else if($id <= 18) {
        echo "<a class=\"build\" href=\"dorf1.php?a=$id&c=$session->checker\">升級到等級 ";
        }
        else {
        echo "<a class=\"build\" href=\"dorf2.php?a=$id&c=$session->checker\">升級到等級 ";
        }
        echo $village->resarray['f'.$id]+($loopsame > 0 ? 2:1);
        echo ".</a> <span class=\"none\">(等待貯列)</span> ";
    }
}

?>
