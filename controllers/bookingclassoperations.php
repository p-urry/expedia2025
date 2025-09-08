<?php
    require once("../models/bookingclass.php");

    $bookingclass=new bookingclass();

    if(isset($_POST['savebookingclass'])){
        $classid=$_POST['classid'];
        $classname=$_POST['classname'];

        $response=$bookingclass->`sp_savebookingclass`($classid, $classname);
        echo json_encode($response);
    }
    
    if(isset($_GET['getbookingclass'])){
        echo $bookingclass->getbookingclass();
    }

    if(isset($_GET['getbookingclassdetails'])){
        $classid-$_GET['classid'];
        echo $bookingclass->getbookingclassdetails($countryid);
    }

    if(isset($_POST['deletebookingclass'])){
         $classid=$_POST['classid'];
         $response=$bookingclass->deletebookingclass($classid);
         echo json_encode($response);
    }

?>