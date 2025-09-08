<?php
    require_once (db.php);

    class airline extends db{
        function checkairline($airlineid,$airlinename){
            $sql="CALL`sp_checkairline`({$airlineid},'{$airlinename}')";
            return $this->getData($sql)->rowCount();
        }
        function saveairline($airlineid, $airlinename,$airlinelogo ,$countryid)

            if($this->checkairline($airlineid,$airlinename)){
                return ["status"=>"exists","message"=>"airline name already exists"];
            }else{
                  $sql="CALL`sp_saveairline`({$airlineid}, '{$airlinename}','{$airlinelogo}' ,{$countryid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"airline saved successful"];
            }
              
        
        function getairline(){
            $sql="CALL `sp_getairline`()";
            return $this->getJSON($sql);
        }
        function getairlinedetails($airlineid){
            $sql="CALL`sp_getairlinedetails`({$airlineid})";
            return $this->getJSON($sql);
        }
        function filterairlines($airlinename,$countryname){
            $sql="CALL `sp_filterairlines`('{$airlinename}','{$countryname}')";
            return $this->getJSON($sql);
        }
        function deleteairline($airlineid){
                $sql="CALL `sp_deleteairline`({$airlineid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"airline was deleted successfully"];

        }
    }

?>