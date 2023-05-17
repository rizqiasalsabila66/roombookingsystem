<div class="container">
    <div class="wrapper">
        <div class="Title"> 
            <div class="navbar ">
                <h2><i class="fas fa-university"></i> List Instansi</h2>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                    <?php
                        if ($_SESSION["role"] == 'Admin') {
                         echo '<a class="btn btn-primary mr-2"  href="dashboardAdmin.php?p=tambahInstansi" role="button"><i class="fas fa-plus"></i> Instansi</a>';
                        }
                    ?>
                    </li>
                </ul>
            </div>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">ID Instansi</th>
                        <th scope="col">Nama Instansi</th>
                        <th scope="col">Ketua Instansi</th>
                        <th scope="col">Alamat</th>
                        <?php
                            if ($_SESSION["role"] == 'Admin') { 
                                echo '<th scope="col">Action</th>';
                            }
                        ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        require_once('./class/class.Instansi.php');
                        $objInstansi = new Instansi();
                        $arrayResultInstansi = $objInstansi->SelectAllInstansi();

                        $no = 1;
                        if (count($arrayResultInstansi) === 0) {
                            echo '<tr><td colspan="3" style="text-align: center;">Tidak ada data!</td></tr>';
                        }else {
                            foreach($arrayResultInstansi as $dataInstansi){
                                echo '<tr>';
                                echo '<td>'.$no.'</td>';
                                echo '<td>'.$dataInstansi->IDInstansi.'</td>';
                                echo '<td>'.$dataInstansi->namaInstansi.'</td>';
                                echo '<td>'.$dataInstansi->kainstansi.'</td>';
                                echo '<td>'.$dataInstansi->alamat_instansi.'</td>';
                                if ($_SESSION["role"] == 'Admin') { 
                                echo '<td><a class="btn btn-warning" href="dashboardAdmin.php?p=tambahInstansi&IDInstansi='.$dataInstansi->IDInstansi.'"><i class="fas fa-edit"></i> Edit</a> <a class="btn btn-danger" href="dashboardAdmin.php?p=deleteInstansi&IDInstansi='.$dataInstansi->IDInstansi.'" onclick="return confirm(\'Apakah anda yakin ingin mengahapus?\')"><i class="fas fa-trash"></i> Delete</a></td>';
                                }
                                echo '</tr>';
                                $no++;
                            }
                        }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>            