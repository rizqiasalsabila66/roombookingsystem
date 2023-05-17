<?php

class Instansi extends Connection{
    public $IDInstansi = '';
    public $kainstansi = '';
    public $namaInstansi = '';

    public $hasil = false;
    public $message = '';

    public function AddInstansi(){
        $this->connect();
        $sql = "INSERT INTO instansi (alamat_instansi, namaInstansi)
                VALUES ('$this->alamat_instansi','$this->namaInstansi')";

        $this->hasil = mysqli_query($this->connection, $sql);
        

        if($this->hasil)
            $this->message = 'Data berhasil ditambahkan';
        else
            $this->message = 'Data gagal ditambahkan';
            
    }

    public function UpdateInstansi(){
        $this->connect();
        $sql = "UPDATE instansi
                SET alamat_instansi = '$this->alamat_instansi',
                    namaInstansi = '$this->namaInstansi'
                WHERE IDInstansi = '$this->IDInstansi'";
        
        $this->hasil = mysqli_query($this->connection, $sql);

        if($this->hasil)
            $this->message = 'Data berhasil diubah';
        else
            $this->message = 'Data gagal diubah';
            echo $sql;
    }

    public function DeleteInstansi(){
        $this->connect();
        $sql = "DELETE FROM instansi WHERE IDInstansi = '$this->IDInstansi'";
        $this->hasil = mysqli_query($this->connection, $sql);

        if($this->hasil)
            $this->message = 'Data berhasil dihapus';
        else
            $this->message = 'Data gagal dihapus';
    }


    public function SelectAllInstansi(){
        $this->connect();
        $sql = "SELECT * FROM instansi";
        $result = mysqli_query($this->connection, $sql);

        $arrResult = Array();
        $count=0;
        
            while ($data = mysqli_fetch_array($result)){
                $objInstansi = new Instansi();
                $objInstansi->IDInstansi=$data['IDInstansi'];
                $objInstansi->alamat_instansi=$data['alamat_instansi'];
                $objInstansi->namaInstansi=$data['namaInstansi'];
                $objInstansi->kainstansi=$data['kainstansi'];
                $arrResult[$count] = $objInstansi;
                $count++;
            }
        
        return $arrResult;
    }

    public function SelectOneInstansi(){
        $this->connect();
        $sql = "SELECT * FROM instansi WHERE IDInstansi='$this->IDInstansi'";
        $resultOne = mysqli_query($this->connection, $sql);

        if(mysqli_num_rows($resultOne) == 1){
            $this->hasil = true;
            $data = mysqli_fetch_assoc($resultOne);
            $this->alamat_instansi = $data['alamat_instansi'];
            $this->namaInstansi = $data['namaInstansi'];
        }
    }
}

?>