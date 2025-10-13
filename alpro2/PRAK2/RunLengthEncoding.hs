module RunLengthEncoding where

runLengthEncoding :: String -> [(Char, Int)]
runLengthEncoding ls = 
    bantuaku (head ls) 1 (tail ls)
    where
        bantuaku rn count [] = [(rn, count)]
        bantuaku rn count lrs = 
            if rn == head lrs then bantuaku rn (count+1) (tail lrs)
            else [(rn, count)] ++ bantuaku (head lrs) 1 (tail lrs)