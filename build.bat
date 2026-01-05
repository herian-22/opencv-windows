@echo off
setlocal
:: Sesuaikan PROJECT_NAME dengan nama di add_executable(cpp-scope ...)
set PROJECT_NAME=cpp-scope

echo =======================================
echo [PROCESS] Melakukan Build dan Run
echo =======================================

:: 1. LOAD ENVIRONMENT
where cl >nul 2>nul
if %errorlevel% neq 0 (
    echo [INFO] Menyiapkan environment MSVC...
    if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" (
        call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
    ) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
        call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
    )
)

:: 2. CLEAN & CONFIGURE (Mencari Library)
echo [STEP 1/3] Membersihkan dan Mengonfigurasi...
if exist build ( rmdir /s /q build )
:: Tambahkan -Wno-dev untuk menghilangkan warning policy OpenCV yang tadi muncul
cmake -S . -B build -G "Ninja" -DCMAKE_TOOLCHAIN_FILE="C:/vcpkg/scripts/buildsystems/vcpkg.cmake" -Wno-dev
if %errorlevel% neq 0 ( exit /b %errorlevel% )

:: 3. BUILD (Proses Kompilasi Sebenarnya)
echo [STEP 2/3] Mengompilasi Kode...
:: Perhatikan: Perintahnya adalah --build, bukan -S . -B build
cmake --build build
if %errorlevel% neq 0 ( exit /b %errorlevel% )

:: 4. RUN (Menjalankan)
echo [STEP 3/3] Menjalankan Program...
echo ---------------------------------------
echo.
if exist ".\build\%PROJECT_NAME%.exe" (
    ".\build\%PROJECT_NAME%.exe"
) else (
    echo [ERROR] File %PROJECT_NAME%.exe tidak ditemukan!
    dir .\build\
)
echo.
echo ---------------------------------------
pause
endlocal