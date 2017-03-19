port module Main exposing (..)

import Tests
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)


main : TestProgram
main =
    run emit Tests.product


port emit : ( String, Value ) -> Cmd msg
