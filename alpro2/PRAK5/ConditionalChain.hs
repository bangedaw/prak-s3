module ConditionalChain where

konso:: a -> [a] -> [a]
konso e l = e : l

konsDot:: [a] -> a -> [a]
konsDot l e = l ++ [e]

-- Deskripsi:
-- Fungsi `conditionalChain` menerima sebuah pasangan aturan yang terdiri dari
-- kondisi dan fungsi transformasi, serta sebuah list (bisa kosong).
-- Setiap elemen pada list akan dicek terhadap kondisi tersebut.
-- Jika elemen memenuhi kondisi, maka elemen tersebut akan diubah
-- menggunakan fungsi transformasi. Jika tidak, elemen dibiarkan tetap.

-- Contoh:
-- conditionalChain ((\x -> x < 0), (\x -> x - 1)) [-2, 0, 4] => [-3, 0, 4]

conditionalChain :: (a -> Bool, a -> a) -> [a] -> [a]
conditionalChain (_, _) [] = []
conditionalChain (f1, f2) l = 
    if f1 (head l) then konso (f2 (head l)) (conditionalChain (f1, f2) (tail l))
    else konso (head l) (conditionalChain (f1, f2) (tail l))
        
-- TODO
-- Note: Dilarang menggunakan map