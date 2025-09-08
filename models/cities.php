<?php
    require_once (db.php);

    class city extends db{
        function checkcities($cityid,$cityname){
            $sql="CALL`sp_checkcities`({$cityid},{$cityname})";
            return $this->getData($sql)->rowCount();
        }
        function savecities($cityid, $cityname,$countryid){
            if($this->checkcities($cityid, $cityname)){
                return ["status"=>"exists","message"=>"city name already exists"];
            }else{
                  $sql="CALL`sp_savecities`({$cityid},'{$cityname}',{$countryid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"city save successful"];
            }
              
        }
        function getcities(){
            $sql="CALL `sp_getcities`()";
            return $this->getJSON($sql);
        }
        function getcitydetails($cityid){
            $sql="CALL`sp_getcitydetails`({$cityid})";
            return $this->getJSON($sql);
        }
        function deletecities($cityid){
                $sql="CALL `sp_deletecities`({$cityid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"city was deleted successfully"];

        }
    }

?>