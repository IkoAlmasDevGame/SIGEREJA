<?php 
if(isset($_GET["kode"])){
    $kode = $_GET["kode"];
    $row = $koneksi->query("SELECT * FROM tb_umat WHERE id_umat='$kode'");
    $data_cek = $row->fetch_array();
}
?>
<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-users"></i> Anggota Kartu Keluarga
        </h3>
    </div>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="card-body">


            <input type='hidden' class="form-control" id="id_umat" name="id_umat"
                value="<?php echo $data_cek['id_umat']; ?>" readonly />

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">No Kartu Keluarga</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="no_kk" name="no_kk"
                        value="<?php echo $data_cek['no_kk']; ?>" readonly />
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="nama_umat" name="nama_umat"
                        value="<?php echo $data_cek['nama_umat']; ?>" readonly />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Alamat</label>
                <div class="col-sm-8">
                    <?php if ($data_cek['kab'] != "Belum ada Desa/Kelurahan")
					{ ?>
                    <input type="text" class="form-control"
                        value="<?php echo $data_cek['alamat']; ?>, RT <?php echo $data_cek['rt']; ?> RW <?php echo $data_cek['rw']; ?> (<?php echo $data_cek['kec']; ?> - <?php echo $data_cek['kab']; ?>)"
                        readonly />
                    <?php }
					else
					{ ?>
                    <input type="text" class="form-control"
                        value="<?php echo $data_cek['alamat']; ?>, RT <?php echo $data_cek['rt']; ?> RW <?php echo $data_cek['rw']; ?> (<?php echo $data_cek['kec']; ?> - <?php echo $data_cek['kab']; ?>)"
                        readonly />
                    <?php } ?>

                </div>
            </div>

            <!-- <div class="form-group row">
				<label class="col-sm-2 col-form-label">Anggota</label>
				<div class="col-sm-4">
					<select name="id_umat" id="id_umat" class="form-control select2bs4" required>
						<option value="" disabled selected>- Umat -</option>
						<?php
						// ambil data dari database
						$query = "select * from tb_umat where status_umat='Ada'";
						$hasil = mysqli_query($koneksi, $query);
						while ($row = mysqli_fetch_array($hasil))
						{
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
				<div class="col-sm-3">
					<select name="hubungan" id="hubungan" class="form-control">
						<option value="" disabled selected>- Hubungan Keluarga -</option>
						<option>Kepala Keluarga</option>
						<option>Istri</option>
						<option>Anak</option>
						<option>Orang Tua</option>
						<option>Mertua</option>
						<option>Menantu</option>
						<option>Cucu</option>
						<option>Famili Lain</option>
					</select>
				</div>
				<input type="submit" name="Simpan" value="Tambah" class="btn btn-success">
			</div> -->

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>NIK</th>
                                <th>Nama</th>
                                <th>Jenis Kelamin</th>
                                <!-- <th>Aksi</th> -->
                            </tr>
                        </thead>
                        <tbody>

                            <?php
							$no = 1;
							$sql = $koneksi->query("SELECT * from tb_umat where status_umat='Ada' and id_umat='$data_cek[id_umat]'");
							while ($data = $sql->fetch_assoc())
							{
							?>

                            <tr>
                                <td>
                                    <?php echo $data['nik']; ?>
                                </td>
                                <td>
                                    <?php echo $data['nama_umat']; ?>
                                </td>
                                <td>
                                    <?php echo $data['jenis_kelamin']; ?>
                                </td>
                            </tr>

                            <?php
							}
							?>
                        </tbody>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <a href="?page=data-kartu" title="Kembali" class="btn btn-warning">Kembali</a>
        </div>
    </form>
</div>

<?php

if (isset($_POST['Simpan']))
{
	//mulai proses simpan data
	$sql_simpan = "INSERT INTO tb_anggota (id_kk, id_umat, hubungan) VALUES( 
            '" . $_POST['id_kk'] . "',
            '" . $_POST['id_umat'] . "',
            '" . $_POST['hubungan'] . "')";
	$query_simpan = mysqli_query($koneksi, $sql_simpan);
	mysqli_close($koneksi);

	if ($query_simpan)
	{
		echo "<script>
      Swal.fire({title: 'Tambah Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
      }).then((result) => {if (result.value){
          window.location = 'index.php?page=anggota&kode=" . $_POST['id_kk'] . "';
          }
      })</script>";
	}
	else
	{
		echo "<script>
      Swal.fire({title: 'Tambah Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
      }).then((result) => {if (result.value){
          window.location = 'index.php?page=anggota&kode=" . $_POST['id_kk'] . "';
          }
      })</script>";
	}
}
     //selesai proses simpan data