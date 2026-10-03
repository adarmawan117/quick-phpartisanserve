@echo off
setlocal EnableDelayedExpansion
title Artisan Serve - Laravel Launcher

:: Berpindah ke folder target yang diklik kanan
if not "%~1"=="" (
    cd /d "%~1"
)

echo.
echo  ==============================================================
echo    Laravel Artisan Development Server Launcher
echo  ==============================================================
echo  Direktori: %CD%
echo.

:: 1. Validasi keberadaan file artisan
if not exist "artisan" (
    echo  ==============================================================
    echo  [ERROR] BUKAN FOLDER PROJECT LARAVEL!
    echo  ==============================================================
    echo  File 'artisan' tidak ditemukan di folder ini:
    echo  "%CD%"
    echo.
    echo  Tombol 'Artisan Serve' hanya dapat digunakan pada folder project
    echo  Laravel yang memiliki file 'artisan'.
    echo  ==============================================================
    echo.
    pause
    exit /b 1
)

:: 2. Periksa apakah dependensi composer sudah diinstall (folder vendor)
if not exist "vendor" (
    echo  [INFO] Folder 'vendor' belum ditemukan.
    echo  Menjalankan instalasi dependensi otomatis: composer install...
    echo  --------------------------------------------------------------
    call composer install
    if errorlevel 1 (
        echo.
        echo  [ERROR] Gagal menjalankan composer install!
        echo  Silakan periksa pesan kesalahan di atas.
        echo.
        pause
        exit /b 1
    )
    echo.
)

:: 3. Periksa keberadaan file konfigurasi .env
if not exist ".env" (
    echo  --------------------------------------------------------------
    echo  [PERINGATAN] File konfigurasi '.env' belum ditemukan!
    if exist ".env.example" (
        echo  File '.env.example' terdeteksi di folder ini.
        echo  Jangan lupa untuk menyalin '.env.example' menjadi '.env' dan
        echo  menjalankan 'php artisan key:generate' jika diperlukan.
    ) else (
        echo  Pastikan file konfigurasi '.env' telah disiapkan agar
        echo  aplikasi Laravel dapat berjalan normal.
    )
    echo  --------------------------------------------------------------
    echo.
)

:: 4. Jalankan development server Laravel
echo  Menjalankan Laravel Development Server...
echo  --------------------------------------------------------------
echo  Perintah : php artisan serve
echo  --------------------------------------------------------------
echo.
call php artisan serve

if %errorlevel% neq 0 (
    echo.
    echo  ==============================================================
    echo  [INFO] Server telah dihentikan atau terjadi error di atas.
    echo  ==============================================================
    echo.
    pause
)
