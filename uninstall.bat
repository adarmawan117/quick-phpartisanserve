@echo off
title Uninstall Shortcut Artisan Serve
echo ================================================================
echo   MENGHAPUS SHORTCUT ARTISAN SERVE DARI WINDOWS EXPLORER
echo ================================================================
echo.

reg delete "HKCU\Software\Classes\Directory\shell\ArtisanServe" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Directory\Background\shell\ArtisanServe" /f >nul 2>&1

:: Bersihkan file runner & icon di profil pengguna jika ada
if exist "%USERPROFILE%\.icons\artisan-serve.cmd" del /f /q "%USERPROFILE%\.icons\artisan-serve.cmd" >nul 2>&1
if exist "%USERPROFILE%\.icons\laravel.ico" del /f /q "%USERPROFILE%\.icons\laravel.ico" >nul 2>&1

echo [*] Entri registry ArtisanServe dan file pendukung berhasil dibersihkan.
echo.
echo ================================================================
echo [SUKSES] Shortcut 'Artisan Serve' telah berhasil dicopot dari Explorer!
echo ================================================================
echo.
pause
