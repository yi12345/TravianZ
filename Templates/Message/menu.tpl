<div id="textmenu">
   <a href="nachrichten.php" <?php if(!isset($_GET['t'])) { echo "class=\"selected\""; } ?>>已接收</a>
 | <a href="nachrichten.php?t=1" <?php if(isset($_GET['t']) && $_GET['t'] == 1) { echo "class=\"selected\""; } ?> >新訊息</a>
 | <a href="nachrichten.php?t=2" <?php if(isset($_GET['t']) && $_GET['t'] == 2) { echo "class=\"selected\""; } ?> >已發送</a>
 <?php if($session->plus) {
 echo " | <a href=\"nachrichten.php?t=3\"";
 if(isset($_GET['t']) && $_GET['t'] == 3) { echo "class=\"selected\""; }
 echo ">已保存</a> | <a href=\"nachrichten.php?t=4\"";
 if(isset($_GET['t']) && $_GET['t'] == 4) { echo "class=\"selected\""; }
 echo ">筆記</a>";
 }
 ?>
</div>