<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//                                Adding tasks, constructions and artefact  by: Armando             //
//////////////////////////////////////////////////////////////////////////////////////////////////////
									//                         //
									//         ENGLISH         //
									//      Author: Dzoki      //
									//     Adding: Armando     //
									/////////////////////////////

//MAIN MENU
define("TRIBE1","羅馬人");
define("TRIBE2","條頓人");
define("TRIBE3","高盧人");
define("TRIBE4","自然界");
define("TRIBE5","達賴族");
define("TRIBE6","野獸");

define("HOME","首頁");
define("INSTRUCT","說明");
define("ADMIN_PANEL","管理員控制台-ACP");
define("MASS_MESSAGE","發送群信");
define("LOGOUT","登出");
define("PROFILE","個人資料");
define("SUPPORT","支援");
define("UPDATE_T_10","更新前10名");
define("SYSTEM_MESSAGE","系統公告");
define("TRAVIAN_PLUS","Travian <b><span class=\"plus_g\">P</span><span class=\"plus_o\">l</span><span class=\"plus_g\">u</span><span class=\"plus_o\">s</span></span></span></b>");
define("CONTACT","聯絡我們！");
define("GAME_RULES","遊戲規定");

//MENU
define("REG","註冊");
define("FORUM","論壇");
define("CHAT","聊天室");
define("IMPRINT","版本說明");
define("MORE_LINKS","更多連結");
define("TOUR","遊戲瀏覽");


//ERRORS
define("USRNM_EMPTY","(玩家名稱空白)");
define("USRNM_TAKEN","(玩家名稱已存在)");
define("USRNM_SHORT","(玩家名稱至少 ".USRNM_MIN_LENGTH." 字)");
define("USRNM_CHAR","(無效文字)");
define("PW_EMPTY","(密碼空白)");
define("PW_SHORT","(密碼至少 ".PW_MIN_LENGTH." 字)");
define("PW_INSECURE","(密碼不安全. 請使用一個更有保障的)");
define("EMAIL_EMPTY","(電子郵件地址空白)");
define("EMAIL_INVALID","(電子郵件地址無效)");
define("EMAIL_TAKEN","(電子郵件已存在)");
define("TRIBE_EMPTY","<li>請選擇一個種族</li>");
define("AGREE_ERROR","<li>你必須同意以上遊戲規則以及一般條款條件，才能進行註冊，本伺服器保留任何權力。</li>");
define("LOGIN_USR_EMPTY","輸入玩家名稱");
define("LOGIN_PASS_EMPTY","輸入密碼");
define("EMAIL_ERROR","電子郵件不正確");
define("PASS_MISMATCH","密碼不正確");
define("ALLI_OWNER","在刪除前，請先指派一名委任盟主");
define("SIT_ERROR","照看者已設立");
define("USR_NT_FOUND","玩家名稱不存在");
define("LOGIN_PW_ERROR","密碼不正確");
define("WEL_TOPIC","錦囊妙計");
define("ATAG_EMPTY","Tag empty");
define("ANAME_EMPTY","Name empty");
define("ATAG_EXIST","Tag taken");
define("ANAME_EXIST","Name taken");
define("NOT_OPENED_YET","Server not started yet.");
define("REGISTER_CLOSED","The register is closed. You can't register to this server.");
define("NAME_EMPTY","Please insert name");
define("NAME_NO_EXIST","There is no user with the name ");
define("ID_NO_EXIST","There is no user with the id ");
define("SAME_NAME","You can't invite yourself");
define("ALREADY_INVITED"," already invited");
define("ALREADY_IN_ALLY"," already in this alliance");

//COPYRIGHT
define("TRAVIAN_COPYRIGHT","TravianZ 100% Open Source Travian Clone.");

//BUILD.TPL
define("CUR_PROD","目前的產量");
define("NEXT_PROD","產量在等級 ");

//BUILDINGS
define("B1","伐木場");
define("B1_DESC","伐木場是砍伐木材的地方.伐木場等級越高,單位時間內能砍伐的木材也就越多.");
define("B2","泥坑");
define("B2_DESC","泥坑是生產泥土的地方.泥坑等級越高,單位時間內生產的磚塊也就越多.");
define("B3","鐵礦場");
define("B3_DESC","鐵礦場是用來採集鐵礦的.鐵礦場等級越高,每小時能採集的鐵礦就越多.");
define("B4","農場");
define("B4_DESC","農場是為居民生產糧食的地方.農場等級越高,所能生產的糧食也就越多.");

//DORF1
define("LUMBER","木材");
define("CLAY","磚塊");
define("IRON","鋼鐵");
define("CROP","穀物");
define("LEVEL","等級");
define("CROP_COM",CROP." 消耗");
define("PER_HR","每小時");
define("PROD_HEADER","生產");
define("MULTI_V_HEADER","村莊");
define("ANNOUNCEMENT","公告");
define("GO2MY_VILLAGE","回到我的村莊");
define("VILLAGE_CENTER","地圖中心");
define("FINISH_GOLD","花費2金,結束這個村莊當前建築任務或者兵種研發, 升級的任務. (除了皇宮和行宮)");
define("WAITING_LOOP","(等待建築)");
define("HRS","(hrs.)");
define("DONE_AT","結束在");
define("CANCEL","取消");
define("LOYALTY","忠誠度:");
define("CALCULATED_IN","產生在");
define("SEVER_TIME","伺服器時間:");

//QUEST
define("Q_CONTINUE","繼續下個任務");
define("Q_REWARD","你的任務獎勵:");
define("Q_BUTN","完成任務");
define("Q0","歡迎來到");
define("Q0_DESC","As I see you have been made chieftain of this little village. I will be your counselor for the first few days and never leave your (right hand) side.");
define("Q0_OPT1","To the first task.");
define("Q0_OPT2","Look around on your own.");
define("Q0_OPT3","Play no tasks.");

define("Q1","Task 1: Woodcutter");
define("Q1_DESC","There are four green forests around your village. Construct a woodcutter on one of them. Lumber is an important resource for our new settlement.");
define("Q1_ORDER","Order:<\/p>Construct a woodcutter.");
define("Q1_RESP","Yes, that way you gain more lumber.I helped a bit and completed the order instantly.");
define("Q1_REWARD","Woodcutter instantly completed.");

define("Q2","Task 2: Crop");
define("Q2_DESC","Now your subjects are hungry from working all day. Extend a cropland to improve your subjects' supply. Come back here once the building is complete.");
define("Q2_ORDER","Order:<\/p>Extend one cropland.");
define("Q2_RESP","Very good. Now your subjects have enough to eat again...");
define("Q2_REWARD","Your reward:<\/p>1 day Travian");

define("Q3","Task 3: Your Village's Name");
define("Q3_DESC","Creative as you are you can grant your village the ultimate name.<br \/><br \/>Click on 'profile' in the left hand menu and then select 'change profile'...");
define("Q3_ORDER","Order:<\/p>Change your village's name to something nice.");
define("Q3_RESP","Wow, a great name for their village. It could have been the name of my village!...");

define("Q4","Task 4: Other Players");
define("Q4_DESC","In ". SERVER_NAME ." you play along with billions of other players. Click 'statistics' in the top menu to look up your rank and enter it here.");
define("Q4_ORDER","Order:<\/p>Look for your rank in the statistics and enter it here.");
define("Q4_BUTN","complete task");
define("Q4_RESP","Exactly! That's your rank.");

define("Q5","Task 5: Two Building Orders");
define("Q5_DESC","Build an iron mine and a clay pit. Of iron and clay one can never have enough.");
define("Q5_ORDER","Order:<\/p><ul><li>Extend one iron mine.<\/li><li>Extend one clay pit.<\/li><\/ul>");
define("Q5_RESP","As you noticed, building orders take rather long. The world of ". SERVER_NAME ." will continue to spin even if you are offline. Even in a few months there will be many new things for you to discover.<br \/><br \/>The best thing to do is occasionally checking your village and giving you subjects new tasks to do.");

define("Q6","Task 6: Messages");
define("Q6_DESC","You can talk to other players using the messaging system. I sent a message to you. Read it and come back here.<br \/><br \/>P.S. Don't forget: on the left the reports, on the right the messages.");
define("Q6_ORDER","Order:<\/p>Read your new message.");
define("Q6_RESP","You received it? Very good.<br \/><br \/>Here is some Gold. With Gold you can do several things, e.g. extend your   in the left hand menu.");
define("Q6_RESP1","-Account or increase your resource production.To do so click ");
define("Q6_RESP2","in the left hand menu.");
define("Q6_SUBJECT","Message From The Taskmaster");
define("Q6_MESSAGE","You are to be informed that a nice reward is waiting for you at the taskmaster.<br /><br />Hint: The message has been generated automatically. An answer is not necessary.");

define("Q7","Task 7: One Each!");
define("Q7_DESC","Now we should increase your resource production a bit. Build an additional woodcutter, clay pit, iron mine and cropland to level 1.");
define("Q7_ORDER","Order:<\/p>Extend one more of each resource tile to level 1.");
define("Q7_RESP","Very good, great develop of resources production.");

define("Q8","Task 8: Huge Army!");
define("Q8_DESC","Now I've got a very special quest for you. I am hungry. Give me 200 crop!<br \/><br \/>In return I will try to organize a huge army to protect your village.");
define("Q8_ORDER","Order:<\/p>Send 200 crop to the taskmaster.");
define("Q8_BUTN","Send crop");
define("Q8_NOCROP","No Enough Crop!");

define("Q9","Task 9: Everything to 1.");
define("Q9_DESC","In Travian there is always something to do! While you are waiting for incoming the huge army, Now we should increase your resource production a bit. Extend all your resource tiles to level 1.");
define("Q9_ORDER","Order:<\/p>Extend all resource tiles to level 1.");
define("Q9_RESP","Very good, your resource production just thrives.<br \/><br \/>Soon we can start with constructing buildings in the village.");

define("Q10","Task 10: Dove of Peace");
define("Q10_DESC","The first days after signing up you are protected against attacks by your fellow players. You can see how long this protection lasts by adding the code <b>[#0]<\/b> to your profile.");
define("Q10_ORDER","Order:<\/p>Write the code <b>[#0]<\/b> into your profile by adding it to one of the two description fields.");
define("Q10_RESP","Well done! Now everyone can see what a great warrior the world is approached by.");
define("Q10_REWARD","Your reward:<\/p>2 day Travian");

define("Q11","Task 11: Neighbours!");
define("Q11_DESC","Around you, there are many different villages. One of them is named. ");
define("Q11_DESC1"," Click on 'map' in the header menu and look for that village. The name of your neighbours' villages can be seen when hovering your mouse over any of them.");
define("Q11_ORDER","Order:</p>Look for the coordinates of ");
define("Q11_ORDER1","and enter them here.");
define("Q11_RESP","Exactly, there ");
define("Q11_RESP1"," Village! As many resources as you reach this village. Well, almost as much ...");
define("Q11_BUTN","completar misi&oacute;n");

define("Q12","Task 12: Cranny");
define("Q12_DESC","It's getting time to erect a cranny. The world of <?php echo SERVER_NAME; ?> is dangerous.<br \/><br \/>Many players live by stealing other players' resources. Build a cranny to hide some of your resources from enemies.");
define("Q12_ORDER","Order:<\/p>Construct a Cranny.");
define("Q12_RESP","Well done, now it's way harder for your mean fellow players to plunder your village.<br \/><br \/>If under attack, your villagers will hide the resources in the Cranny all on their own.");

define("Q13","Task 13: To Two.");
define("Q13_DESC","In <?php echo SERVER_NAME; ?> there is always something to do! Extend one woodcutter, one clay pit, one iron mine and one cropland to level 2 each.");
define("Q13_ORDER","Order:<\/p>Extend one of each resource tile to level 2.");
define("Q13_RESP","Very good, your village grows and thrives!");

define("Q14","Task 14: Instructions");
define("Q14_DESC","In the ingame instructions you can find short information texts about different buildings and types of units.<br \/><br \/>Click on 'instructions' at the left to find out how much lumber is required for the barracks.");
define("Q14_ORDER","Order:<\/p>Enter how much lumber barracks cost");
define("Q14_BUTN","complete task");
define("Q14_RESP","Exactly! Barracks cost 210 lumber.");

define("Q15","Task 15: Main Building");
define("Q15_DESC","Your master builders need a main building level 3 to erect important buildings such as the marketplace or barracks.");
define("Q15_ORDER","Order:<\/p>Extend your main building to level 3.");
define("Q15_RESP","Well done. The main building level 3 has been completed.<br><br>With this upgrade your master builders cannot only construct more types of buildings but also do so faster.");

define("Q16","Task 16: Advanced!");
define("Q16_DESC","Look up your rank in the player statistics again and enjoy your progress.");
define("Q16_ORDER","Order:<\/p>Look for your rank in the statistics and enter it here.");
define("Q16_RESP","Well done! That's your current rank.");

define("Q17","Task 17: Weapons or Dough");
define("Q17_DESC","Now you have to make a decision: Either trade peacefully or become a dreaded warrior.<br \/><br \/>For the marketplace you need a granary, for the barracks you need a rally point.");
define("Q17_BUTN","Economy");
define("Q17_BUTN1","Military");

define("Q18","Task 18: Military");
define("Q18_DESC","A brave decision. To be able to send troops you need a rally point.<br \/><br \/>The rally point must be built on a specific building site. The ");
define("Q18_DESC1"," building site.");
define("Q18_DESC2"," is located on the right side of the main building, slightly below it. The building site itself is curved.");
define("Q18_ORDER","Order:<\/p>Construct a rally point.");
define("Q18_RESP","Your rally point has been erected! A good move towards world domination!");

define("Q19","Task 19: Barracks");
define("Q19_DESC","Now you have a main building level 3 and a rally point. That means that all prerequisites for building barracks have been fulfilled.<br><br>You can use the barracks to train troops for fighting.");
define("Q19_ORDER","Order:<\/p>Construct barracks.");
define("Q19_RESP","Well done... The best instructors from the whole country have gathered to train your men\u2019s fighting skills to top form.");

define("Q20","Task 20: Train.");
define("Q20_DESC","Now that you have barracks you can start training troops. Train two ");
define("Q20_ORDER","Please train 2 ");
define("Q20_RESP","The foundation for your glorious army has been laid.<br \/><br \/>Before sending your army off to plunder you should check with the.");
define("Q20_RESP1","Combat Simulator");
define("Q20_RESP2","to see how many troops you need to successfully fight one rat without losses.");

define("Q21","Task 18: Economy");
define("Q21_DESC","Trade & Economy was your choice. Golden times await you for sure!");
define("Q21_ORDER","Order:<\/p>Construct a Granary.");
define("Q21_RESP","Well done! With the Granary you can store more wheat.");

define("Q22","Task 19: Warehouse");
define("Q22_DESC","Not only Crop has to be saved. Other resources can go to waste as well if they are not stored correctly. Construct a Warehouse!");
define("Q22_ORDER","Order:<\/p>Construct Warehouse.");
define("Q22_RESP",";Well done, your Warehouse is complete...&rdquo;<\/i><br \/>Now you have fulfilled all prerequisites required to construct a Marketplace.");

define("Q23","Task 20: Marketplace.");
define("Q23_DESC",";Construct a Marketplace so you can trade with your fellow players.");
define("Q23_ORDER","Order:<\/p>Please build a Marketplace.");
define("Q23_RESP",";The Marketplace has been completed. Now you can make offers of your own and accept foreign offers! When creating your own offers, you should think about offering what other players need most to get more profit.");

define("Q24","Task 21: Everything to 2.");
define("Q24_DESC","Now we should increase your resource production a bit. Build an additional woodcutter, clay pit, iron mine and cropland to level 1.");
define("Q24_ORDER","Order:<\/p>Extend all resource tiles to level 2.");
define("Q24_RESP","Congratulations! Your village grows and thrives...");

define("Q28","Task 22: Alliance.");
define("Q28_DESC","Teamwork is important in Travian. Players who work together organise themselves in alliances. Get an invitation from an alliance in your region and join this alliance. Alternatively, you can found your own alliance. To do this, you need a level 3 embassy.");
define("Q28_ORDER","Order:<\/p>Join an alliance or found one on your own.");
define("Q28_RESP","Is good! Now you're in a union called");
define("Q28_RESP1",", and you're a member of their alliance with the faster you'll progress...");

define("Q29","Task 23: Main Building to Level 5");
define("Q29_DESC","To be able to build a palace or residence, you will need a main building at level 5.");
define("Q29_ORDER","Order:<\/p>Upgrade your main building to level 5.");
define("Q29_RESP","The main building is level 5 now and you can build palace or residence...");

define("Q30","Task 24: Granary to Level 3.");
define("Q30_DESC","That you do not lose crop, you should upgrade your granary.");
define("Q30_ORDER","Order:<\/p>Upgrade your granary to level 3.");
define("Q30_RESP","Granary is level 3 now...");

define("Q31","Task 25: Warehouse to Level 7");
define("Q31_DESC"," To make sure your resources won't overflow, you should upgrade your warehouse.");
define("Q31_ORDER","Order:<\/p>Upgrade your warehouse to level 7.");
define("Q31_RESP","Warehouse has upgraded to level 7...");

define("Q32","Task 26: All to five!");
define("Q32_DESC","You will always need more resources. Resource tiles are quite expensive but will always pay out in the long term.");
define("Q32_ORDER","Order:<\/p>Upgrade all resources tiles to level 5.");
define("Q32_RESP","All resources are at level 5, very good, your village grows and thrives!");

define("Q33","Task 27: Palace or Residence?");
define("Q33_DESC","To found a new village, you will need settlers. They can be trained in either a palace or a residence.");
define("Q33_ORDER","Order:<\/p>Build a palace or residence to level 10.");
define("Q33_RESP","had reached to level 10, you can now train settlers and found your second village. Notice the cultural points...");

define("Q34","Task 28: 3 settlers.");
define("Q34_DESC","To found a new village, you will need settlers. You can train them in the palace or residence.");
define("Q34_ORDER","Order:<\/p>Train 3 settlers.");
define("Q34_RESP","3 settlers were trained. To found new village you need at least");
define("Q34_RESP1","culture points...");

define("Q35","Task 29: New Village.");
define("Q35_DESC","There are a lot of empty tiles on the map. Find one that suits you and found a new village");
define("Q35_ORDER","Order:<\/p>Found a new village.");
define("Q35_RESP","I am proud of you! Now you have two villages and have all the possibilities to build a mighty empire. I wish you luck with this.");

define("Q36"," Task 30: Build a ");
define("Q36_DESC","Now that you have trained some soldiers, you should build a ");
define("Q36_DESC1"," too. It increases the base defence and your soldiers will receive a defensive bonus.");
define("Q36_ORDER","Order:<\/p>Build a ");
define("Q36_RESP","That's what I'm talking about. A ");
define("Q36_RESP1"," Very useful. It increases the defence of the troops in the village.");

define("Q37","Tasks");
define("Q37_DESC","All tasks achieved!");

define("OPT3","Resource overview");
define("T","Your resource deliveries");
define("T1","Delivery");
define("T2","Delivery time");
define("T3","Status");
define("T4","fetch");
define("T5","fetched");
define("T6","on hold");
define("T7","1 day Travian ");
define("T8","2 days Travian ");
//======================================================//
//================ UNITS - DO NOT EDIT! ================//
//======================================================//
define("U0","英雄");

//ROMAN UNITS
define("U1","古羅馬步兵");
define("U2","禁衛兵");
define("U3","帝國兵");
define("U4","使者騎士");
define("U5","帝國騎士");
define("U6","將軍騎士");
define("U7","衝撞車");
define("U8","火焰投石機");
define("U9","參議員");
define("U10","拓荒者");

//TEUTON UNITS
define("U11","棍棒兵");
define("U12","矛兵");
define("U13","斧頭兵");
define("U14","偵查兵");
define("U15","聖騎士");
define("U16","條頓騎士");
define("U17","衝撞車");
define("U18","投石機");
define("U19","首領");
define("U20","拓荒者");

//GAUL UNITS
define("U21","方陣兵");
define("U22","劍士");
define("U23","探路者");
define("U24","雷法師");
define("U25","德魯依騎兵");
define("U26","海頓聖騎士");
define("U27","衝撞車");
define("U28","投石器");
define("U29","首領");
define("U30","拓荒者");
define("U99","陷阱");

//NATURE UNITS
define("U31","老鼠");
define("U32","蜘蛛");
define("U33","蛇");
define("U34","蝙蝠");
define("U35","野豬");
define("U36","狼");
define("U37","熊");
define("U38","鱷魚");
define("U39","老虎");
define("U40","大象");

//NATARS UNITS
define("U41","長槍兵");
define("U42","刺錘武士");
define("U43","近衛兵");
define("U44","狩獵鳥");
define("U45","斧騎兵");
define("U46","達賴騎士");
define("U47","戰象");
define("U48","投石車");
define("U49","達賴國王");
define("U50","拓荒者");

//MONSTER UNITS
define("U51","Monster Peon");
define("U52","Monster Hunter");
define("U53","Monster Warrior");
define("U54","Ghost");
define("U55","Monster Steed");
define("U56","Monster War Steed");
define("U57","Monster Ram");
define("U58","Monster Catapult");
define("U59","Monster Chief");
define("U60","Monster Settler");

// RESOURCES
define("R1","木材");
define("R2","磚塊");
define("R3","鋼鐵");
define("R4","穀物");

//INDEX.php
define("LOGIN","登入");
define("PLAYERS","總玩家數量");
define("ACTIVE","活躍玩家");
define("ONLINE","線上玩家");
define("TUTORIAL","教學");
define("PLAYER_STATISTICS","Player statistics");
define("TOTAL_PLAYERS","".PLAYERS." in total");
define("ACTIVE_PLAYERS","Active players");
define("ONLINE_PLAYERS","".PLAYERS." online");
define("MP_STRATEGY_GAME","".SERVER_NAME." - the multiplayer strategy game");
define("WHAT_IS","".SERVER_NAME." is one of the most popular browser games in the world. As a player in ".SERVER_NAME.", you will build your own empire, recruit a mighty army, and fight with your allies for game world hegemony.");
define("REGISTER_FOR_FREE","Register here for free!");
define("LATEST_GAME_WORLD","Latest game world");
define("LATEST_GAME_WORLD2","Register on the latest<br/>game world and enjoy<br/>the advantages of<br/>being one of the<br/>first players.");
define("PLAY_NOW","Play ".SERVER_NAME." now");
define("LEARN_MORE","Learn more <br/>about ".SERVER_NAME."!");
define("LEARN_MORE2","Now with a revolutionised<br>server system, completely new<br>graphics <br>This clone is The Shiz!");
define("COMUNITY","Community");
define("BECOME_COMUNITY","Become part of our community now!");
define("BECOME_COMUNITY2","Become a part of one of<br>the biggest gaming<br>communities in the<br>world.");
define("NEWS","News");
define("SCREENSHOTS","Screenshots");
define("LEARN1","Upgrade your fields and mines to increase your resource production. You will need resources to construct buildings and train soldiers.");
define("LEARN2","Construct and expand the buildings in your village. Buildings improve your overall infrastructure, increase your resource production and allow you to research, train and upgrade your troops.");
define("LEARN3","View and interact with your surroundings. You can make new friends or new enemies, make use of the nearby oases and observe as your empire grows and becomes stronger.");
define("LEARN4","Follow your improvement and success and compare yourself to other players. Look at the Top 10 rankings and fight to win a weekly medal.");
define("LEARN5","Receive detailed reports about your adventures, trades and battles. Don't forget to check the brand new reports about the happenings taking place in your surroundings.");
define("LEARN6","Exchange information and conduct diplomacy with other players. Always remember that communication is the key to winning new friends and solving old conflicts.");
define("LOGIN_TO","Log in to ". SERVER_NAME);
define("REGIN_TO","Register in ". SERVER_NAME);
define("P_ONLINE","Players online: ");
define("P_TOTAL","Players in total: ");
define("CHOOSE","Please choose a server.");
define("STARTED"," The server started ". round((time()-COMMENCE)/86400) ." days ago.");

//ANMELDEN.php
define("NICKNAME","暱稱");
define("EMAIL","電郵信箱");
define("PASSWORD","密碼");
define("ROMANS","羅馬人");
define("TEUTONS","條頓人");
define("GAULS","高盧人");
define("NW","西北方");
define("NE","東北方");
define("SW","西南方");
define("SE","東南方");
define("RANDOM","隨機");
define("ACCEPT_RULES"," 我接受本遊戲的 遊戲規定 和 條款.");
define("ONE_PER_SERVER","每個服務器，每個玩家只能擁有一個帳戶.");
define("BEFORE_REGISTER","在你創造帳號之前請你務必閱讀 <a href='../anleitung.php' target='_blank'>遊戲說明</a> 了解 TravianX 3個種族的優點和缺點");
define("BUILDING_UPGRADING","建築:");
define("HOURS","小時");


//ATTACKS ETC.
define("TROOP_MOVEMENTS","軍隊移動:");
define("ARRIVING_REINF_TROOPS","Arriving reinforcing troops");
define("ARRIVING_REINF_TROOPS_SHORT","Reinf.");
define("OWN_ATTACKING_TROOPS","Own attacking troops");
define("ATTACK","攻擊");
define("OWN_REINFORCING_TROOPS","Own reinforcing troops");
define("TROOPS_DORF","軍隊:");
define("NEWVILLAGE","New vill.");
define("FOUNDNEWVILLAGE","Founding New village");
define("UNDERATTACK","The village is under attack");
define("OASISATTACK","The Oasis is under attack");
define("OASISATTACKS","Oasis Att.");
define("RETURNFROM","Return from");
define("REINFORCEMENTFOR","Reinforcement to");
define("ATTACK_ON","Attack to");
define("RAID_ON","Raid to");
define("SCOUTING","Scouting");
define("PRISONERS","Prisioners");
define("PRISONERSIN","Prisioners in");
define("PRISONERSFROM","Prisioners from");
define("TROOPS","Troops");
define("TROOPSFROM","Troops");
define("BOUNTY","Bounty");
define("ARRIVAL","Arrival");
define("INCOMING_TROOPS","Incoming Troops");
define("TROOPS_ON_THEIR_WAY","Troops on their way");
define("OWN_TROOPS","Own troops");
define("ON","on");
define("AT","at");
define("UPKEEP","Upkeep");
define("SEND_BACK","Send back");
define("TROOPS_IN_THE_VILLAGE","Troops in the village");
define("TROOPS_IN_OTHER_VILLAGE","Troops in other village");
define("TROOPS_IN_OASIS","Troops in oasis");
define("KILL","Kill");
define("FROM","From");
define("SEND_TROOPS","Send troops");
define("TASKMASTER","Taskmaster");
define("VILLAGE_OF_THE_ELDERS_TROOPS","village of the elders troops");


//LOGIN.php
define("COOKIES","You must have cookies enabled to be able to log in. If you share this computer with other people you should log out after each session for your own safety.");
define("NAME","名稱");
define("PW_FORGOTTEN","忘記密碼?");
define("PW_REQUEST","Then you can request a new one which will be sent to your email address.");
define("PW_GENERATE","產生一組新密碼.");
define("EMAIL_NOT_VERIFIED","電子郵件帳號不正確!");
define("EMAIL_FOLLOW","Follow this link to activate your account.");
define("VERIFY_EMAIL","驗證郵件.");
define("SERVER_STARTS_IN","Server will start in: ");
define("START_NOW","START NOW");


//404.php
define("NOTHING_HERE","Nothing here!");
define("WE_LOOKED","We looked 404 times already but can't find anything");

//TIME RELATED
define("CALCULATED","產生在");
define("SERVER_TIME","伺服器時間:");

//MASSMESSAGE.php
define("MASS","Message Content");
define("MASS_SUBJECT","主旨:");
define("MASS_COLOR","Message color:");
define("MASS_REQUIRED","All fields required");
define("MASS_UNITS","Images (units):");
define("MASS_SHOWHIDE","Show/Hide");
define("MASS_READ","Read this: after adding smilie, you have to add left or right after number otherwise image will won't work");
define("MASS_CONFIRM","Confirmation");
define("MASS_REALLY","Do you really want to send MassIGM?");
define("MASS_ABORT","Aborting right now");
define("MASS_SENT","Mass IGM was sent");

//BUILDINGS
define("WOODCUTTER","伐木場");
define("CLAYPIT","泥坑");
define("IRONMINE","鐵礦場");
define("CROPLAND","農場");
define("SAWMILL","鋸木廠");
define("BRICKYARD","磚塊廠");
define("IRONFOUNDRY","鋼鐵鑄造廠");
define("GRAINMILL","麵粉廠");
define("BAKERY","麵包房");
define("WAREHOUSE","倉庫");
define("GRANARY","糧倉");
define("BLACKSMITH","鐵匠鋪");
define("ARMOURY","軍械庫");
define("TOURNAMENTSQUARE","競技場");
define("MAINBUILDING","村莊大樓");
define("RALLYPOINT","集結點");
define("OVERVIEW","Resumen");
define("RALLYPOINT_DESC","Your village's troops meet here. From here you can send them out to conquer, raid or reinforce other villages.");
define("MARKETPLACE","市場");
define("EMBASSY","大使館");
define("BARRACKS","兵營");
define("STABLE","馬廄");
define("WORKSHOP","工場");
define("ACADEMY","研發所");
define("CRANNY","山洞");
define("TOWNHALL","城鎮廳");
define("RESIDENCE","行宮");
define("PALACE","皇宮");
define("TREASURY","寶庫");
define("TRADEOFFICE","交易所");
define("GREATBARRACKS","大兵營");
define("GREATSTABLE","大馬廄");
define("CITYWALL","城牆");
define("EARTHWALL","土牆");
define("PALISADE","圍欄");
define("STONEMASON","石匠鋪");
define("BREWERY","釀酒廠");
define("TRAPPER","陷阱");
define("HEROSMANSION","英雄館");
define("GREATWAREHOUSE","大倉庫");
define("GREATGRANARY","大糧倉");
define("WONDER","世界奇觀");
define("HORSEDRINKING","飲馬槽");
define("GREATWORKSHOP","大工場");

//artefact
define("ARCHITECTS_DESC","All buildings in the area of effect are stronger. This means that you will need more catapults to damage buildings protected by this artifacts powers.");
define("ARCHITECTS_SMALL","The architects slight secret");
define("ARCHITECTS_SMALLVILLAGE","Diamond Chisel");
define("ARCHITECTS_LARGE","The architects great secret");
define("ARCHITECTS_LARGEVILLAGE","Giant Marble Hammer");
define("ARCHITECTS_UNIQUE","The architects unique secret");
define("ARCHITECTS_UNIQUEVILLAGE","Hemons Scrolls");
define("HASTE_DESC","All troops in the area of effect move faster.");
define("HASTE_SMALL","The slight titan boots");
define("HASTE_SMALLVILLAGE","Opal Horseshoe");
define("HASTE_LARGE","The great titan boots");
define("HASTE_LARGEVILLAGE","Golden Chariot");
define("HASTE_UNIQUE","The unique titan boots");
define("HASTE_UNIQUEVILLAGE","Pheidippides Sandals");
define("EYESIGHT_DESC","All spies (Scouts, Pathfinders, and Equites Legati) increase their spying ability. In addition, with all versions of this artifact you can see the incoming TYPE of troops but not how many there are.");
define("EYESIGHT_SMALL","The eagles slight eyes");
define("EYESIGHT_SMALLVILLAGE","Tale of a Rat");
define("EYESIGHT_LARGE","The eagles great eyes");
define("EYESIGHT_LARGEVILLAGE","Generals Letter");
define("EYESIGHT_UNIQUE","The eagles unique eyes");
define("EYESIGHT_UNIQUEVILLAGE","Diary of Sun Tzu");
define("DIET_DESC","All troops in the artifacts range consume less wheat, making it possible to maintain a larger army.");
define("DIET_SMALL","Slight diet control");
define("DIET_SMALLVILLAGE","Silver Platter");
define("DIET_LARGE","Great diet control");
define("DIET_LARGEVILLAGE","Sacred Hunting Bow");
define("DIET_UNIQUE","Unique diet control");
define("DIET_UNIQUEVILLAGE","King Arthurs Chalice");
define("ACADEMIC_DESC","Troops are built a certain percentage faster within the scope of the artifact.");
define("ACADEMIC_SMALL","The trainers slight talent");
define("ACADEMIC_SMALLVILLAGE","Scribed Soldiers Oath");
define("ACADEMIC_LARGE","The trainers great talent");
define("ACADEMIC_LARGEVILLAGE","Declaration of War");
define("ACADEMIC_UNIQUE","The trainers unique talent");
define("ACADEMIC_UNIQUEVILLAGE","Memoirs of Alexander the Great");
define("STORAGE_DESC","With this building plan you are able to build the Great Granary or Great Warehouse in the Village with the artifact, or the whole account depending on the artifact. As long as you posses that artifact you are able to build and enlarge those buildings.");
define("STORAGE_SMALL","Slight storage masterplan");
define("STORAGE_SMALLVILLAGE","Builders Sketch");
define("STORAGE_LARGE","Great storage masterplan");
define("STORAGE_LARGEVILLAGE","Babylonian Tablet");
define("CONFUSION_DESC","Cranny capacity is increased by a certain amount for each type of artifact. Catapults can only shoot random on villages within this artifacts power. Exceptions are the WW which can always be targeted and the treasure chamber which can always be targeted, except with the unique artifact. When aiming at a resource field only random resource fields can be hit, when aiming at a building only random buildings can be hit.");
define("CONFUSION_SMALL","Rivals slight confusion");
define("CONFUSION_SMALLVILLAGE","Map of the Hidden Caverns");
define("CONFUSION_LARGE","Rivals great confusion");
define("CONFUSION_LARGEVILLAGE","Bottomless Satchel");
define("CONFUSION_UNIQUE","Rivals unique confusion");
define("CONFUSION_UNIQUEVILLAGE","Trojan Horse");
define("FOOL_DESC","Every 24 hours it gets a random effect, bonus, or penalty (all are possible with the exception of great warehouse, great granary and WW building plans). They change effect AND scope every 24 hours. The unique artifact will always take positive bonuses.");
define("FOOL_SMALL","Artefact of the slight fool");
define("FOOL_SMALLVILLAGE","Pendant of Mischief");
define("FOOL_UNIQUE","Artefact of the unique fool");
define("FOOL_UNIQUEVILLAGE","Forbidden Manuscript");
define("ARTEFACT","Construction plans



Countless days have passed since the first battles upon the walls of the cursed villages of the Dread Natars, many armies of both the free ones and the Natarian empire struggled and died before the walls of the many strongholds from which the Natars had once ruled all creation. Now with the dust settled and a relative calm having settled in, armies began to count their losses and collect their dead, the stench of combat still lingering in the night air, a smell of a slaughter unforgettable in its extent and brutality yet soon to be dwarfed by yet others. The largest armies of the free ones and the Dread Natars were marshalling for yet another renewed assault upon the coveted former strongholds of the Natarian Empire.

Soon scouts arrived telling of a most awesome sight and a chilling reminder, a dread army of an unfathomable size had been spotted marshalling at the end of the world, the Natarian capital, a force so great and unstoppable that the dust from their march would choke off all light, a force so brutal and ruthless that it would crush all hope. The free people knew that they had to race now, race against time and the endless hordes of the Natarian Empire to raise a Wonder of the World to restore the world to peace and vanquish the Natarian threat.

But to raise such a great Wonder would be no easy task, one would need construction plans created in the distant past, plans of such an arcane nature that even the very wisest of sages knew not their contents or locations.

Tens of thousands of scouts roamed across all existence searching in vain for these mystical plans, looking in all places but the dreaded Natarian Capital, yet could not find them. Today however, they return bearing good news, they return baring the locations of the plans, hidden by the armies of the Natars inside secret strongholds constructed to be hidden from the eyes of man.

Now begins the final stretch, when the greatest armies of the Free people and the Natars will clash across the world for the fate of all that lies under heaven. This is the war that will echo across the eons, this is your war, and here you shall etch your name across history, here you shall become legend.


Facts:
To steal one, the following things must happen:
You must attack the village (NO Raid!)
WIN the Attack
Destroy the treasury
An empty treasury lvl 10 MUST be in the village where that attack came from
Have a hero in an attack

If not, the next attack on that village, winning with a hero and empty treasury will take the building plan.

To build a WW, you must own a plan yourself (you = the WW village owner) from lvl 0 to 49, from 50 to 100 you need an additional plan in your alliance! Two plans in the WW village account would not work!

The construction plans are conquerable immediately when they appear to the server.

There will be a countdown in game, showing the exact time of the release, 5 days prior to the launch. ");


//planos
define("PLAN","Ancient Construction Plan");
define("PLANVILLAGE","WW Buildingplan");
define("PLAN_DESC","With this ancient construction plan you will able to build World Wonder to level 50. to build further, your alliance must hold at least two plans.");
define("PLAN_INFO","World Wonder Construction Plans


Many moons ago the tribes of Travian were surprised by the unforeseen return of the Natars. This tribe from immemorial times surpassing all in wisdom, might and glory was about to trouble the free ones again. Thus they put all their efforts in preparing a last war against the Natars and vanquishing them forever. Many thought about the so-called 'Wonders of the World', a construction of many legends, as the only solution. It was told that it would render anyone invincible once completed. Ultimately making the constructors the rulers and conquerors of all known Travian.

However, it was also told that one would need construction plans to construct such a building. Due to this fact, the architects devised cunning plans about how to store these safely. After a while, one could see temple-like buildings in many a city and metropolis - the Treasure Chambers (Treasuries).

Sadly, no one - not even the wise and well versed - knew where to find these construction plans. The harder people tried to locate them, the more it seemed as if they where only legends.

Today, however, this last secret will be revealed. Deprivations and endeavors of the past will not have been in vain, as today scouts of several tribes have successfully obtained the whereabouts of the construction plans. Well guarded by the Natars, they lie hidden in several oases to be found all over Travian. Only the most valiant heroes will be able to secure such a plan and bring it home safely so that the construction can begin.

In the end, we will see whether the free tribes of Travian can once again outwit the Natars and vanquish them once and for all. Do not be so foolish as to assume that the Natars will leave without a fight, though!



To steal a set of Construction Plans from the Natars, the following things must happen:
- You must Attack the village (NOT Raid!)
- You must WIN the Attack
- You must DESTROY the Treasure Chamber (Treasury)
- Your Hero MUST be in that attack, as he is the only one who may carry the Construction Plans
- An empty level 10 Treasure Chamber (Treasury) MUST be in the village where that attack came from
NOTE: If the above criteria is not met during the attack, the next attack on that village which does meet the above criteria will take the Construction Plans.



To build a Treasure Chamber (Treasury), you will need a Main Building level 10 and the village MUST NOT be a Capital or contain a World Wonder.

To build a World Wonder, you must own the Construction Plans yourself (you = the World Wonder Village Owner) from level 0 to 50, and then from level 51 to 100 you will need an additional set of Construction Plans in your Alliance! Two sets of Construction Plans in the World Wonder Village Account will not work!");
define("WWVILLAGE","WW village");
/*
|--------------------------------------------------------------------------
|   Index
|--------------------------------------------------------------------------
*/

	   $lang['index'][0][1] = "歡迎來到 " . SERVER_NAME . "";
	   $lang['index'][0][2] = "資料";
	   $lang['index'][0][3] = "這是免費的, 現在就加入!";
	   $lang['index'][0][4] = "" . SERVER_NAME . "是什麼";
	   $lang['index'][0][5] = "" . SERVER_NAME . " 是 <b>網頁遊戲</b> 是架構於瀏覽器的遊戲<BR />TRAVIAN世界內有數千至數萬名玩家，一名玩家就是一個村莊的領主，以外交、權謀、諜戰、結盟、分工等等謀略，成為中世紀霸主<br /><p>這是 <strong>免費的</strong> 而且 <strong>不用下載</strong>.";
	   $lang['index'][0][6] = "點擊這裡玩 " . SERVER_NAME . "";
	   $lang['index'][0][7] = "總人數";
	   $lang['index'][0][8] = "活躍的玩家";
	   $lang['index'][0][9] = "在線的玩家";
	   $lang['index'][0][10] = "關於遊戲";
	   $lang['index'][0][11] = "一開始你的村莊只有一個建築物。 ";
	   $lang['index'][0][12] = "在發展成大帝國之前，你須要開發你的資源以增加生產力。";
	   $lang['index'][0][13] = "在 OC TRAVIAN 的世界您並不孤單，您將和成千上萬的玩家在虛擬的世界裡一起互動。";
	   $lang['index'][0][14] = "新聞";
	   $lang['index'][0][15] = "說明";
	   $lang['index'][0][16] = "遊戲截圖";
	   $lang['forum'] = "論壇";
	   $lang['register'] = "註冊";
	   $lang['login'] = "登入";


?>
