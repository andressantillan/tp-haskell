{- Ejercicio 11
Definir la función select (filter de Prelude) 
tal que dado un criterio de selección y una lista retorna los elementos
de la lista que verifican el criterio. -}

select :: (a->Bool) -> [a] -> [a]
select x [] = []
select x (e:resto) 
    | x e = (e:select x resto)
    | otherwise = select x resto

select x [] = []
select x (e:resto) =
    if x e then (e:select x resto) else select x resto