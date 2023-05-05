{- Ejercicio 10
Definir la función collect (map de Prelude) tal que dada una función y una lista aplica la función a 
cada elemento de la lista y retorna la lista de resultados -}

collect :: (a->b) -> [a] -> [b]
collect x [] = []
collect x (e:resto) =  (x e:collect x resto)