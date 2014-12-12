<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       Market.php                                                  ##
##  Developed by:  Dzoki                                                       ##
##  Some fixes:    aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

class Market
{
    public $onsale,$onmarket,$sending,$recieving,$return = array();
    public $maxcarry,$merchant,$used;

    public function procMarket($post)
    {
        $this->loadMarket();
        if(isset($_SESSION['loadMarket']))
        {
            $this->loadOnsale();
            unset($_SESSION['loadMarket']);
        }
        if(isset($post['ft']))
        {
            switch($post['ft'])
            {
                case "mk1": $this->sendResource($post); break;
                case "mk2": $this->addOffer($post); break;
                case "mk3": $this->tradeResource($post); break;
            }
        }
    }

    public function procRemove($get)
    {
        global $database,$village,$session;

        if(isset($get['t']) && $get['t'] == 1)
        {
            $this->filterNeed($get);
        }
        else if(isset($get['t']) && $get['t'] ==2 && isset($get['a']) && $get['a'] == 5 && isset($get['del']))
        {
            //GET ALL FIELDS FROM MARKET
            $type = $database->getMarketField($village->wid,"gtype");
            $amt = $database->getMarketField($village->wid,"gamt");
            $vref = $village->wid;
            $database->getResourcesBack($vref,$type,$amt);
            $database->addMarket($village->wid,$get['del'],0,0,0,0,0,0,1);
            header("Location: build.php?id=".$get['id']."&t=2");
        }
        if(isset($get['t']) && $get['t'] == 1 && isset($get['a']) && $get['a'] == $session->mchecker && !isset($get['del']))
        {
            $session->changeChecker();
            $this->acceptOffer($get);
        }
    }

    public function merchantAvail()
    {
        return $this->merchant - $this->used;
    }

    private function loadMarket()
    {
        global $session,$building,$bid28,$bid17,$database,$village;

        $this->recieving = $database->getMovement(0,$village->wid,1);
        $this->sending = $database->getMovement(0,$village->wid,0);
        $this->return  = $database->getMovement(2,$village->wid,1);
        $this->merchant = ($building->getTypeLevel(17) > 0)? $bid17[$building->getTypeLevel(17)]['attri'] : 0;
        $this->used = $database->totalMerchantUsed($village->wid);
        $this->onmarket = $database->getMarket($village->wid,0);
        $this->maxcarry = ($session->tribe == 1)? 500 : (($session->tribe == 2)? 1000 : 750);
        $this->maxcarry *= TRADER_CAPACITY;
        if($building->getTypeLevel(28) != 0)
        {
            $this->maxcarry *= $bid28[$building->getTypeLevel(28)]['attri'] / 100;
        }
    }

    private function sendResource($post)
    {
        global $database,$village,$session,$generator,$logging;

        $wtrans = (isset($post['r1']) && $post['r1'] != "")? $post['r1'] : 0;
        $ctrans = (isset($post['r2']) && $post['r2'] != "")? $post['r2'] : 0;
        $itrans = (isset($post['r3']) && $post['r3'] != "")? $post['r3'] : 0;
        $crtrans = (isset($post['r4']) && $post['r4'] != "")? $post['r4'] : 0;
        $wtrans = str_replace("-", "", $wtrans);
        $ctrans = str_replace("-", "", $ctrans);
        $itrans = str_replace("-", "", $itrans);
        $crtrans = str_replace("-", "", $crtrans);
        $availableWood = $database->getWoodAvailable($village->wid);
        $availableClay = $database->getClayAvailable($village->wid);
        $availableIron = $database->getIronAvailable($village->wid);
        $availableCrop = $database->getCropAvailable($village->wid);
        if($session->access == BANNED)
        {
            header("Location: banned.php");
        }
        else if($availableWood >= $post['r1'] AND $availableClay >= $post['r2'] AND $availableIron >= $post['r3'] AND $availableCrop >= $post['r4'])
        {
            $resource = array($wtrans,$ctrans,$itrans,$crtrans);
            $reqMerc = ceil((array_sum($resource)-0.1)/$this->maxcarry);

            if($this->merchantAvail() != 0 && $reqMerc <= $this->merchantAvail())
            {
                $id = $post['getwref'];
                $coor = $database->getCoor($id);
                if($database->getVillageState($id))
                {
                    $timetaken = $generator->procDistanceTime($coor,$village->coor,$session->tribe,0);
                    $res = $resource[0]+$resource[1]+$resource[2]+$resource[3];
                    if($res!=0)
                    {
                        $reference = $database->sendResource($resource[0],$resource[1],$resource[2],$resource[3],$reqMerc,0);
                        $database->modifyResource($village->wid,$resource[0],$resource[1],$resource[2],$resource[3],0);
                        $database->addMovement(0,$village->wid,$id,$reference,time(),time()+$timetaken,$post['send3']);
                        $logging->addMarketLog($village->wid,1,array($resource[0],$resource[1],$resource[2],$resource[3],$id));
                    }
                }
            }
            header("Location: build.php?id=".$post['id']);
        }
        else
        {
            // something
        }
    }

    private function addOffer($post)
    {
        global $database,$village,$session;


        if($post['rid1'] == $post['rid2'])
        {
            // Trading res for res of same type (invalid)
            header("Location: build.php?id=".$post['id']."&t=2&e2");
        }
        elseif($post['m1'] > (2 * $post['m2']))
        {
            // Trade is for more than 2x (invalid)
            header("Location: build.php?id=".$post['id']."&t=2&e2");
        }
        elseif($post['m2'] > (2 * $post['m1']))
        {
            // Trade is for less than 0.5x (invalid)
            header("Location: build.php?id=".$post['id']."&t=2&e2");
        }
        else
        {
            $wood = ($post['rid1'] == 1)? $post['m1'] : 0;
            $clay = ($post['rid1'] == 2)? $post['m1'] : 0;
            $iron = ($post['rid1'] == 3)? $post['m1'] : 0;
            $crop = ($post['rid1'] == 4)? $post['m1'] : 0;
            $availableWood = $database->getWoodAvailable($village->wid);
            $availableClay = $database->getClayAvailable($village->wid);
            $availableIron = $database->getIronAvailable($village->wid);
            $availableCrop = $database->getCropAvailable($village->wid);

            if($session->access == BANNED)
            {
                header("Location: banned.php");
            }

            elseif($availableWood >= $wood AND $availableClay >= $clay AND $availableIron >= $iron AND $availableCrop >= $crop)
            {
                $reqMerc = 1;

                if(($wood+$clay+$iron+$crop) > $this->maxcarry)
                {
                    $reqMerc = round(($wood+$clay+$iron+$crop)/$this->maxcarry);

                    if(($wood+$clay+$iron+$crop) > $this->maxcarry*$reqMerc)
                    {
                        $reqMerc += 1;
                    }
                }
                if($this->merchantAvail() != 0 && $reqMerc <= $this->merchantAvail())
                {
                    if($database->modifyResource($village->wid,$wood,$clay,$iron,$crop,0))
                    {
                        $time = 0;
                        if(isset($_POST['d1']))
                        {
                            $time = $_POST['d2'] * 3600;
                        }
                        $alliance = (isset($post['ally']) && $post['ally'] == 1)? $session->userinfo['alliance'] : 0;
                        $database->addMarket($village->wid,$post['rid1'],$post['m1'],$post['rid2'],$post['m2'],$time,$alliance,$reqMerc,0);
                    }
                    // Enough merchants
                    header("Location: build.php?id=".$post['id']."&t=2");
                }
                else
                {
                    // Not enough merchants
                    header("Location: build.php?id=".$post['id']."&t=2&e3");
                }
            }
            else
            {
                // not enough resources
                header("Location: build.php?id=".$post['id']."&t=2&e1");
            }
        }
    }

    private function acceptOffer($get)
    {
        global $database,$village,$session,$logging,$generator;

        $infoarray = $database->getMarketInfo($get['g']);
        $reqMerc = 1;
        if($infoarray['wamt'] > $this->maxcarry)
        {
            $reqMerc = round($infoarray['wamt']/$this->maxcarry);
            if($infoarray['wamt'] > $this->maxcarry*$reqMerc)
            {
                $reqMerc += 1;
            }
        }
        $myresource = $hisresource = array(1=>0,0,0,0);
        $myresource[$infoarray['wtype']] = $infoarray['wamt'];
        $mysendid = $database->sendResource($myresource[1],$myresource[2],$myresource[3],$myresource[4],$reqMerc,0);
        $hisresource[$infoarray['gtype']] = $infoarray['gamt'];
        $hissendid = $database->sendResource($hisresource[1],$hisresource[2],$hisresource[3],$hisresource[4],$infoarray['merchant'],0);
        $hiscoor = $database->getCoor($infoarray['vref']);
        $mytime = $generator->procDistanceTime($hiscoor,$village->coor,$session->tribe,0);
        $targettribe = $database->getUserField($database->getVillageField($infoarray['vref'],"owner"),"tribe",0);
        $histime = $generator->procDistanceTime($village->coor,$hiscoor,$targettribe,0);
        $database->addMovement(0,$village->wid,$infoarray['vref'],$mysendid,time(),$mytime+time());
        $database->addMovement(0,$infoarray['vref'],$village->wid,$hissendid,time(),$histime+time());
        $resource = array(1=>0,0,0,0);
        $resource[$infoarray['wtype']] = $infoarray['wamt'];
        $database->modifyResource($village->wid,$resource[1],$resource[2],$resource[3],$resource[4],0);
        $database->setMarketAcc($get['g']);
        $database->removeAcceptedOffer($get['g']);
        $logging->addMarketLog($village->wid,2,array($infoarray['vref'],$get['g']));
        header("Location: build.php?id=".$get['id']);
    }

    private function loadOnsale()
    {
        global $database,$village,$session,$multisort,$generator;

        $displayarray = $database->getMarket($village->wid,1);
        $holderarray = array();
        foreach($displayarray as $value)
        {
            $targetcoor = $database->getCoor($value['vref']);
            $duration = $generator->procDistanceTime($targetcoor,$village->coor,$session->tribe,0);
            if($duration <= $value['maxtime'] || $value['maxtime'] == 0)
            {
                $value['duration'] = $duration;
                array_push($holderarray,$value);
            }
        }
        $this->onsale = $multisort->sorte($holderarray, "'duration'", true, 2);
    }

    private function filterNeed($get)
    {
        if(isset($get['v']) || isset($get['s']) || isset($get['b']))
        {
            $holder = $holder2 = array();
            if(isset($get['v']) && $get['v'] == "1:1")
            {
                foreach($this->onsale as $equal)
                {
                    if($equal['wamt'] <= $equal['gamt'])
                    {
                        array_push($holder,$equal);
                    }
                }
            }
            else
            {
                $holder = $this->onsale;
            }
            foreach($holder as $sale)
            {
                if(isset($get['s']) && isset($get['b']))
                {
                    if($sale['gtype'] == $get['s'] && $sale['wtype'] == $get['b'])
                    {
                        array_push($holder2,$sale);
                    }
                }
                else if(isset($get['s']) && !isset($get['b']))
                {
                    if($sale['gtype'] == $get['s'])
                    {
                        array_push($holder2,$sale);
                    }
                }
                else if(isset($get['b']) && !isset($get['s']))
                {
                    if($sale['wtype'] == $get['b'])
                    {
                        array_push($holder2,$sale);
                    }
                }
                else
                {
                    $holder2 = $holder;
                }
            }
            $this->onsale = $holder2;
        }
        else
        {
            $this->loadOnsale();
        }
    }

    private function tradeResource($post)
    {
        global $session,$database,$village;

        $wwvillage = $database->getResourceLevel($village->wid);
        if($wwvillage['f99t']!=40)
        {
            if($session->userinfo['gold'] >= 3)
            {
                //kijken of ze niet meer gs invoeren dan ze hebben
                if($session->access == BANNED)
                {
                    header("Location: banned.php");
                }
                else if (($post['m2'][0]+$post['m2'][1]+$post['m2'][2]+$post['m2'][3])<=(round($village->awood)+round($village->aclay)+round($village->airon)+round($village->acrop)))
                {
                    $database->setVillageField($village->wid,"wood",$post['m2'][0]);
                    $database->setVillageField($village->wid,"clay",$post['m2'][1]);
                    $database->setVillageField($village->wid,"iron",$post['m2'][2]);
                    $database->setVillageField($village->wid,"crop",$post['m2'][3]);
                    $database->modifyGold($session->uid,3,0);
                    header("Location: build.php?id=".$post['id']."&t=3&c");;
                }
                else
                {
                    header("Location: build.php?id=".$post['id']."&t=3");
                }
            }
            else
            {
                header("Location: build.php?id=".$post['id']."&t=3");
            }
        }
    }
};

$market = new Market;
?>