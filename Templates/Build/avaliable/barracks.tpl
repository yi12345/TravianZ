<h2>軍營</h2>

<table class="new_building" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<td class="desc">在軍營，你可以訓練你的軍隊。等級越高速度越快訓練速度愈快</td>
		<td rowspan="3" class="bimg">
        <a href="#" onClick="return Popup(19,4);">
				<img class="building g19" src="img/x.gif" alt="Barracks" title="Barracks" /></a>
					</td>
	</tr>
	<tr>
		<?php
        $_GET['bid'] = 19;
        include("availupgrade.tpl");
        ?>
	</tr>
</table>