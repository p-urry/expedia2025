<?php
    require_once (db.php);

    class bookingclass extends db{
        function  checkbookingclass($classid,$classname){
            $sql="CALL`sp_checkbookingclasses`({$classid},'{$classname}')";
            return $this->getData($sql)->rowCount();
        }
        function savebookingclass($classid,$classname){
            if($this->checkbookingclasses($classid,$classname)){
                return ["status"=>"exists","message"=>"booking class already exists"];
            }else{
                  $sql="CALL`sp_savebookingclass`({$classid},'{$classname}')";
                $this->getData($sql);
                return["status"=>"success","message"=>"message save successful"];
            }
              
        }
        function getbookingclass(){
            $sql="CALL `sp_getbookingclass`()";
            return $this->getJSON($sql);
        }
        function getbookingclassdetails($classid){
            $sql="CALL`sp_getbookingclassdetails`({$classid})";
            return $this->getJSON($sql);
        }
        function deletebookingclass($classid){
                $sql="CALL `sp_deletebookingclass`({$classid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"booking class was deleted successfully"];

        }
    }

?>