module Page.Top exposing (view)

import Color exposing (..)
import Css exposing (..)
import Css.Extra exposing (..)
import Css.Global exposing (adjacentSiblings)
import Css.Reset.Customized exposing (customizedResetCss)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


view : List (Html.Html msg)
view =
    List.map toUnstyled
        [ customizedResetCss
        , main_
            [ css
                [ padding (px 100) ]
            ]
            [ strips gray
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips red
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips pink
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips magenta
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips violet
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips blue
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips sky
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips cyan
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips teal
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips green
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips lime
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips yellow
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            , strips orange
                [ -4.5, -4, -3, -2, -1, 0, 1, 2, 3 ]
            ]
        ]


strips : HslaSpace -> List Float -> Html msg
strips hslaSpace array =
    ul
        [ css
            [ display grid
            , gridTemplateColumns [ "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr" ]
            , gridColumnGap (px 3)
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
                            , backgroundColor (hsla_ <| Color.darken v <| hslaSpace)
                            , borderRadius (px 2)
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
                        [ text <|
                            if v > 0 then
                                hslaSpace.value ++ " +" ++ String.fromFloat v

                            else if v == 0 then
                                hslaSpace.value

                            else
                                hslaSpace.value ++ " " ++ String.fromFloat v
                        ]
                    ]
            )
            array
        )
