module Update.Add exposing (update)

import Model.Model exposing (..)
import Update.Util exposing (..)


update : Model -> AddEvent -> ( Model, Cmd Msg )
update model event =
    case event of
        AGangMember member ->
            let
                members =
                    model.members
            in
            ( { model
                | members = member :: members
                , gold = model.gold - member.cost
              }
            , run (ViewChange Dashboard)
            )
