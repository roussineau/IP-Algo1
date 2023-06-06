-- 1.1)
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)

-- 1.2)
ultimo :: [t] -> t
ultimo (x:[]) = x
ultimo (x:xs) = ultimo (xs)

-- 1.3)
principio :: [t] -> [t]
principio (x:[]) = []
principio (x:xs) = x : principio (xs)

-- 1.4)
reverso :: [t] -> [t]
reverso t
    | longitud t == 0 = []
    | otherwise = (ultimo t) : reverso (principio t)

-- 2.1)
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs)
    | e == x = True
    | otherwise = pertenece e xs

-- 2.2)
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales (x:[]) = True
todosIguales (x:xs) = x == head xs && todosIguales xs

-- 2.3)
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (_:[]) = True
todosDistintos (x:xs) = not (pertenece x (x:xs) && pertenece x (xs)) && todosDistintos (xs)

-- 2.4)
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos (t) = not (todosDistintos (t))

-- 2.5)
quitar :: (Eq t) => t -> [t] -> [t]
quitar t [] = []
quitar t (x:xs)
    | t == x = xs
    | otherwise = x : quitar t xs

-- 2.6)
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos t (x:xs)
    | t == x = quitarTodos t xs
    | otherwise = x : quitarTodos t xs

-- 2.7)
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (t:ts)
    | pertenece t ts = t : (eliminarRepetidos (quitarTodos t ts))
    | otherwise = t : eliminarRepetidos ts

-- 2.8)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos _ [] = False
mismosElementos [] _ = False
mismosElementos (t:ts) (x:xs)
    | pertenece t (x:xs) =  True && (mismosElementos (quitarTodos t (t:ts)) (quitarTodos t (x:xs)))
    | otherwise = False

-- Otra implementación útil:
-- mismosElementos :: (Eq t) => [t] -> [t] -> Bool
-- mismosElementos lista1 lista2 = listaPerteneceLista lista1 lista2 && listaPerteneceLista lista2 lista1

-- listaPerteneceLista :: (Eq t) => [t] -> [t] -> Bool
-- listaPerteneceLista [] lista = True
-- listaPerteneceLista (x:xs) ls = (pertenece x ls) && listaPerteneceLista xs ls

-- 2.9)
capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua (_:[]) = True
capicua (x:xs) = x == head (reverso xs) && capicua (principio xs)

-- 3.1)
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- 3.2)
productoria :: [Integer] -> Integer
productoria [] = 0
productoria (x:[]) = x
productoria (x:xs) = x * productoria xs

-- 3.3)
maximo :: [Integer] -> Integer
maximo (x:[]) = x
maximo (x:xs)
    | x > head xs = mayor x (maximo xs)
    | otherwise = mayor (head xs) (maximo (xs))

mayor :: Integer -> Integer -> Integer
mayor x y
    | x >= y = x
    | otherwise = y

-- 3.4)
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = (n + x) : sumarN n xs

-- 3.5)
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

-- 3.6)
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo t = sumarN (ultimo t) t

-- 3.7)
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | mod x 2 == 0 = x : pares xs
    | otherwise = pares xs

-- 3.8)
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN t (x:xs)
    | mod x t == 0 = x : multiplosDeN t xs
    | otherwise = multiplosDeN t xs

-- 3.9)
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar t = m : ordenar (quitar m t)
    where m = maximo t

-- 4.1)
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:[]) = [x]
sacarBlancosRepetidos (x:xs)
    | (x == ' ') && (head xs == ' ') = sacarBlancosRepetidos xs
    | otherwise = x : sacarBlancosRepetidos xs

-- 4.2)
contarPalabras :: [Char] -> Integer
contarPalabras (x:xs) = contarPalabrasAux t
    where t = limpiarPalabras (x:xs)

contarPalabrasAux :: [Char] -> Integer
contarPalabrasAux [] = 0 
contarPalabrasAux (x:[]) = 1
contarPalabrasAux (x:xs)
    | x == ' ' = 1 + contarPalabrasAux (xs)
    | otherwise = contarPalabrasAux (xs)

sacarBlancosExtremos :: [Char] -> [Char]
sacarBlancosExtremos (x:[]) = [x]
sacarBlancosExtremos [] = []
sacarBlancosExtremos (x:xs)
    | x == ' ' = sacarBlancosExtremos xs
    | ultimo xs == ' ' = sacarBlancosExtremos (principio (x:xs))
    | otherwise = (x:xs)

limpiarPalabras :: [Char] -> [Char]
limpiarPalabras t = sacarBlancosRepetidos (sacarBlancosExtremos t)

-- 4.3)
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga t = palabraMasLargaAux (palabras t)

palabraMasLargaAux :: [[Char]] -> [Char]
palabraMasLargaAux [] = []
palabraMasLargaAux (x:[]) = x
palabraMasLargaAux (x:xs)
    | compararPalabras x (head xs) == x = compararPalabras x (palabraMasLargaAux xs)
    | otherwise = compararPalabras (head xs) (palabraMasLargaAux xs)

compararPalabras :: [Char] -> [Char] -> [Char]
compararPalabras x y
    | longitud x >= longitud y = x
    | otherwise = y

-- 4.4)
palabras :: [Char] -> [[Char]]
palabras t = extraerPalabras t []

extraerPalabras :: [Char] -> [Char] -> [[Char]]
extraerPalabras [] [] = []
extraerPalabras [] palabra = [palabra]
extraerPalabras (x:xs) []
    | esEspacio x = extraerPalabras xs []
extraerPalabras (x:xs) palabra
    | esEspacio x = palabra : extraerPalabras xs []
    | otherwise = extraerPalabras xs (palabra ++ [x])

esEspacio :: Char -> Bool
esEspacio x = x == ' '

-- 4.5)
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

-- 4.6)
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs) = limpiarPalabras (x ++ [' '] ++ aplanarConBlancos xs)

-- 4.7)
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:[]) _ = x
aplanarConNBlancos (x:xs) n = sacarBlancosExtremos (x ++ (nBlancos n) ++ aplanarConNBlancos xs n)

nBlancos :: Integer -> [Char]
nBlancos n
    | n <=0 = []
    | otherwise = ' ' : nBlancos (n-1)

-- 5.1)
nat2bin :: Integer -> [Integer]
nat2bin 0 = [0]
nat2bin n = nat2binAux n []

nat2binAux :: Integer -> [Integer] -> [Integer]
nat2binAux 0 t = t
nat2binAux n t = nat2binAux (div n 2) ((mod n 2) : t)

-- La idea es ir dividiendo el número por 2 y obteniendo el residuo,
-- que será el dígito binario correspondiente. Luego, se divide el
-- cociente entre 2, y así sucesivamente hasta que el cociente sea cero.

-- 5.2)
bin2nat :: [Integer] -> Integer
bin2nat [0] = 0
bin2nat [1] = 1
bin2nat (x:xs) = x * 2^(longitud xs) + bin2nat xs

-- En el sistema binario, cada dígito tiene un valor de una potencia de 2.
-- La posición del dígito determina la potencia de 2 correspondiente.
-- Por ejemplo, el número binario "1101" representa el número decimal 13, ya que:
-- 1 * 2^3 + 1 * 2^2 + 0 * 2^1 + 1 * 2^0 = 8 + 4 + 0 + 1 = 13.

-- 5.3)
nat2hex :: Integer -> [Char]
nat2hex 0 = [head hexas]
nat2hex n
    | n < 16 = [hexas !! (fromInteger n)]
    | otherwise = [hexas !! (fromInteger (div n 16))] ++ nat2hex (mod n 16)

hexas :: [Char]
hexas = ['0'..'9'] ++ ['A'..'F']

-- 5.4)
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada t = sumaAcumuladaAux 0 t
  where
    sumaAcumuladaAux _ [] = []
    sumaAcumuladaAux s (x:xs) = (s + x) : sumaAcumuladaAux (s + x) xs

-- 5.5)
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:[]) = [descomponerNumEnPrimos x]
descomponerEnPrimos (x:xs) = descomponerNumEnPrimos x : descomponerEnPrimos(xs)

descomponerNumEnPrimos :: Integer -> [Integer]
descomponerNumEnPrimos n = descomponerNumEnPrimosAux n 2

descomponerNumEnPrimosAux :: Integer -> Integer -> [Integer]
descomponerNumEnPrimosAux 1 k = []
descomponerNumEnPrimosAux n k
    | esPrimo n = [n]
    | esPrimo k && mod n k == 0 = k : descomponerNumEnPrimosAux (div n k) k
    | k >= n = []
    | otherwise = descomponerNumEnPrimosAux n (k+1)

esPrimo :: Integer -> Bool
esPrimo n = encontrarDivisor n 2 == n

encontrarDivisor :: Integer -> Integer -> Integer
encontrarDivisor n k | mod n k == 0 = k
                     | k+1 > n = n
                     | otherwise = encontrarDivisor n (k+1)