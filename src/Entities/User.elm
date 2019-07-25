module Entities.User exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (..)


type alias User =
    { email : String
    , token : String
    , username : String
    , bio : String
    , image : String
    }


decode : Decoder User
decode =
    Decode.succeed User
        |> required "email" Decode.string
        |> required "token" Decode.string
        |> required "username" Decode.string
        |> required "bio" Decode.string
        |> required "image" Decode.string