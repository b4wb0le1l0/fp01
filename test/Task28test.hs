module Task28test (tests) where

import Task28
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "28 problem"
    [ testCase "Sum of diagonals (Recursive)" $
        spiralDiagonalSumRecursive 1001 @?= 669171001,
      testCase "Sum of diagonals (Tail Recursive)" $
        spiralDiagonalSumTailRecursive 1001 @?= 669171001
    ]
