<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-edit"></i> Form Edit Absensi
        </h3>
    </div>
    <div class="row">
        <div class="col-md-8">
            <form action="" method="post">
                <?php
                if (isset($_GET['kode']) && !empty($_GET['kode'])) {
                    $id = $_GET['kode'];


                    // Retrieve existing death record data based on ID
                    $query = "SELECT * FROM tb_absensi_umat where id_absensi ='$id'";
                    $result = mysqli_query($koneksi, $query);

                    if ($row = mysqli_fetch_array($result)) {
                        // Populate form fields with existing data
                        $nik = $row['nama'];
                        // ... Populate other fields accordingly
                ?>
                        <input type="hidden" name="id_absensi" value="<?php echo $row['id_absensi'] ?>">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Nama </label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="nama" value="<?= $row['nama']; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Status Kehadiran</label>
                                <div class="col-sm-6">
                                    <select name="status_absensi" id="" class="form-control">
                                        <option value="<?= $row['status_absensi']; ?>"><?= $row['status_absensi']; ?></option>
                                        <option value="hadir">hadir</option>
                                        <option value="izin">izin</option>
                                        <option value="sakit">sakit</option>
                                        <option value="alpa">alpa</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Tanggal</label>
                                <div class="col-sm-6">
                                    <input type="date" class="form-control" id="tanggal" name="tanggal" placeholder="tanggal" value="<?= $row['tanggal']; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Jam Masuk</label>
                                <div class="col-sm-4">
                                    <input type="time" class="form-control" id="time" name="jam_masuk" placeholder="Jam masuk" value="<?= $row['jam_masuk']; ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Jam keluar</label>
                                <div class="col-sm-4">
                                    <input type="time" class="form-control" id="time" name="jam_keluar" placeholder="Jam keluar" value="<?= $row['jam_keluar']; ?>">
                                </div>
                            </div>
                    <?php
                    }
                }
                    ?>
                        </div>
                        <div class="card-footer">
                            <input type="submit" name="Simpan" value="Simpan" class="btn btn-info">
                            <a href="?page=data-absensi" title="Kembali" class="btn btn-secondary">Batal</a>
                        </div>
            </form>

        </div>
        <div class="col-md-4 mt-4">
            <h1>Clock</h1>
            <h3 id="jam"></h3>
        </div>
    </div>
</div>
<?php

if (isset($_POST['Simpan'])) {
    $id_absensi = $_POST['id_absensi'];
    $nama = $_POST['nama'];
    $status_absensi = $_POST['status_absensi'];
    $tanggal = $_POST['tanggal'];
    $jam_masuk = $_POST['jam_masuk'];
    $jam_keluar = $_POST['jam_keluar'];

    // Periksa koneksi
    $koneksi = mysqli_connect("localhost", "root", "", "sigereja");
    if (!$koneksi) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Lakukan query untuk menyisipkan data ke dalam tabel
    $query = "UPDATE tb_absensi_umat SET nama='$nama', status_absensi='$status_absensi', tanggal='$tanggal', jam_masuk='$jam_masuk', jam_keluar='$jam_keluar' WHERE id_absensi=$id_absensi";


    // Eksekusi query
    $update = mysqli_query($koneksi, $query);

    // Periksa apakah query berhasil dijalankan
    if ($update) {
        echo "<script>
                Swal.fire({
                    title: 'update Data Berhasil',
                    text: '',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value){
                        window.location = 'index.php?page=data-absensi';
                    }
                })
            </script>";
    } else {
        echo "<script>
                Swal.fire({
                    title: 'update Data Gagal',
                    text: '',
                    icon: 'error',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value){
                        window.location = 'index.php?page=edit-absensi';
                    }
                })
            </script>";
    }
}

?>

<script>
    function updateJam() {
        var now = new Date();

        // Tampilkan jam
        var jam = now.getHours();
        var menit = now.getMinutes();
        var detik = now.getSeconds();
        jam = jam < 10 ? '0' + jam : jam;
        menit = menit < 10 ? '0' + menit : menit;
        detik = detik < 10 ? '0' + detik : detik;
        var waktu = jam + ':' + menit + ':' + detik;
        document.getElementById('jam').innerText = waktu;


        setTimeout(updateJam, 1000); // Perbarui setiap 1 detik
    }

    // Panggil fungsi untuk pertama kali
    updateJam();
</script>