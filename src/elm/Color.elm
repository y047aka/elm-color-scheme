module Color exposing (blue, cyan, grape, gray, green, lightBlue, lime, orange, pink, red, teal, violet, yellow)

import Css exposing (Color, hsl)


gray : Int -> Color
gray l =
    hsl 0 0 (normalize l)


red : Int -> Color
red l =
    hsl 0 1 (normalize l)


orange : Int -> Color
orange l =
    hsl 30 1 (normalize l)


yellow : Int -> Color
yellow l =
    hsl 60 1 (normalize l)


lime : Int -> Color
lime l =
    hsl 90 1 (normalize l)


green : Int -> Color
green l =
    hsl 120 1 (normalize l)


teal : Int -> Color
teal l =
    hsl 150 1 (normalize l)


cyan : Int -> Color
cyan l =
    hsl 180 1 (normalize l)


lightBlue : Int -> Color
lightBlue l =
    hsl 210 1 (normalize l)


blue : Int -> Color
blue l =
    hsl 240 1 (normalize l)


violet : Int -> Color
violet l =
    hsl 270 1 (normalize l)


grape : Int -> Color
grape l =
    hsl 300 1 (normalize l)


pink : Int -> Color
pink l =
    hsl 330 1 (normalize l)



-- HELPERS


normalize : Int -> Float
normalize input =
    input
        |> highCutOver 9
        |> lowCutUnder 0
        |> (\n ->
                case n of
                    0 ->
                        0.95

                    1 ->
                        0.9

                    2 ->
                        0.85

                    3 ->
                        0.8

                    4 ->
                        0.7

                    5 ->
                        0.6

                    6 ->
                        0.5

                    7 ->
                        0.4

                    8 ->
                        0.3

                    9 ->
                        0.2

                    _ ->
                        0
           )


highCutOver : Int -> Int -> Int
highCutOver max n =
    if n > max then
        max

    else
        n


lowCutUnder : Int -> Int -> Int
lowCutUnder min n =
    if n < min then
        min

    else
        n
