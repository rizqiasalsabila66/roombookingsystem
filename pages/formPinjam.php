<?php
  
  require_once('./class/class.Peminjaman.php');
  require_once('./class/class.Register.php');
  require_once('./class/class.Instansi.php');
  require_once('./class/class.Ruangan.php');

  require_once('./class/class.Mail.php');

  $objPeminjaman = new Peminjaman_Ruangan();
  $objRegister = new Register();
  $objInstansi = new Instansi();
  $objRuangan = new Ruangan();


  $email = $_SESSION["email"];
  $nama = $_SESSION["nama"];
  $role = $_SESSION["role"];
  $persetujuan = 'Belum Disetujui';
  $tglPersetujuan = '-';

  if(isset($_GET['IDRuangan'])){
    $objRuangan->IDRuangan = $_GET['IDRuangan'];
    $objRuangan->SelectOneRuangan();
  }

  if (isset($_POST['btnSubmit'])){
    $objPeminjaman->IDPeminjaman;
    $jamPinjam = date("H:i", strtotime($_POST['jamPinjam']));
    $objPeminjaman->jamPinjam = $jamPinjam;
    $jamSelesai = date("H:i", strtotime($_POST['selesaiPinjam']));
    $objPeminjaman->jamSelesai = $jamSelesai;
    $jamPinjam2 = strtotime($_POST['jamPinjam']);
    $selesaiPinjam2 = strtotime($_POST['selesaiPinjam']);
    $diff = abs($jamPinjam2 - $selesaiPinjam2);
    $hours = floor(($diff - (60*60))); 
    $datetime = date("H:i", $hours);
    $objPeminjaman->lamaPinjam = $datetime;
    $objPeminjaman->keperluan = $_POST['keperluan'];
    $objPeminjaman->tambahan = $_POST['tambahan'];
    $objPeminjaman->tglSelesai = date('Y-m-d', strtotime($_POST['tglSelesai']));
    $objPeminjaman->tglPinjam = date('Y-m-d', strtotime($_POST['tglPinjam']));
    $objPeminjaman->UserID = $_SESSION['UserID'];
    $objPeminjaman->IDRuangan = $objRuangan->IDRuangan;
    $objPeminjaman->AddPeminjaman();

    $hariPinjam = date("l", strtotime($_POST['tglPinjam']));
    $hariSelesai = date("l", strtotime($_POST['tglSelesai']));


      if($objPeminjaman->hasil){			
        $message =  file_get_contents('templateemail.html');  					 
        $header = "Peminjaman berhasil";
        $body = '<span style="font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;">
                  <table id="pinjam" >
                    <tr>
                        <td colspan="3" align="center">
                            <h2>Form Penggunaan Ruangan</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nama
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            '.$nama.'
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Divisi
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$role.'
                        </td>    
                    </tr>
                    <tr>
                        <td>
                            Ruangan
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$objRuangan->namaRuangan.'
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Lantai
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$objRuangan->lantai.'
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hari/Tanggal
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$hariPinjam.'/'.$objPeminjaman->tglPinjam.'—'.$hariSelesai.'/'.$objPeminjaman->tglSelesai.'
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Jam Pinjam—Selesai
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$objPeminjaman->jamPinjam.'—'.$objPeminjaman->jamSelesai.'
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Keperluan
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$objPeminjaman->keperluan.'
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tambahan
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$objPeminjaman->tambahan.'
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Persetujuan
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$persetujuan.'
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tanggal Persetujuan
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                          '.$tglPersetujuan.'
                        </td>
                    </tr>
                    
                  </table>
                </span>';
        $footer ='Silakan login untuk memantau persetujuan peminjaman ruangan';
                                    
        $message = str_replace("#header#",$header,$message);
        $message = str_replace("#body#",$body,$message);
        $message = str_replace("#footer#",$footer,$message);
                                         
        //$objMail = new Mail();
        //$objMail->SendMail($email, $nama, 'Peminjaman berhasil', $message);	
        echo "<script> alert('Peminjaman berhasil'); </script>";
        echo '<script> window.location="dashboardUser.php?p"; </script>'; 				
      }
    }
  
  // elseif (isset($_GET['IDPeminjaman'])) {
  //   $objPeminjaman->IDPeminjaman = $_GET['IDPeminjaman'];
  //   $objPeminjaman->SelectOnePeminjaman();
  // }

?>

<div class="container">
  <div class="wrapper">
    <h2 class="Title">Form Penggunaan Ruangan</h2>
      <p>Silahkan isi data dibawah ini untuk meminjam ruangan sesuai keperluan</p>
        <?php 
          if($objPeminjaman->hasil)
          echo '<div class="alert alert-success" role="alert">
          Form peminjaman ruangan berhasil dikirim untuk persetujuan, cek email kamu untuk memantau persetujuan!
        </div>';
        ?>
        
        <div class="alert alert-warning" role="alert">
          Ada kolom yang salah atau belum kamu isi tuh!
        </div> 
          <form action="" method="POST">

            <div class="form-group">
                <label for="nama">Nama </label>
                <input type="text" class="form-control" id="nama" placeholder="<?php echo $_SESSION["nama"] ?>" value="<?php echo $_SESSION["nama"] ?>" readonly>
            </div>

            <div class="form-group">
                <label for="divisi">Pekerjaan</label>
                <input type="text" class="form-control" id="divisi" name="divisi" placeholder="<?php echo $_SESSION["role"] ?>" value="<?php echo $_SESSION["role"] ?>" readonly>
            </div>

            <div class="form-row form-group">
              <div class="col">
                  <label for="ruangan">Ruangan </label>
                  <input type="text" class="form-control" id="ruangan" name="ruangan" placeholder="<?php echo $objRuangan->namaRuangan; ?>" value="<?php echo $objRuangan->namaRuangan; ?>" readonly>
              </div>
              <div class="col">
                  <label for="lantai">Lantai </label>
                  <input type="text" class="form-control" id="lantai" name="lantai" placeholder="<?php echo $objRuangan->lantai ?>" value="<?php echo $objRuangan->lantai; ?>" readonly>
              </div>
            </div>

            <div class="form-row form-group">
              <div class="col">
                <label for="tglPinjam">Tanggal Pinjam:</label>
                <input type="date" class="form-control" id="tglPinjam" name="tglPinjam" value="<?php echo date('Y-m-d'); ?>" required>
              </div>
              <div class="col">
                <label for="tglSelesai">Tanggal Selesai:</label>
                <input type="date" class="form-control" id="tglSelesai" name="tglSelesai" value="<?php echo date('Y-m-d'); ?>" required>
              </div>
            </div>

            <div class="form-row form-group">
              <div class="col">
                <label for="jamPinjam">Jam Pinjam:</label>
                <input type="time" class="form-control" id="jamPinjam" name="jamPinjam"  required >
              </div>
              <div class="col">
                <label for="jamSelesaiPinjam">Jam Selesai:</label>
                <input type="time" class="form-control" id="selesaiPinjam" name="selesaiPinjam"  required>
              </div>
            </div>

            <div class="form-group">
                <label for="keperluan">Keperluan:</label>
                <textarea class="form-control" id="keperluan" name="keperluan" rows="3" style="height:100%" required></textarea>
            </div>

            <div class="form-group">
                <label for="tambahan">Tambahan:</label>
                <textarea class="form-control" id="tambahan" name="tambahan" rows="3" style="height:100%" required></textarea>
            </div>



            <input type="submit" name="btnSubmit" class="btn btn-primary btn-block" value="Submit">
            <a href="index.php?p=pilihRuangan" class="btn btn-light btn-block">Cancel</a>
    </form>
    
  </div>
</div>