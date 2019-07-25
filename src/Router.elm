module Router exposing (..)

import Browser exposing (UrlRequest)
import Url exposing (Url)
import Url.Parser as Url exposing (..)
import Msg exposing (Msg)


type Route
    = Home
    | Register
    | NotFound


parseUrl : Url -> Route
parseUrl =
    Url.parse routeParser >> Maybe.withDefault NotFound


routeParser : Url.Parser (Route -> a) a
routeParser  =
    oneOf
        [ map Home top
        , map Register <| s "register"
        ]
