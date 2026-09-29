@echo off
setlocal EnableDelayedExpansion
title Installer Shortcut Artisan Serve Context Menu
echo ================================================================
echo     INSTALLER SHORTCUT ARTISAN SERVE WINDOWS EXPLORER
echo ================================================================
echo.

:: 1. Cek apakah PHP terpasang dan ada di PATH
where php.exe >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] PHP BELUM TERINSTALL ATAU BELUM TERDAFTAR PADA PATH!
    echo.
    echo Framework Laravel membutuhkan runtime PHP agar dapat dijalankan.
    echo.
    echo Silakan download dan pasang PHP terlebih dahulu di:
    echo https://windows.php.net/
    echo atau gunakan tool environment seperti Laravel Herd / Laragon.
    echo.
    echo Pemasangan shortcut Artisan Serve DIBATALKAN.
    echo ================================================================
    echo.
    pause
    exit /b 1
)

:: 2. Cek apakah Composer terpasang
where composer >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] COMPOSER PACKAGE MANAGER TIDAK DITEMUKAN!
    echo.
    echo Pastikan Composer telah terpasang dan terdaftar pada PATH Windows Anda.
    echo Composer dibutuhkan untuk mengelola dependensi proyek Laravel.
    echo.
    echo Silakan download dan pasang Composer di:
    echo https://getcomposer.org/
    echo.
    echo Pemasangan shortcut Artisan Serve DIBATALKAN.
    echo ================================================================
    echo.
    pause
    exit /b 1
)

echo [*] Pengecekan Sistem:
for /f "tokens=*" %%v in ('php -v 2^>nul') do (
    echo     - PHP terdeteksi      : %%v
    goto :composer_check
)
:composer_check
for /f "tokens=*" %%v in ('composer -V 2^>nul') do (
    echo     - Composer terdeteksi : %%v
    goto :terminal_check
)

:terminal_check
:: 3. Deteksi otomatis Windows Terminal wt.exe vs Command Prompt cmd.exe
where wt.exe >nul 2>&1
if %errorlevel% equ 0 (
    set "USE_WT=1"
    set "TERM_NAME=Windows Terminal [wt.exe]"
) else (
    set "USE_WT=0"
    set "TERM_NAME=Command Prompt [cmd.exe]"
)
echo     - Terminal otomatis   : %TERM_NAME%
echo.

:: 4. Siapkan folder icon dan script permanen di profil pengguna
set "TARGET_DIR=%USERPROFILE%\.icons"
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

:: 5. Salin icon dan runner script ke folder pengguna
copy /y "%~dp0laravel.ico" "%TARGET_DIR%\laravel.ico" >nul
copy /y "%~dp0artisan-serve.cmd" "%TARGET_DIR%\artisan-serve.cmd" >nul

if not exist "%TARGET_DIR%\laravel.ico" (
    echo [!] Peringatan: Gagal menyalin laravel.ico
)
if not exist "%TARGET_DIR%\artisan-serve.cmd" (
    echo [!] Peringatan: Gagal menyalin artisan-serve.cmd
)

:: 6. Format path untuk file Registry (ubah \ menjadi \\)
set "REG_ICON=%TARGET_DIR%\laravel.ico"
set "REG_ICON=%REG_ICON:\=\\%"

set "REG_SCRIPT=%TARGET_DIR%\artisan-serve.cmd"
set "REG_SCRIPT=%REG_SCRIPT:\=\\%"

:: 7. Buat file .reg temporary untuk didaftarkan
set "TEMP_REG=%TEMP%\artisanserve_install.reg"

(
echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_CURRENT_USER\Software\Classes\Directory\shell\ArtisanServe]
echo @="Artisan Serve"
echo "Icon"="%REG_ICON%"
echo.
echo [HKEY_CURRENT_USER\Software\Classes\Directory\shell\ArtisanServe\command]
if "%USE_WT%"=="1" (
    echo @="wt.exe -d \"%%1\" \"%REG_SCRIPT%\" \"%%1\""
) else (
    echo @="cmd.exe /k call \"%REG_SCRIPT%\" \"%%1\""
)
echo.
echo [HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\ArtisanServe]
echo @="Artisan Serve"
echo "Icon"="%REG_ICON%"
echo.
echo [HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\ArtisanServe\command]
if "%USE_WT%"=="1" (
    echo @="wt.exe -d \"%%V\" \"%REG_SCRIPT%\" \"%%V\""
) else (
    echo @="cmd.exe /k call \"%REG_SCRIPT%\" \"%V\""
)
) > "%TEMP_REG%"

:: 8. Daftarkan ke Windows Registry
reg import "%TEMP_REG%" >nul
set "REG_STATUS=%errorlevel%"
del "%TEMP_REG%" >nul 2>&1

echo ================================================================
if %REG_STATUS% equ 0 (
    echo [SUKSES] Shortcut Artisan Serve berhasil dipasang ke Windows Explorer!
    echo.
    echo Detail Konfigurasi:
    echo - Icon Laravel         : %TARGET_DIR%\laravel.ico
    echo - Runner Script        : %TARGET_DIR%\artisan-serve.cmd
    echo - Terminal Default     : %TERM_NAME%
    echo.
    echo Cara Penggunaan:
    echo 1. Buka File Explorer di folder proyek Laravel mana saja.
    echo 2. Klik kanan pada folder proyek, pilih "Artisan Serve".
    echo    Atau masuk ke dalam folder, klik kanan di ruang kosong.
    echo 3. Dev server Laravel otomatis berjalan di terminal!
    echo    Jika bukan folder Laravel, notifikasi informatif akan ditampilkan.
) else (
    echo [GAGAL] Terjadi kesalahan saat menulis ke Windows Registry.
)
echo ================================================================
echo.
pause
