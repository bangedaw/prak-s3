module CountOccurrence where

ngeluarinlist :: [[Int]] -> [Int]
ngeluarinlist [] = []
ngeluarinlist (l:ls) = l ++ ngeluarinlist ls

-- count(ListOfList, n) menghitung berapa kali integer n muncul di dalam sebuah list of list.
-- CONTOH: count [[1,2,1],[3],[1,4]] 1 menghasilkan 3
count :: [[Int]] -> Int -> Int
-- TODO : implementasi fungsi count 
count l n = 
    let 
        l1 = ngeluarinlist l
    in 
        length (filter (== n) l1)