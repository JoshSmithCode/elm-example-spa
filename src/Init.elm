module Init exposing (..)

import Url exposing (Url)
import Browser.Navigation as Navigation
import Model exposing (Model)
import Msg exposing (Msg)
import Home.Model as Home
import Router
import Entities


type alias Flags =
    {
    }


init : Flags -> Url -> Navigation.Key -> (Model, Cmd Msg)
init flags url navigationKey =
    (
    { key = navigationKey
    , route = Router.parseUrl url
    , home = Home.init
    , entities = Entities.init
    }
    , Cmd.none
    )

