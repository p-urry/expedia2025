<?php
    require once("../models/flightbookingclasses.php");

    $flightbookingclasses =new flightbookingclasses();

    if(isset($_POST['saveflightbookingclasses'])){
        $bookingclassid=$_POST['bookingclassid'];
        $bookingid=$_POST['bookingid'];
        $noofseats=$_POST['noofseats'];
        $unitprice=$_POST['unitprice'];
        $currencyid=$_POST['currencyid'];
        
    
        $response=$flight->`sp_saveflightbookingclasses`($bookingclassid, $bookingid ,$noofseats, $unitprice, $currencyid);
        echo json_encode($response);
    }
    
    if(isset($_GET['getflightbookingclasses'])){
        echo $flight->getflightbookingclasses();
    }

    if(isset($_GET['getflightbookingclassesdetails'])){
        $bookingclassid-$_GET['bookingclassid'];
        echo $flight->getflightdetails($bookingclassid);
    }

    if(isset($_POST['deleteflightbookingclasses'])){
         $bookingclassid=$_POST['bookingclassid'];
         $response=$flight->deleteflightbookingclasses($bookingclassid);
         echo json_encode($response);
    }

?>