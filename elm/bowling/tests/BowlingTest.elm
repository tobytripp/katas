module BowlingTest exposing (..)

import Bowling exposing (..)
import Expect exposing (Expectation)
import Test exposing (..)


suite : Test
suite =
    describe "Bowling score"
        [ test "scores zero for a gutter game" <|
            \_ -> Expect.equal 0 (score (List.repeat 20 0))
        , test "rolling all ones scores 20" <|
            \_ -> Expect.equal 20 (score (List.repeat 20 1))
        , test "rolling one spare, you get the next roll as a bonus" <|
            \_ -> Expect.equal 16 (score (5 :: 5 :: 3 :: List.repeat 17 0))
        , test "rolling all spares scores 150" <|
            \_ -> Expect.equal 150 (score (List.repeat 21 5))
        , test "when rolling a strike, you get the next two rolls as bonus" <|
            \_ -> Expect.equal 24 (score (10 :: 3 :: 4 :: List.repeat 16 0))
        , test "scores 300 on a perfect game" <|
            \_ -> Expect.equal 300 (score (List.repeat 12 10))
        ]
