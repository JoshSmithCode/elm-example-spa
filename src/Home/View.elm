module Home.View exposing (..)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)

import Home.Model as Home
import Home.Style as Style
import Msg exposing (Msg)


view : Home.Model -> Html Msg
view homeModel =
    div
        []
        [ div
            [ css Style.banner ]
            [ div
                [ class "container" ]
                [ h1
                    [ css Style.mainBannerText ]
                    [ text "conduit" ]
                , span
                    [ css Style.subBannerText ]
                    [ text "A place to share your knowledge" ]
                ]
            ]
        ]