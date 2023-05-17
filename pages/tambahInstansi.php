<?php

    require_once('./class/class.Instansi.php');
    $objInstansi = new Instansi();
    if(isset($_POST['btnSubmit'])){
        
        $objInstansi->kainstansi = $_POST['kainstansi'];
        $objInstansi->namaInstansi = $_POST['namaInstansi'];


        if(isset($_GET['IDInstansi'])){
            $objInstansi->IDInstansi = $_GET['IDInstansi'];
            $objInstansi->UpdateInstansi();
        }else{
            $objInstansi->AddInstansi();
        }

        echo "<script> alert('$objInstansi->message'); </script>";
        if($objInstansi->hasil){
            echo '<script> window.location = "dashboardAdmin.php?p=adminListInstansi"; </script>';
        }

        
    } else if(isset($_GET['IDInstansi'])){
        $objInstansi->IDInstansi = $_GET['IDInstansi'];
        $objInstansi->SelectOneInstansi();
    }
?>
<div class="container">
    <div class="wrapper">
        <div class="row justify-content-center align-items-center " style="height:100%">
            <div class="col-6">
                <div class="card shadow p-3 mb-5 mt-5 bg-white rounded border-0">
                    <div class="card-body">
                        <h2>Tambah Instansi</h2>
                        <p>Tambahkan instansi yang belum terdaftar</p> 
                        <form action="" autocomplete="off" method="POST" enctype="multipart/form-data"> 
                            
                            <div class="form-group">
                                <label for="kainstansi">Nama Kepala Instansi</label>
                                 <input type="text" class="form-control" name="kainstansi" value="<?php echo $objInstansi->kainstansi; ?>">
                            </div>

                            <div class="form-group">
                                <label for="namaInstansi">Nama Instansi</label>
                                 <input type="text" class="form-control" name="namaInstansi" value="<?php echo $objInstansi->namaInstansi; ?>">
                            </div>

                            <input type="submit" name="btnSubmit" class="btn btn-primary btn-block" value="Save">
                            <a href="dashboardAdmin.php?p=adminListInstansi" class="btn btn-light btn-block">Cancel</a>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>