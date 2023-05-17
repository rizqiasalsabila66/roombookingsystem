<div class="container">
    <div class="wrapper">
        <div class="Title"> 
            <div class="navbar">
                <h2><i class="fas fa-calendar-alt"></i> Peminjaman </h2>
            </div>
            <!-- Daftar Ruangan Yang Bisa Dipinjam -->
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Ruangan</th>
                        <th scope="col">Tanggal Pinjam</th>
                        <th scope="col">Tanggal Selesai</th>
                        <th scope="col">Jam Pinjam</th>
                        <th scope="col">Jam Selesai</th>
                        <th scope="col">Persetujuan</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        require_once('./class/class.Peminjaman.php');
                        $objPeminjaman = new Peminjaman_Ruangan();
                        $arrayPeminjaman = $objPeminjaman->SelectAllPeminjamanUser();

                        if(count($arrayPeminjaman) == 0){
                            echo '<tr><td colspan="6" class="justify-content-center align-items-center"><i class="fas fa-calendar-times"></i>Tidak ada data!</td></tr>';
                        } else{
                            foreach ($arrayPeminjaman as $dataPeminjaman) {
                                if ($_SESSION["UserID"] == $dataPeminjaman->UserID) {
                                    echo '<tr>';
                                    echo '<td style="white-space: nowrap; overflow: hidden; width: 70px; text-overflow: ellipsis; table-layout: fixed">'.$dataPeminjaman->ruangan->namaRuangan.'</td>';
                                    echo '<td>'.$dataPeminjaman->tglPinjam.'</td>';
                                    echo '<td>'.$dataPeminjaman->tglSelesai.'</td>';
                                    echo '<td>'.$dataPeminjaman->jamPinjam.'</td>';
                                    echo '<td>'.$dataPeminjaman->jamSelesai.'</td>';
                                    echo '<td ';
                                    if ($dataPeminjaman->persetujuan === 'Disetujui') {
                                        echo 'class="alert alert-success" role="alert"><strong>'.$dataPeminjaman->persetujuan;
                                    } elseif ($dataPeminjaman->persetujuan === 'Tidak disetujui') {
                                        echo 'class="alert alert-danger" role="alert"><strong>'.$dataPeminjaman->persetujuan;
                                    } 
                                    echo '</strong></td>';
                                    echo '</tr>';
                                } //else {
                                    //echo '<tr><td colspan="6" style="text-align: center;"> Kamu belum meminjam ruangan! </td></tr>';
                                //}
                                
                            }
                        }
                    ?>
                </tbody>
            </table>
    </div>
</div>            