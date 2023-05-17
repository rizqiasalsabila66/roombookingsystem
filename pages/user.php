<?php

    require_once('./class/class.Register.php');
    require_once('./class/class.Instansi.php');
    require_once('./class/class.Peminjam.php');

    $objInstansi = new Instansi();
    $objRegister = new Register();
    $objPeminjam = new Peminjam();

    $instansiList = $objInstansi->SelectAllInstansi();

    if(isset($_POST['btnUpdate'])){
        $objRegister->email = $_POST['email'];
        $objRegister->nama = $_POST['fullname'];
        $objRegister->alamat = $_POST['address'];    
        $objRegister->noTelp = $_POST['noTelp'];     
        $objRegister->gender = $_POST['jenisKelamin'];
        $objPeminjam->UserID = $_GET['UserID'];
     

        if(isset($_GET['UserID'])){
            $objRegister->UserID = $_GET['UserID'];
            $objPeminjam->UserID =$_GET['UserID'];
            $objRegister->UpdateMember();
            $objPeminjam->UpdatePeminjam();
        }
        
        if($objRegister->hasil){
        echo "<script> alert('$objRegister->message'); </script>";
        echo '<script> window.location = "dashboardMahasiswa.php?p"; </script>';
        }
    } else if (isset($_GET['UserID'])) {
        $objRegister->UserID = $_GET['UserID'];
        $objPeminjam->UserID = $_GET['UserID'];
        $objRegister->SelectOneMember();
        $objPeminjam->SelectOnePeminjam();
    }
?>
<div class="container">
    <div class="wrapper">
        <div class="row justify-content-center align-items-center " style="height:100%">
        <div class="col-md-9">
		    <div class="card shadow p-3 mb-5 mt-5 bg-white rounded border-0">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4><i class="fas fa-user"></i> Your Profile</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
                            <form action="" autocomplete="off" method="POST">
                                
                                <!-- Full Name -->
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" class="form-control" name="fullname" id="fullName" value="<?php echo $objRegister->nama; ?>">
                                </div>

                                <!-- Email -->
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" id="email" value="<?php echo $objRegister->email; ?>">
                                </div>

                                

                                 <!-- Alamat -->
                                <div class="form-group">
                                    <label for="address">Alamat</label>
                                    <textarea class="form-control" name="address" id="address" rows="3" style="height:100%"><?php echo $objRegister->alamat; ?></textarea>
                                </div>

                                <!-- Nomer Telepon -->
                                <div class="form-group">
                                    <label for="noTelp">Nomor Telepon</label>
                                    <input type="number" class="form-control" name="noTelp" id="noTelp" value="<?php echo $objRegister->noTelp; ?>">
                                </div>

                                <!-- Jenis Kelamin -->
                                <div class="form-group">
                                    <label for="jenisKelamin">Jenis Kelamin</label></br>
                                    
                                        <?php
                                            $gender = array("F"=>"Perempuan", "M"=>"Laki-laki");
                                            foreach($gender as $key => $value) {	
                                                if($objRegister->gender == $key){
                                                    echo '<div class="custom-control custom-radio custom-control-inline">';
                                                    echo '<input type="radio" id="laki" name="jenisKelamin" class="custom-control-input" checked value="'.$key.'">';					
                                                    echo '<label class="custom-control-label" for="laki"> '.$value.'</label>';
                                                    echo '</div>';
                                                }else{
                                                    echo '<div class="custom-control custom-radio custom-control-inline">';
                                                    echo '<input type="radio" id="perempuan" name="jenisKelamin" class="custom-control-input" value="'.$key.'">';					
                                                    echo '<label class="custom-control-label" for="perempuan"> '.$value.'</label>';
                                                    echo '</div>';
                                                }
                                            }	
                                        ?>
                                    
                                </div>

                                <input type="submit" name="btnUpdate" class="btn btn-primary btn-block" value="Update Profile">
                                <a href="dashboardAdmin.php?p=adminListUser" class="btn btn-light btn-block">Cancel</a>
                            
                            </form>
                        </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
        </div>
    </div>
</div>

<!-- JS Tab Control -->
<script>
    $(document).ready(function () {
        $('input[name="pekerjaan"]').click(function () {
            $(this).tab('show');
            $(this).removeClass('active');
        });
    });

    $(".reveal").on('click',function() {
        const show = $('.fa');
        $(show).toggleClass('.fa fa-eye-slash');
        $(this).toggleClass('active');
        var $pwd = $(".pwd");
        if ($pwd.attr('type') === 'password') {
            $pwd.attr('type', 'text');
        } else {
            $pwd.attr('type', 'password');
        }
    });
</script>