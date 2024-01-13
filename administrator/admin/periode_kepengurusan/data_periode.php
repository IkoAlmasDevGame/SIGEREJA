<div class="card card-info">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fas fa-table"> Data Pengerusan</i>
        </h3>
    </div>
    <form action="" method="post">
        <br>
        <select name="ketua" id="ketua" class="form-control col-3 mx-5">
            <option value="">Pilih Nama Pengurus</option>
            <?php 
                $row = mysqli_query($koneksi, "SELECT * FROM tb_umat");
                while($isi = $row->fetch_array()){
                    ?>
            <option value="<?=$isi["id_umat"]?>">
                <?php echo $isi["nik"] ?> - <?php echo $isi["nama_umat"] ?>
            </option>
            <?php
                }  
            ?>
        </select>
        <br>
        <input type="submit" value="submit" class="btn btn-primary mx-5">
        <div class="card-body">
            <div class="table-responsive-md table-responsive-lg">
                <table class="table table-bordered table-striped" id="example1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Ketua</th>
                            <th>Nama Sekretaris</th>
                            <th>Nama Bendahara</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            if(isset($_POST["ketua"])){
                                $no = 1;
                                $id_umat = $_POST["ketua"];
                                $rowM = mysqli_query($koneksi, "SELECT * FROM tb_kub WHERE ketua = '$id_umat'");
                                while($data = $rowM->fetch_array()){
                                    $ket = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * from tb_umat where id_umat='$data[ketua]'"));
				                    $sek = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * from tb_umat where id_umat='$data[sekretaris]'"));
				                    $ben = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * from tb_umat where id_umat='$data[bendahara]'"));
                        ?>
                        <tr>
                            <td><?php echo $no; ?></td>
                            <td><?php echo $ket["nama_umat"]; ?></td>
                            <td><?php echo $sek["nama_umat"]; ?></td>
                            <td><?php echo $ben["nama_umat"]; ?></td>
                            <td>
                                <a href="" data-toggle="modal" data-target="#lihat<?=$data["ketua"]?>"
                                    aria-controls="modal" class="btn btn-default active">
                                    Lihat Data
                                </a>
                                <div class="modal fade" id="lihat<?=$data["ketua"]?>" aria-hidden="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title"> Data Pengerus : <?=$ket["nama_umat"]?> </h5>
                                                <button class="btn btn-default bg-transparent" type="button"
                                                    data-dismiss="modal">
                                                    <span class="fs-4">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body bg-secondary active">
                                                <span style="font-size: 14px;">
                                                    Ketua Umum :
                                                    <p style="font-size: 14px; margin-top: 16px;">
                                                        Ketua : <?php echo $ket["nama_umat"] ?>
                                                    </p>
                                                    <p style="font-size: 14px;">
                                                        Sekretaris : <?php echo $sek["nama_umat"] ?>
                                                    </p>
                                                    <p style="font-size: 14px;">
                                                        Bendahara : <?php echo $ben["nama_umat"] ?>
                                                    </p>
                                                </span>
                                                <span style="font-size: 14px;">
                                                    Bidang - Bidang :
                                                    <ul class="navbar-nav mt-3">
                                                        <ol type="A">
                                                            <li>
                                                                Bidang Pembinaan Iman : Liturgi, Musik, Pewartaan, KS
                                                                <span style="font-size: 14px;">
                                                                    <p>
                                                                        Koordinator : <?php echo "Maksi Saik"; ?>
                                                                        <br>
                                                                        Anggota : <?php echo "Baitasar Nahak"; ?>,
                                                                        <?php echo "Germanus Atawuwur"; ?>,
                                                                        <?php echo "Sr. Stanisia, PRR"; ?>
                                                                    </p>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                Bidang Pengamalan Iman : Sosek, Perempuan, HAM
                                                                <span style="font-size: 14px;">
                                                                    <p>
                                                                        Koordinator :
                                                                        <?php echo "Maria Elda Mandaru"; ?>
                                                                        <br>
                                                                        Anggota : <?php echo "Benediktus Muda"; ?>,
                                                                        <?php echo "Klara Rame"; ?>,
                                                                        <?php echo "Ermelinda Murniati Ganggur"; ?>
                                                                    </p>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                Bidang Pendidikan dan Kewaram : Kepemudaan, Sekami,
                                                                Kategorial
                                                                <span style="font-size: 14px;">
                                                                    <p>
                                                                        Koordinator :
                                                                        <?php echo "Aloysius Hanu Beo"; ?>
                                                                        <br>
                                                                        Anggota : <?php echo "Leonila Ulmasembun"; ?>,
                                                                        <?php echo "Anton Talo Popo"; ?>,
                                                                        <?php echo "Renatus Ferneubun"; ?>
                                                                    </p>
                                                                </span>
                                                            </li>
                                                        </ol>
                                                    </ul>
                                                </span>
                                                <div class="modal-footer">
                                                    <button class="btn btn-default btn-outline-dark" type="button"
                                                        data-dismiss="modal">
                                                        <span class="fs-4">cancel</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <?php
                        $no++;
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</div>