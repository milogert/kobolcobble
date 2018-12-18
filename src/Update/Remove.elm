module Update.Remove exposing (update)

import List.Extra as ListE
import Model.Model exposing (..)


update : Model -> RemoveEvent -> ( Model, Cmd Msg )
update model event =
    case event of
        RGangMember member ->
            let
                members =
                    ListE.remove member model.members
            in
            ( { model | members = members }
            , Cmd.none
            )
