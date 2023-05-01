fact1 x 
        | x < 2 = 1
        | otherwise = x*(fact1 (x-1))