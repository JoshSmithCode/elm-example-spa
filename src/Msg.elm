module Msg exposing (..)

import Http
import Browser exposing (UrlRequest)
import Url exposing (Url)
import ApiResponses as Api


type Msg
    = NoOp
    | UrlRequest UrlRequest
    | UrlChange Url
    | GlobalFeedArticles (Result Http.Error Api.MultipleArticles)