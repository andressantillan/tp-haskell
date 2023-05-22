import Data.Char
import Data.List

-- Una materia tiene:
-- * [X] nombre
-- * [X] año
-- * [X] cuatrimestre
-- * [X] una lista de correlativas
data TipoMateria = Materia {
        nombre :: String,
        anio:: Integer,
        cuatrimestre:: Integer,
        correlativas :: [TipoMateria]
    } deriving Show 

agregarMateria :: TipoMateria -> TipoMateria -> TipoMateria
agregarMateria (Materia nombre anio cuatrimestre correlativas) m2 = 
                Materia nombre anio cuatrimestre (correlativas ++ [m2])


-- [X] ¿Cómo se comparan materias?
-- [X] ¿Cómo ordenar materias?
-- ¿Cómo se pueden agregar materias correlativas?

instance Eq TipoMateria where
    m1 == m2 = lowercase (nombre m1) == lowercase (nombre m2)
        where lowercase s = map toLower s

-- Materia 3ero 1er Cuatrimestre
-- Materia 3ero 2do Cuatrimestre
-- Materia 4to 2do Cuatrimestre

instance Ord TipoMateria where
    -- Comparo el anio y si son iguales,  comparo el cuatrimestre
    m1 <= m2 
        | anio m1 == anio m2 = cuatrimestre m1 <= cuatrimestre m2
        | otherwise = anio m1 <= anio m2

m1  = Materia "Paradigmas" 4 1 []
m2 = Materia "Redes" 4 1 []  
m3 = Materia "Distribuidos" 4 2 []  

materias = [m1, m3, m2]
