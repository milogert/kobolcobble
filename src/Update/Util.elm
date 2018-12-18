module Update.Util exposing (run)

import Model.Model exposing (..)
import Task


run : Msg -> Cmd Msg
run msg =
    Task.perform (always msg) (Task.succeed ())
