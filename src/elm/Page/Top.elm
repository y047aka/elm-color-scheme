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
            (List.map strips
                [ gray
                , red
                , pink
                , grape
                , violet
                , indigo
                , blue
                , cyan
                , teal
                , green
                , lime
                , yellow
                , orange
                ]
            )
        ]


strips : HslaSpace -> Html msg
strips hslaSpace =
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
                            , backgroundColor (hsla_ <| tone.manipulate <| hslaSpace)
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
                        [ text <| hslaSpace.value ++ " " ++ tone.label
                        ]
                    ]
            )
            [ { label = "-3"
              , manipulate = Color.lighten -3
              }
            , { label = "-2"
              , manipulate = Color.lighten -2
              }
            , { label = "-1"
              , manipulate = Color.lighten -1
              }
            , { label = ""
              , manipulate = Color.identity
              }
            , { label = "+1"
              , manipulate = Color.lighten 1
              }
            , { label = "+2"
              , manipulate = Color.lighten 2
              }
            , { label = "+3"
              , manipulate = Color.lighten 3
              }
            , { label = "+4"
              , manipulate = Color.lighten 4
              }
            , { label = "+4.5"
              , manipulate = Color.lighten 4.5
              }
            ]
        )
