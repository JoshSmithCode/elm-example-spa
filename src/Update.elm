module Update exposing (..)

import Browser.Navigation as Navigation
import Browser
import Model exposing (Model)
import Msg exposing (Msg)
import Router
import Url


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of

        Msg.UrlRequest urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    (model, Navigation.pushUrl model.key (Url.toString url))

                Browser.External url ->
                    (model, Navigation.load url)

        Msg.UrlChange url ->
            ({ model | route = Router.parseUrl url }, Cmd.none)

        _ ->
            (model, Cmd.none)