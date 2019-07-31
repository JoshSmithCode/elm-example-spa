module Router exposing (..)

import Url exposing (Url)
import Url.Parser as Url exposing (..)
import Msg exposing (Msg)
import Home.ApiRequests as HomeApi


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


getInitCmd : Route -> Cmd Msg
getInitCmd route =
    case route of
        Home ->
            HomeApi.init
        _ ->
            Cmd.none