module View.AddMember exposing (render, renderWithButton)

import Bootstrap.Button as Btn
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, div, h1, hr, img, text)
import Model.GangMember exposing (..)
import Model.Model exposing (..)
import View.GangMember


render : Model -> List (Grid.Column Msg)
render model =
    let
        possibleMembers =
            Model.GangMember.members
                |> List.filter (\m -> m.cost <= model.gold)

        memberDisplay =
            case possibleMembers of
                [] ->
                    [ Grid.col
                        [ Col.xs12 ]
                        [ text "No purchasable gang members." ]
                    ]

                m ->
                    m
                        |> List.map renderWithButton
                        |> List.map (\h -> [ h ])
                        |> List.map (Grid.col [ Col.xs12, Col.md6 ])
    in
    memberDisplay


renderWithButton : GangMember -> Html Msg
renderWithButton member =
    View.GangMember.renderPreview
        member
