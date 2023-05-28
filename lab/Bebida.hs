module Bebida where

import Data.Char
import Data.List
import Cliente

-- Consulta objetivo 7
-- klusener "huevo" (rescatarse 2 (klusener "chocolate" (jarraLoca cliente4)))
accionGrogxd :: TipoCliente -> TipoCliente
accionGrogxd c = c {resistencia = 0, historial = historial c ++ [grogxd]}

accionJarraLoca :: TipoCliente -> TipoCliente
accionJarraLoca c = c {
    resistencia = resistencia c - 10,
    amigos = disminuirResistencia,
    historial = historial c ++ [jarraLoca]
} where disminuirResistencia = map accionJarraLoca (amigos c)

accionKlusener:: [Char] -> TipoCliente -> TipoCliente
accionKlusener gusto c = c {resistencia = disminuirResistencia c (length gusto), historial = historial c ++ [klusener gusto]}
    where disminuirResistencia c x = resistencia c - toInteger x

accionTintico :: TipoCliente -> TipoCliente
accionTintico c = c {resistencia = aumentarResistencia c (length (amigos c)), historial = historial c ++ [tintico]} 
    where aumentarResistencia c x = resistencia c + 5 * (toInteger x)

accionSoda :: Int -> TipoCliente -> TipoCliente
accionSoda fuerza c = c {nombre = agregarErp fuerza (nombre c), historial = historial c ++ [soda fuerza]}
    where agregarErp f c = "e" ++ concat(replicate f "r") ++ "p" ++ c

-- tomarTragos rodri [soda 1, soda 2]
tomarTragos :: TipoCliente -> [TipoAccion] -> TipoCliente
tomarTragos cliente bebidas = foldl (\c b -> realizarAccion c b) cliente bebidas

dameOtro :: TipoCliente -> TipoCliente
dameOtro cliente = realizarAccion cliente (last (historial cliente))

-- cualesPuedeTomar rodri [soda 2, soda 5, klusener "frutillaaaaaaaaaa", grogxd, jarraLoca]
cualesPuedeTomar :: TipoCliente -> [TipoAccion] -> [TipoAccion]
cualesPuedeTomar cliente bebidas = filter (noMeDejaEnComa cliente) bebidas
    where noMeDejaEnComa c b =
            let cAux = accion b c
            in (resistencia cAux) > 0

cuantasPuedeTomar::TipoCliente -> [TipoAccion] -> Int
cuantasPuedeTomar cliente bebidas = length (cualesPuedeTomar cliente bebidas)

grogxd = Accion "grogxd" accionGrogxd
jarraLoca = Accion "jarra loca" accionJarraLoca
tintico = Accion "tintico" accionTintico
klusener gusto = Accion ("klusener " ++ gusto) (accionKlusener gusto)
soda fuerza = Accion "soda" (accionSoda fuerza)