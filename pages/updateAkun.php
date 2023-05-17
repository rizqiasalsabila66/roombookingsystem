<?php

    require_once('./class/class.Register.php');
    require_once('./class/class.Instansi.php');
    require_once('./class/class.Peminjam.php');

    $objInstansi = new Instansi();
    $objRegister = new Register();
    $objPeminjam = new Peminjam();

    $instansiList = $objInstansi->SelectAllInstansi();

    if(isset($_POST['btnUpdate'])){
        $objRegister->UserID = $_SESSION['UserID'];
        $objRegister->email = $_POST['email'];
        $password = $_POST['pass'];
        $objRegister->password = password_hash($password, PASSWORD_DEFAULT);
        $objRegister->UpdateAkun();

        
        if($objRegister->hasil){
        echo "<script> alert('$objRegister->message'); </script>";
        echo '<script> window.location = "dashboardUser.php?p"; </script>';
        }
    } else if (isset($_GET['UserID'])) {
        $objRegister->UserID = $_GET['UserID'];
        $objPeminjam->UserID = $_GET['UserID'];
        $objRegister->SelectOneMember();

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
                            <h4><i class="fas fa-user"></i> Your Akun</h4>
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <form action="" autocomplete="off" method="POST">
                                
                                   <!-- Email -->
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" id="email" value="<?php echo $objRegister->email; ?>">
                                </div>

                                <!-- Password -->
                                <div class="form-group">
                                    <label for="pass">Password</label>
                                    <div class="input-group">
                                    <input type="password" class="form-control pwd" id="pass" name="pass" autocomplete="off" value="<?php echo $objRegister->password; ?>">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary reveal " type="button"><i class="fa fa-eye"></i></button>
                                    </span>          
                                </div>
                                </div>

                                <input type="submit" name="btnUpdate" class="btn btn-primary btn-block" value="Update My Akun">
                                <a href="dashboardMahasiswa.php" class="btn btn-light btn-block">Cancel</a>
                            
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