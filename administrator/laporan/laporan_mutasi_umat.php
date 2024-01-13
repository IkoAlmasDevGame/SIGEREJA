<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-file"></i> Cetak Mutasi Masuk dan Keluar Umat
        </h3>
    </div>
</div>

<div class="row">

    <div class="col border mr-2">

        <form action="./report/cetak_mutasi_In_out.php" method="post">
            <center><label class="text-center">Mutasi Masuk dan Keluar</label></center>

            <div class="card-body">
                <div class="form-group row">
                    <div class="col">
                        <h6 for="tanggal">Pilih tanggal </h6>
                        <input type="date" class="form-control" id="tanggal" name="tanggal" required>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <input target="_blank" type="submit" name="Cetak" value="Cetak" class="btn btn-info"></input>
                <a class="btn btn-warning" href="?page=data-absensi">Batal</a>
            </div>
    </div>
    </form>
</div>
<span class="mt-2 bold"><i><b><small>*Data yang tersedia pada tanggal :</small></b></i></span>
<?php
$sql = $koneksi->query("SELECT * from tb_absensi_umat");
while ($data = $sql->fetch_assoc()) {
?>
    <tr>
        <td>
            <ul>
                <li><small><?= $data['tanggal']; ?></small></li>
            </ul>
        </td>
    </tr>

<?php } ?>
</div>