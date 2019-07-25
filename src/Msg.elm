module Msg exposing (..)

import Browser exposing (UrlRequest)
import Url exposing (Url)


type Msg
    = NoOp
    | UrlRequest UrlRequest
    | UrlChange Url