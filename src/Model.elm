module Model exposing (..)

import Home.Model as Home
import Browser.Navigation as Navigation
import Router exposing (Route)
import Entities exposing (Entities)
import ArticlesFeed exposing (ArticlesFeed)


type alias Model =
    { key : Navigation.Key
    , route : Route
    , home : Home.Model
    , entities : Entities
    , globalArticles : ArticlesFeed
    }


