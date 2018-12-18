module Model.GangMember exposing
    ( Alliance(..)
    , Equipment
    , GangMember
    , GangMemberState
    , MoveUnit(..)
    , UnitType(..)
    , defaultMember
    , fromAlliance
    , fromMove
    , fromUnitType
    , initGangMemberState
    , leaders
    , members
    )

import Model.Ability exposing (..)
import Model.Critical exposing (..)


type alias GangMember =
    { name : String
    , unitType : UnitType
    , alliance : Alliance
    , cost : Int
    , move : MoveUnit
    , fight : Int
    , defend : Int
    , wounds : Int
    , criticalSet : List (Maybe Critical)
    , abilities : List Ability
    , equipmentSet : List Equipment
    , state : GangMemberState
    }


type UnitType
    = GangLeader
    | Runt


fromUnitType : UnitType -> String
fromUnitType ut =
    case ut of
        GangLeader ->
            "Gang Leader"

        Runt ->
            "Runt"


type Alliance
    = Black
    | Red


fromAlliance : Alliance -> String
fromAlliance a =
    case a of
        Black ->
            "Black"

        Red ->
            "Red"


type MoveUnit
    = Width
    | Length


fromMove : MoveUnit -> String
fromMove a =
    case a of
        Width ->
            "Width"

        Length ->
            "Length"


type alias Equipment =
    { title : String
    , description : String
    }


type alias GangMemberState =
    { activated : Bool
    , woundsSustained : Int
    , statusEffects : List String
    }


initGangMemberState : GangMemberState
initGangMemberState =
    GangMemberState False 0 []


defaultMember : GangMember
defaultMember =
    GangMember "" GangLeader Red 0 Length 0 0 0 [] [] [] initGangMemberState


leaders : List GangMember
leaders =
    [ { defaultMember
        | name = "Barry the Elf"
        , fight = 4
        , defend = 4
        , wounds = 9
        , criticalSet =
            [ Just block, Just evade, Just heal, Just myNameIs ]
      }
    , { defaultMember
        | name = "Egg Keeper"
        , move = Width
        , fight = 4
        , defend = 4
        , wounds = 10
        , criticalSet =
            [ Just antagonize
            , Just eggToss
            , Just muskyScent
            , Just strangeAllure
            ]
      }
    ]


members : List GangMember
members =
    [ GangMember "Human Lowlife"
        Runt
        Red
        1
        Width
        2
        2
        3
        [ Nothing, Just kneecap, Nothing, Nothing ]
        []
        []
        initGangMemberState
    , GangMember "Halfling Bowman"
        Runt
        Red
        1
        Width
        2
        2
        2
        [ Nothing
        , Just blind
        , Nothing
        , Nothing
        ]
        [ Ability "Reload" "" ]
        []
        initGangMemberState
    , GangMember "Goblin Scumbag"
        Runt
        Black
        1
        Length
        2
        2
        2
        [ Nothing
        , Just bite
        , Nothing
        , Nothing
        ]
        [ Ability "Cowardly" "" ]
        []
        initGangMemberState
    , GangMember "Human Lowlife"
        Runt
        Red
        1
        Length
        2
        2
        2
        [ Just evade
        , Nothing
        , Nothing
        , Nothing
        ]
        []
        []
        initGangMemberState
    ]
