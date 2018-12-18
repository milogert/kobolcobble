module Update.Set exposing (update)

import List.Extra as ListE
import Model.GangMember exposing (..)
import Model.Model exposing (..)
import Update.Util exposing (..)


update : Model -> SetEvent -> ( Model, Cmd Msg )
update model event =
    case event of
        SName name ->
            ( { model | name = Just name }
            , Cmd.none
            )

        SGold goldString ->
            ( { model | gold = toInt goldString }
            , Cmd.none
            )

        SNoteriety noterietyString ->
            ( { model | noteriety = toInt noterietyString }
            , Cmd.none
            )

        SRuthlessness ruthlessnessString ->
            ( { model | ruthlessness = toInt ruthlessnessString }
            , Cmd.none
            )

        SGangLeader gangMember ->
            ( { model | gangLeader = Just gangMember }
            , run (ViewChange Dashboard)
            )

        SMembers members ->
            ( { model | members = members }
            , Cmd.none
            )

        SActivate member activated ->
            let
                currentState =
                    member.state

                updatedState =
                    { currentState | activated = activated }

                activatedMember =
                    { member | state = updatedState }
            in
            case member.unitType of
                GangLeader ->
                    ( { model
                        | gangLeader = Just activatedMember
                      }
                    , Cmd.none
                    )

                _ ->
                    let
                        updatedMembers =
                            ListE.setIf
                                (\s -> s == member)
                                member
                                model.members
                    in
                    ( { model | members = updatedMembers }
                    , Cmd.none
                    )
