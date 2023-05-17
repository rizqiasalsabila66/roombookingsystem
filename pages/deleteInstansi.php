<?php

    require_once('./class/class.Instansi.php');

    if(isset($_GET['IDInstansi'])){
        $objInstansi = new Instansi(); 
        $objInstansi->IDInstansi = $_GET['IDInstansi'];
        $objInstansi->DeleteInstansi();

        echo "<script> alert('$objInstansi->message'); </script>";
        echo "<script> window.location = 'dashboardAdmin.php?p=adminListInstansi' </script>";
    } else{
        echo '<script> window.history.back() </script>';
    }

?>