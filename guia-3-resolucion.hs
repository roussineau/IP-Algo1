-- 1) a)
f1 :: Int -> Int
f1 n | n == 1 = 8
     | n == 4 = 131
     | n == 16 = 16

-- 1) b)
g :: Int -> Int
g n | n == 8 = 16
    | n == 16 = 4
    | n == 131 = 1

-- 2) a)
absoluto :: Int -> Int
absoluto n | n < 0 = -n
           | n >= 0 = n

-- 2) b)
maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y | absoluto(x) > absoluto(y) = absoluto(x)
                   | absoluto(x) < absoluto(y) = absoluto(y)

-- 2) c)
maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | x > y && x > z = x 
              | y > x && y > z = y
              | z > x && z > y = z

-- 2) d) 
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | x == 0 = True
              | y == 0 = True
              | otherwise = False

algunoEs0PM :: Float -> Float -> Bool
algunoEs0PM 0 _ = True
algunoEs0PM _ 0 = True
algunoEs0PM _ _ = False


-- 2) e) 
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False

-- 2) f) 
mismoIntervalo :: Int -> Int -> Bool
mismoIntervalo x y | (x < 3) && (y <= 3) = True
                   | (x > 3) && (y <= 7) = True
                   | (x > 7) && ( y > 7 ) = True
                   | otherwise = False

-- 2) g) 
sumaDistintos :: Int -> Int -> Int -> Int 
sumaDistintos x y z | (x == y || x == z) && y /= z = y + z
                    | (y == z || y == x) && x /= z = x + z
                    | (x == y && x == z) && y == z = 0
                    | otherwise = x + y + z

-- 2) h) 
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False

-- 2) i)
digitoUnidades :: Int -> Int
digitoUnidades x | x < 10 = x
                 | otherwise = digitoUnidades(div x 10)

-- 2) j)
digitoDecenas :: Int -> Int
digitoDecenas x | x < 100 = x
                | otherwise = digitoDecenas(div x 10)

-- 3) 
estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b | a == 0 || b == 0 = False -- Cumplo el Requiere.
                      | otherwise = any( \k -> k/= 0 && a * a + a * b * k == 0 ) [-100..100] -- Cumplo el Asegura.
                      -- El metodo any es para evaluar una ecuacion, le estoy diciendo por parametro que k debe ser igual a cero, para que sea verdadero el bool.

-- 4) a)
prodInt :: (Int, Int) -> (Int, Int) -> Int
prodInt (a, b) (c, d) = (a * c) + (b * d)

-- 4) b)
todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor (a, b) (c, d) | (a < c) && (b < d) = True
                        | otherwise = False

-- 4) c)
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a, b) (c, d) = sqrt((a - c)^2 + (b - d)^2)

-- 4) d)
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (a, b, c) = (a + b + c)

-- 4) e)
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (x, y, z) a | (mod x a == 0) && (mod y a /= 0) && (mod z a /= 0) = x
                               | (mod x a /= 0) && (mod y a == 0) && (mod z a /= 0) = y
                               | (mod x a /= 0) && (mod y a /= 0) && (mod z a == 0) = z
                               | (mod x a == 0) && (mod y a == 0) && (mod z a /= 0) = x + y
                               | (mod x a == 0) && (mod y a /= 0) && (mod z a == 0) = x + z
                               | (mod x a /= 0) && (mod y a == 0) && (mod z a == 0) = y + z
                               | otherwise = 0

-- 4) f)
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (a, b, c) | even a = 1
                       | even b = 2
                       | even c = 3
                       | otherwise = 4

-- 4) g)
crearPar :: a -> b -> (a, b)
crearPar x y = (x, y)

-- 4) h) 
invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)

-- 5)
todoMenores :: (Int, Int, Int) -> Bool
todoMenores (x, y, z) | (todoMenores_f(x) > todoMenores_g(x)) && (todoMenores_f(y) > todoMenores_g(y)) && (todoMenores_f(z) > todoMenores_g(z)) = True
                      | otherwise = False

todoMenores_f :: Int -> Int
todoMenores_f x | ( x < 7 ) = x ^ 2
                | ( x > 7 ) = 2 * x - 1

todoMenores_g :: Int -> Int
todoMenores_g x | todoMenores_esPar(x) = round (fromIntegral x / 2)
                | otherwise = 3 * x + 1 

todoMenores_esPar :: Int -> Bool
todoMenores_esPar x = mod x 2 == 0 

-- 6)
bisiesto :: Int -> Bool
bisiesto x | not (esMultiplo x 4) || esMultiplo x 100 && not(esMultiplo x 400) = False
           | otherwise = True

esMultiplo :: Int -> Int -> Bool
esMultiplo x y | mod x y == 0 = True
               | otherwise = False




