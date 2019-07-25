module Style exposing (..)

import Css exposing (..)


brandGreen =
    hex "5cb85c"


brandFont =
    ["titillium web", "sans-serif;"]


nav =
    [ displayFlex
    , width <| pct 100
    , height <| px 56
    , backgroundColor <| hex "ffffff"
    , justifyContent spaceBetween
    , alignItems center
    ]


logo =
    [ fontFamilies brandFont
    , color brandGreen
    , fontSize <| em 1.25
    ]


navItems =
    [ displayFlex
    , flexDirection row
    ]


navItem =
    [ firstChild
        [ marginLeft <| em 0 ]
    , marginLeft <| em 0.8
    , color <| hex "aaa"
    , fontWeight <| int 150
    , cursor pointer
    , hover
        [ color <| hex "666"
        , textDecoration none
        ]
    ]

