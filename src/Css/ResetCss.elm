module Css.ResetCss exposing (resetCss)

import Css exposing (..)
import Css.Global exposing (..)
import Css.ResetCss.Ress exposing (ress)
import Html.Styled exposing (Html)


resetCss : Html msg
resetCss =
    global <|
        List.append ress customReset


customReset : List Snippet
customReset =
    [ body
        [ fontFamilies [ qt "HelveticaNeue", sansSerif.value ]
        , color (hex "#333")
        ]
    ]
