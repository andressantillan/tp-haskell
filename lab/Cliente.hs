module Cliente where

import Data.Char
import Data.List

data TipoCliente = Cliente {
    nombre::String,
    resistencia::Integer,
    amigos::[TipoCliente],
    historial::[TipoAccion]
}deriving Show

data TipoAccion = Accion {
    nombre_accion::String,
    accion::(TipoCliente -> TipoCliente)
}

instance Show (TipoAccion) where
    show accion = nombre_accion accion

instance Eq TipoCliente where
    c1 == c2 = lowercase(nombre c1) == lowercase(nombre c2)
            where lowercase s = map toLower s

comoEsta::TipoCliente->String
comoEsta cliente 
    | resistencia cliente >= 50 = "Fresco"
    | resistencia cliente < 50 && length (amigos cliente) > 1 = "Piola"
    | otherwise = "Durisimoooooo"

-- c1 agrega c2 (invertido)
accionAgregarAmigo::TipoCliente->TipoCliente->TipoCliente
accionAgregarAmigo c2 c1 
    | c1 == c2 = c1 -- Si me quiero agregar a mi mismo como amigo, no puedo. Devuelvo c1
    | elem c2 (amigos c1) = c1
    | otherwise = c1 { amigos = amigos c1 ++ [c2]}

accionRescatarse::Int->TipoCliente->TipoCliente
accionRescatarse horas c
    | horas <= 0 = c
    | horas > 0 && horas < 3 = c {resistencia = resistencia c + 100}
    | otherwise = c {resistencia = resistencia c + 200}

realizarAccion :: TipoCliente -> TipoAccion -> TipoCliente
realizarAccion cliente accionAux = accion accionAux cliente

agregarAmigo nuevoAmigo = Accion ("Agregar a " ++ (nombre nuevoAmigo)) (accionAgregarAmigo nuevoAmigo)
rescatarse h = Accion "Rescatarse" (accionRescatarse h)
