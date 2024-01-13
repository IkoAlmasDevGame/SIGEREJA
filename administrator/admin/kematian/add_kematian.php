<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-edit"></i> Tambah Kematian
        </h3>
    </div>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="card-body">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">NIK</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nik" name="nik" placeholder="Nomor Induk Kependudukan" required>
                </div>
            </div>

            <!-- Add a search button -->
            <div class="form-group row">
                <div class="col-sm-6 offset-sm-2">
                    <button type="button" class="btn btn-primary"  onclick="searchUmatByNIK()">Cari</button>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nama Umat</label>
                <div class="col-sm-6">
                    <input readonly type="text" class="form-control" id="nama_umat" name="nama_umat" placeholder="Nama umat" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Lingkungan</label>
                <div class="col-sm-6">
                    <input readonly type="text" class="form-control" id="lingkungan" name="lingkungan" placeholder="Lingkungan" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Tanggal Kematian</label>
                <div class="col-sm-6">
                    <input type="date" class="form-control" id="tgl_kematian" name="tgl_kematian" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Tempat Kematian</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="tempat_kematian" name="tempat_kematian" placeholder="Tempat Kematian" required>
                </div>
            </div>

        </div>
        <div class="card-footer">
            <input type="submit" name="SimpanKematian" value="Simpan" class="btn btn-info">
            <a href="?page=data-kematian" title="Kembali" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</div>



<?php
if (isset($_POST['SimpanKematian'])) {
    // Get umat data based on provided nama_umat
    $nama_umat = $_POST['nama_umat'];
    $query_umat = "SELECT * FROM tb_umat WHERE nama_umat = '$nama_umat' LIMIT 1";
    $result_umat = mysqli_query($koneksi, $query_umat);

    if ($row_umat = mysqli_fetch_array($result_umat)) {
        // Found umat, proceed to insert death record
        $id_umat = $row_umat['id_umat'];
        $tgl_kematian = $_POST['tgl_kematian'];
        $tempat_kematian = $_POST['tempat_kematian'];

        // Insert into tb_kematian
        $sql_simpan_kematian = "INSERT INTO tb_kematian (id_umat, tgl_kematian, tempat) VALUES (
            '$id_umat',
            '$tgl_kematian',
            '$tempat_kematian'
        )";
        $query_simpan_kematian = mysqli_query($koneksi, $sql_simpan_kematian);

        if ($query_simpan_kematian) {
            echo "<script>
                Swal.fire({
                    title: 'Tambah Data Kematian Berhasil',
                    text: '',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value){
                        window.location = 'index.php?page=data-kematian';
                    }
                })
            </script>";
        } else {
            echo "<script>
                Swal.fire({
                    title: 'Tambah Data Kematian Gagal',
                    text: '',
                    icon: 'error',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value){
                        window.location = 'index.php?page=add-kematian';
                    }
                })
            </script>";
        }
    } else {
        echo "<script>
            Swal.fire({
                title: 'Umat tidak ditemukan',
                text: 'Pastikan nama umat sudah benar',
                icon: 'error',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.value){
                    window.location = 'index.php?page=add-kematian';
                }
            })
        </script>";
    }
}
?>