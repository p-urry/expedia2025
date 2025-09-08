<?php
    require_once (db.php);

    class traveldocument extends db{
        function checktraveldocuments($documentid,$documentname){
            $sql="CALL`sp_checktraveldocuments`({$documentid},{$documentname})";
            return $this->getData($sql)->rowCount();
        }
        function savetraveldocuments($documentid, $documentname,$documentexpires){
            if($this->checktraveldocuments($documentid, $documentname)){
                return ["status"=>"exists","message"=>"traveldocument name already exists"];
            }else{
                  $sql="CALL`sp_savetraveldocuments`({$documentid},'{$documentname}',{$documentexpires})";
                $this->getData($sql);
                return["status"=>"success","message"=>"traveldocument save successful"];
            }
              
        }
        function gettraveldocuments(){
            $sql="CALL `sp_gettraveldocuments`()";
            return $this->getJSON($sql);
        }
        function gettraveldocumentdetails($documentid){
            $sql="CALL`sp_gettraveldocumentdetails`({$documentid})";
            return $this->getJSON($sql);
        }
        function deletetraveldocuments($documentid){
                $sql="CALL `sp_deletetraveldocuments`({$documentid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"traveldocument was deleted successfully"];

        }
    }

?>