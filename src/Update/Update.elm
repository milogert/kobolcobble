module Update.Update exposing (update)

import Model.Model exposing (..)
import Update.Add
import Update.Remove
import Update.Set
import Update.ViewChange


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ViewChange event ->
            Update.ViewChange.update model event

        Add event ->
            Update.Add.update model event

        Set event ->
            Update.Set.update model event

        Remove event ->
            Update.Remove.update model event
