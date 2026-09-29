# Shortcut 'Artisan Serve' Windows Explorer Context Menu

Folder ini berisi shortcut klik kanan Windows Explorer untuk menjalankan development server Laravel (`php artisan serve`) secara instan (0 ms tanpa lag) dengan icon resmi Laravel.

<p align="center">
  <img src="./Klik%20Kanan%20Context.jpg" alt="Preview Artisan Serve Windows Explorer" width="340" />
</p>

---

## 📁 Struktur File

```text
├── install.bat             <-- [UTAMA] Cukup double-click file ini untuk install
├── uninstall.bat           <-- [UNINSTALL] Double-click untuk mencopot shortcut
├── artisan-serve.cmd       <-- Script runner cerdas yang dieksekusi saat klik kanan
├── laravel.ico             <-- Icon resmi Laravel
├── Klik Kanan Context.jpg  <-- Screenshot tampilan context menu
├── social-preview.png      <-- Banner social preview (GitHub & Open Graph)
├── registry/               <-- Arsip file mentah .reg (jangan klik ganda file di sini)
│   ├── Add-ArtisanServe-CMD.reg
│   ├── Add-ArtisanServe-Terminal.reg
│   └── Remove-ArtisanServe.reg
└── README.md               <-- Panduan teknis
```

---

## 🚀 Cara Pemasangan (Cukup 1 Klik)

1. Buka folder ini di Windows Explorer.
2. **Klik ganda (double-click)** pada file **`install.bat`**.
3. Selesai! Tidak perlu memilih terminal secara manual, sistem akan otomatis:
   - Memeriksa apakah **PHP** dan **Composer** sudah terpasang di komputer.
   - Mendeteksi apakah komputer memiliki **Windows Terminal (`wt.exe`)** atau menggunakan **Command Prompt (`cmd.exe`)**.
   - Menyalin icon dan runner script ke direktori profil pengguna (`%USERPROFILE%\.icons`).
   - Mendaftarkan menu ke Windows Registry pengguna aktif (`HKEY_CURRENT_USER`).

---

## 🛡️ Fitur Pintar & Penanganan Error

1. **Pengecekan di Awal (Install Time):**
   - Jika PHP belum terinstall atau belum terdaftar di PATH, proses instalasi akan **dibatalkan secara otomatis** dengan petunjuk unduh ke `https://windows.php.net/`.
   - Jika Composer belum terpasang, instalasi dibatalkan dengan petunjuk unduh ke `https://getcomposer.org/`.
2. **Pengecekan saat Klik Kanan Ditekan (Run Time):**
   - **Jika folder bukan project Laravel (tidak ada file `artisan`):**
     Muncul notifikasi error informatif dalam bahasa Indonesia yang menjelaskan bahwa folder tersebut bukan project Laravel.
   - **Jika folder `vendor` belum ada (project baru di-clone dari Git):**
     Script akan otomatis menjalankan `composer install` terlebih dahulu sebelum server dijalankan!
   - **Pengecekan file konfigurasi `.env`:**
     Jika file konfigurasi `.env` belum dibuat namun terdapat `.env.example`, script akan memberikan pengingat ramah untuk menyalin `.env.example` ke `.env` dan menjalankan `php artisan key:generate`.
3. **Eksekusi Server Instan (Zero-Friction):**
   - Menjalankan `php artisan serve` standar secara otomatis tanpa friksi dan tanpa perlu mengetik manual di terminal.

---

## 🗑️ Cara Mencopot / Uninstall

Cukup **klik ganda** file **`uninstall.bat`**. Entri context menu pada Windows Explorer dan file pendukung akan langsung dibersihkan.

---

## 👨‍💻 Pengembang

Dikembangkan dengan ❤️ oleh [ADR Programming](https://www.instagram.com/adr_programming/)
