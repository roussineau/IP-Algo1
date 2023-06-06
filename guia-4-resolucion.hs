-- 1)
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n-1) + fibonacci(n-2)

-- 2)
parteEntera :: Float -> Integer
parteEntera n = truncate n

-- 3)
esDivisible :: Integer -> Integer -> Bool
esDivisible n m | n<m = False
                | n==m = True
                | otherwise = esDivisible(n-m) m

-- 4)
sumaImpares :: Integer -> Integer
sumaImpares n | n==1 = 1
              | otherwise = sumaImpares(n-1) + 2*n-1

-- 5)
medioFact :: Integer -> Integer
medioFact n | n==0 = 1
            | n==1 = 1
            | otherwise = medioFact(n-2)*n

-- 6)
sumaDigitos :: Integer -> Integer
sumaDigitos n | n<10 = n
              | otherwise = mod n 10 + sumaDigitos(div n 10)

-- 7)
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n<10 = True
                      | otherwise = digitosIguales (mod n 10) (div n 10)

digitosIguales :: Integer -> Integer -> Bool
digitosIguales n m | m<10 = n == m
                   | otherwise = (n == mod m 10) && digitosIguales n (div m 10)

-- 8)
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i = mod (div n x) 10
    where x = 10^((cantDigitos n)-i)

cantDigitos :: Integer -> Integer
cantDigitos n | div n 10 == 0 = 1
              | otherwise = cantDigitos (div n 10) + 1

-- 9)
esCapicua :: Integer -> Bool
esCapicua n = n == invertir n

invertir :: Integer -> Integer
invertir n | n < 10 = n
           | otherwise = (mod n 10)*(10^((cantDigitos n)-1)) + invertir (div n 10)

-- 10 a)
f1 :: Integer -> Integer
f1 n | n <= 0 = 2^n
     | otherwise = 2^n + f1 (n-1)

-- 10 b) 
f2 :: Integer -> Float -> Float
f2 n q | n <= 1 = q^n
       | otherwise = q^n + f2 (n-1) q

-- 10 c)
f3 :: Integer -> Float -> Float
f3 n q = f2 (2*n) q

-- 10 d)
f4 :: Integer -> Float -> Float
f4 n q = f4Aux (2*n) n q

f4Aux :: Integer -> Integer -> Float -> Float
f4Aux n i q | i == n = q^n
            | otherwise = q^n + f4Aux (n-1) i q

-- 11 a)
eAprox :: Integer -> Float
eAprox n | n == 0 = 1.0
         | otherwise = 1.0 / fromIntegral (factorial n) + eAprox (n-1)

factorial :: Integer -> Integer
factorial n | n == 0 = 1
            | otherwise = n * factorial (n-1)

-- 11 b)
e :: Float
e = eAprox 10

-- 12)
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = (sucesionA2 n) - 1.0

sucesionA2 :: Integer -> Float
sucesionA2 n | n <= 1 = 2.0
             | otherwise = 2.0 + (1.0 / sucesionA2 (n-1))

-- 13)
sumatoriaTotal :: Integer -> Integer -> Integer
sumatoriaTotal n m = sumatoriaEnI n m 1 1

sumatoriaEnI :: Integer -> Integer -> Integer -> Integer -> Integer
sumatoriaEnI n m j i | n <= 1 = sumatoriaEnJ n m j i
                     | otherwise = (sumatoriaEnJ n m j n) + (sumatoriaEnI (n-1) m j i)

sumatoriaEnJ :: Integer -> Integer -> Integer -> Integer -> Integer
sumatoriaEnJ n m j i | m <= 1 = i
                     | otherwise = i^m + sumatoriaEnJ n (m-1) j i

-- 14)
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias _ 0 _ = 0
sumaPotencias q n m = sumaPotencias q (n-1) m + sumatoriaInterna2 q n m

sumatoriaInterna2 :: Integer -> Integer -> Integer -> Integer
sumatoriaInterna2 _ _ 0 = 0
sumatoriaInterna2 n j k = n^(j+k) + sumatoriaInterna2 n j (k-1)

-- 15)
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales n m = sumatoriaEnN n m 1.0 

sumatoriaEnN :: Integer -> Integer -> Float -> Float
sumatoriaEnN n m p | n <= 1 = sumatoriaEnM n m p
                   | otherwise = sumatoriaEnM n m (fromIntegral n) + sumatoriaEnN (n-1) m p

sumatoriaEnM :: Integer -> Integer -> Float -> Float
sumatoriaEnM n m p | m <= 1 = p
                   | otherwise = p / fromIntegral m + sumatoriaEnM n (m-1) p

-- 16 a)
menorDivisor :: Integer -> Integer
menorDivisor n = encontrarDivisor n 2

encontrarDivisor :: Integer -> Integer -> Integer
encontrarDivisor n k | mod n k == 0 = k
                     | k+1 > n = n
                     | otherwise = encontrarDivisor n (k+1)

-- 16 b)
esPrimo :: Integer -> Bool
esPrimo n = encontrarDivisor n 2 == n

-- 16 c)
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos m n = gcd m n == 1

-- 16 d)
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = (listaDePrimos n) !! (fromIntegral (n-1))

listaDePrimos :: Integer -> [Integer]
listaDePrimos n = take (fromIntegral n) (filter esPrimo [2..])
{-
La función take toma un número entero n y una lista xs, y devuelve
una nueva lista que contiene los primeros n elementos de xs.

La función filter toma una función de predicado p y una lista xs, y
devuelve una nueva lista que contiene solo los elementos de xs para
los cuales la función p devuelve True
-}

-- 17)
