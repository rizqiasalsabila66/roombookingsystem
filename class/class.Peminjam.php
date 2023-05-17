<?php


    class Peminjam extends Connection{
        public $UserID = 0;
        public $NIM = '';
        public $NIDN = '';
        public $IDInstansi = '';
        public $instansi = '';

        public $hasil = false;
        public $message = '';

        
        public function AddPeminjam($IDPeminjam){
            $this->connect();

            $sql = "INSERT INTO peminjam (UserID, IDInstansi)
                    VALUES ($IDPeminjam, '$this->IDInstansi')";

            $this->hasil = mysqli_query($this->connection, $sql);

            if($this->hasil)
                $this->message = 'Data berhasil ditambahkan';
                
            else
                $this->message = 'Data gagal ditambahkan';
        }

        public function UpdatePeminjam(){
            $this->connect();
            $sql = "UPDATE peminjam
                    SET IDInstansi = '$this->IDInstansi'
                    WHERE UserID = '$this->UserID'";
            
            $this->hasil = mysqli_query($this->connection, $sql);

            if($this->hasil)
                $this->message = 'Data berhasil diubah';
            else
                $this->message = 'Data gagal diubah';
        }

        public function DeletePeminjam(){
            $this->connect();
            $sql = "DELETE FROM peminjam WHERE UserID = '$this->UserID'";
            $this->hasil = mysqli_query($this->connection, $sql);

            if($this->hasil)
                $this->message = 'Data berhasil dihapus';
            else
                $this->message = 'Data gagal dihapus';
        }

        public function SelectOnePeminjam(){
            $this->connect();
            $sql = "SELECT * FROM peminjam WHERE UserID='$this->UserID'";
            $resultOne = mysqli_query($this->connection, $sql);
    
            if(mysqli_num_rows($resultOne) == 1){
                $this->hasil = true;
                $data = mysqli_fetch_assoc($resultOne);
                $this->IDInstansi = $data['IDInstansi'];
            }
        }

        public function SelectAllPeminjam(){
            $this->connect();
            $sql = "SELECT * FROM peminjam";
            $result = mysqli_query($this->connection, $sql);
            $arrResult = Array();
            $count = 0;

            if (mysqli_num_rows($result) > 0) {
                while($data = mysqli_fetch_array($result)){
                    $objPeminjam = new Peminjam();
                    $objPeminjam->UserID = $data['UserID'];
                    $arrResult[$count] = $objPeminjam;
                    $count++;
                }
            }
            return $arrResult;

        }
    }

?>