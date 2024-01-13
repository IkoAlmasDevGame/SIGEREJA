<div class="card card-info">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-table"></i> Data kategori
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div>
            <a href="?page=add-kategori" class="btn btn-primary">
                <i class="fa fa-edit"></i> Tambah Data</a>
        </div>
    </div>
    <div class="table-responsive">
        <br>
        <table id="example1" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Kategori</th>
                    <th>Nama Ketua </th>
                    <th>Wakil Ketua</th>
                    <th>jumlah KK</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = 1;
                $sql = $koneksi->query("SELECT * from tb_kategorial");
                while ($data = $sql->fetch_assoc()) {
                    // var_dump($data);

                ?>
                    <tr>
                        <td><?= $no++; ?></td>
                        <td><?= $data['kategori']; ?></td>
                        <td><?= $data['ketua']; ?></td>
                        <td><?= $data['wakil_ketua']; ?></td>
                        <td><?= $data['jumlah_kk']; ?></td>
                        <td>
                            <a href="?page=edit-kategori&kode=<?php echo $data['id_kategorial']; ?>" title="Ubah" class="btn btn-success btn-sm">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a class="btn btn-danger" href="?page=delete-kategori&kode=<?php echo $data['id_kategorial']; ?>" onclick="return confirm('Apakah anda yakin hapus data ini ?')"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                <?php }; ?>
            </tbody>
        </table>
    </div>
</div>
<!-- /.card-body -->