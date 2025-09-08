<?php
    require once("../models/flightbookingpassengers.php");

    $flightbookingpassengers =new flightbookingpassengers();

    if(isset($_POST['saveflightbookingpassengers'])){
        $passengerbookingid=$_POST['passengerbookingid'];
        $bookingclassid=$_POST['bookingclassid'];
        $documentid=$_POST['documentid'];
        $iddocumentno=$_POST['iddocumentno'];
        $firstname=$_POST['firstname'];
        $middlename=$_POST['middlename'];
        $lastname=$_POST['lastname'];
        $gender=$_POST['gender'];
        $DOB=$_POST['DOB'];
    
        $response=$flightbookingpassengers->`sp_saveflightbookingpassengers`($passengerbookingid, $bookingclassid,$documentid ,$iddocumentno, $firstname, $middlename, $lastname, $gender,$DOB);
        echo json_encode($response);
    }
    
    if(isset($_GET['getflightbookingpassengers'])){
        echo $flightbookingpassengers->getflightbookingpassengers();
    }

    if(isset($_GET['getflightbookingpassengersdetails'])){
        $passengerbookingid-$_GET['passengerbookingid'];
        echo $flightbookingpassengers->getflightbookingpassengersdetails($passengerbookingid);
    }

    if(isset($_POST['deleteflightbookingpassengers'])){
         $passengerbookingid=$_POST['passengerbookingid'];
         $response=$flightbookingpassengers->deleteflightbookingpassengers($passengerbookingid);
         echo json_encode($response);
    }

?>