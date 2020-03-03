module Page.Top exposing (view)

import Css exposing (..)
import Css.Extra exposing (..)
import Css.Global exposing (adjacentSiblings)
import Css.ResetCss
import HslaColor exposing (..)
import HslaColor.Manipulate as HslaColor exposing (rotateHue)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


view : List (Html.Html msg)
view =
    List.map toUnstyled
        [ Css.ResetCss.resetCss
        , main_
            [ css
                [ padding (px 100) ]
            ]
            [ strips gray
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips red
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips (magenta |> rotateHue 30)
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips magenta
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips (blue |> rotateHue 30)
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips blue
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips (cyan |> rotateHue 30)
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips cyan
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips (lime |> rotateHue 30)
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips lime
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips (yellow |> rotateHue 30)
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips yellow
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips (red |> rotateHue 30)
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            ]
        ]


strips : HslaColor -> List Float -> Html msg
strips hslaSpace array =
    ul
        [ css
            [ display grid
            , gridTemplateColumns [ "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr" ]
            , adjacentSiblings
                [ Css.Global.ul
                    [ marginTop (px 50) ]
                ]
            ]
        ]
        (List.map
            (\v ->
                li
                    [ css
                        [ display block
                        , listStyle none
                        ]
                    ]
                    [ div
                        [ css
                            [ height (px 50)
                            , backgroundColor (hsla_ <| HslaColor.darken (v * 0.1) <| hslaSpace)
                            ]
                        ]
                        []
                    , p
                        [ css
                            [ display block
                            , paddingTop (px 15)
                            , fontSize (px 14)
                            , lineHeight (int 1)
                            , textTransform uppercase
                            , color (hex "#555")
                            ]
                        ]
                        [-- text <|
                         -- if v > 0 then
                         --     hslaSpace.value ++ " +" ++ String.fromFloat v
                         -- else if v == 0 then
                         --     hslaSpace.value
                         -- else
                         --     hslaSpace.value ++ " " ++ String.fromFloat v
                        ]
                    ]
            )
            array
        )


hsla_ : HslaColor -> Color
hsla_ hslaColor =
    let
        { hue, saturation, lightness, alpha } =
            HslaColor.toHsla hslaColor
    in
    Css.hsla (hue * 360) saturation lightness alpha
