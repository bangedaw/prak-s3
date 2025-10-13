module ColumnOperations where 

konsdot :: [Int] -> Int -> [Int]
konso :: Int -> [Int] -> [Int]
isEmpty :: [Int] -> Bool

-- REALISASI
konso e l = [e] ++ l
konsdot l e = l ++ [e]
isEmpty l = null l

-- Lengkapi Fungsi di bawah ini
konsLo :: [Int] -> [[Int]] -> [[Int]]
konsLo l s = l : s

transposeMatrix :: [[Int]] -> [[Int]]
transposeMatrix [] = []
transposeMatrix l1@(lh:lt) 
    | null lh = []
    | otherwise = konsLo (map head l1) (transposeMatrix (map tail l1))

getIndex :: [[Int]] -> [Int] -> Int
getIndex (hm:tm) l 
    | hm == l = 1
    | otherwise = 1 + getIndex tm l

columnOperations :: [[Int]] -> [Int]
columnOperations [] = []
columnOperations m@(hm:tm) =
    let
        m1 = transposeMatrix l
    in
        
