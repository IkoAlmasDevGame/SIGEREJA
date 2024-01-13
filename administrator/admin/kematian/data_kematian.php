<div class="card card-info">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-table"></i> Data Lingkungan
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div class="table-responsive">
            <div>
                <a href="?page=add-kematian" class="btn btn-primary">
                    <i class="fa fa-edit"></i> Tambah Data</a>
            </div>
            <br>
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Umat</th>
                        <th>Nama Lingkungan</th>
                        <th>NIK</th>
                        <th>Tgl Kematian</th>
                        <th>Tempat</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
                    $no = 1;
                    $sql = $koneksi->query("SELECT * from tb_kematian");
                    while ($data = $sql->fetch_assoc()) {
                        $umat = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * from tb_kematian  JOIN tb_umat ON tb_kematian.id_umat = tb_umat.id_umat JOIN tb_lingkungan ON tb_umat.id_lingkungan = tb_lingkungan.id_lingkungan WHERE tb_kematian.id_umat='$data[id_umat]'"));

                        $lingkungan = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * from tb_kematian  JOIN tb_umat ON tb_kematian.id_umat = tb_umat.id_umat JOIN tb_lingkungan ON tb_umat.id_lingkungan = tb_lingkungan.id_lingkungan WHERE tb_kematian.id_umat='$data[id_umat]'"));
                    ?>

                        <tr>
                            <td>
                                <?php echo $no++; ?>
                            </td>
                            <td>
                                <?php echo $umat['nama_umat']; ?>

                            </td>
                            <td>
                                <?php echo $lingkungan['nama_lingkungan']; ?>

                            </td>
                            <td>
                                <?php echo $umat['nik']; ?>
                            </td>
                            <td>
                                <?php echo $data['tgl_kematian']; ?>
                            </td>
                            <td>
                                <?php echo $data['tempat']; ?>
                            </td>
                            <!-- aksi -->
                            <td>
                                <a href="?page=edit-kematian&kode=<?php echo $data['id']; ?>" title="Ubah" class="btn btn-success btn-sm">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a href="?page=del-kematian&kode=<?php echo $data['id']; ?>" onclick="return confirm('Apakah anda yakin hapus data ini ?')" title="Hapus" class="btn btn-danger btn-sm">
                                    <i class="fa fa-trash"></i>
                                </a>
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
    <!-- /.card-body -->