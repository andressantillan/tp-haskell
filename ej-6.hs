-- Definir la función mayor/menor tal que dada una lista retorne el mayor/menor
-- de sus elementos.

mayor [] = error "Lista vacia"
mayor [x] = x
mayor (x:xs) = 
    if x > y then x else y
    where y = mayor xs

menor [] = error "Lista vacia"
menor [x] = x
menor (x:xs) = 
    if x < y then x else y
    where y = menor xs

