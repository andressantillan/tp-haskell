{- Definir la función vmax/vmin (funciones max/min de Prelude) tal que dados 2 enteros retorne el mayor/menor.
Analizar las modificaciones a introducir si se desea obtener el mayor/menor de 2 caracteres. Ídem para 2 strings.
Definir en forma genérica las funciones vmax y vmin tal que retornen el mayor/menor de 2 valores dados.
 -}

 -- Al escribir con guards los casos, se cubrio tambien los casos
 -- en donde se manejan char y strings respectivamente.
 
vmin x y 
    | x < y = x
    | y < x = y
    | x == y = x

vmax x y
    | x > y = x
    | y > x = y
    | x == y = x



