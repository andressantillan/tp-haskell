{-
    Definir el prototipo que Haskell infiere de la siguiente función y analizar el objetivo y prototipo de la función (++):
    hola "Juan" = "Hola, qué dia ¿no?"
    hola nombre = "Buenas " ++ nombre ++ " ¿todo bien?"
    El operador ++ se utiliza para concatenar listas,
    en este caso una lista de caracteres.
-}
hola :: String a => String x
hola :: a => String x