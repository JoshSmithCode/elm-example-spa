module Entities.Author exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Author =
    { username : String
    , bio : String
    , image : String
    , following : Bool
--    , articleSlugs : List String -- @todo - maybe this doesn't belong here
    }


decode : Decoder Author
decode =
    Decode.succeed Author
        |> Decode.required "username" Decode.string
        |> Decode.required "bio" Decode.string
        |> Decode.required "image" Decode.string
        |> Decode.required "following" Decode.bool