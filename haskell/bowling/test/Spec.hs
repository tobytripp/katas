import Test.HUnit
import System.Exit (exitSuccess, exitFailure)
import Lib

tests :: Test
tests = test [
  "scores zero for a gutter game" ~: do
      assertEqual "" 0 (score (replicate 20 0))
  ,
  "scoring all ones gives a score of 20" ~: do
      assertEqual "" 20 (score (replicate 20 1))
  ,
  "scoring one spare, you get the next roll as a bonus" ~: do
      assertEqual "" 16 (score (5:5:3: (replicate 17 0)))
  ,
  "all spares" ~: do
      assertEqual "" 150 (score (replicate 21 5))
  ,
  "when scoring a strike, you get the next two rolls as bonus" ~: do
      assertEqual "" 24 (score (10:3:4: (replicate 16 0)))
  ,
  "scores 300 on a perfect game" ~: do
      assertEqual "" 300 (score (replicate 12 10))
  ]

main :: IO ()
main = do
  testCounts <- runTestTT tests
  case ((failures testCounts), (errors testCounts)) of
    (0, 0) -> exitSuccess
    otherwise -> exitFailure
