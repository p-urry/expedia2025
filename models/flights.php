<?php
    require_once (db.php);

    class flights extends db{
        function checkflight($flightid,$flightnumber){
            $sql="CALL`sp_checkflights`({$flightid},'{$flightnumber}')";
            return $this->getData($sql)->rowCount();
        }
        function saveflight($flightid, $flightnumber,$airlineid ,$departurecity, $destinationcity, $duration, $departuretime, $departureairportid)

            if($this->checkflight($flightid,$flightnumber)){
                return ["status"=>"exists","message"=>"flight already exists"];
            }else{
                  $sql="CALL`sp_saveflights({$flightid}, '{$flightnumber}',{$airlineid} ,'{$departurecity}','{$destinationcity}', {$duration},{$departuretime},{$departureairportid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"flight saved successful"];
            }
              
        
        function getflight(){
            $sql="CALL `sp_getflights`()";
            return $this->getJSON($sql);
        }
        function getflightdetails($flightid){
            $sql="CALL`sp_getflightdetails`({$flightid})";
            return $this->getJSON($sql);
        }
        function deleteflight($airportid){
                $sql="CALL `sp_deleteflights`({$flightid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"flight was deleted successfully"];

        }
    }

?>