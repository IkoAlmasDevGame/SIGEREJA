<div class="card card-info">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-table"></i> Data Pindah
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div class="card-header-form">
            <a href="" data-target="#tambah" data-toggle="modal" title="tambah" class="btn btn-success btn-sm">
                <i class="fa fa-plus"></i>
                Tambah Data Pindah
            </a>
            <div class="modal fade" id="tambah" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Tambah Pindah</h3>
                            <button class="btn btn-default bg-transparent" type="button" data-dismiss="modal">
                                <span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <?php
                                    if (isset ($_POST['add'])){
                                            $sql_ubah = "INSERT tb_pindah SET 
                                            ketua = '".$_POST['ketua']."',
                                            id_kub = '".$_POST['id_kub']."',
                                            id_lingkungan = '".$_POST['id_lingkungan']."'";
                                            $query_add = mysqli_query($koneksi, $sql_ubah);
                                            $query_ubah = mysqli_query($koneksi, "UPDATE tb_kub SET id_lingkungan ='$_POST[id_lingkungan]', ketua='$_POST[ketua]' WHERE id_kub='$_POST[id_kub]'");
                                            mysqli_close($koneksi);
                                        
                                    if ($query_add && $query_ubah) {
                                        echo "<script>
                                              Swal.fire({title: 'Ubah Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
                                              }).then((result) => {if (result.value)
                                                {window.location = 'index.php?page=data-pindah';
                                                }
                                              })</script>";
                                              }else{
                                              echo "<script>
                                              Swal.fire({title: 'Ubah Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
                                              }).then((result) => {if (result.value)
                                                {window.location = 'index.php?page=data-pindah';
                                                }
                                              })
                                        </script>";
                                        }
                                    }
                                ?>
                                <table class="table table-striped">
                                    <tr>
                                        <div class="form-group row">
                                            <td>nama kub</td>
                                            <td>
                                                <div class="col-sm-8">
                                                    <select name="id_kub" id="nama_kub" class="form-control">
                                                        <option value="" disabled selected>- Pilih Kub -</option>
                                                        <?php
                                        // ambil data dari database
                                        $query = "select * from tb_kub";
                                        $hasil = mysqli_query($koneksi, $query);
                                        foreach ($hasil as $row) {
                                            # code...
                                        ?>
                                                        <option value="<?php echo $row['id_kub'] ?>">
                                                            <?php echo $row['nama_kub'] ?>
                                                        </option>
                                                        <?php
                                        }
                                        ?>
                                                    </select>
                                                </div>
                                            </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <div class="form-group row">
                                            <td>nama Lingkungan</td>
                                            <td>
                                                <div class="col-sm-8">
                                                    <select name="id_lingkungan" id="nama_lingkungan"
                                                        class="form-control">
                                                        <option value="" disabled selected>- Pilih Lingkungan -</option>
                                                        <?php
                                                // ambil data dari database
                                                $query = "select * from tb_lingkungan";
                                                $hasil = mysqli_query($koneksi, $query);
                                                foreach ($hasil as $row) {
                                                    # code...
                                                ?>
                                                        <option value="<?php echo $row['id_lingkungan'] ?>">
                                                            <?php echo $row['nama_lingkungan'] ?>
                                                        </option>
                                                        <?php
                                                }
                                                ?>
                                                    </select>
                                                </div>
                                            </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <div class="form-group row">
                                            <td>Nama Umat</td>
                                            <td>
                                                <div class="col-sm-8">
                                                    <select name="ketua" id="ketua" class="form-control">
                                                        <option value="" disabled selected>- Pilih Nama Umat -</option>
                                                        <?php
                                        // ambil data dari database
                                        $query = "select * from tb_umat where status_umat='Ada'";
                                        $hasil = mysqli_query($koneksi, $query);
                                        foreach ($hasil as $row) {
                                            # code...
                                        ?>
                                                        <option value="<?php echo $row['id_umat'] ?>">
                                                            <?php echo $row['nik'] ?>
                                                            -
                                                            <?php echo $row['nama_umat'] ?>
                                                        </option>
                                                        <?php
                                        }
                                        ?>
                                                    </select>
                                                </div>
                                            </td>
                                        </div>
                                    </tr>
                                </table>
                                <div class="modal-footer">
                                    <input type="submit" name="add" value="Simpan" class="btn btn-success">
                                    <button class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="table-responsive">
        <br>
        <table id="example1" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Lingkungan</th>
                    <th>Nama Kub</th>
                    <th>Nama Umat</th>
                </tr>
            </thead>
            <tbody>

                <?php
                    $no = 1;
			        $sql = $koneksi->query("SELECT tb_pindah.*, tb_lingkungan.*, tb_umat.*,  tb_kub.* from tb_pindah inner join tb_lingkungan on tb_pindah.id_lingkungan = tb_lingkungan.id_lingkungan inner join tb_kub on tb_pindah.id_kub = tb_kub.id_kub inner join tb_umat on tb_pindah.ketua = tb_umat.id_umat");
                    foreach ($sql as $data) {
                    ?>
                <tr>
                    <td>
                        <?php echo $no++; ?>
                    </td>
                    <td>
                        <?php echo $data['nama_lingkungan']; ?>
                    </td>
                    <td>
                        <?php echo $data['nama_kub']; ?>
                    </td>
                    <td>
                        <?php echo $data['nama_umat']; ?>
                    </td>
                </tr>

                <?php
              }
            ?>
            </tbody>
        </table>
    </div>
</div>
<!-- /.card-body -->
