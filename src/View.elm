module View exposing (..)

import Browser exposing (Document)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Model exposing (Model)
import Msg exposing (Msg)
import Style
import Router
import Home.View as Home


document : Model -> Document Msg
document model =
    { title = "Conduit"
    , body = [ view model |> toUnstyled ]
    }


view : Model -> Html Msg
view model =
    div
        []
        [ div
            [ class "container"
            , css Style.nav
            ]
            [ div
                [ css Style.logo ]
                [ text "Conduit" ]
            , div
                [ css Style.navItems ]
                [ a
                    [ css Style.navItem
                    , href "/"
                    ]
                    [ text "Home" ]
                , a
                    [ css Style.navItem
                    , href ""
                    ]
                    [ text "Sign in" ]
                , a
                    [ css Style.navItem
                    , href "/register"
                    ]
                    [ text "Sign up" ]
                ]
            ]
        , pageView model
        ]


pageView : Model -> Html Msg
pageView model =
    case model.route of
        Router.Home ->
            Home.view model.home

        Router.Register ->
            text "REGISTER PAGE"

        Router.NotFound ->
            text "ROUTE NOT FOUND"