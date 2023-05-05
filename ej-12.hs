{- Analizar la función (.) definida en Prelude, definir su objetivo y determinar si los ejemplos de aplicación son
correctos o no:
(.) :: (b -> c) -> (a -> b) -> (a -> c)
(f . g) x = f (g x)
-- Ejemplos
g1 x = (not . esta) x
g2 x = not . esta x
g3 x xs = not . esta x xs
g4 = cuadrado . cuadrado
g5 x = (cubo . cubo) x
g6 = sum . map length
g7 = filter even . map length
g8 = (+1) . flip div 2
g9 x = length . (++ x)
g10 x y = length . (++ x) -}

-- El objetivo de la funcion (.) es realizar la composicion de funciones, es decir
-- dado a . b, utilizar el resultado de la funcion b como argumento para la funcion a.

--  g1 x = (not . esta) x => No funciona ya que los tipos que las funciones retornan, no concuerdan
--  g2 x = not . esta x => Funciona, y su funcionamiento es decir si el elemento x NO pertenece a la lista
--  g3 x xs = not . esta x 



xs  