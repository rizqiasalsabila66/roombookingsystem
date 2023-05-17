<div class="container">
    <div class="wrapper">
        <div class="Title"> 
            <div class="navbar ">
                <h2><i class="fas fa-calendar-alt"></i> Arsip Peminjaman</h2>
                
            </div>
            <!-- Daftar Peminjaman Ruangan-->
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Peminjam</th>
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
                    $arrayPeminjaman = $objPeminjaman->SelectAllPeminjaman();

                    if(count($arrayPeminjaman) == 0){
                        echo '<tr><td colspan="8" style="text-align: center;"><i class="fas fa-calendar-times"></i>Tidak ada data!</td></tr>';
                    } else{
                        $objPeminjaman->IDPeminjaman;
                        foreach ($arrayPeminjaman as $dataPeminjaman) {
                            echo '<tr>';
                            
                            if ($dataPeminjaman->persetujuan === 'Disetujui'||$dataPeminjaman->persetujuan === 'Tidak disetujui') {
                            echo '<td>'.$dataPeminjaman->user->nama.'</td>';
                            echo '<td>'.$dataPeminjaman->ruangan->namaRuangan.'</td>';
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
                             }
                             
                            echo '</tr>';
                        }
                    }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>  