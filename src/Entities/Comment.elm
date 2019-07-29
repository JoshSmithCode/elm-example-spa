module Entities.Comment exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Comment =
    { id : Int
    , createdAt : String
    , updatedAt : String
    , body : String
    , authorUsername : String
    }


decode : Decoder Comment
decode =
    Decode.succeed
        |> Decode.required "id" Decode.int
        |> Decode.required "createdAt" Decode.string
        |> Decode.required "updatedAt" Decode.string
        |> Decode.required "body" Decode.string
        |> Decode.requiredAt ["author", "username"] Decode.string