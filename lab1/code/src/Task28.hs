module Task28 (spiralDiagonalSumRecursive, spiralDiagonalSumTailRecursive) where

------------------------------------------

-- 1) Рекурсия
sumDiagonalsRecursive :: Int -> Int
sumDiagonalsRecursive n
  | n == 1 = 1
  | otherwise = sumOfCorners n + sumDiagonalsRecursive (n - 2)
  where
    sumOfCorners x = 4 * x * x - 6 * (x - 1)

spiralDiagonalSumRecursive :: Int -> Int
spiralDiagonalSumRecursive = sumDiagonalsRecursive

------------------------------------------

-- 2) Хвостовая рекурсия
sumDiagonalsTailRecursive :: Int -> Int -> Int
sumDiagonalsTailRecursive n acc
  | n < 1 = acc             -- добавил для приличия
  | n == 1 = acc + 1        -- добавил для приличия
  | otherwise = sumDiagonalsTailRecursive (n - 2) (acc + sumOfCorners n)
  where
    sumOfCorners x = 4 * x * x - 6 * (x - 1)

spiralDiagonalSumTailRecursive :: Int -> Int
spiralDiagonalSumTailRecursive n = sumDiagonalsTailRecursive n 0