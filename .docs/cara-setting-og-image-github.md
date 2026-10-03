# Panduan Setting Social Preview (OG Image) di Repositori GitHub

Dokumen ini menjelaskan langkah-langkah praktis untuk memasang gambar pratinjau media sosial (*Social Preview* / *Open Graph Image*) pada repositori GitHub Anda, sehingga saat tautan repositori dibagikan ke platform seperti WhatsApp, Telegram, Discord, LinkedIn, atau Twitter/X, kartu pratinjau yang muncul terlihat profesional dan menarik.

---

## 🖼️ Persyaratan File Gambar

File gambar yang telah disiapkan di root proyek ini:
- **Nama File:** `social-preview.png`
- **Dimensi:** `1280 × 640 px` (Aspek rasio standar GitHub 2:1)
- **Format:** PNG / JPEG / GIF
- **Ukuran File:** Maksimal 1 MB (file `social-preview.png` di proyek ini hanya ~180 KB, sangat optimal)

---

## 🚀 Langkah-Langkah Pemasangan di GitHub

1. **Buka Repositori di Browser:**
   - Kunjungi repositori Anda:  
     👉 [https://github.com/adarmawan117/quick-phpartisanserve](https://github.com/adarmawan117/quick-phpartisanserve)

2. **Masuk ke Menu Settings:**
   - Di bar navigasi tab atas repositori (di samping *Code*, *Issues*, *Pull requests*, *Actions*, dst.), klik tab **Settings** (ikon roda gigi ⚙️).
   - *(Catatan: Menu Settings hanya muncul jika Anda login sebagai pemilik/owner repositori).*

3. **Buka Bagian General:**
   - Di sidebar sebelah kiri, pastikan Anda berada di menu **General** (halaman default menu Settings).

4. **Cari Bagian "Social preview":**
   - Gulir (*scroll*) halaman ke bawah hingga Anda menemukan bagian berjudul **Social preview**.
   - Di bagian ini terdapat kotak pratinjau gambar default repositori GitHub.

5. **Upload Gambar:**
   - Klik tombol **Edit** di sebelah kanan kotak Social preview.
   - Pilih opsi **"Upload an image..."**.
   - Pilih file `social-preview.png` yang ada di folder root proyek:
     ```text
     d:\ADR\Programming\Program\MyProgram\Tools\quick-artisanserve\social-preview.png
     ```
   - Tunggu beberapa detik hingga proses unggah selesai.

6. **Simpan Perubahan:**
   - Sesuaikan posisi jika diminta, lalu klik **Save changes** (atau selesai otomatis setelah upload).
   - Gambar banner kustom kini telah aktif untuk repositori Anda!

---

## 🔍 Cara Menguji Hasil Tampilan (Open Graph Preview)

Untuk memastikan gambar OG telah terpasang dan terbaca sempurna oleh bot media sosial tanpa harus membagikannya terlebih dahulu, Anda dapat menggunakan alat uji publik berikut:

1. **OpenGraph Checker:**
   - Buka [https://www.opengraph.xyz/](https://www.opengraph.xyz/)
   - Masukkan URL repositori: `https://github.com/adarmawan117/quick-phpartisanserve`
   - Klik **Check Website** untuk melihat simulasi tampilan di Facebook, Twitter/X, Discord, dan LinkedIn.

2. **WhatsApp / Telegram Cache Refresh:**
   - Jika saat tautan dicoba di-share pratinjaunya belum berubah, hal ini wajar karena cache CDN platform sosial.
   - Coba tambahkan parameter dummy sementara di akhir link untuk bypass cache (misal: `https://github.com/adarmawan117/quick-phpartisanserve?v=1`).

---

## 👨‍💻 Kredit

Dibuat oleh [ADR Programming](https://www.instagram.com/adr_programming/)
