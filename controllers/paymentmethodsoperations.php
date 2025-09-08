<?php
    require once("../models/paymentmethods.php");

    $paymentmethods=new paymentmethods();

    if(isset($_POST['savepaymentmethods'])){
        $methodid=$_POST['methodid'];
        $methodname=$_POST['methodname'];

        $response=$paymentmethods->`sp_savepaymentmethods`($methodid, $methodname);
        echo json_encode($response);
    }
    
    if(isset($_GET['getpaymentmethods'])){
        echo $paymentmethods->getpaymentmethods();
    }

    if(isset($_GET['getpaymentmethodsdetails'])){
        $methodid-$_GET['methodid'];
        echo $paymentmethods->getpaymentmethodsdetails($methodid);
    }

    if(isset($_POST['deletepaymentmethods'])){
         $methodid=$_POST['methodid'];
         $response=$paymentmethods->deletepaymentmethods($methodid);
         echo json_encode($response);
    }

?>