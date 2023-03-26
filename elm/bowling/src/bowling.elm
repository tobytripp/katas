module Bowling exposing (score)


score : List number -> number
score rolls =
    case rolls of
        [] ->
            0

        x :: [] ->
            x

        x :: y :: [] ->
            x + y

        x :: y :: z :: [] ->
            x + y + z

        x :: y :: z :: xs ->
            if x == 10 then
                x + y + z + score (y :: z :: xs)

            else if x + y == 10 then
                x + y + z + score (z :: xs)

            else
                x + y + score (z :: xs)
