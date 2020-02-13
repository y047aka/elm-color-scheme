module Page.Top exposing (view)

import Color exposing (..)
import Css exposing (..)
import Css.Extra exposing (..)
import Css.Global exposing (adjacentSiblings)
import Css.ResetCss
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
            [ strips
                { label = "Gray"
                , color = gray
                }
            , strips
                { label = "Red"
                , color = red
                }
            , strips
                { label = "Green"
                , color = green
                }
            , strips
                { label = "Blue"
                , color = blue
                }
            ]
        ]


strips :
    { label : String
    , color : Int -> Color
    }
    -> Html msg
strips ops =
    ul
        [ css
            [ display grid
            , gridTemplateColumns [ "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr", "1fr" ]
            , gridColumnGap (px 5)
            , adjacentSiblings
                [ Css.Global.ul
                    [ marginTop (px 50) ]
                ]
            ]
        ]
        (List.map
            (\tone ->
                li
                    [ css
                        [ display block
                        , listStyle none
                        ]
                    ]
                    [ div
                        [ css
                            [ height (px 50)
                            , backgroundColor (ops.color tone)
                            , borderRadius (px 2)
                            ]
                        ]
                        []
                    , p
                        [ css
                            [ display block
                            , paddingTop (px 10)
                            , fontSize (px 14)
                            , lineHeight (int 1)
                            , textTransform uppercase
                            , color (hex "#555")
                            ]
                        ]
                        [ text <| ops.label ++ " " ++ String.fromInt tone ]
                    ]
            )
            [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
        )
