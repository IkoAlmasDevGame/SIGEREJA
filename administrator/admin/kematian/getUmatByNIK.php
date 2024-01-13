<?php

//Mulai Sesion
session_start();
if (isset($_SESSION["ses_username"]) == "")
{
	header("location: login.hophp");
}
else
{
	$data_id = $_SESSION["ses_id"];
	$data_nama = $_SESSION["ses_nama"];
	$data_user = $_SESSION["ses_username"];
	$data_level = $_SESSION["ses_level"];
}

//Koneksi database
$koneksi = new mysqli ("localhost","root","","sigereja");

//query untuk tabel pesan ata mengambil jumlah pesan pada tabel pesan
$sql = $koneksi->query("SELECT COUNT(id_pesan) as pesan  from tb_pesan");
while ($data = $sql->fetch_assoc())
{
	$pesan = $data['pesan'];
}
 
if (isset($_POST['nik'])) {
    $nik = $_POST['nik'];
    $query_umat_nik = "SELECT tb_umat.id_umat, tb_umat.nama_umat, tb_umat.nik, tb_lingkungan.nama_lingkungan FROM tb_umat JOIN tb_lingkungan ON tb_umat.id_lingkungan = tb_lingkungan.id_lingkungan WHERE tb_umat.nik = '$nik' LIMIT 1";
    $result_umat_nik = mysqli_query($koneksi, $query_umat_nik);

    if ($row_umat_nik = mysqli_fetch_assoc($result_umat_nik)) {
        // Return umat data as JSON
        echo json_encode($row_umat_nik);
    } else {
        $message = [
            "status" => "error",
            "message" => "Umat tidak ditemukan"
        ];
    
        // Umat not found
        echo json_encode($message);
    }
} else {
    // Invalid request
    echo json_encode("Invalid request : " . $_GET['nik']);
}
?>