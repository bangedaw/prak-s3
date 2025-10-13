module Matrix where 

-- UTILITY FUNCTIONS
konsdot :: [Int] -> Int -> [Int]
konso :: Int -> [Int] -> [Int]
isEmpty :: [Int] -> Bool

konso e l = [e] ++ l
konsdot l e = l ++ [e]
isEmpty l = null l

konsdotMatrix :: [[Int]] -> [Int] -> [[Int]]
konsoMatrix :: [Int] -> [[Int]] -> [[Int]]
isEmptyMatrix :: [[Int]] -> Bool

konsoMatrix e l = [e] ++ l
konsdotMatrix l e = l ++ [e]
isEmptyMatrix l = null l

-- NOTES: Semua Index dipastikan valid, yaitu tidak negatif dan tidak melebihi panjang list/Matrix

-- MATRIX MANIPULATION FUNCTIONS
-- TYPE: Matrix adalah [[Int]]
-- Dengan definisi type sebagai berikut, kita dapat mensubstitusi [[Int]] dengan Matrix
type Matrix = [[Int]]

-- addAtIndex :: Int -> [Int] -> Int -> [Int]
-- {addAtIndex x l i menambahkan elemen x pada posisi i dalam l}
-- 
-- Note: list l mungkin kosong
--       Mengembalikan [x] apabila l kosong
addAtIndex :: Int -> [Int] -> Int -> [Int]
addAtIndex x [] _ = [x]
addAtIndex x l 0 = konso x l
addAtIndex x l i = konso (head l) (addAtIndex x (tail l) (i-1))

-- deleteAtIndex :: [Int] -> Int -> [Int]
-- {deleteAtIndex l i menghapus elemen pada posisi i dalam l}
-- 
-- Note: list l mungkin kosong
--       Mengembalikan [] apabila l kosong
deleteAtIndex :: [Int] -> Int -> [Int]
deleteAtIndex [] _ = []
deleteAtIndex l 0 = tail l
deleteAtIndex l i = konso (head l) (deleteAtIndex (tail l) (i-1))

-- editAtIndex :: [Int] -> Int -> Int -> [Int]
-- {editAtIndex l i newValue mengubah elemen l pada posisi i dengan newValue}
-- 
-- Note: list l mungkin kosong
--       Mengembalikan [] apabila l kosong
editAtIndex :: [Int] -> Int -> Int -> [Int]
editAtIndex [] _ _ = []
editAtIndex l 0 newValue = konso newValue (tail l)
editAtIndex l i newValue = konso (head l) (editAtIndex (tail l) (i-1) newValue)

-- addMatrixElement :: Matrix -> Int -> Int -> Int -> Matrix
-- {addMatrixElement m row col value menambahkan value pada posisi (row,col) dalam m}
-- 
-- Note: Matrix m mungkin kosong
--       Mengembalikan [] apabila m kosong
addMatrixElement :: Matrix -> Int -> Int -> Int -> Matrix
addMatrixElement [] _ _ _ = []
addMatrixElement (hm:tm) 1 col value = konsoMatrix (addAtIndex value hm col) tm
addMatrixElement (hm:tm) row col value = konsoMatrix hm (addMatrixElement tm (row-1) col value) 

-- deleteMatrixElement :: Matrix -> Int -> Int -> Matrix  
-- {deleteMatrixElement m row col menghapus elemen pada posisi (row,col) dalam m}
-- 
-- Note: Matrix m mungkin kosong
--       Mengembalikan [] apabila m kosong
deleteMatrixElement :: Matrix -> Int -> Int -> Matrix
deleteMatrixElement [] _ _ = []
deleteMatrixElement (hm:tm) 0 col = konsoMatrix (deleteAtIndex hm col) tm
deleteMatrixElement (hm:tm) row col = konsoMatrix hm (deleteMatrixElement tm (row-1) col)

-- editMatrixElement :: Matrix -> Int -> Int -> Int -> Matrix
-- {editMatrixElement m row col newValue mengubah elemen pada posisi (row,col) dengan newValue}
-- 
-- Note: Matrix m mungkin kosong
--       Mengembalikan [] apabila m kosong
editMatrixElement :: Matrix -> Int -> Int -> Int -> Matrix
editMatrixElement [] _ _ _ = []
editMatrixElement (hm:tm) 0 col newValue = konsoMatrix (editAtIndex hm col newValue) tm
editMatrixElement (hm:tm) row col newValue = konsoMatrix hm (editMatrixElement tm (row-1) col newValue)

-- getMatrixElement :: Matrix -> Int -> Int -> Int
-- {getMatrixElement m row col mengambil elemen pada posisi (row,col) dalam m}
-- 
-- Note: Matrix m mungkin kosong
--       Mengembalikan 0 apabila m kosong
getMatrixElement :: Matrix -> Int -> Int -> Int
getMatrixElement [] _ _ = 0
getMatrixElement ((hhm:thm):tm) 0 0 = hhm
getMatrixElement ((hhm:thm):tm) 0 col = getMatrixElement (thm:tm) 0 (col-1)
getMatrixElement (hm:tm) row 0 = getMatrixElement tm (row-1) 0

-- printMatrix :: Matrix -> IO ()
-- {printMatrix m mencetak m dalam format yang mudah dibaca}
printMatrix :: Matrix -> IO ()
printMatrix [] = putStrLn "Empty m"
printMatrix m = mapM_ print m
