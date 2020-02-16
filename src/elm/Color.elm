module Color exposing (HslaSpace, bi, blue, cb, cyan, darken, desaturate, gray, green, gt, hsla_, identity, indigo, iv, lg, lighten, lime, magenta, mp, orange, oy, pink, pr, red, ro, saturate, tc, teal, violet, vm, yellow, yl)

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


ro : HslaSpace
ro =
    primaryColor 15 "ro"


orange : HslaSpace
orange =
    primaryColor 30 "orange"


oy : HslaSpace
oy =
    primaryColor 45 "oy"


yellow : HslaSpace
yellow =
    primaryColor 60 "yellow"


yl : HslaSpace
yl =
    primaryColor 75 "yl"


lime : HslaSpace
lime =
    primaryColor 90 "lime"


lg : HslaSpace
lg =
    primaryColor 105 "lg"


green : HslaSpace
green =
    primaryColor 120 "green"


gt : HslaSpace
gt =
    primaryColor 135 "gt"


teal : HslaSpace
teal =
    primaryColor 150 "teal"


tc : HslaSpace
tc =
    primaryColor 165 "tc"


cyan : HslaSpace
cyan =
    primaryColor 180 "cyan"


cb : HslaSpace
cb =
    primaryColor 195 "cb"


blue : HslaSpace
blue =
    primaryColor 210 "blue"


bi : HslaSpace
bi =
    primaryColor 225 "bi"


indigo : HslaSpace
indigo =
    primaryColor 240 "indigo"


iv : HslaSpace
iv =
    primaryColor 255 "iv"


violet : HslaSpace
violet =
    primaryColor 270 "violet"


vm : HslaSpace
vm =
    primaryColor 285 "vm"


magenta : HslaSpace
magenta =
    primaryColor 300 "magenta"


mp : HslaSpace
mp =
    primaryColor 315 "mp"


pink : HslaSpace
pink =
    primaryColor 330 "pink"


pr : HslaSpace
pr =
    primaryColor 345 "pr"
