<?php
//////////////     made by alq0rsan   /////////////////////////
if($session->access != BANNED){
    $MyVilId = mysqli_query($GLOBALS['link'],"SELECT * FROM ".TB_PREFIX."vdata WHERE `wref`='".$village->wid."'") or die(mysqli_error($database->dblink));
    $uuVilid = mysqli_fetch_array($MyVilId);

    $totalT = ($T1+$T2+$T3+$T4);
    $totalR = ($uuVilid['6']+$uuVilid['7']+$uuVilid['8']+$uuVilid['10']);

    $goldlog = mysqli_fetch_array(mysqli_query($GLOBALS['link'],"SELECT Count(*) as Total FROM ".TB_PREFIX."gold_fin_log"), MYSQLI_ASSOC) or die(mysqli_error($database->dblink));

if($totalT <= $totalR) {
mysqli_query($GLOBALS['link'],"UPDATE ".TB_PREFIX."vdata set wood = '".$T1."' where `wref`='".$village->wid."'") or die(mysqli_error($database->dblink));
mysqli_query($GLOBALS['link'],"UPDATE ".TB_PREFIX."vdata set clay = '".$T2."' where `wref`='".$village->wid."'") or die(mysqli_error($database->dblink));
mysqli_query($GLOBALS['link'],"UPDATE ".TB_PREFIX."vdata set iron = '".$T3."' where `wref`='".$village->wid."'") or die(mysqli_error($database->dblink));
mysqli_query($GLOBALS['link'],"UPDATE ".TB_PREFIX."vdata set crop = '".$T4."' where `wref`='".$village->wid."'") or die(mysqli_error($database->dblink));
    mysqli_query($GLOBALS['link'],"UPDATE ".TB_PREFIX."users set gold = ".($session->gold-3)." where `id`='".$session->uid."'") or die(mysqli_error($database->dblink));
    mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".($goldlog['Total']+1)."', '".$village->wid."', 'trade 1:1')") or die(mysqli_error($database->dblink));
echo "done";
} else {
echo "failed";
    mysqli_query($GLOBALS['link'],"INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".($goldlog['Total']+1)."', '".$village->wid."', 'Failed trade 1:1')") or die(mysqli_error($database->dblink));

}

header("Location: plus.php?id=3");
exit;
}else{
header("Location: banned.php");
exit;
}
 ?>