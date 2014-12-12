<h2>訓練場</h2>
	<table class="new_building" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<td class="desc">在訓練場你的部隊可以訓練，以提高他們的耐力。進一步的建築升級加快你的部隊超出<?php echo TS_THRESHOLD; ?>廣場的最小距離。</td>
			<td rowspan="3" class="bimg">
				<a href="#" onClick="return Popup(14,4);">
				<img class="building g14" src="img/x.gif" alt="Tournament Square" title="Tournament Square" /></a>
			</td>
		</tr>
		<tr>
		<?php
        $_GET['bid'] = 14;
        include("availupgrade.tpl");
        ?>
		</tr></tbody>
	</table>