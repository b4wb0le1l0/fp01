import qualified Task28test
import qualified Task3test
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "All tests"
    [ Task3test.tests,
      Task28test.tests
    ]
