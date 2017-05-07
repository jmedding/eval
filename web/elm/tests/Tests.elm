module Tests exposing (..)

import Test exposing (..)
import Dict exposing (Dict)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String
import Json.Decode as Decode
import Components.Product as Product
import Components.Excluder as Excluder
import Components.Settings as Settings
import Components.Measure as Measure

import Debug exposing ( log )

all : Test
all =
    describe "Sample Test Suite"
        [ describe "Unit test examples"
            [ test "Addition" <|
                \() ->
                    Expect.equal (3 + 7) 10
            , test "String.left" <|
                \() ->
                    Expect.equal "a" (String.left 1 "abcdefg")
            ]
        , describe "Fuzz test examples, using randomly generated input"
            [ fuzz (list int) "Lists always have positive length" <|
                \aList ->
                    List.length aList |> Expect.atLeast 0
            , fuzz (list int) "Sorting a list does not change its length" <|
                \aList ->
                    List.sort aList |> List.length |> Expect.equal (List.length aList)
            , fuzzWith { runs = 1000 } int "List.member will find an integer in a list containing it" <|
                \i ->
                    List.member i [ i ] |> Expect.true "If you see this, List.member returned False!"
            , fuzz2 string string "The length of a string equals the sum of its substrings' lengths" <|
                \s1 s2 ->
                    s1 ++ s2 |> String.length |> Expect.equal (String.length s1 + String.length s2)
            ]
        , product
        , settings
        ]




product : Test
product =
    describe "Product test suite"
        [ test "Product Model json decoder" <|
            \() -> 
                let 
                    products = case Decode.decodeString ( Product.decodeProductList) jsonProductString of
                        (Ok products) -> products
                        (Err reason) -> log reason []
                in
                    Expect.equal 3 (List.length products)
        ]

jsonProductString : String
jsonProductString = 
  """
{"droppers":
    [{ "brand":"9point8", "partNo":"0000-0703", "model":"Fall Line", "diameter":"30.9", "length":"75", "actuator":"cable", "price":399, "reliability":5, "weight":498, "include":"True" }
    ,{ "brand":"9point8", "partNo":"0000-0608", "model":"Fall Line", "diameter":"30.9", "length":"125", "actuator":"cable", "price":399, "reliability":5, "weight":566, "include":"True" }
    ,{ "brand":"9point8", "partNo":"0000-0697", "model":"Fall Line", "diameter":"31.6", "length":"100", "actuator":"cable", "price":399, "reliability":5, "weight":516, "include":"True" }
    ]
}
  """ 

-- TODOS
--   Fix label position in chart
--   Add tooltip to chart bars
--   Remember filter settings in refresh
--   Add reset for filter features

-- DONE
--   Default is to show only one diameter and length
--   Sort droppers by score for the chart (pareto)
--   Filters should not reset when instance is selected/deselected
--   Add actuator as a filter
--   Add instance weight as a measure

settings : Test
settings = 
    let
        testExcluderSettingList = [("a", True), ("b", True)]
        excluderSettingList = [("test", testExcluderSettingList)]
        measureSettingList = [("a", 3), ("b", 7)]
        
        testSettings = Settings.Settings measureSettingList excluderSettingList
        excluder = ("test", Dict.fromList [("a", False), ("b", True), ("c", False)], (\p -> "attr"))
        nullExcluder = ("null", Dict.fromList [], (\p -> "attr"))
        measure1 = Measure.Model "A" "a" 5 (\a b c -> 5.0)
        measure2 = Measure.Model "B" "b" 5 (\a b c -> 5.0)
     
        -- For Testing Update functions
        settings = Dict.fromList [ ("test", Dict.fromList testExcluderSettingList )]
        (_, setDict, _) = Settings.restoreExcluder settings excluder

        -- For testing 'apply' function
        (newMeasures, newExcluders) = Settings.apply testSettings [measure1, measure2] [excluder]
    in
        describe "test Settings module"
            [describe "restore functions"
                [test "restoreExcluder function takes saved value" <|
                    \() -> Expect.equal (Just True) (Dict.get "a" setDict)
                ,test "restoreExcluder function keeps new value" <|
                    \() -> Expect.equal (Just False) (Dict.get "c" setDict)
                ]
            , describe "restore functions"
                [test "restore measures" <|
                    \() -> 
                        let
                            measures = Settings.restoreMeasures testSettings [measure1, measure2]
                            newWeight = case List.head measures of 
                                Just m -> m.weight
                                Nothing -> -1
                        in
                            Expect.equal 3 newWeight
                ,test "restore excluders" <|
                    \() -> 
                        let
                            excluders = Settings.restoreExcluders testSettings [excluder]
                            (_, dict, _) = case List.head excluders of
                                Just ex -> ex
                                Nothing -> nullExcluder
                        in
                            Expect.equal (Just True) (Dict.get "a" dict)
                ]
            ]