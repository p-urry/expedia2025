<?php
    require_once (db.php);

    class flightbookingpassengers extends db{
        function checkflightbookingpassengers($passangerbookingid,$bookingclassid){
            $sql="CALL`sp_checkflightbookingpassengers`({$passangerbookingid},'{$bookingclassid}')";
            return $this->getData($sql)->rowCount();
        }
        function saveflightbookingpassengers($passangerbookingid, $bookingclassid,$documentid ,$iddocumentno, $firstname, $lastname, $middlename, $gender,$DOB)

            if($this->checkflightbookingpassengers($passangerbookingid,$bookingclassid)){
                return ["status"=>"exists","message"=>"flightbookingpassengers already exists"];
            }else{
                  $sql="CALL`sp_saveflightbookingpassengers({$passangerbookingid}, '{$bookingclassid}',{$documentid} ,'{$iddocumentno}','{$firstname}', {$lastname},{$middlename},{$gender},{$DOB})";
                $this->getData($sql);
                return["status"=>"success","message"=>"flightbookingpassengers saved successful"];
            }
              
        
        function getflightbookingpassengers(){
            $sql="CALL `sp_getflightbookingpassengers`()";
            return $this->getJSON($sql);
        }
        function getflightbookingpassengersdetails($passangerbookingid){
            $sql="CALL`sp_getflightbookingpassengersdetails`({$passangerbookingid})";
            return $this->getJSON($sql);
        }
        function deleteflightbookingpassengers($airportid){
                $sql="CALL `sp_deleteflightbookingpassengers`({$passangerbookingid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"flightbookingpassengers was deleted successfully"];

        }
    }

?>