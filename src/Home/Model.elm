module Home.Model exposing (..)

import Array exposing (Array)


type alias Model =
    { tags : List String
    , articles : List String
    , currentPage : Int
    }


init : Model
init =
    { tags = []
    , articles = []
    , currentPage = 1
    }