<!--
** 
** - TravianX -
** DO NOT REMOVE COPYRIGHT NOTICE!
-->
<?php
include("Templates/Plus/pmenu.tpl");$extragoud="0";
?>

<script type="text/javascript">
<!--
function loadProductGroup(group_id) {
    if (group_id.length == 0){
        path='';
    } else {
        path='?group='+group_id;
    }

    location.href=path;
}
//-->
</script>
<table class="rate_details lang_ltr lang_de" cellpadding="1" cellspacing="1">
	<thead>

		<tr>
			<th colspan="2">Gold Shop</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="pic"><img src="img/bezahlung/Travian_verdienen.jpg" style="99px; height:99px;" alt="Package A" />

			<div>Gold Shop</div>
			</td>
			<td class="desc">
			Basically, we reserve the ordered amount of gold immediately after the payment. If there are any problems, please send an email to our 
			<a href="mailto:<?php echo (defined('PAYPAL_EMAIL') ? PAYPAL_EMAIL : 'martin@martinambrus.com') ?>">payment account</a>. <br /><br /><b>Username<br />Payment Method<br />Ordered Package<br />
			Date and time</b><br /><br />We strive to ensure speedy processing!<br />
                            
                            </td>

		</tr>
	</tbody>
</table>
<div id="products">
			    <table class="product lang_ltr lang_de" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<th>Package A</th>
					</tr>
				</thead>
				<tbody>


										<tr>
						<td class="pic"><a href="plus1.php?id=110">
							<img src="img/bezahlung/Travian_paket_a.jpg" style="width:
							99px; height:99px;"
				                         alt="Package A" /></a></td>
					</tr>
					<tr>
						<td><?php echo (defined('PLUS_PACKAGE_A_GOLD') ? PLUS_PACKAGE_A_GOLD : 60); ?>&nbsp;Gold</td>
					</tr>
					<tr>
						<td><?php echo (defined('PLUS_PACKAGE_A_PRICE') ? PLUS_PACKAGE_A_PRICE : '1,99') . ' ' . (defined('PAYPAL_CURRENCY') ? PAYPAL_CURRENCY : 'EUR'); ?></td>

					</tr>
					<tr>
						<td><a href="plus1.php?id=110">&raquo; buy</a></td>
					</tr>
									</tbody>
			</table>
			    <table class="product lang_ltr lang_de" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<th>Package B</th>
					</tr>
				</thead>
				<tbody>


										<tr>
						<td class="pic"><a
							href="plus1.php?id=111">
							<img src="img/bezahlung/Travian_paket_b.jpg" style="width:
							99px; height:99px;"
				                         alt="Package B" /></a></td>
					</tr>
					<tr>
                        <td><?php echo (defined('PLUS_PACKAGE_B_GOLD') ? PLUS_PACKAGE_B_GOLD : 120); ?>&nbsp;Gold</td>
                    </tr>
                    <tr>
                        <td><?php echo (defined('PLUS_PACKAGE_B_PRICE') ? PLUS_PACKAGE_B_PRICE : '4,99') . ' ' . (defined('PAYPAL_CURRENCY') ? PAYPAL_CURRENCY : 'EUR'); ?></td>

                    </tr>
					<tr>
						<td><a
							href="plus1.php?id=111">&raquo; buy</a></td>
					</tr>
									</tbody>
			</table>
			    <table class="product lang_ltr lang_de" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<th>Package C</th>
					</tr>
				</thead>
				<tbody>


										<tr>
						<td class="pic"><a
							href="plus1.php?id=112">
							<img src="img/bezahlung/Travian_paket_c.jpg" style="width:
							99px; height:99px;"
				                         alt="Package C" /></a></td>
					</tr>
					<tr>
                        <td><?php echo (defined('PLUS_PACKAGE_C_GOLD') ? PLUS_PACKAGE_C_GOLD : 360); ?>&nbsp;Gold</td>
                    </tr>
                    <tr>
                        <td><?php echo (defined('PLUS_PACKAGE_C_PRICE') ? PLUS_PACKAGE_C_PRICE : '9,99') . ' ' . (defined('PAYPAL_CURRENCY') ? PAYPAL_CURRENCY : 'EUR'); ?></td>

                    </tr>
					<tr>
						<td><a
							href="plus1.php?id=112">&raquo; buy</a></td>
					</tr>
									</tbody>
			</table>
			    <table class="product lang_ltr lang_de" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<th>Package D</th>
					</tr>
				</thead>
				<tbody>


										<tr>
						<td class="pic"><a
							href="plus1.php?id=113">
							<img src="img/bezahlung/Travian_paket_d.jpg" style="width:
							99px; height:99px;"
				                         alt="Package D" /></a></td>
					</tr>
					<tr>
                        <td><?php echo (defined('PLUS_PACKAGE_D_GOLD') ? PLUS_PACKAGE_D_GOLD : 1000); ?>&nbsp;Gold</td>
                    </tr>
                    <tr>
                        <td><?php echo (defined('PLUS_PACKAGE_D_PRICE') ? PLUS_PACKAGE_D_PRICE : '19,99') . ' ' . (defined('PAYPAL_CURRENCY') ? PAYPAL_CURRENCY : 'EUR'); ?></td>

                    </tr>
					<tr>
						<td><a
							href="plus1.php?id=113">&raquo; buy</a></td>
					</tr>
									</tbody>
			</table>
			    <table class="product lang_ltr lang_de" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<th>Package E</th>
					</tr>
				</thead>
				<tbody>


										<tr>
						<td class="pic"><a
							href="plus1.php?id=3110">
							<img src="img/bezahlung/Travian_paket_e.jpg" style="width:
							99px; height:99px;"
				                         alt="Package E" /></a></td>
					</tr>
					<tr>
                        <td><?php echo (defined('PLUS_PACKAGE_E_GOLD') ? PLUS_PACKAGE_E_GOLD : 2000); ?>&nbsp;Gold</td>
                    </tr>
                    <tr>
                        <td><?php echo (defined('PLUS_PACKAGE_E_PRICE') ? PLUS_PACKAGE_E_PRICE : '49,99') . ' ' . (defined('PAYPAL_CURRENCY') ? PAYPAL_CURRENCY : 'EUR'); ?></td>

                    </tr>
					<tr>
						<td><a
							href="plus1.php?id=3110">&raquo; buy</a></td>
					</tr>
									</tbody>
			</table>
			    			   
			   <!-- <table class="product lang_ltr lang_de" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<th>Verdienen</th>
					</tr>
				</thead>
				<tbody>


										<tr>
						<td class="pic"><a
							href="plus1.php?id=5533">
							<img src="img/bezahlung/Travian_verdienen.jpg" style="width:
							99px; height:99px;"
				                         alt="verdienen" /></a></td>
					</tr>
					<tr>
						<td>300&nbsp;Gold</td>
					</tr>
					<tr>
						<td>12,00&nbsp;EUR</td>

					</tr>
					<tr>
						<td><a
							href="plus1.php?id=5533">&raquo; buy</a></td>
					</tr>
									</tbody>
			</table>-->
			    


<div class="clear"></div>
<div style="padding: 10px 10px; font-style: italic; font-size: 10px; color: #F00;"><b>None of the packages are refundable!</b></div>

</div>

</div>
