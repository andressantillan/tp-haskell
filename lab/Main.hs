import Cliente
import Bebida
import Itinerario

rodri = Cliente "Rodri" 55 [] [tintico]
marcos = Cliente "Marcos" 40 [rodri] [klusener "guinda"]
cristian = Cliente "Cristian" 2 [] [grogxd, jarraLoca]
ana = Cliente "Ana" 120 [rodri, marcos] []
robertoCarlos = Cliente "Roberto Carlos" 165 [] []

mezclaExplosiva = Itinerario "Mezcla Explosiva" 2.5 [grogxd, grogxd, klusener "huevo", klusener "frutilla"]
itinerarioBasico = Itinerario "Basico" 5 [jarraLoca, klusener "chocolate", rescatarse 2, klusener "huevo"]
salidaDeAmigos = Itinerario "Salida de amigos" 1 [soda 1, tintico, agregarAmigo robertoCarlos, jarraLoca]

agregarAmigos::Int->TipoCliente->[TipoCliente]->TipoCliente
agregarAmigos 0 cliente [] = cliente
agregarAmigos 0 cliente _ = cliente
agregarAmigos n cliente (nuevoAmigo:resto) = agregarAmigos (n-1) (accion (agregarAmigo nuevoAmigo) cliente) (amigos nuevoAmigo ++ resto)

jarraPopular::Int->TipoCliente->TipoCliente
jarraPopular nivel cliente =
    agregarAmigos nivel cliente (amigos cliente)

{- Pruebas -}
-- Objetivo 3
prueba31 = comoEsta cristian
prueba32 = comoEsta rodri
prueba33 = comoEsta marcos
prueba34 = comoEsta (accion (agregarAmigo ana) (accion (agregarAmigo rodri) cristian))

-- Objetivo 4
prueba41 = accion (agregarAmigo rodri) rodri
prueba42 = accion (agregarAmigo rodri) marcos
prueba43 = accion (agregarAmigo marcos) rodri

-- Objetivo 5
prueba51 = realizarAccion ana grogxd
prueba52 = realizarAccion ana jarraLoca
prueba53 = realizarAccion ana (klusener "huevo")
prueba54 = realizarAccion ana (klusener "chocolate")
prueba55 = realizarAccion cristian tintico
prueba56 = realizarAccion ana tintico
prueba57 = realizarAccion rodri (soda 2)
prueba58 = realizarAccion ana (soda 10)
prueba59 = realizarAccion ana (soda 0)

-- Objetivo 6
prueba61 = accion (rescatarse 5) rodri
prueba62 = accion (rescatarse 1) rodri

{- Segunda parte pruebas -}

prueba1b = realizarAccion marcos (soda 3)
prueba11c = tomarTragos rodri [soda 1, soda 2]
prueba12c = tomarTragos marcos [klusener "huevo", tintico, jarraLoca]

prueba11d = dameOtro ana
prueba12d = dameOtro marcos
prueba13d = dameOtro (realizarAccion rodri (soda 1))

prueba21b = cualesPuedeTomar rodri [grogxd, tintico, klusener "frutilla"]
prueba22b = cualesPuedeTomar rodri [grogxd, tintico, klusener "fruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuutilla"]

prueba3b = realizarItinerario rodri salidaDeAmigos

prueba41a = intensidad mezclaExplosiva
prueba42a = intensidad salidaDeAmigos
prueba43a = intensidad itinerarioBasico

prueba41b = maxIntensidad [salidaDeAmigos, mezclaExplosiva, itinerarioBasico]
prueba42b = realizarItinerarioIntenso rodri [salidaDeAmigos, mezclaExplosiva, itinerarioBasico]

pruebaJp1 = jarraPopular 0 (accion (agregarAmigo ana) robertoCarlos)
pruebaJp2 = jarraPopular 3 (accion (agregarAmigo ana) robertoCarlos)
pruebaJp3 = jarraPopular 4 (accion (agregarAmigo (accion (agregarAmigo ana) cristian)) robertoCarlos)
