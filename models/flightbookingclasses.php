<?php
    require_once (db.php);

    class flightbookingclasses extends db{
        function checkflightbookingclasses($bookingclassid,$bookingid){
            $sql="CALL`sp_checkflightbookingclasses`({$bookingclassid},'{$bookingid}')";
            return $this->getData($sql)->rowCount();
        }
        function saveflightbookingclasses($bookingclassid, $bookingid ,$noofseats, $unitprice, $currencyid)

            if($this->checkflightbookingclasses($bookingclassid,$bookingid)){
                return ["status"=>"exists","message"=>"flightbookingclass already exists"];
            }else{
                  $sql="CALL`sp_saveflightbookingclasses({$bookingclassid}, '{$bookingid}' ,'{$noofseats}','{$unitprice}', {$currencyid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"flightbookingclass saved successful"];
            }
              
        
        function getflightbookingclasses(){
            $sql="CALL `sp_getflightbookingclasses`()";
            return $this->getJSON($sql);
        }
        function getflightbookingclassesdetails($bookingclassid){
            $sql="CALL`sp_getflightbookingclassesdetails`({$bookingclassid})";
            return $this->getJSON($sql);
        }
        function deleteflightbookingclasses($bookingclassid){
                $sql="CALL `sp_deleteflightbookingclassesclasses`({$bookingclassid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"flightbookingclass was deleted successfully"];

        }
    }

?>