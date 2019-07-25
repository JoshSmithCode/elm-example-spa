module Entities.Comment exposing (..)

import Date exposing (Date)


type alias Comment =
    { id : Int
    , createdAt : Date
    , updatedAt : Date
    , body : String
    , authorUsername : String
    , articleSlug : String
    }