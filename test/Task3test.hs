module Task3test (tests) where

import Task3
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "3 problem"
    [ testCase "Recursion Method Test" $
        largestPrimeFactor2 600851475143 @?= 6857,
      testCase "Tail Recursion Method Test" $
        largestPrimeFactor 600851475143 @?= 6857,
      testCase "Infinity collection simple numbers Method Test" $
        largestPrimeFactor3 600851475143 @?= 6857,
      testCase "modularMethod Test" $
        modularMethod 600851475143 @?= 6857,
      testCase "mapMethod Test" $
        mapMethod 600851475143 @?= 6857
    ]