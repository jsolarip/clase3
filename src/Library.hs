module Library where
import PdePreludat


type Horas = Number
type Objetivo = String
type Presion = Number

presionGolpe :: Horas -> Objetivo -> Presion
presionGolpe horas objetivo = poder horas / fortaleza objetivo

poder :: Horas -> Number
poder = (* 15)

fortaleza :: Objetivo -> Number
fortaleza = (2*) . length

type Golpe = Objetivo -> Number

gomuGomu :: Golpe
gomuGomu = presionGolpe 180

normalesConsecutivos :: Golpe 
normalesConsecutivos = presionGolpe 240

objetivoDificil::Objetivo->Bool
objetivoDificil=(100>).gomuGomu

objetivoAccesible::Objetivo->Bool
objetivoAccesible=(between 200 400).normalesConsecutivos.focalizarObjetivo


focalizarObjetivo::Objetivo->Objetivo
focalizarObjetivo= take 7

between :: Ord a => a -> a -> a -> Bool
between bajo alto medio = bajo <= medio && medio <= alto