module View.Util exposing (iconBrand, iconSolid)

import Html exposing (Html, i)
import Html.Attributes exposing (class)
import Model.Model exposing (..)


iconBrand : String -> Html Msg
iconBrand s =
    i [ class <| "fab fa-" ++ s ] []


iconSolid : String -> Html Msg
iconSolid s =
    i [ class <| "fas fa-" ++ s ] []
