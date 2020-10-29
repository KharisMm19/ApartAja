-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29 Okt 2020 pada 14.15
-- Versi Server: 10.1.16-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apartemen`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas_tambahan`
--

CREATE TABLE `fasilitas_tambahan` (
  `id_fasilitas` int(2) NOT NULL,
  `nama_fasilitas` varchar(20) NOT NULL,
  `deskripsi_fasilitas` text NOT NULL,
  `harga_fasilitas` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gambar_ruangan`
--

CREATE TABLE `gambar_ruangan` (
  `id_gambar` int(2) NOT NULL,
  `id_ruangan` int(2) NOT NULL,
  `gambar` text NOT NULL,
  `deskripsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kritik_saran`
--

CREATE TABLE `kritik_saran` (
  `id_kritik_saran` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `isi` text NOT NULL,
  `kategori` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(3) NOT NULL,
  `id_pesanan` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `id_rekening` int(1) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `total_harga` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan_apartemen`
--

CREATE TABLE `pemesanan_apartemen` (
  `id_pesanan` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `id_ruangan` int(2) NOT NULL,
  `id_pengelola` int(2) NOT NULL,
  `id_fasilitas` int(2) NOT NULL,
  `lama_sewa` int(3) NOT NULL,
  `total_harga` int(8) NOT NULL,
  `tanggal_sewa` date NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `status_pemesanan` varchar(20) NOT NULL,
  `pesan_pengelola` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengelola`
--

CREATE TABLE `pengelola` (
  `id_pengelola` int(2) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(40) NOT NULL,
  `status_pengelola` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengelola`
--

INSERT INTO `pengelola` (`id_pengelola`, `nama`, `no_telpon`, `jenis_kelamin`, `email`, `username`, `password`, `status_pengelola`) VALUES
(1, 'admin', '089987678765', 'perempuan', 'admin@gmail.com', 'admin', 'admin', 'Sudah Terverifikasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening_bank`
--

CREATE TABLE `rekening_bank` (
  `id_rekening` int(1) NOT NULL,
  `nama_bank` varchar(15) NOT NULL,
  `no_rek` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan_apartemen`
--

CREATE TABLE `ruangan_apartemen` (
  `id_ruangan` int(2) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jenis` varchar(15) NOT NULL,
  `harga` int(7) NOT NULL,
  `detail` text NOT NULL,
  `ruangan_tersedia` int(2) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(3) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(40) NOT NULL,
  `gambar_kartu_identitas` text NOT NULL,
  `status_user` varchar(20) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `alamat`, `no_telpon`, `jenis_kelamin`, `email`, `username`, `password`, `gambar_kartu_identitas`, `status_user`, `level`) VALUES
(1, 'Husnul', 'None', 'None', 'Female', 'husnulhotimah9c@gmail.com', 'husnul', 'e10adc3949ba59abbe56e057f20f883e', 'assets/img/etc/ava_default.jpg', 'Sudah Terverifikasi', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fasilitas_tambahan`
--
ALTER TABLE `fasilitas_tambahan`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `gambar_ruangan`
--
ALTER TABLE `gambar_ruangan`
  ADD PRIMARY KEY (`id_gambar`),
  ADD KEY `id_ruangan` (`id_ruangan`);

--
-- Indexes for table `kritik_saran`
--
ALTER TABLE `kritik_saran`
  ADD PRIMARY KEY (`id_kritik_saran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_rekening` (`id_rekening`);

--
-- Indexes for table `pemesanan_apartemen`
--
ALTER TABLE `pemesanan_apartemen`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_ruangan` (`id_ruangan`),
  ADD KEY `id_pengelola` (`id_pengelola`),
  ADD KEY `id_fasilitas` (`id_fasilitas`);

--
-- Indexes for table `pengelola`
--
ALTER TABLE `pengelola`
  ADD PRIMARY KEY (`id_pengelola`);

--
-- Indexes for table `rekening_bank`
--
ALTER TABLE `rekening_bank`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indexes for table `ruangan_apartemen`
--
ALTER TABLE `ruangan_apartemen`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fasilitas_tambahan`
--
ALTER TABLE `fasilitas_tambahan`
  MODIFY `id_fasilitas` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gambar_ruangan`
--
ALTER TABLE `gambar_ruangan`
  MODIFY `id_gambar` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kritik_saran`
--
ALTER TABLE `kritik_saran`
  MODIFY `id_kritik_saran` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pemesanan_apartemen`
--
ALTER TABLE `pemesanan_apartemen`
  MODIFY `id_pesanan` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengelola`
--
ALTER TABLE `pengelola`
  MODIFY `id_pengelola` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rekening_bank`
--
ALTER TABLE `rekening_bank`
  MODIFY `id_rekening` int(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gambar_ruangan`
--
ALTER TABLE `gambar_ruangan`
  ADD CONSTRAINT `gambar_ruangan_ibfk_1` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan_apartemen` (`id_ruangan`);

--
-- Ketidakleluasaan untuk tabel `kritik_saran`
--
ALTER TABLE `kritik_saran`
  ADD CONSTRAINT `kritik_saran_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `pembayaran_ibfk_3` FOREIGN KEY (`id_pesanan`) REFERENCES `pemesanan_apartemen` (`id_pesanan`),
  ADD CONSTRAINT `pembayaran_ibfk_4` FOREIGN KEY (`id_rekening`) REFERENCES `rekening_bank` (`id_rekening`);

--
-- Ketidakleluasaan untuk tabel `pemesanan_apartemen`
--
ALTER TABLE `pemesanan_apartemen`
  ADD CONSTRAINT `pemesanan_apartemen_ibfk_1` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan_apartemen` (`id_ruangan`),
  ADD CONSTRAINT `pemesanan_apartemen_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `pemesanan_apartemen_ibfk_3` FOREIGN KEY (`id_pengelola`) REFERENCES `pengelola` (`id_pengelola`),
  ADD CONSTRAINT `pemesanan_apartemen_ibfk_4` FOREIGN KEY (`id_fasilitas`) REFERENCES `fasilitas_tambahan` (`id_fasilitas`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
