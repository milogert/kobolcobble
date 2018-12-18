module View.GangMember exposing
    ( render
    , renderPreview
    , renderWithDelete
    )

import Bootstrap.Badge as Badge
import Bootstrap.Button as Btn
import Bootstrap.Card as Card
import Bootstrap.Card.Block as Block
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, b, div, h4, h5, h6, small, text)
import Html.Attributes exposing (class, style)
import Model.GangMember exposing (..)
import Model.Model exposing (..)
import View.Util exposing (..)


render : Bool -> GangMember -> Html Msg
render preview gangMember =
    let
        activateButton =
            case preview of
                True ->
                    text ""

                False ->
                    Btn.button
                        [ Btn.onClick
                            (Set <| SActivate gangMember True)
                        , Btn.disabled
                            gangMember.state.activated
                        , Btn.attrs [ class "close ml-2" ]
                        ]
                        [ iconSolid "running" ]

        ( actionIcon, actionAction ) =
            case ( preview, gangMember.unitType ) of
                ( True, GangLeader ) ->
                    ( "check", Set (SGangLeader gangMember) )

                ( False, GangLeader ) ->
                    ( "sync", ViewChange SelectGangLeader )

                ( True, _ ) ->
                    ( "check", Add (AGangMember gangMember) )

                ( False, _ ) ->
                    ( "times", Remove (RGangMember gangMember) )

        actionButton =
            Btn.button
                [ Btn.onClick actionAction
                , Btn.attrs [ class "close ml-2" ]
                ]
                [ iconSolid actionIcon ]

        allianceBadge =
            case gangMember.alliance of
                Red ->
                    Badge.badgeDark
                        [ style "background-color" "red" ]
                        [ text "Red" ]

                Black ->
                    Badge.badgeDark
                        [ style "background-color" "black" ]
                        [ text "Black" ]

        critDisplayFunc index mCrit =
            let
                t =
                    case mCrit of
                        Nothing ->
                            "-"

                        Just c ->
                            c.title
            in
            ( "L-" ++ String.fromInt (index + 1), t )

        critList =
            gangMember.criticalSet
                |> List.indexedMap critDisplayFunc
    in
    Card.config [ Card.attrs [ class "mb-3" ] ]
        |> Card.headerH4 []
            [ text <| gangMember.name
            , small []
                [ text " - "
                , text <| Model.GangMember.fromUnitType gangMember.unitType
                , text " - "
                , allianceBadge
                ]
            , activateButton
            , actionButton
            ]
        |> Card.block []
            [ Block.titleH5 [] [ text "Stats" ]
            , Block.custom <|
                fourColRow
                    [ ( "M", Model.GangMember.fromMove gangMember.move )
                    , ( "F", String.fromInt gangMember.fight )
                    , ( "D", String.fromInt gangMember.defend )
                    , ( "W", String.fromInt gangMember.wounds )
                    ]
            , Block.titleH5 [] [ text "Criticals" ]
            , Block.custom <|
                fourColRow <|
                    critList
            ]
        |> Card.view


renderPreview : GangMember -> Html Msg
renderPreview gangMember =
    render True gangMember


renderWithDelete : GangMember -> Html Msg
renderWithDelete member =
    render
        False
        member


fourColRow : List ( String, String ) -> Html Msg
fourColRow items =
    Grid.row [] <|
        List.map
            (\( label, value ) ->
                Grid.col [ Col.sm3, Col.xs12 ]
                    [ b [] [ text label ]
                    , text <| ": " ++ value
                    ]
            )
            items
