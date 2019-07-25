module ApiResponses exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode exposing (..)
import Entities.User as User exposing (User)
import Entities.Article as Article exposing (Article)
import Entities.Author as Author exposing (Author)


type alias UserResponse =
    { user : User
    }


userResponseDecoder : Decoder UserResponse
userResponseDecoder =
    Decode.succeed UserResponse
        |> required "user" User.decode


type alias ProfileResponse =
    { profile : User
    }


profileResponseDecoder : Decoder ProfileResponse
profileResponseDecoder =
    Decode.succeed ProfileResponse
        |> required "profile" Author.decode


type alias SingleArticle =
    { article : Article
    , author : Author
    }


singleArticleResponse : Decoder SingleArticle
singleArticleResponse =
    Decode.map2
        SingleArticle
        (Decode.field "article" Article.decode)
        (Decode.at ["article", "author"] Author.decode)


multipleArticleResponse : Decoder (List SingleArticle)
multipleArticleResponse =
    Decode.field "articles" <| Decode.list (singleArticleResponse)