module View.SelectLeader exposing (render, renderWithButton)

import Bootstrap.Button as Btn
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, div, h1, hr, img, text)
import Model.GangMember exposing (..)
import Model.Model exposing (..)
import View.GangMember


render : Model -> List (Grid.Column Msg)
render model =
    Model.GangMember.leaders
        |> List.map renderWithButton
        |> List.map (\h -> [ h ])
        |> List.map (Grid.col [ Col.xs12, Col.md6 ])


renderWithButton : GangMember -> Html Msg
renderWithButton member =
    View.GangMember.renderPreview
        member
