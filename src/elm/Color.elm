module Color exposing (blue, gray, green, red, toneFromInt)

import Css exposing (Color, hsl)


toneFromInt : Int -> Float
toneFromInt int =
    case ( int < 0, int > 9 ) of
        ( True, False ) ->
            0

        ( False, True ) ->
            0.9

        _ ->
            (*) 0.1 <| toFloat int


gray : Int -> Color
gray l =
    hsl 0 0 (toneFromInt l)


red : Int -> Color
red l =
    hsl 0 1 (toneFromInt l)


green : Int -> Color
green l =
    hsl 120 1 (toneFromInt l)


blue : Int -> Color
blue l =
    hsl 240 1 (toneFromInt l)
