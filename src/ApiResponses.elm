module ApiResponses exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode exposing (..)
import Entities.User as User exposing (User)
import Entities.Comment as Comment exposing (Comment)
import Entities.Article as Article exposing (Article)
import Entities.Author as Author exposing (Author)
import Dict exposing (Dict)


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


articleResponse : Decoder SingleArticle
articleResponse =
    Decode.map2
        SingleArticle
        (Decode.field "article" Article.decode)
        (Decode.at ["article", "author"] Author.decode)


type alias MultipleArticles =
    { articles : Dict String Article
    , authors : Dict String Author
    , count : Int
    }


multipleArticleDecoder : Decoder MultipleArticles
multipleArticleDecoder =
    Decode.map2
        (\multipleArticles count -> {multipleArticles | count = count})
        (Decode.field "articles" normalizedArticlesDecoder)
        (Decode.field "articlesCount" Decode.int)


normalizedArticlesDecoder : Decoder MultipleArticles
normalizedArticlesDecoder =
    Decode.map (List.foldl normalizeArticles { articles = Dict.empty, authors = Dict.empty, count = 0 })
        <| Decode.list articleResponse


normalizeArticles : SingleArticle -> MultipleArticles -> MultipleArticles
normalizeArticles {article, author} {articles, authors} =
    let
        newArticles = Dict.insert article.slug article articles
        newAuthors = Dict.insert author.username author authors
    in
        { articles = newArticles, authors = newAuthors, count = 0 }


type alias SingleComment =
    { comment : Comment
    , author : Author
    }


articleResponse : Decoder SingleComment
articleResponse =
    Decode.succeed Comment
        |> Decode.required "comment" Comment.decode
        |> Decode.requiredAt ["article", "author"] Author.decode


type alias MultipleComments =
    { comments : Dict Int Comment
    , authors : Dict String Author
    }


multipleCommentResponse : Decoder MultipleComments
multipleCommentResponse =
    Decode.field "articles"
        <| Decode.map (List.foldl normalizeComments { articles = Dict.empty, authors = Dict.empty })
        <| Decode.list articleResponse


normalizeComments : SingleComment -> MultipleComments -> MultipleComments
normalizeComments {comment, author} {comments, authors} =
    let
        newComments = Dict.insert comment.id comment comments
        newAuthors = Dict.insert author.username author authors
    in
        { comments = newComments, authors = newAuthors }


tagsResponse : Decoder (List String)
tagsResponse =
    Decode.field "tags" <| Decode.list Decode.string