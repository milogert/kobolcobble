module Model.Model exposing
    ( AddEvent(..)
    , AppState
    , Model
    , Msg(..)
    , RemoveEvent(..)
    , SetEvent(..)
    , ViewChangeEvent(..)
    , fromViewEvent
    , init
    , toInt
    , toIntWithDefault
    )

import Model.GangMember exposing (..)


type Msg
    = ViewChange ViewChangeEvent
    | Add AddEvent
    | Set SetEvent
    | Remove RemoveEvent


type ViewChangeEvent
    = Dashboard
    | SelectGangLeader
    | AddMember


fromViewEvent : ViewChangeEvent -> String
fromViewEvent vce =
    case vce of
        Dashboard ->
            "Dashboard"

        SelectGangLeader ->
            "Select Gang Leader"

        AddMember ->
            "Add Gang Member"


type AddEvent
    = AGangMember GangMember


type SetEvent
    = SName String
    | SGold String
    | SNoteriety String
    | SRuthlessness String
    | SGangLeader GangMember
    | SMembers (List GangMember)
    | SActivate GangMember Bool


type RemoveEvent
    = RGangMember GangMember


type alias Model =
    { name : Maybe String
    , gold : Int
    , noteriety : Int
    , ruthlessness : Int
    , gangLeader : Maybe GangMember
    , members : List GangMember
    , state : AppState
    }


type alias AppState =
    { view : ViewChangeEvent
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Nothing 10 0 0 Nothing [] (AppState Dashboard)
    , Cmd.none
    )


toInt : String -> Int
toInt string =
    toIntWithDefault string 0


toIntWithDefault : String -> Int -> Int
toIntWithDefault string default =
    String.toInt string
        |> Maybe.withDefault default
