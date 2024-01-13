<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-edit"></i> Form Absensi
        </h3>
    </div>
    <div class="row">
        <div class="col-md-8">
            <form action="" method="post" enctype="multipart/form-data">
                <div class="card-body">

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Nama </label>
                        <div class="col-sm-6">
                            <select class="form-control" name="nama" id="" required>
                                <option disabled selected> -- Nama -- </option>
                                <?php
                                // ambil data dari database
                                $query = "select * from tb_umat where status_umat='Ada'";
                                $hasil = mysqli_query($koneksi, $query);
                                while ($row = mysqli_fetch_array($hasil)) {
                                ?>
                                    <option value="<?php echo $row['nama_umat'] ?>">
                                        <?php echo $row['nik'] ?>
                                        -
                                        <?php echo $row['nama_umat'] ?>
                                    </option>
                                <?php
                                }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Status Kehadiran</label>
                        <div class="col-sm-6">
                            <select name="status_absensi" id="" class="form-control" required>
                                <option disabled selected> -- Satus kehadiran -- </option>
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
                            <input type="date" class="form-control" id="tanggal" name="tanggal" placeholder="tanggal" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Jam Masuk</label>
                        <div class="col-sm-4">
                            <input type="time" class="form-control" id="time" name="jam_masuk" placeholder="Jam masuk" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Jam keluar</label>
                        <div class="col-sm-4">
                            <input type="time" class="form-control" id="time" name="jam_keluar" placeholder="Jam keluar" required>
                        </div>
                    </div>

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
    $query = "INSERT INTO tb_absensi_umat (nama, status_absensi, tanggal, jam_masuk, jam_keluar) VALUES ('$nama', '$status_absensi', '$tanggal', '$jam_masuk', '$jam_keluar')";

    // Eksekusi query
    $save = mysqli_query($koneksi, $query);

    // Periksa apakah query berhasil dijalankan
    if ($save) {
        echo "<script>
                Swal.fire({
                    title: 'Tambah Data Berhasil',
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
                    title: 'Tambah Data Gagal',
                    text: '',
                    icon: 'error',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value){
                        window.location = 'index.php?page=add-absensi';
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