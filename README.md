# 🪙 Coin Cap

**Coin Cap** adalah aplikasi untuk memantau harga dan informasi aset kripto secara real-time. Aplikasi ini dibuat menggunakan framework **Flutter** dan ditujukan sebagai latihan pribadi.

---

## 📅 Timeline Pengerjaan

### 🗓 21 Agustus 2025
- Membuat project dengan command:
  ```sh
  flutter create coin_cap
- Membuat struktur dasar aplikasi dengan Scaffold dan layout awal.
- Menambahkan dropdown untuk memilih jenis coin.

### 🗓 22 Agustus 2025
- Integrasi REST API menggunakan ```Dio``` untuk mendapatkan data coin.
- Membuat models untuk mapping data coin dari JSON.
- Membuat service class untuk memanggil API.

### 🗓 23 Agustus 2025
- Menampilkan informasi coin: gambar, harga terkini, dan persentase perubahan.
- Membuat custom widget untuk menampilkan data coin agar reusable.

### 🗓 24 Agustus 2025
- Menambahkan bagian ```descriptionCoin``` agar bisa menampilkan deskripsi lengkap setiap aset kripto.
- Membungkus deskripsi dengan ```SingleChildScrollView``` agar bisa di-scroll.
- Mengatur layout agar tetap responsif di berbagai ukuran layar.

### 🗓 25 Agustus 2025
- Refinement UI (padding, warna, font).
- Menambahkan error handling ketika data API gagal dimuat.
- Testing aplikasi di emulator dan perangkat nyata.
- **Push project ke GitHub.**