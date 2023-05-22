import Data.Char
import Data.List

data TipoCliente = Cliente {
    nombre::String,
    resistencia::Integer,
    amigos::[TipoCliente]
} deriving Show 

cliente1 = Cliente "Rodri" 55 []
cliente2 = Cliente "Marcos" 40 [cliente1]
cliente3 = Cliente "Cristian" 2 []
cliente4 = Cliente "Ana" 120 [cliente1, cliente2]

comoEsta cliente 
    | resistencia cliente >= 50 = "Fresco"
    | resistencia cliente < 50 && length (amigos cliente) > 1 = "Piola"
    | otherwise = "Durisimoooooo"

instance Eq TipoCliente where
    c1 == c2 = lowercase(nombre c1) == lowercase(nombre c2)
            where lowercase s = map toLower s

-- c1 agrega a c2
agregarAmigo c1 c2 
    | c1 == c2 = c1 -- Si me quiero agregar a mi mismo como amigo, no puedo. Devuelvo c1
    | elem c2 (amigos c1) = c1
    | otherwise = c1 { amigos = amigos c1 ++ [c2]}
