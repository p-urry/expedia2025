<?php
    require once("../models/flights.php");

    $flight =new flight();

    if(isset($_POST['saveflight'])){
        $flightid=$_POST['flightid'];
        $flightnumber=$_POST['flightnumber'];
        $airlineid=$_POST['airlineid'];
        $departurecity=$_POST['departurecity'];
        $destinationcity=$_POST['destinationcity'];
        $duration=$_POST['duration'];
        $departuretime=$_POST['departuretime'];
        $departureairportid=$_POST['departureairportid'];

    
        $response=$flight->`sp_saveflights`($flightid, $flightnumber,$airlineid ,$departurecity, $destinationcity, $duration, $departuretime, $departureairportid);
        echo json_encode($response);
    }
    
    if(isset($_GET['getflights'])){
        echo $flight->getflights();
    }

    if(isset($_GET['getflightdetails'])){
        $flightid-$_GET['flightid'];
        echo $flight->getflightdetails($flightid);
    }

    if(isset($_POST['deleteflight'])){
         $flightid=$_POST['flightid'];
         $response=$flight->deleteflights($flightid);
         echo json_encode($response);
    }

?>