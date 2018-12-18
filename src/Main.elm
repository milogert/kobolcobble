module Main exposing (main)

import Browser
import Model.Model exposing (..)
import Subs.Subs exposing (..)
import Update.Update exposing (..)
import View.View exposing (..)


main : Program () Model Msg
main =
    Browser.document
        { view = View.View.view
        , init = Model.Model.init
        , update = Update.Update.update
        , subscriptions = Subs.Subs.sub
        }
