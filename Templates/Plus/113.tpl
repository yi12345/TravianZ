<?php
include("Templates/Plus/pmenu.tpl");
$free = $session->uid;
?>
<!-- Hinweis -->

<table class="rate_details lang_ltr lang_de" cellpadding="1" cellspacing="1">
	<thead>

		<tr>
			<th colspan="2">1. Call2Pay</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="pic"><img src="img/bezahlung/call2pay.png" style="99px; height:99px;" alt="Paket A" />

			<div>Gold : 1000<br />Cost : 19,99 Euro<br />Wait : Instant</div>
			</td>
			<td class="desc">
							Pay by phone              <br />

            				<a href="#"
					onclick="window.open('http://billing.micropayment.de/call2pay/event/?account=56387&project=trvnx&theme=default&gfx=x-surfer&bgcolor=ffffff&title=travianix-1000+Gold&amount=1999','nsrpay','scrollbars=yes,status=yes,resizable=yes,toolbar=yes,width=800,height=600');return false;">
				<img src="img/bezahlung/call2pay1.png" style="width:126px; height:38px;" alt="call2pay" /></a>

			<br />
                More information about micropayent can be found here:                                <a href="https://www.micropayment.de/" target="_blank"><br />More Info</a>
                            </td>

		</tr>
	</tbody>
</table>

<table class="rate_details lang_ltr lang_de" cellpadding="1" cellspacing="1">
	<thead>

		<tr>
			<th colspan="2">2. Ebank2Pay</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="pic"><img src="img/bezahlung/ebank2pay.png" style="99px; height:99px;" alt="Paket A" />

			<div>Gold : 1000<br />Cost : 19,99 Euro<br />Wait : Instant</div>
			</td>
			<td class="desc">
							Pay by online banktransfer               <br />

            				<a href="#"
					onclick="window.open('http://billing.micropayment.de/ebank2pay/event/?account=56387&project=trvnx&theme=default&gfx=x-surfer&bgcolor=ffffff&title=travianix+1000+Gold&amount=1999&currency=EUR&paytext=travianix+1000+Gold','nsrpay','scrollbars=yes,status=yes,resizable=yes,toolbar=yes,width=800,height=600');return false;">
				<img src="img/bezahlung/ebank2pay2.png" style="width:181px; height:38px;" alt="ebank2pay" /></a>

			<br />
                More information about micropayent can be found here:                                <a href="https://www.micropayment.de/" target="_blank"><br />More Info</a>
                                            </td>

		</tr>
	</tbody>
</table>
<table class="rate_details lang_ltr lang_de" cellpadding="1" cellspacing="1">
	<thead>

		<tr>
			<th colspan="2">3. Paypal</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="pic"><img src="img/bezahlung/paypal.jpg" style="99px; height:99px;" alt="Paket A" />

			<div>Gold : 1000<br />Cost : 19,99 Euro<br />Wait : 24 hours</div>
			</td>
			<td class="desc">Bezahlung per Paypal einleiten<br />
            <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7HRQHLYRA97XU" target="_blank">
				<img src="img/bezahlung/paypal1.gif" style="width:126px; height:47px;" alt="Moneybookers" /></a><br />
            Mehr Information zu PayPal findest du hier:    <br />                            <a href="#"
				onclick="window.open('https://www.paypal.com/de/cgi-bin/webscr?cmd=xpt/cps/popup/OLCWhatIsPayPal-outside','external','scrollbars=yes,status=yes,resizable=yes,toolbar=yes,width=800,height=600');return false;">Weitere Infos</a>                <br /> </td>

		</tr>
	</tbody>
</table>
<table class="rate_details lang_ltr lang_de" cellpadding="1" cellspacing="1">
	<thead>

		<tr>
			<th colspan="2">4. Skrill (moneybookers)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="pic"><img src="img/bezahlung/skrill1.jpg" style="99px; height:99px;" alt="Paket A" />

			<div>Gold : 1000<br />Cost : 19,99 Euro<br />Wait : 24 hours</div>
			</td>
			<td class="desc">
							Mit Skrill (moneybookers) kannst du mit deiner Kreditkarte oder per �berweisung von deinem Konto zahlen.                <br />
                <? echo'<form action="https://www.moneybookers.com/app/payment.pl" target="_blank">
 <input type="hidden" name="pay_to_email" value="novgorodschi@icloud.com">
 <input type="hidden" name="recipient_description" value="netsoundradio">
 <input type="hidden" name="transaction_id" value="113">
 <input type="hidden" name="return_url" value="http://www.merchant.com/payment_made.htm">
 <input type="hidden" name="return_url_text" value="Danke f�r deinen Einkauf">
 <input type="hidden" name="return_url_target" value="1">
 <input type="hidden" name="cancel_url" value="http://www.merchant.com/payment_cancelled.htm">
 <input type="hidden" name="cancel_url_target" value="1">
 <input type="hidden" name="status_url" value="mailto: novgorodschi@icloud.com">
 <input type="hidden" name="status_url2" value="mailto: novgorodschi@icloud.com">
 <input type="hidden" name="new_window_redirect" value="1">
 <input type="hidden" name="dynamic_descriptor" value="Descriptor">
 <input type="hidden" name="language" value="DE">
 <input type="hidden" name="confirmation_note" value="Vielen Dank f�r deinen Einkauf! ">
 <input type="hidden" name="merchant_fields" value="field1">
 <input type="hidden" name="title" value="">
 <input type="hidden" name="firstname" value="">
 <input type="hidden" name="lastname" value="">
 <input type="hidden" name="address" value="">
 <input type="hidden" name="address2" value="Bitte Spielername eingeben">
 <input type="hidden" name="phone_number" value="">
 <input type="hidden" name="postal_code" value="">
 <input type="hidden" name="city" value="">
 <input type="hidden" name="state" value="">
 <input type="hidden" name="country" value="GER">
 <input type="hidden" name="amount" value="19.99">
 <input type="hidden" name="currency" value="EUR">
 <input type="hidden" name="amount2_description" value="Produktpreis:">
 <input type="hidden" name="amount2" value="19.99">
 <input type="hidden" name="amount3_description" value="Bearbeitung:">
 <input type="hidden" name="amount3" value="0">
 <input type="hidden" name="amount4_description" value="Steuer:">
 <input type="hidden" name="amount4" value="0">
 <input type="hidden" name="detail1_description" value="Product ID:">
 <input type="hidden" name="detail1_text" value="Paket D : 600 Gold">
 <input type="hidden" name="detail2_description" value="Beschreibung:">
 <input type="hidden" name="detail2_text" value="Travian Gold ">
 <input type="hidden" name="detail3_description" value="Verk�ufer-ID:">
 <input type="hidden" name="detail3_text" value="37115003">
 <input type="hidden" name="detail4_description" value="Weitere Angaben:">
 <input type="hidden" name="detail4_text" value="5-6 Tage Leieferzeit">
  <input type="hidden" name="rec_period" value="1">
 <input type="hidden" name="rec_grace_period" value="1">
 <input type="hidden" name="rec_cycle" value="day">
 <input type="hidden" name="ondemand_max_currency" value="EUR">
 <input type="hidden" name="payment_methods" value="PWY21,PWY22,PWY26,PWY25,PWY28,PWY32,PWY33,PWY36,ACC,VSA,MSC,VSD,VSE,AMX,DIN,JCB,MAE,LSR,SLO,GCB,SFT,DID,GIR,ENT,EBT,SO2,NPY,PLI,DNK,CSI,PSP,EPY,BWI,MZM,">
 <input type="hidden" name="submit_id" value="Submit">
 <input type="image" src="img/bezahlung/skrill.png" alt="Absenden">
</form>';?>

			<br />Mehr Information zu Skrill findest du hier:                                <a href="https://www.moneybookers.com/app/skrill.pl" target="_blank"><br />Weitere Infos</a>
                                            </td>

		</tr>
	</tbody>
</table>
<br /><br /><br /><br /><br /><br />
</div>

</div>

