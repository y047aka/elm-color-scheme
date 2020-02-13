module Page.Top exposing (view)

import Css exposing (..)
import Css.ResetCss
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


view : List (Html.Html msg)
view =
    List.map toUnstyled
        [ Css.ResetCss.resetCss
        , main_ []
            [ ul
                [ css
                    [ property "display" "grid"
                    , width (pct 100)
                    ]
                ]
                (let
                    listItem tone =
                        li
                            [ css
                                [ display block
                                , listStyle none
                                ]
                            ]
                            [ text (String.fromInt tone) ]
                 in
                 List.map listItem [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
                )
            ]
        ]
