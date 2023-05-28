module Itinerario where

import Data.Char
import Data.List
import Cliente (TipoCliente, TipoAccion)
import Bebida (tomarTragos)

data TipoItinerario = Itinerario {
    nombre_itinerario::String,
    duracion::Float,
    acciones::[TipoAccion]
}

instance Show (TipoItinerario) where
    show itinerario = nombre_itinerario itinerario

realizarItinerario::TipoCliente->TipoItinerario->TipoCliente
realizarItinerario cliente itinerario = tomarTragos cliente (acciones itinerario)

intensidad::TipoItinerario->Float
intensidad itinerario = genericLength(acciones itinerario) / (duracion itinerario)

maxIntensidad::[TipoItinerario]->TipoItinerario
maxIntensidad [] = error "No hay itinerarios"
maxIntensidad [x] = x
maxIntensidad (x:resto) = 
    maxItinerario x (maxIntensidad resto)
    where maxItinerario i1 i2 =
            if intensidad i1 >= intensidad i2 
            then i1
            else i2

realizarItinerarioIntenso::TipoCliente->[TipoItinerario]->TipoCliente
realizarItinerarioIntenso cliente itinerarios = realizarItinerario cliente (maxIntensidad itinerarios)
