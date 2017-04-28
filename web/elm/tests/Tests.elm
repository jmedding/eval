module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String
import Json.Decode as Decode
import Components.Product as Product

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
    [{"weight":425.0,"updated_at":"2017-03-10T05:05:59.345223","reliability":6.0,"price":450.4,"partNo":"abc123","manufacturer":"Fox","length":"150","inserted_at":"2017-03-10T05:05:59.329144","diameter":"30.9","description":"Gravity"}
    ,{"weight":500.0,"updated_at":"2017-03-15T05:03:50.877758","reliability":7.0,"price":459.0,"partNo":"ksufe838","manufacturer":"Rockshox","length":"200","inserted_at":"2017-03-15T05:03:27.876840","diameter":"30.9","description":"Reverb"}
    ,{"weight":505.0,"updated_at":"2017-03-15T05:04:47.682686","reliability":7.0,"price":487.0,"partNo":"298ds98","manufacturer":"Rockshox","length":"175","inserted_at":"2017-03-15T05:04:47.682680","diameter":"34.1","description":"Reverb"}
    ]
}
  """ 

-- TODOS
--   Fix label position in chart
--   Sort droppers by score for the chart (pareto)
--   Add tooltip to chart bars
--   Remember filter settings in refresh
--   Add reset for filter features
--   Default is to show only one diameter and length

-- DONE
--   Filters should not reset when instance is selected/deselected
--   Add actuator as a filter
--   Add instance weight as a measure