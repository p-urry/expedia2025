<?php
    require once("../models/traveldocuments.php");

    $taveldocuments=new taveldocuments();

    if(isset($_POST['savetaveldocuments'])){
        $documentid=$_POST['documentid'];
        $documentname=$_POST['documentname'];
        $documentexpires=$_POST['documentexpires'];

        $response=$taveldocuments->`sp_savetraveldocuments`($documentid,$documentname,$documentexpires);
        echo json_encode($response);
    }
    
    if(isset($_GET['gettaveldocuments'])){
        echo $taveldocuments->gettraveldocuments();
    }

    if(isset($_GET['gettaveldocumentsdetails'])){
        $documentid-$_GET['documentid'];
        echo $taveldocuments->gettaveldocumentsdetails($documentid);
    }

    if(isset($_POST['deletetaveldocuments'])){
         $documentid=$_POST['documentid'];
         $response=$taveldocuments->deletetaveldocuments($documentid);
         echo json_encode($response);
    }

?>