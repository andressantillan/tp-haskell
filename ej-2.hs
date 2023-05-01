{-
    Lo que hace la funcion gcd de Prelude,
    es retornar el mayor comun divisor entre X e Y.
    En este caso, si se llama la funcion con parametros 0 0,
    retorna un mensaje de error para 0 0.
    En gcd x y, define gcd' donde se reguarda de no recibir valores negativos,
    estos pasan a positivos mediante la funcion abs, que devuelve el valor absoluto de un numero.
    Seguido de la clausula where, si y=0, el gcd entre x e y es x.
    Despues, con x e y, aplica la funcion gcd' para determinar el gcd entre y
    y el resto de la division entre x e y.
-}
gcd :: Integral a => a -> a -> a
gcd 0 0 = error "Prelude.gcd: gcd 0 0 is undefined"
gcd x y = gcd' (abs x) (abs y)
            where   gcd' x 0 = x
                    gcd' x y = gcd' y (x `rem` y)