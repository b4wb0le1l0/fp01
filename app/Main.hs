module Main
  ( main,
  )
where

import Task28
import Task3

main :: IO ()
main = do
  print $ largestPrimeFactor 600851475143
  print $ largestPrimeFactor2 600851475143
  print $ largestPrimeFactor3 600851475143
  print $ modularMethod 600851475143
  print $ mapMethod 600851475143
  putStrLn "####################"
  print $ spiralDiagonalSumRecursive 1001
  print $ spiralDiagonalSumTailRecursive 1001
