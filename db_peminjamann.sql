-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2026 at 08:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_peminjamann`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `nama_buku` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `jumlah_total` int(11) NOT NULL,
  `jumlah_tersedia` int(11) NOT NULL,
  `kondisi` enum('Baik','Rusak','Perbaikan') DEFAULT 'Baik',
  `lokasi` varchar(100) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `nama_buku`, `deskripsi`, `kategori`, `jumlah_total`, `jumlah_tersedia`, `kondisi`, `lokasi`, `tanggal_masuk`, `created_at`, `updated_at`) VALUES
(1, 'Laptop Dell', 'Laptop Dell Inspiron 15', 'Elektronik', 5, 3, 'Baik', 'Lemari A1', '2025-01-01', '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(2, 'Proyektor', 'Proyektor Epson 3LCD', 'Elektronik', 3, 2, 'Baik', 'Lemari A2', '2025-01-05', '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(3, 'Printer Canon', 'Printer Canon Pixma', 'Elektronik', 4, 4, 'Baik', 'Meja B1', '2025-01-10', '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(4, 'Buku Pemrograman', 'Kumpulan buku teknis (10 set)', 'Buku', 10, 7, 'Baik', 'Rak C1', '2025-01-15', '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(5, 'Kamera DSLR', 'Kamera Canon EOS 6D', 'Fotografi', 2, 1, 'Baik', 'Lemari A3', '2025-02-01', '2026-02-02 07:10:23', '2026-02-02 07:10:23');

-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE `denda` (
  `id` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `nominal_denda` decimal(10,2) NOT NULL,
  `alasan` varchar(100) DEFAULT NULL,
  `status_pembayaran` enum('Belum Bayar','Sudah Bayar') DEFAULT 'Belum Bayar',
  `tanggal_pembayaran` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali_estimasi` date NOT NULL,
  `tanggal_kembali_aktual` date DEFAULT NULL,
  `status` enum('Aktif','Dikembalikan','Overdue','Hilang') DEFAULT 'Aktif',
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_user`, `id_barang`, `jumlah`, `tanggal_pinjam`, `tanggal_kembali_estimasi`, `tanggal_kembali_aktual`, `status`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2026-01-15', '2026-02-15', NULL, 'Aktif', NULL, '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(2, 2, 2, 1, '2026-01-20', '2026-02-03', NULL, 'Aktif', NULL, '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(3, 3, 4, 2, '2026-01-25', '2026-02-08', NULL, 'Aktif', NULL, '2026-02-02 07:10:23', '2026-02-02 07:10:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_identitas` varchar(50) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `tanggal_daftar` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `no_identitas`, `alamat`, `no_telepon`, `tanggal_daftar`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Riyaldi', 'ahmad@example.com', '123456789', 'Jl. Merdeka No. 10', '081234567890', '2026-02-02 07:10:23', '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(2, 'Siti Nurhaliza', 'siti@example.com', '987654321', 'Jl. Diponegoro No. 5', '082345678901', '2026-02-02 07:10:23', '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(3, 'Budi Santoso', 'budi@example.com', '456789123', 'Jl. Sudirman No. 20', '083456789012', '2026-02-02 07:10:23', '2026-02-02 07:10:23', '2026-02-02 07:10:23'),
(4, 'Dewi Lestari', 'dewi@example.com', '789123456', 'Jl. Ahmad Yani No. 15', '084567890123', '2026-02-02 07:10:23', '2026-02-02 07:10:23', '2026-02-02 07:10:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `denda`
--
ALTER TABLE `denda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `no_identitas` (`no_identitas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `denda`
--
ALTER TABLE `denda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `denda`
--
ALTER TABLE `denda`
  ADD CONSTRAINT `denda_ibfk_1` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `buku` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
