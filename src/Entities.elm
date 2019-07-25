module Entities exposing (..)

import Dict exposing (Dict)
import Entities.Article exposing (Article)
import Entities.Author exposing (Author)
import Entities.Comment exposing (Comment)
import Entities.User exposing (User)


type alias Entities =
    { articles : Dict String Article
    , authors : Dict String Author
    , comments : Dict Int Comment
    , users : Dict String User
    }


init : Entities
init =
    { articles = Dict.empty
    , authors = Dict.empty
    , comments = Dict.empty
    , users = Dict.empty
    }