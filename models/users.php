<?php
    require_once("db.php");

    class user extends db{

        function checkuser($userid,$username){
            $sql="CALL `sp_checkusername`({$userid},'{$username}')";
            // echo $sql.PHP_EOL;
            return $this->getData($sql)->rowCount();
        }

        function saveuser($userid,$username,$firstname,$lastname,$userpassword,$salt,$mobile,$email,$systemadmin){
            // Check if the users exists
            if ($this->checkuser($userid,$username)){
                return ["status"=>"exists","message"=>"user exists"];
            }else{
                // Remove after implementing user login
                $addedby=1;
                $sql="CALL `sp_saveuser`({$userid},'{$username}','{$firstname}','{$lastname}','{$userpassword}','{$salt}',
                '{$mobile}','{$email}',{$systemadmin},{$addedby})";
                // echo $sql.PHP_EOL;
                $rst=$this->getData($sql)->fetch();                
                return ["status"=>"success","message"=>"user was saved successully","userid"=>$rst['userid']];
            }
        }

        function getusers(){
            $sql="CALL `sp_getallusers`()";
            return $this->getJSON($sql);
        }

        function getuserdetails($userid){
            $sql="CALL `sp_getuserdetails`({$userid})";
            return $this->getJSON($sql);
        }

        function getobjects(){
            $sql="CALL `sp_getobjects`()";
            return $this->getJSON($sql);
        }

        function saveuserprivilege($userid,$objectid,$valid){
            $sql="CALL `sp_saveuserprivilege`({$userid},{$objectid},{$valid},{$this->userid})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"user privilege added successfully"];
        }

        function loginuser($username,$password){
            $sql="CALL `sp_getuserbyusername`('{$username}')";
            $userdetails= $this->getData($sql);
            if($userdetails->rowCount()>0){
                $userdetails=$userdetails->fetch();
                // check their password
                if($userdetails['password']==hash('SHA256',$password.$userdetails['salt'])){
                    $_SESSION['userid']=$userdetails['userid'];
                    $_SESSION['username']=$userdetails['firstname']." ".$userdetails['lastname'];
                    return ["status"=>"success","message"=>"login successful","userid"=>$userdetails['userid']];
                }else{
                    return ["status"=>"invalid","message"=>"invalid username or password"];
                }
            }else{
                return ["status"=>"invalid","message"=>"invalid username or password"];
            }
            
        }
    }


?>