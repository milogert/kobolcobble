module View.View exposing (currentView, view)

import Bootstrap.Button as Btn
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Browser exposing (Document)
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (class, src)
import Model.Model exposing (..)
import View.AddMember
import View.Dashboard
import View.SelectLeader
import View.Util exposing (..)


view : Model -> Document Msg
view model =
    let
        body =
            currentView model model.state.view

        backView =
            case model.state.view of
                Dashboard ->
                    Dashboard

                SelectGangLeader ->
                    Dashboard

                AddMember ->
                    Dashboard
    in
    Document
        (fromViewEvent model.state.view)
        [ Grid.container []
            [ CDN.stylesheet
            , Grid.row []
                [ Grid.col [ Col.xs ]
                    [ h1 []
                        [ Btn.button
                            [ Btn.light
                            , Btn.small
                            , Btn.onClick (ViewChange backView)
                            , Btn.attrs
                                [ class "mr-2" ]
                            ]
                            [ iconSolid "arrow-left" ]
                        , text "Kobol-Cobble"
                        ]
                    ]
                ]
            , Grid.row
                []
                body
            ]
        ]


currentView : Model -> ViewChangeEvent -> List (Grid.Column Msg)
currentView model viewEvent =
    case viewEvent of
        Dashboard ->
            View.Dashboard.render model

        SelectGangLeader ->
            View.SelectLeader.render model

        AddMember ->
            View.AddMember.render model
