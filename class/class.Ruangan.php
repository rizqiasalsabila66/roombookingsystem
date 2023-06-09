<?php

class Ruangan extends Connection{
    public $IDRuangan = '';
    public $namaRuangan = '';
    public $lantai = '';
    public $kapasitas = '';
    public $ket_ruangan = '';
    public $fotoRuangan = '';
    

    public $hasil = false;
    public $message = '';

    public function AddRuangan(){
        
        $sql = "INSERT INTO ruangan (namaRuangan, lantai, kapasitas, ket_ruangan, fotoRuangan)
                VALUES ('$this->namaRuangan', '$this->lantai', '$this->kapasitas', '$this->ket_ruangan', '$this->fotoRuangan')";

        $this->hasil = mysqli_query($this->connection, $sql);
        

        if($this->hasil)
            $this->message = 'Data berhasil ditambahkan';
        else
            $this->message = 'Data gagal ditambahkan';
    }

    public function UpdateRuangan(){
        $this->connect();
        $sql = "UPDATE ruangan
                SET namaRuangan = '$this->namaRuangan',
                    lantai = '$this->lantai',
                    kapasitas = '$this->kapasitas',
                    ket_ruangan = '$this->ket_ruangan',
                   
                WHERE IDRuangan = '$this->IDRuangan'";
        
        $this->hasil = mysqli_query($this->connection, $sql);

        if($this->hasil)
            $this->message = 'Data berhasil diubah';
        else
            $this->message = 'Data gagal diubah';
    }

    public function DeleteRuangan(){
        $this->connect();
        $sql = "DELETE FROM ruangan WHERE IDRuangan = '$this->IDRuangan'";
        $this->hasil = mysqli_query($this->connection, $sql);

        if($this->hasil)
            $this->message = 'Data berhasil dihapus';
        else
            $this->message = 'Data gagal dihapus';
    }


    public function SelectAllRuangan(){
        $this->connect();
        $sql = "SELECT * FROM ruangan";
        $result = mysqli_query($this->connection, $sql);

        $arrResult = Array();
        $count=0;
        
            while ($data = mysqli_fetch_array($result)){
                $objRuangan = new Ruangan();
                $objRuangan->IDRuangan=$data['IDRuangan'];
                $objRuangan->namaRuangan=$data['namaRuangan'];
                $objRuangan->lantai=$data['lantai'];
                $objRuangan->kapasitas=$data['kapasitas'];
                $objRuangan->ket_ruangan=$data['ket_ruangan'];
                $objRuangan->fotoRuangan=$data['fotoRuangan'];
               
                $arrResult[$count] = $objRuangan;
                $count++;
            }
        
        return $arrResult;
    }

    public function SelectOneRuangan(){
        $this->connect();
        $sql = "SELECT * FROM ruangan WHERE IDRuangan='$this->IDRuangan'";
        $resultOne = mysqli_query($this->connection, $sql);

        if(mysqli_num_rows($resultOne) == 1){
            $this->hasil = true;
            $data = mysqli_fetch_assoc($resultOne);
            $this->namaRuangan = $data['namaRuangan'];
            $this->lantai = $data['lantai'];
            $this->kapasitas = $data['kapasitas'];
            $this->ket_ruangan = $data['ket_ruangan'];
            
        }
    }
}

?>