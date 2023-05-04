{- Ejercicio 8
Definir las funciones esta/noEsta tal que dado un elemento y una lista verifican que el elemento pertenece/no
pertenece a la lista. -}

esta x [] = False
esta x (y:resto)
    | x == y = True
    | otherwise = esta x resto

no_esta x l = not (esta x l)