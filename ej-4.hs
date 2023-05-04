{- Definir las funciones fact1, fact2, fact3, que retornen el factorial de un entero dado. Una versión debe aplicar
guardas, otra pattern matching, y otra definida como lo deseen. Verificar el prototipo de cada función inferido por
Haskell. -}

-- Guards
fact1 x 
        | x < 2 = 1
        | otherwise = x*(fact1 (x-1))

-- Pattern matching
fact2 0 = 1
fact2 x = x*(fact2 (x-1))

-- Multiplicacion generando una lista
fact3 x = product [1..x]

