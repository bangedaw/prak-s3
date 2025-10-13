module Mahasiswa where

-- TYPE MAHASISWA
-- DEFINISI TYPE
-- type mahasiswa: <nama: String, nim: String, ipk: Float>
-- {<nama, nim, ipk> adalah sebuah mahasiswa, dengan nama adalah nama mahasiswa,
--  nim adalah nomor induk mahasiswa, ipk adalah nilai IPK mahasiswa}

data Mahasiswa = Mahasiswa String String Float
  deriving (Show, Eq)

-- DEFINISI DAN SPESIFIKASI SELEKTOR
-- nama: mahasiswa -> String
-- {nama(M) memberikan nama Mahasiswa M}
nama :: Mahasiswa -> String
nama (Mahasiswa name _ _) = name

-- nim: mahasiswa -> String
-- {nim(M) memberikan NIM Mahasiswa M}
nim :: Mahasiswa -> String
nim (Mahasiswa _ num _) = num

-- ipk: mahasiswa -> Float
-- {ipk(M) memberikan IPK Mahasiswa M}
ipk :: Mahasiswa -> Float
ipk (Mahasiswa _ _ score) = score

-- DEFINISI DAN SPESIFIKASI KONSTRUKTOR
-- makeMahasiswa: String -> String -> Float -> mahasiswa
-- {makeMahasiswa(nama,nim,ipk) membentuk Mahasiswa baru}
makeMahasiswa :: String -> String -> Float -> Mahasiswa
makeMahasiswa name num score = Mahasiswa name num score

-- DEFINISI DAN SPESIFIKASI PREDIKAT
-- isValidMahasiswa: mahasiswa -> boolean
-- {isValidMahasiswa(M) benar jika M memiliki Nama, NIM tidak kosong dan IPK antara 0.0 s.d. 4.0}
isValidMahasiswa :: Mahasiswa -> Bool
isValidMahasiswa (Mahasiswa name num score) = name /= "" && num /= "" && 0.0 <= score && score <= 4.0

-- DEFINISI OPERATOR/FUNGSI LAIN TERHADAP MAHASISWA
-- gantiIPK: mahasiswa -> Float -> mahasiswa
-- {gantiIPK(M,ipkBaru) mengganti IPK mahasiswa M dengan ipkBaru (maksimal 4.0)}
gantiIPK :: Mahasiswa -> Float -> Mahasiswa
gantiIPK (Mahasiswa name num _) score2 = 
    if 0.0 <= score2 && score2 <= 4.0 then
        makeMahasiswa name num score2
    else if score2 < 0.0 then
        makeMahasiswa name num 0.0
    else 
        makeMahasiswa name num 4.0


-- klasifikasiMahasiswa: mahasiswa -> String
-- {klasifikasiMahasiswa(M) memberikan predikat mahasiswa berdasarkan IPK}
-- Dengan ketentuan:
-- IPK >= 3.51 : "Cumlaude"
-- 3.00 <= IPK < 3.51 : "Sangat Memuaskan"
-- 2.75 <= IPK < 3.00 : "Memuaskan"
-- IPK < 2.75 : "Perlu Perbaikan"
klasifikasiMahasiswa :: Mahasiswa -> String
klasifikasiMahasiswa (Mahasiswa _ _ score) = 
    if 0.0 <= score && score < 2.75 then
        "Perlu Perbaikan"
    else if 2.75 <= score && score < 3.00 then
        "Memuaskan"
    else if 3.00 <= score && score < 3.51 then
        "Sangat Memuaskan"
    else if 3.51 <= score && score <= 4.0 then
        "Cumlaude"
    else
        ""

-- tampilMahasiswa: mahasiswa -> String
-- {tampilMahasiswa(M) mengubah Mahasiswa M menjadi string deskriptif}
-- Dengan format:
-- "Nama: <nama>, NIM: <nim>, IPK: <ipk>"
tampilMahasiswa :: Mahasiswa -> String
tampilMahasiswa (Mahasiswa name num score) = 
    concat ["Nama: ", name, ", NIM: ", num, ", IPK: ", show score]
