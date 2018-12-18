module Update.ViewChange exposing (update)

import Model.Model exposing (..)


update : Model -> ViewChangeEvent -> ( Model, Cmd Msg )
update model event =
    case event of
        e ->
            let
                cState =
                    model.state
            in
            ( { model
                | state = { cState | view = e }
              }
            , Cmd.none
            )
