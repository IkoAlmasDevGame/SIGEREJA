<div class="card card-info">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-table"></i> Data kategori
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div>
            <a href="?page=add-absensi" class="btn btn-primary">
                <i class="fa fa-plus"></i> Absen Umat</a>

            <a href="?page=laporan-mutasi-umat" class="btn btn-warning">
                <i class="fa fa-book"></i> Cetak Mutasi</a>
        </div>
    </div>
    <div class="table-responsive">
        <br>
        <table id="example1" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Umat</th>
                    <th>Kehadiran </th>
                    <th>Date</th>
                    <th>Jam masuk</th>
                    <th>Jam keluar</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = 1;
                $sql = $koneksi->query("SELECT * from tb_absensi_umat");
                while ($data = $sql->fetch_assoc()) {
                    // var_dump($data);

                ?>
                    <tr>
                        <td><?= $no++; ?></td>
                        <td><?= $data['nama']; ?></td>
                        <td><?= $data['status_absensi']; ?></td>
                        <td><?= date('d-m-Y', strtotime($data['tanggal'])); ?></td>
                        <td><?= $data['jam_masuk']; ?></td>
                        <td><?= $data['jam_keluar']; ?></td>
                        <td>
                            <a href="?page=edit-absensi&kode=<?php echo $data['id_absensi']; ?>" title="Ubah" class="btn btn-success btn-sm">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a href="?page=delete-absensi&kode=<?php echo $data['id_absensi']; ?>" onclick="return confirm('Apakah anda yakin hapus data ini ?')" title="Hapus" class="btn btn-danger btn-sm">
                                <i class="fa fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>
<!-- /.card-body -->