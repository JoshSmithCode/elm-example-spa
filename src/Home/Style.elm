module Home.Style exposing (..)

import Css exposing (..)
import Style


banner =
    [ backgroundColor Style.brandGreen
    , property "box-shadow" "inset 0px 8px 8px -8px rgba(0,0,0,.3),inset 0px -8px 8px -8px rgba(0,0,0,.3);"
    , paddingTop <| em 1.5
    , paddingBottom <| em 1.75
    ]


mainBannerText =
    [ color <| hex "fff"
    , fontFamilies Style.brandFont
    , width <| pct 100
    , textAlign center
    , fontSize <| em 3
    , textShadow4 (px 1) (px 1) (px 2) (hex "999")
    ]


subBannerText =
    [ color <| hex "fff"
    , display block
    , width <| pct 100
    , textAlign center
    , fontWeight <| int 300
    , fontSize <| em 1.5
    ]