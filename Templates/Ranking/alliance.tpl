<?php
if(!is_numeric($_SESSION['search'])) {
?>
	<center><font color=orange size=2><p class=\"error\">The alliance <b>"<?php echo $_SESSION['search']; ?>"</b> does not exist.</p></font></center>
<?php
    $search = 0;
}
else {
$search = $_SESSION['search'];
}
?>
<table cellpadding="1" cellspacing="1" id="alliance" class="row_table_data">
			<thead>
				<tr>
					<th colspan="5">
						Крупнейшие альянсы						<div id="submenu"><a title="Топ 10" href="statistiken.php?id=43"><img class="btn_top10" src="img/x.gif" alt="Top 10"></a><a title="защитники недели" href="statistiken.php?id=42"><img class="btn_def" src="img/x.gif" alt="defender"></a><a title="Нападающие недели" href="statistiken.php?id=41"><img class="btn_off" src="img/x.gif" alt="attacker"></a></div>		    
					</th>
				</tr>
		<tr><td></td><td>Альянс</td><td>кол-во игроков</td><td>&Oslash;</td><td>Очки</td></tr>
		</thead><tbody>  
        <?php
        if(isset($_GET['rank'])){
		$multiplier = 1;
			if(is_numeric($_GET['rank'])) {
				if($_GET['rank'] > count($ranking->getRank())) {
				$_GET['rank'] = count($ranking->getRank())-1;
				}
				while($_GET['rank'] > (20*$multiplier)) {
					$multiplier +=1;
				}
			$start = 20*$multiplier-19;
			} else { $start = ($_SESSION['start']+1); }
		} else { $start = ($_SESSION['start']+1); }
        if(count($ranking->getRank()) > 0) {
        	$ranking = $ranking->getRank();
            for($i=$start;$i<($start+20);$i++) {
            	if(isset($ranking[$i]['name']) && $ranking[$i] != "pad") {
                	if($i == $search) {
                    echo "<tr class=\"hl\"><td class=\"ra fc\" >";
                    }
                    else {
                    echo "<tr><td class=\"ra \" >";
                    }
                    echo $i.".</td><td class=\"al \" ><a href=\"allianz.php?aid=".$ranking[$i]['id']."\">".$ranking[$i]['tag']."</a></td><td class=\"pla \" >";
                    echo $ranking[$i]['players']."</td><td class=\"av \" >".$ranking[$i]['avg']."</td><td class=\"po \">".$ranking[$i]['totalpop']."</td></tr>";
                }
            }
        }
        else {
        	echo "<td class=\"none\" colspan=\"5\">Альянсов не обнаружено</td>";
        }
        ?>
 </tbody>
</table>
<?php
include("ranksearch.tpl");
?>
