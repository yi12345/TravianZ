<body>
    <div id="build" class="gid27">
        <a href="#" onclick="return Popup(27,4);" class="build_logo"><img class="building g27" src="img/x.gif" alt="Treasury" title="<?php echo TREASURY; ?>"></a>

        <h1><?php echo TREASURY; ?> <span class="level"><?php echo LEVEL; ?> <?php

        echo $village->resarray['f' . $id];

?></span></h1>

        <p class="build_desc"><?php echo TREASURY_DESC; ?></p>
        
        <?php

        include ("27_menu.tpl");

?>
        
        <table id="show_artefacts" cellpadding="1" cellspacing="1">
    		<thead>
    			<tr>
			    	<th colspan="4"><?php echo SMALL_ARTIFACTS; ?></th>
    			</tr>
    			<tr>
    				<td></td>
	    			<td><?php echo NAME; ?></td>
	    			<td><?php echo PLAYER; ?></td>
	    			<td><?php echo ALLIANCE; ?></td>
    			</tr>
    		</thead>
    		<tbody>
            <?php

		$count = mysqli_fetch_array(mysqli_query($GLOBALS['link'],"SELECT Count(*) as Total FROM " . TB_PREFIX . "artefacts"), MYSQLI_ASSOC);
		$count = $count['Total'];
        if($count == 0) {
        	echo '<td colspan="4" class="none">'.NO_ARTIFACTS.'</td>';
        } else {


        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 1");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>10</b>, '.EFFECT.' <b>'.VILLAGE.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 2");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>10</b>, '.EFFECT.' <b>'.VILLAGE.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 3");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>10</b>, '.EFFECT.' <b>'.VILLAGE.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 4");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>10</b>, '.EFFECT.' <b>'.VILLAGE.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 5");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>10</b>, '.EFFECT.' <b>'.VILLAGE.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 6");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>10</b>, '.EFFECT.' <b>'.VILLAGE.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 7");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>10</b>, '.EFFECT.' <b>'.VILLAGE.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 8");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Treasury <b>10</b>, Effect <b>Account</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = mysqli_query($GLOBALS['link'],"SELECT type, id, name, effect, vref, owner FROM `" . TB_PREFIX . "artefacts` WHERE size = 1 AND type = 8");
        	while($row = mysqli_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>10</b>, '.EFFECT.' <b>'.VILLAGE.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
        <?php

        }

?>
            
    	</tbody></table>
        
        <?php

        include ("upgrade.tpl");

?>
        
</div>
