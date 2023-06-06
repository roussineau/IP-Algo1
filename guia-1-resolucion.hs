-- 1 a)
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

-- 1 b)
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1

-- 1 c)
h :: Integer -> Integer
h n = f(m)
    where m = g(n)

k :: Integer -> Integer
k n = g(m)
    where m = f(n)

-- 2 a)
absoluto :: Integer -> Integer
absoluto n | n > 0 = n
           | n == 0 = 0
           | otherwise = -n

-- 2 b)
maximoabsoluto :: Integer -> Integer -> Integer
maximoabsoluto n m | absoluto(n) > absoluto(m) = n
                   | absoluto(m) > absoluto(n) = m
                   | otherwise = n

-- 2 c)
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 n m p | (n > m || n == m) && (n > p || n==p) = n
              | (m > n || n == m) && (m > p || n==p) = m
              | (p > n || n == p) && (p > m || m==p) = p

-- 2 d)
--algunoEs0 :: Float -> Float -> Bool
--algunoEs0 n m = n==0 || m == 0

algunoEs0 :: Float -> Float -> Bool
algunoEs0 0 _ = True
algunoEs0 _ 0 = True
algunoEs0 _ _ = False

-- 2 e)
--ambosSon0 :: Float -> Float -> Bool
--ambosSon0 n m = n == 0 && m == 0

ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True
ambosSon0 _ _ = False

-- 2 f)
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo n m | n <= 3 && m <= 3 = True
                   | n > 3 && n<= 7 && m > 3 && m<= 7 = True
                   | n > 7 && m > 7 = True
                   | otherwise = False

-- 2 g)
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos n m p | (n == m && n /= p) || (p == m && p /= n) = n + p
                    | (n == p && n /= m) || (m == p && m /= n) = n + m
                    | (n == m && p /= m) || (n == p && m /= p) = m + p
                    | (n == m && m == p) = n
                    | otherwise = n + m + p

-- 2 h)
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe n m = mod n m == 0

-- 2 i)
digitoUnidades :: Integer -> Integer
digitoUnidades n = div n 10

-- 2 j)
digitoDecenas :: Integer -> Integer
digitoDecenas n = (div n 100)*10 + (mod n 10)

-- 3)
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados n m = n*n + n*m*k == 0
    where k = -(div n m)

-- 4 a)
prodInt :: (Integer, Integer) -> (Integer, Integer) -> Integer
prodInt (n, m) (r, s) = n*r + m*s

-- 4 b)
todoMenor :: (Integer, Integer) -> (Integer, Integer) -> Bool
todoMenor (n, m) (r, s) = n < r && m < s

-- 4 c)
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (m, n) (r, s) = sqrt ((m-r)^2 + (n-s)^2)

-- 4 d)
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (n, m, r) = n+m+r

-- 4 e)
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (n, m, p) q | (mod n q == 0) && (mod m q == 0) && (mod p q == 0) = n+m+p
                               | (mod n q == 0) && (mod m q == 0) = n+m
                               | (mod n q == 0) && (mod p q == 0) = n+p
                               | (mod m q == 0) && (mod p q == 0) = m+p
                               | (mod n q == 0) = n
                               | (mod m q == 0) = m
                               | (mod p q == 0) = p
                               | otherwise = 0

-- 4 f)
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (n, m, p) | even n = 1
                       | even m = 2
                       | even p = 3
                       | otherwise = 4

-- 4 g)
crearPar :: t -> s -> (t, s)
crearPar n m = (n, m)

-- 4 h)
invertir :: (t, s) -> (s, t)
invertir (n, m) = (m, n)

-- 5)
todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (n, m, p) = subF(n)>subG(n) && subF(m)>subG(m) && subF(p)>subG(p)

subF :: Integer -> Integer
subF n | n<=7 = n^2
       | otherwise = 2*n-1

subG :: Integer -> Integer
subG n | even n = div n 2
       | otherwise = 3*n + 1

-- 6)
bisiesto :: Integer -> Bool
bisiesto year = not (mod year 4 /= 0 || (mod year 100 == 0 && mod year 400 /= 0))

-- 7)
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (n, m, p) (a, b, c) = abs (n-a) + abs (m-b) + abs (p-c)

-- 8)
comparar :: Integer -> Integer -> Integer
comparar n m | sumaUltimosDosDigitos(n) < sumaUltimosDosDigitos(m) = 1
             | sumaUltimosDosDigitos(n) > sumaUltimosDosDigitos(m) = -1
             | otherwise = 0

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos n = mod n 10 + mod (div n 10) 10

{- 9)

a) f1 devuelve 1 si n es igual a cero, y devuelve cero en cualquier otro caso.
b) f2 devuelve 15 si n es igual a 1, y devuelve -15 si n es igual a -1. en otros casos da error, porque no esta definida.
c) f3 devuelve 7 si n es menor o igual a 9, y devuelve 5 si n es mayor o igual a 3. en los casos en los que se cumplen ambas condiciones, solo devuelve la primera por ser un lenguaje lazy.
d) f4 devuelve la mitad de la suma de los flotantes x e y.
e) f5 devuelve la mitad de la suma de las componentes de la tupla (x, y)
f) f6 devuelve true o false dependiendo de si la parte entera del flotante a coincide con el entero b.

-}