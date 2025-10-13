module SlidingWindow where

konso:: a -> [a] -> [a]
konso e l = e : l

konsDot:: [a] -> a -> [a]
konsDot l e = l ++ [e]


isEmpty:: [a] -> Bool
isEmpty l = null l

nbElement:: [a] -> Int
nbElement l = if isEmpty l then 0 else 1 + nbElement (tail l)

{-|
  TakeN menerima sebuah integer n dan sebuah list l, dan menghasilkan sebuah list yang berisi n elemen pertama dari l. Jika n lebih besar dari panjang l, maka dihasilkan l itu sendiri.
  Prekondisi: n >= 0, l bisa kosong.
-}
takeN:: Int -> [a] -> [a]
takeN 0 _ = []
takeN n li = 
    if n > length li then li
    else konso (head li) (takeN (n-1) (tail li))
-- TODO

{-|
  Deskripsi:
  Fungsi slidingWindow menerima sebuah integer ukuran window n prekondisi : 0 < n <= panjang xs,
  sebuah fungsi pemroses f, dan sebuah list xs, prekondisi : panjang xs > 0. Fungsi ini akan
  menghasilkan sebuah list baru yang berisi hasil dari penerapan
  fungsi f ke setiap window dengan ukuran n. Dapat menggunakan fungsi takeN.

  Contoh:
  slidingWindow 3 windowRange [1, 2, 3, 4, 5] akan menghasilkan [2, 2, 2]
-}
slidingWindow :: Int -> ([a] -> b) -> [a] -> [b]
slidingWindow _ _ [] = []
slidingWindow n f l =
    let
        l1 = takeN n l
    in 
        if length l1 == n then
            konso (f(l1)) (slidingWindow n f (tail l)) 
        else
            slidingWindow n f (tail l)
    
-- TODO

{-|
  Deskripsi:
  Fungsi windowRange menghasilkan selisih antara nilai maksimum dan nilai minimum dari list tersebut.
  nilai minimum dari list tersebut.

  Contoh:
  windowRange [1, 2, 3, 4, 5] akan menghasilkan 4
-}
windowRange:: [Int] -> Int
windowRange li = (maximum li) - (minimum li)
-- TODO

makeList :: Int -> Int-> [Int]
makeList _ 0 = []
makeList x n = konso x (makeList x (n-1))
