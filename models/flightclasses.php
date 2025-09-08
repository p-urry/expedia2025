<?php
    require_once (db.php);

    class flightclasses extends db{
        function checkflightclasses($flightclassid,$flightid){
            $sql="CALL`sp_checkflightclassesclasses`({$flightclassid},'{$flightid}')";
            return $this->getData($sql)->rowCount();
        }
        function saveflightclasses($flightclassid, $flightid,$bookingclassid ,$noofseats, $unitprice, $currencyid)

            if($this->checkflightclasses($flightclassid,$flightid)){
                return ["status"=>"exists","message"=>"flightclass already exists"];
            }else{
                  $sql="CALL`sp_saveflightclassesclasses({$flightclassid}, '{$flightid}',{$bookingclassid} ,'{$noofseats}','{$unitprice}', {$currencyid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"flightclass saved successful"];
            }
              
        
        function getflightclasses(){
            $sql="CALL `sp_getflightclassesclasses`()";
            return $this->getJSON($sql);
        }
        function getflightclassesdetails($flightclassid){
            $sql="CALL`sp_getflightclassesdetails`({$flightclassid})";
            return $this->getJSON($sql);
        }
        function deleteflightclasses($flightclassid){
                $sql="CALL `sp_deleteflightclassesclasses`({$flightclassid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"flight was deleted successfully"];

        }
    }

?>