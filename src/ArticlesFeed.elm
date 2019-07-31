module ArticlesFeed exposing (..)

import Dict exposing (Dict)
import Entities.Article as Article


type alias ArticlesFeed =
    { currentPage : Int
    , articlesPerPage : Int
    , totalArticles : Int
    , loadedArticles : Dict Int (List Article.Slug)
    }