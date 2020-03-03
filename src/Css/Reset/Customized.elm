module Css.Reset.Customized exposing (customizedResetCss)

import Css exposing (..)
import Css.Global exposing (..)
import Css.Reset exposing (ress)
import Html.Styled exposing (Html)


customizedResetCss : Html msg
customizedResetCss =
    global <|
        List.append ress additionalReset


additionalReset : List Snippet
additionalReset =
    [ body
        [ fontFamilies [ qt "HelveticaNeue", sansSerif.value ]
        , color (hex "#333")
        ]
    ]
