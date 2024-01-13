<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-edit"></i> Edit Kematian
        </h3>
    </div>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="card-body">
            <?php
            // Check if editing is requested and get the death record ID
            if (isset($_GET['kode']) && !empty($_GET['kode'])) {
                $death_id = $_GET['kode'];

                // Retrieve existing death record data based on ID
                $query_death = "SELECT * FROM tb_kematian JOIN tb_umat ON tb_kematian.id_umat = tb_umat.id_umat JOIN tb_lingkungan ON tb_umat.id_lingkungan = tb_lingkungan.id_lingkungan WHERE tb_kematian.id = '$death_id'";
                $result_death = mysqli_query($koneksi, $query_death);

                if ($row_death = mysqli_fetch_array($result_death)) {
                    // Populate form fields with existing data
                    $nik = $row_death['nik'];
                    // ... Populate other fields accordingly
            ?>
                    <!-- Add an input for the death record ID to identify the record to edit -->
                    <input type="hidden" name="death_id" value="<?php echo $death_id; ?>">



                    <!-- Existing code for NIK, search button, and other fields -->
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tanggal Kematian</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" id="tgl_kematian" name="tgl_kematian" value="<?php echo $row_death['tgl_kematian']; ?>" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tempat Kematian</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="tempat_kematian" name="tempat_kematian" value="<?php echo $row_death['tempat']; ?>" placeholder="Tempat Kematian" required>
                        </div>
                    </div>
            <?php
                }
            }
            ?>
        </div>
        <div class="card-footer">
            <!-- Change the submit button value to "Update" -->
            <input type="submit" name="UpdateKematian" value="Update" class="btn btn-info">
            <a href="?page=data-kematian" title="Kembali" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</div>

<?php
// Handle the update operation
if (isset($_POST['UpdateKematian'])) {
    $death_id = $_POST['death_id'];
    $tgl_kematian = $_POST['tgl_kematian'];
    $tempat_kematian = $_POST['tempat_kematian'];

    // Update tb_kematian
    $sql_update_kematian = "UPDATE tb_kematian SET 
        tgl_kematian = '$tgl_kematian',
        tempat = '$tempat_kematian'
        WHERE id = '$death_id'";

    $query_update_kematian = mysqli_query($koneksi, $sql_update_kematian);

    if ($query_update_kematian) {
        echo "<script>
            Swal.fire({
                title: 'Update Data Kematian Berhasil',
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
                title: 'Update Data Kematian Gagal',
                text: '',
                icon: 'error',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.value){
                    window.location = 'index.php?page=edit-kematian&edit=$death_id';
                }
            })
        </script>";
    }
}
?>