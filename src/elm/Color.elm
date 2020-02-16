module Color exposing (HslaSpace, blue, cyan, darken, desaturate, grape, gray, green, hsla_, identity, indigo, lighten, lime, orange, pink, red, saturate, teal, violet, yellow)

import Css exposing (Color, hsla)


type alias HslaSpace =
    { hue : Float
    , saturation : Float
    , lightness : Float
    , alpha : Float
    , value : String
    }


hsla_ : HslaSpace -> Color
hsla_ { hue, saturation, lightness, alpha } =
    hsla hue saturation lightness alpha


limit : Float -> Float
limit =
    clamp 0 1


identity : HslaSpace -> HslaSpace
identity hslaSpace =
    hslaSpace


lighten : Float -> HslaSpace -> HslaSpace
lighten offset cl =
    { cl | lightness = limit (cl.lightness + (offset * 0.1)) }


darken : Float -> HslaSpace -> HslaSpace
darken offset cl =
    lighten -offset cl


saturate : Float -> HslaSpace -> HslaSpace
saturate offset cl =
    { cl | saturation = limit (cl.saturation + offset) }


desaturate : Float -> HslaSpace -> HslaSpace
desaturate offset cl =
    saturate -offset cl


gray : HslaSpace
gray =
    HslaSpace 0 0 0.5 1 "gray"



-- PRIMARY COLORS


primaryColor : Float -> String -> HslaSpace
primaryColor hue colorName =
    HslaSpace hue 1 0.5 1 colorName


red : HslaSpace
red =
    primaryColor 0 "red"


orange : HslaSpace
orange =
    primaryColor 30 "orange"


yellow : HslaSpace
yellow =
    primaryColor 60 "yellow"


lime : HslaSpace
lime =
    primaryColor 90 "lime"


green : HslaSpace
green =
    primaryColor 120 "green"


teal : HslaSpace
teal =
    primaryColor 150 "teal"


cyan : HslaSpace
cyan =
    primaryColor 180 "cyan"


blue : HslaSpace
blue =
    primaryColor 210 "blue"


indigo : HslaSpace
indigo =
    primaryColor 240 "indigo"


violet : HslaSpace
violet =
    primaryColor 270 "violet"


grape : HslaSpace
grape =
    primaryColor 300 "grape"


pink : HslaSpace
pink =
    primaryColor 330 "pink"
