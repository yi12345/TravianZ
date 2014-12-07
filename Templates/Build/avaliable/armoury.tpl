    <h2>軍械庫</h2>
	<table class="new_building" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<td class="desc">在軍械庫，你可以增強你的軍隊裝甲。通過升級，你可以製作更好的鎧甲來強化軍隊。</td>
			<td rowspan="3" class="bimg">
				<a href="#" onClick="return Popup(13,4);">
				<img class="building g13" src="img/x.gif" alt="Armoury" title="Armoury" /></a>
			</td>
		</tr>
		<tr>
		<?php
        $_GET['bid'] = 13;
        include("availupgrade.tpl");
        ?>
		</tr></tbody>
	</table>