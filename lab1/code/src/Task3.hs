module Task3 (largestPrimeFactor, largestPrimeFactor2, largestPrimeFactor3, modularMethod, mapMethod) where

------------------------------------------

-- (рекурсия)
largestPrimeFactor2 :: Integer -> Integer
largestPrimeFactor2 n = largestFactor n 2
  where
    largestFactor current divisor
        | current < 2 = current
        | current `mod` divisor == 0 = largestFactor (current `div` divisor) divisor
        | divisor * divisor > current = current
        | otherwise = largestFactor current (divisor + 1)

------------------------------------------

-- (хвостовая рекурсия)
largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = largestFactor n 2 1
  where
    largestFactor 1 _ largest = largest
    largestFactor num divisor largest
        | num `mod` divisor == 0 = largestFactor (num `div` divisor) divisor divisor
        | divisor * divisor > num = max largest num
        | otherwise = largestFactor num (divisor + 1) largest

------------------------------------------

-- (бесконечный список простых чисел)
largestPrimeFactor3 :: Integer -> Integer
largestPrimeFactor3 n = largestFactor n primes
  where
    largestFactor 1 _ = 1
    largestFactor num (p:ps)
        | num `mod` p == 0 = largestFactor (num `div` p) (p:ps)
        | p * p > num = num
        | otherwise = largestFactor num ps

-- решето Эратосфена
primes :: [Integer]
primes = sieve [2..]
  where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

------------------------------------------

-- (вспомогательная функция для вух последующих)
isPrime :: Integer -> Bool
isPrime n
    | n < 2     = False
    | otherwise = null [x | x <- [2..floor . sqrt $ fromIntegral n], n `mod` x == 0]

------------------------------------------

-- (модульная реализация)
-- Генерация делителей числа
divisors :: Integer -> [Integer]
divisors n = filter (\x -> n `mod` x == 0) [2..floor . sqrt $ fromIntegral n]

-- Получение наибольшего простого делителя
modularMethod :: Integer -> Integer
modularMethod n = maximum $ filter isPrime (divisors n)

------------------------------------------

-- (использование map)
divisores :: Integer -> [Integer]
divisores n = filter (\x -> n `mod` x == 0) $ map (\x -> x) [2..floor . sqrt $ fromIntegral n]

-- Получение наибольшего простого делителя
mapMethod :: Integer -> Integer
mapMethod n = maximum $ filter isPrime (divisores n)

