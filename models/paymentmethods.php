<?php
    require_once (db.php);

    class paymentmethods extends db{
        function  checkpaymentmethods($methodid,$methodname){
            $sql="CALL`sp_checkpaymentmethods`({$methodid},'{$methodname}')";
            return $this->getData($sql)->rowCount();
        }
        function savepaymentmethods($methodid,$methodname){
            if($this->checkpaymentmethods($methodid,$methodname)){
                return ["status"=>"exists","message"=>"paymentmethods name already exists"];
            }else{
                  $sql="CALL`sp_savepaymentmethods`({$methodid},'{$methodname}')";
                $this->getData($sql);
                return["status"=>"success","message"=>"message save successful"];
            }
              
        }
        function getpaymentmethods(){
            $sql="CALL `sp_getpaymentmethods`()";
            return $this->getJSON($sql);
        }
        function getpaymentmethodsdetails($methodid){
            $sql="CALL`sp_getpaymentmethodsdetails`({$methodid})";
            return $this->getJSON($sql);
        }
        function deletepaymentmethods($methodid){
                $sql="CALL `sp_deletepaymentmethods`({$methodid})";
                $this->getData($sql);
                return["status"=>"success","message"=>"message was deleted successfully"];

        }
    }

?>