module Point where

-- TYPE POINT
-- DEFINISI TYPE
-- type point: <x: Float, y: Float>
-- {<x,y> adalah sebuah point, dengan x adalah absis, y adalah ordinat}

data Point = Pt Float Float
  deriving (Show, Eq)

-- DEFINISI DAN SPESIFİIKASI SELEKTOR
-- absis: point -> Float
-- {absis(P) memberikan absis Point P}
absis :: Point -> Float
absis (Pt x _) = x

-- ordinat: point -> Float
-- {ordinat(P) memberikan ordinat Point P}
ordinat :: Point -> Float
ordinat (Pt _ y) = y

-- DEFINISI DAN SPESIFIKASI KONSTRUKTOR
-- makePoint: 2 Float -> point
-- {makePoint(x,y) membentuk sebuah point dari x dan y dengan x sebagai absis dan y sebagai ordinat}
makePoint :: Float -> Float -> Point
makePoint x y = Pt x y

-- DEFINISI DAN SPESIFIKASI PREDIKAT
-- isOrigin: point -> boolean
-- {isOrigin(P) benar jika P adalah titik origin yaitu <0,0>}
isOrigin :: Point -> Bool
isOrigin (Pt x y) = x == 0 && y == 0

-- kuadran: point -> Int
-- {kuadran(P) menghitung kuadran dimana titik tersebut terletak. Syarat P bukan titik origin dan bukan terletak pada sumbu X atau pun sumbu Y}
-- prekondisi: P bukan titik origin dan tidak terletak pada sumbu X atau Y
kuadran :: Point -> Int
kuadran (Pt x y) =
    if x > 0 && y > 0 then
        1
    else if x < 0 && y > 0 then
        2
    else if x < 0 && y < 0 then
        3
    else
        4

-- DEFINISI OPERATOR/FUNGSI LAIN TERHADAP POINT
-- jarak: 2 point -> Float
-- {jarak(P1,P2) menghitung jarak antara 2 point P1 dan P2}
jarak :: Point -> Point -> Float
jarak (Pt w x) (Pt y z) = sqrt((w - y) * (w - y) + (x - z) * (x - z))

-- jarak0: point -> Float
-- {jarak0(P1) menghitung jarak titik terhadap titik pusat koordinat (0,0)}
jarak0 :: Point -> Float
jarak0 (Pt x y) = sqrt(x*x + y*y)

-- movePoint: Float -> Float -> point -> point
-- {movePoint(dx,dy,P) menggeser titik P sejauh dx pada sumbu x dan dy pada sumbu y}
movePoint :: Float -> Float -> Point -> Point
movePoint dx dy (Pt x y) = makePoint (x + dx) (y + dy)
