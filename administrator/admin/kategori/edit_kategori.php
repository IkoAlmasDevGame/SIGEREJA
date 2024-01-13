<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-edit"></i> Form Edit Data Kategori
        </h3>
    </div>
    <form action="" method="post" enctype="multipart/form-data">
        <?php
        if (isset($_GET['kode']) && !empty($_GET['kode'])) {
            $id = $_GET['kode'];


            // Retrieve existing death record data based on ID
            $query = "SELECT * FROM tb_kategorial where id_kategorial ='$id'";
            $result = mysqli_query($koneksi, $query);

            if ($data = mysqli_fetch_array($result)) {
                // var_dump($row);
        ?>
        <input type="hidden" name="id_kategorial" value="<?php echo $data['id_kategorial'] ?>">


        <div class="card-body">

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nama kategori</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="kategori" placeholder="Nama kategori" required
                        value="<?= $data['kategori']; ?>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Pilih ketua kategori</label>
                <div class="col-sm-6">
                    <select class="form-control" name="ketua" id="" required>
                        <option value="<?= $data['ketua']; ?>"><?= $data['ketua']; ?></option>
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
                <label class="col-sm-2 col-form-label">Pilih wakil ketua kategori</label>
                <div class="col-sm-6">
                    <select class="form-control" name="wakil_ketua" id="" required>

                        <?php
                                // ambil data dari database
                                $query = "SELECT * FROM tb_kategorial where id_kategorial ='$id'";
                                $hasil = mysqli_query($koneksi, $query);
                                while ($data = mysqli_fetch_array($hasil)) {
                                ?>
                        <option value="<?= $data['wakil_ketua']; ?>"><?= $data['wakil_ketua']; ?></option>
                        <?php
                                }
                                ?>
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
                <label class="col-sm-2 col-form-label">jumlah KK</label>
                <div class="col-sm-6">
                    <?php
                            $query = "SELECT * FROM tb_kategorial where id_kategorial ='$id'";
                            $result = mysqli_query($koneksi, $query);

                            if ($data = mysqli_fetch_array($result)) {
                                // var_dump($row);
                            ?>
                    <input type="number" class="form-control" name="jumlah_kk" placeholder="jumlah KK" required
                        value="<?= $data['jumlah_kk']; ?>">
                    <?php }; ?>
                </div>
            </div>
            <?php
            }
        }
            ?>
        </div>
        <div class="card-footer">
            <input type="submit" name="Simpan" value="Simpan" class="btn btn-info">
            <a href="?page=data-kategori" title="Kembali" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</div>

<?php

if (isset($_POST['Simpan'])) {
    $id_kategorial = $_POST['id_kategorial'];
    $kategori = $_POST['kategori'];
    $ketua = $_POST['ketua'];
    $wakil_ketua = $_POST['wakil_ketua'];
    $jumlah_kk = $_POST['jumlah_kk'];


    // Periksa koneksi
    $koneksi = mysqli_connect("localhost", "root", "", "sigereja");
    if (!$koneksi) {
        die("Connection failed: " . mysqli_connect_error());
    }

    //mulai proses simpan data
    $sql_update = "UPDATE tb_kategorial SET kategori='$kategori',ketua='$ketua', wakil_ketua='$wakil_ketua', jumlah_kk='$jumlah_kk' where id_kategorial ='$id_kategorial'";


    $query_update = mysqli_query($koneksi, $sql_update);
    mysqli_close($koneksi);

    if ($query_update) {
        echo "<script>
      Swal.fire({title: 'Tambah Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
      }).then((result) => {if (result.value){
          window.location = 'index.php?page=data-kategori';
          }
      })</script>";
    } else {
        echo "<script>
      Swal.fire({title: 'Tambah Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
      }).then((result) => {if (result.value){
          window.location = 'index.php?page=add-kategori';
          }
      })</script>";
    }
}