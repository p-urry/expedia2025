<?php
    require_once (db.php);

    class bookingtype extends db{
        function  checkbookingtype($typeid,$typename){
            $sql="CALL`sp_checkbookingtype`({$typeid},'{$typename}')";
            return $this->getData($sql)->rowCount();
        }
        function savebookingtype($typeid,$typename){
            if($this->checkbookingtype($typeid,$typename)){
                return ["status"=>"exists","message"=>"booking type already exists"];
            }else{
                  $sql="CALL`sp_savebookingtype`({$typeid},'{$typename}')";
                $this->getData($sql);
                return["status"=>"success","message"=>"booking type save successful"];
            }
              
        }
        function getbookingtype(){
            $sql="CALL `sp_getbookingtype`()";
            return $this->getJSON($sql);
        }
        function getbookingtypedetails($typeid){
            $sql="CALL`sp_getbookingtypedetails`({$typeid})";
            return $this->getJSON($sql);
        }
        function deletebookingtype($typeid){
                $sql="CALL `sp_deletebookingtype`({$typeid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"booking type was deleted successfully"];

        }
    }

?>