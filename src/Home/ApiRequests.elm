module Home.ApiRequests exposing (..)

import Http
import Msg exposing (Msg)
import ApiResponses as Api


init : Cmd Msg
init =
    Cmd.batch
        [ Http.get getArticles
        ]


getArticles : { url : String, expect : Http.Expect Msg }
getArticles =
    { url = "/api/articles"
    , expect = Http.expectJson Msg.GlobalFeedArticles Api.multipleArticleDecoder
    }
