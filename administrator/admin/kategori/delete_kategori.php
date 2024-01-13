
<?php
if (isset($_GET['kode'])) {
    $sql = "DELETE FROM tb_kategorial WHERE id_kategorial='" . $_GET['kode'] . "'";
    $query = mysqli_query($koneksi, $sql);

    if ($query) {
        echo "<script>
                Swal.fire({title: 'Hapus Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value) {
                        window.location = 'index.php?page=data-kategori';
                    }
                })</script>";
    } else {
        echo "<script>
                Swal.fire({title: 'Hapus Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value) {
                        window.location = 'index.php?page=data-kategori';
                    }
                })</script>";
    }
}

