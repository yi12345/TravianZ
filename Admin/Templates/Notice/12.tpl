<?php
$dataarray = explode(",",$rep[0]['data']);
if ($database->getUserField($dataarray[0],'username',0)!="??") {
    $user_url="<a href=\"spieler.php?uid=".$database->getUserField($dataarray[0],'id',0)."\">".$database->getUserField($dataarray[0],'username',0)."</a>";
}else{
    $user_url="<font color=\"grey\"><b>??</b></font>";
}
if($database->getVillageField($dataarray[1],'name')!="??") {
    $from_url="<a href=\"karte.php?d=".$dataarray[1]."&c=".$generator->getMapCheck($dataarray[1])."\">".$database->getVillageField($dataarray[1],'name')."</a>";
}else{
    $from_url="<font color=\"grey\"><b>??</b></font>";
}
?>
<table cellpadding="1" cellspacing="1" id="report_surround">
                        <thead>
                                <tr>
                                        <th>主旨:</th>
                                        <th><?php echo $rep[0]['topic']; ?></th>
                                </tr>

                                <tr>
                                <?php
$date = $generator->procMtime($rep[0]['time']); ?>
                                        <td class="sent">寄送時間:</td>
                                        <td>on <?php echo $date[0]."<span> at ".$date[1]; ?></span> <span>小時</span></td>
                                </tr>
                        </thead>
                        <tbody>
                                <tr><td colspan="2" class="empty"></td></tr>
                                <tr><td colspan="2" class="report_content">
                <table cellpadding="1" cellspacing="1" id="trade"><thead><tr>
<td>&nbsp;</td>
<td>><?php echo $user_url;?> 來自村莊 <?php echo $from_url;?></td>
</tr></thead><tbody><tr>
<th>資源</th>
<td>
        <img class="r1" src="img/x.gif" alt="Wood" title="Wood" /><?php echo $dataarray[2]; ?> |
        <img class="r2" src="img/x.gif" alt="Clay" title="Clay" /><?php echo $dataarray[3]; ?> |
        <img class="r3" src="img/x.gif" alt="Iron" title="Iron" /><?php echo $dataarray[4]; ?> |
        <img class="r4" src="img/x.gif" alt="Crop" title="Crop" /><?php echo $dataarray[5]; ?>
</td></tr></tbody>

</table></td></tr></tbody></table>