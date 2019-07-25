module Entities.Article exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Article =
    { slug : String
    , title : String
    , description : String
    , body : String
    , tagList : List String
    , createdAt : String
    , updatedAt : String
    , favorited : Bool
    , favoritesCount : Int
    , authorUsername : String
--    , commentIds : List Int -- @todo - might not belong here
    }


decode : Decoder Article
decode =
    Decode.succeed Article
        |> Decode.required "slug" Decode.string
        |> Decode.required "title" Decode.string
        |> Decode.required "description" Decode.string
        |> Decode.required "body" Decode.string
        |> Decode.required "tagList" (Decode.list Decode.string)
        |> Decode.required "createdAt" (Decode.string)
        |> Decode.required "updatedAt" (Decode.string)
        |> Decode.required "favorited" Decode.bool
        |> Decode.required "favoritesCount" Decode.int
        |> Decode.requiredAt ["author", "username"] Decode.string
