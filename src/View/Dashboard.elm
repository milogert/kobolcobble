module View.Dashboard exposing (render)

import Bootstrap.Button as Btn
import Bootstrap.Form as Form
import Bootstrap.Form.Input as Input
import Bootstrap.Form.InputGroup as InputGroup
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (for)
import Model.Model exposing (..)
import View.GangMember
import View.Util exposing (..)


render : Model -> List (Grid.Column Msg)
render model =
    let
        selectLeaderButton =
            Btn.button
                [ Btn.primary
                , Btn.block
                , Btn.onClick <| ViewChange SelectGangLeader
                ]
                [ text "Select Gang Leader" ]

        crimeLord =
            case model.gangLeader of
                Nothing ->
                    selectLeaderButton

                Just cm ->
                    View.GangMember.render False
                        cm

        gangMembers =
            List.map
                View.GangMember.renderWithDelete
                model.members
    in
    [ Grid.col [ Col.lg6, Col.sm12 ]
        [ Form.form [] <|
            List.map
                (\( i, v, e ) ->
                    Form.row []
                        [ Form.col [ Col.xs12 ]
                            [ stateInput i (String.fromInt v) e ]
                        ]
                )
                [ ( "coins", model.gold, SGold )
                , ( "crown", model.noteriety, SNoteriety )
                , ( "fist", model.ruthlessness, SRuthlessness )
                ]
        , crimeLord
        ]
    , Grid.col
        [ Col.lg6, Col.sm12 ]
        [ div [] gangMembers
        , Btn.button
            [ Btn.primary
            , Btn.block
            , Btn.onClick <| ViewChange AddMember
            ]
            [ text "Add Members" ]
        ]
    ]


stateInput : String -> String -> (String -> SetEvent) -> Html Msg
stateInput icon value event =
    InputGroup.config
        (InputGroup.number
            [ Input.value value
            , Input.onInput <| (Set << event)
            ]
        )
        |> InputGroup.predecessors
            [ InputGroup.span [] [ iconSolid icon ] ]
        |> InputGroup.view
