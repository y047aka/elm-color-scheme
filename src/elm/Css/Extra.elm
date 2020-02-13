module Css.Extra exposing (content_, grid, gridColumn, gridColumnGap, gridGap, gridRow, gridRowGap, gridTemplateColumns, gridTemplateRows)

import Css exposing (..)



{- CSS Grid Layout -}


{-| 本来は `grid = { value = "grid", display = Compatible }` となるべきだが、Css.Structure.Compatible が公開されていないため、既存の `block` での指定を書き換えて使用する
-}
grid : Display {}
grid =
    { block | value = "grid" }


gridTemplateRows : List String -> Style
gridTemplateRows units =
    property "grid-template-rows" <| String.join " " units


gridTemplateColumns : List String -> Style
gridTemplateColumns units =
    property "grid-template-columns" <| String.join " " units


gridRow : String -> Style
gridRow =
    property "grid-row"


gridColumn : String -> Style
gridColumn =
    property "grid-column"


gridRowGap : Length compatible units -> Style
gridRowGap =
    prop1 "grid-row-gap"


gridColumnGap : Length compatible units -> Style
gridColumnGap =
    prop1 "grid-column-gap"


gridGap : Length compatible units -> Style
gridGap =
    prop1 "grid-gap"



{- Functions with underscore -}


content_ : String -> Style
content_ =
    qt >> property "content"



{- Private functions from elm-css -}


prop1 : String -> Value a -> Style
prop1 key arg =
    property key arg.value
