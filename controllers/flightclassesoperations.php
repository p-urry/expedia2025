<?php
    require once("../models/flightclasses.php");

    $flightclass =new flightclass();

    if(isset($_POST['saveflight'])){
        $flightclassid=$_POST['flightclassid'];
        $flightid=$_POST['flightid'];
        $bookingclassid=$_POST['bookingclassid'];
        $noofseats=$_POST['noofseats'];
        $unitprice=$_POST['unitprice'];
        $currencyid=$_POST['currencyid'];
        
    
        $response=$flight->`sp_saveflightclasses`($flightclassid, $flightid,$bookingclassid ,$noofseats, $unitprice, $currencyid);
        echo json_encode($response);
    }
    
    if(isset($_GET['getflightclasses'])){
        echo $flight->getflightclasses();
    }

    if(isset($_GET['getflightclassesdetails'])){
        $flightclassid-$_GET['flightclassid'];
        echo $flight->getflightdetails($flightclassid);
    }

    if(isset($_POST['deleteflightclasses'])){
         $flightclassid=$_POST['flightclassid'];
         $response=$flight->deleteflightclasses($flightclassid);
         echo json_encode($response);
    }

?>