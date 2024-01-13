<?php
ob_start();
error_reporting(E_ALL & ~E_NOTICE);
include "../inc/koneksi.php";
if (isset($_POST['Cetak'])) {
    $tanggal = $_POST['tanggal'];
    $query = mysqli_query($koneksi, "SELECT*FROM tb_absensi_umat WHERE tanggal = '$tanggal'");
    $data = mysqli_fetch_assoc($query);

    $tanggal = $data['tanggal'];

    $sql_cek18 = "SELECT * FROM tb_pengaturan";
    $query_cek18 = mysqli_query($koneksi, $sql_cek18);
    $data_cek18 = mysqli_fetch_array($query_cek18, MYSQLI_BOTH);
}
$satu_hari        = mktime(0, 0, 0, date("n"), date("j"), date("Y"));

function tglIndonesia($str)
{
    $tr   = trim($str);
    $str    = str_replace(array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'), array('Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'), $tr);
    return $str;
}

?>
<html>

<head>
    <title>Print PDF</title>
    <style>
        table {
            border-collapse: collapse;
            table-layout: fixed;
            width: 100%;
            text-align: center;
        }

        table td {
            word-wrap: break-word;
            width: 20%;
            padding: 5px;
        }

        table th {
            padding: 5px;
        }
    </style>

</head>

<body>
    <script>
        window.print();
    </script>
    <div>
        <div style="font-size: 20px;" align="center"><?php echo $data_cek18["nama_web"]; ?></div>
        <div style="font-size: 12px;" align="center"><?php echo $data_cek18["alamat_gereja"]; ?>,
            <?php echo $data_cek18["kecamatan_gereja"]; ?>, <?php echo $data_cek18["kelurahan_gereja"]; ?>,
            <?php echo $data_cek18["kabupaten_gereja"]; ?>, <?php echo $data_cek18["provinsi_gereja"]; ?></div>
        <div style="font-size: 12px;" align="center">Email: <?php echo $data_cek18["email_gereja"]; ?> Telp.
            <?php echo $data_cek18["no_hp"]; ?></div>
    </div>
    <hr class="sidebar-divider" style="border:0.5px solid black;margin:10px 5px 10px 5px;">
    <b>Mutasi pada: <?= date('d-m-Y', strtotime($data['tanggal'])); ?></b><br /><br />

    <table border="1">
        <tr>
            <th>No.</th>
            <th>Nama </th>
            <th>Kehadiran </th>
            <th>Tanggal</th>
            <th>Jam Masuk</th>
            <th>Jam Keluar</th>
        </tr>
        <?php
        $sql_tampil = "SELECT * FROM tb_absensi_umat where tanggal = '$tanggal'";
        $query_tampil = mysqli_query($koneksi, $sql_tampil);
        $no = 1;
        while ($data = mysqli_fetch_array($query_tampil, MYSQLI_BOTH)) {
        ?>
            <tr>
                <td style="text-align: center;"><?= $no++; ?></td>
                <td style="text-align: center;"><?= $data['nama']; ?></td>
                <td style="text-align: center;"><?= $data['status_absensi']; ?></td>
                <td style="text-align: center;"><?= date('d-m-Y', strtotime($data['tanggal'])); ?></td>
                <td style="text-align: center;"><?= $data['jam_masuk']; ?></td>
                <td style="text-align: center;"><?= $data['jam_keluar']; ?></td>
            </tr>
        <?php } ?>
    </table>

    <br><br><br>

    <?php $tgl = date('Y-m-d'); ?>
    <table width="100%">
        <tr>
            <td align="jusrt"></td>
            <td align="center" width="200px">
                Ende, <?php echo tglIndonesia(date('d F Y', strtotime($tgl))) ?>
                <br />Pastor Paroki<br /><br /><br /><br />
                <b><u><?php echo $data_cek18["pastor_paroki"]; ?></u><br /></b>
            </td>
        </tr>
    </table>

</body>

</html>
<?php
error_reporting(0);
$html = ob_get_contents();
require __DIR__ . '/html2pdf/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;

$html2pdf = new Html2Pdf();
$html2pdf->WriteHTML($html);
$html2pdf->Output('Data Umat PerLingkungan.pdf', 'D');
