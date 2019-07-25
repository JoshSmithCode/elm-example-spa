module Main exposing (..)

import Browser
import Init exposing (Flags, init)
import Model exposing (Model)
import Msg exposing (Msg)
import Subscriptions exposing (subscriptions)
import View exposing (document)
import Update exposing (update)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = document
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = Msg.UrlRequest
        , onUrlChange = Msg.UrlChange
        }


