<?php

if(isset($_GET['c']) && $_GET['c'] == 1) {
echo "<div class=\"headline\"><span class=\"f10 c5\">Error creating constant.php check cmod.</span></div><br>";
}
?>
<form action="process.php" method="post" id="dataform">

	<p>
	<span class="f10 c">SERVER RELATED</span>
	<table><tr>
	<td><span class="f9 c6">Server name:</span></td><td width="140"><input type="text" name="servername" id="servername" value="TravianX"></td></tr><tr>
	<td><span class="f9 c6">Server speed:</span></td><td><input name="speed" type="text" id="speed" value="1" size="2"></td></tr><tr>
	<td><span class="f9 c6">Troop speed:</span></td><td width="140"><input type="text" name="incspeed" id="incspeed" value="2" size="2"></td></tr><tr>
	<td><span class="f9 c6">Trader capacity (1 = 1x...):</span></td><td width="140"><input type="text" name="tradercap" id="tradercap" value="1" size="2"></td></tr><tr>
	<td><span class="f9 c6">World size:</span></td><td>
				<select name="wmax">
				<option value="10">10x10</option>
				<option value="25">25x25</option>
				<option value="50">50x50</option>
				<option value="100" selected="selected">100x100</option>
				<option value="150">150x150</option>
				<option value="200">200x200</option>
				<option value="250">250x250</option>
				<option value="300">300x300</option>
				<option value="350">350x350</option>
				<option value="400">400x400</option>
				</select> 
		</td></tr><tr></tr>
	<td><span class="f9 c6">Homepage:</span></td><td><input name="homepage" type="text" id="homepage" value="http://<?php echo $_SERVER['HTTP_HOST']; ?>/"></td></tr><tr></tr>
	<td><span class="f9 c6">Language:</span></td><td>
				<select name="lang">
				<option value="en" selected="selected">English</option>
				<option value="ru">Russian</option>
				</select>
		</td></tr><tr></tr>
	<td><span class="f9 c6">Beginners protection length:</span></td><td>
				<select name="beginner">
				<option value="0">None (0 hours)</option>
				<option value="3600*6">6 hours</option>
				<option value="3600*12" selected="selected">12 hours</option>
				<option value="3600*24">24 hours</option>
				<option value="3600*36">36 hours</option>
				<option value="3600*48">48 hours</option>
				<option value="3600*72">72 hours</option>
				</select>
		</td></tr><tr></tr>	
	<td><span class="f9 c6">Plus account length:</span></td><td>
				<select name="plus_time">
				<option value="3600*12">12 hours</option>
				<option value="3600*24">1 day</option>
				<option value="3600*24*2">2 days</option>
				<option value="3600*24*3">3 days</option>
				<option value="3600*24*4">4 days</option>
				<option value="3600*24*5" selected="selected">5 days</option>
				<option value="3600*24*6">6 days</option>
				<option value="3600*24*7">7 days</option>
				</select>
		</td></tr><tr></tr>		
	<td><span class="f9 c6">+25% production length:</span></td><td>
				<select name="plus_production">
				<option value="3600*12">12 hours</option>
				<option value="3600*24">1 day</option>
				<option value="3600*24*2">2 days</option>
				<option value="3600*24*3">3 days</option>
				<option value="3600*24*4">4 days</option>
				<option value="3600*24*5" selected="selected">5 days</option>
				<option value="3600*24*6">6 days</option>
				<option value="3600*24*7">7 days</option>
				</select>
		</td></tr><tr></tr>	
	<td><span class="f9 c6">Storage Multipler:</span></td><td width="140"><input type="text" name="storage_multiplier" id="storage_multiplier" value="1"></td></tr><tr>
	<td><span class="f9 c6">Tourn Threshold:</span></td><td width="140"><input type="text" name="ts_threshold" id="ts_threshold" value="20"></td></tr><tr>
	<td><span class="f9 c6">Great Workshop:</span></td><td>
				<select name="great_wks">
				<option value="True" selected="selected">True</option>
				<option value="False">False</option>
				</select>
		</td></tr><tr></tr>		
	<td><span class="f9 c6">ww:</span></td><td>
				<select name="ww">
				<option value="True" selected="selected">True</option>
				<option value="False">False</option>
				</select>
		</td></tr><tr></tr>			
		</table>
	</p>
	
		<p>
	<span class="f10 c">ADMIN ACCOUNT</span>
	<table>
	<tr><td><span class="f9 c6">Admin name:</span></td><td><input type="text" name="aname" id="aname" value=""></td></tr>
	<tr><td><span class="f9 c6">Admin email:</span></td><td><input type="text" name="aemail" id="aemail" value=""></td></tr>

	<td><span class="f9 c6">Show admin in stats:</span></td><td>
				<select name="admin_rank">
				<option value="True" selected="selected">True</option>
				<option value="False">False</option>
				</select>
		</td></tr><tr></tr>
	</table>
	</p>
	
	<p>
	<span class="f10 c">SQL RELATED</span>
	<table><tr>
	<td><span class="f9 c6">Hostname:</span></td><td><input name="sserver" type="text" id="sserver" value="localhost"></td></tr><tr>
	<td><span class="f9 c6">Username:</span></td><td><input name="suser" type="text" id="suser" value=""></td></tr><tr>
	<td><span class="f9 c6">Password:</span></td><td><input type="text" name="spass" id="spass"></td></tr><tr>
	<td><span class="f9 c6">DB name:</span></td><td><input type="text" name="sdb" id="sdb"></td></tr><tr>
	<td><span class="f9 c6">Prefix:</span></td><td><input type="text" name="prefix" id="prefix" value="s1_" size="5"></td></tr>
	<td><span class="f9 c6">Type:</span></td><td><select name="connectt">
	  <option value="0" selected="selected">MYSQL</option>
	  <option value="1" disabled="disabled">MYSQLi</option>
	</select></td></tr>
	</table>
	</p>

<!-- <LEFT BOX - ADMIN RELATED> 

	<span><center><strong>ADMIN RELATED</strong></center></span><br />
	<span class="f9 c6 cc2">Admin Name:</span><span class="cc3"><input type="text" name="aname" id="aname"></span><br /><br />
	<span class="f9 c6 cc2">Admin Email:</span><span class="cc3"><input name="aemail" type="text" id="aemail"></span><br /><br />
	<span class="f9 c6 cc2">Admin rank:</span><span class="cc3" style="position: absolute;right:20%;"><select name="admin_rank">
	  <option value="false">No</option>
	  <option value="true" selected="selected">Yes</option></select></span><br /><br />

<!-- </LEFT BOX - ADMIN RELATED> -->

<!-- <RIGHT BOX - GPACK RELATED> 

	<span><center><strong>GPACK RELATED</strong></center></span><br />

	
	<span class="f9 c6 c2">GPack:</span><span class="c3"><select name="gpack">
	  <option value="false" selected="selected">No</option>
	  <option value="true" disabled="disabled">Yes</option></select></span><br /><br />
	<span class="f9 c6 c2">GPack Design:</span><span class="c3"><select name="gp_locate">
	  <option value="gpack/travian_default/" selected="selected">Travian Default
	  <option value="gpack/travianx_v1/">TravianX v1 by Dzoki</option></select></span><br /><br />
	
-->
<!-- </RIGHT BOX - GPACK RELATED> -->

	 
	<p>
	<span class="f10 c">NEWSBOX OPTIONS</span>
	<table><tr>
	<td><span class="f9 c6">Newsbox 1:</span></td><td><select name="box1">
	  <option value="true" selected="selected">Enabled</option>
	  <option value="false">Disabled</option>
	</select></td></tr>
	<td><span class="f9 c6">Newsbox 2:</span></td><td><select name="box2">
	  <option value="true" selected="selected">Enabled</option>
	  <option value="false">Disabled</option>
	</select></td></tr>
	<td><span class="f9 c6">Newsbox 3:</span></td><td><select name="box3">
	  <option value="true" selected="selected">Enabled</option>
	  <option value="false">Disabled</option>
	</select></td></tr>
	</table>
	</p>
	
	<p>
	<span class="f10 c">LOG RELATED</span>
	<table><tr>
	<td><span class="f9 c6">Log Building:</span></td><td><select name="log_build">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr><tr>
	<td><span class="f9 c6">Log Tech:</span></td><td><select name="log_tech">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr><tr>
	<td><span class="f9 c6">Log Login:</span></td><td><select name="log_login">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr>
 	 <tr>
	<td><span class="f9 c6">Log Gold:</span></td><td><select name="log_gold_fin">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr>
	<tr>	<td><span class="f9 c6">Log Admin:</span></td><td><select name="log_admin">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr>
	<tr>	<td><span class="f9 c6">Log War:</span></td><td><select name="log_war">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr><tr>
	<td><span class="f9 c6">Log Market:</span></td><td><select name="log_market">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr><tr>
	<td><span class="f9 c6">Log Illegal:</span></td><td><select name="log_illegal">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr><tr>
	<td><span class="f9 c6">Log :</span></td><td><select name="">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr>
	</table>
	</p>

	<p>
	<span class="f10 c">EXTRA OPTIONS</span>
	<table><tr>
	<td><span class="f9 c6">Quest:</span></td><td><select name="quest">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr><tr>
	<td><span class="f9 c6">Activate:</span></td><td><select name="activate">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr><tr>
	<td><span class="f9 c6">Limit Mailbox:</span></td><td><select name="limit_mailbox">
	  <option value="true" selected="selected">Yes</option>
	  <option value="false">No</option>
	</select></td></tr>
	<tr><td><span class="f9 c6">Max mails:</span></td><td><input type="text" name="max_mails" id="max_mails" value="30" size="4"></td></tr>
	 <tr>
	<td><span class="f9 c6">Demolish - lvl required:</span></td><td><select name="demolish">
			<option value="5">5</option>
			<option value="10" selected="selected">10</option>
			<option value="15">15</option>
			<option value="20">20</option>
	</select></td></tr>
	<tr>	<td><span class="f9 c6">Village Expand:</span></td><td><select name="village_expand">
	  <option value="1">Slow</option>
	  <option value="0" selected="selected">Fast</option>
	</select></td></tr>
	<tr>	<td><span class="f9 c6">Error Reporting:</span></td><td><select name="error">
	  <option value="error_reporting (E_ALL ^ E_NOTICE);" selected="selected">Yes</option>
	  <option value="error_reporting (0);">No</option>
	</select></td></tr><tr>
	<td><span class="f9 c6">T4 is Coming screen:</span></td><td><select name="t4_coming">
	  <option value="true">Yes</option>
	  <option value="false" selected="selected">No</option>
	</select></td></tr>
	</table>
	</p>


	<center>
	<input type="submit" name="Submit" id="Submit" value="Submit">
	<input type="hidden" name="subconst" value="1"></center>
	</form>

</div>
