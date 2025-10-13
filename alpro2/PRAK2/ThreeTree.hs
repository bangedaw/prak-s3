module ThreeTree where
    threeTree :: [Int] -> [Int]
    threeTree l
        | null l = []
        | otherwise =
            if length l > 0 then
                if mod (head l) 3 == 0 then
                    [head l] ++ threeTree (tail l)
                else 
                    threeTree (tail l)
            else 
                l