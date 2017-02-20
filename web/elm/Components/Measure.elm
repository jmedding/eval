module Components.Measure exposing ( .. )

import Html exposing (Html, Attribute, text, div, span, input)
import Html.Attributes as H exposing (class)
import Html.Events exposing (onInput)
import Components.Product as Product

-- MODEL


type alias Model = 
  { label : String
  , attribute : String
  , weight : Int
  , primeFunc : Int -> List Product.Model -> Product.Model -> Float
  }

initialMeasures : List Model
initialMeasures =
  [ Model "Reliability" "reliability"  5 primeReliability
  , Model "Price" "price"  5 primePrice
  ]


primeReliability : Int -> List Product.Model -> Product.Model -> Float
primeReliability weight products product =
  ( toFloat weight ) * product.reliability

primePrice : Int -> List Product.Model -> Product.Model -> Float
primePrice weight products product =
  let
    prices = List.map (\product -> product.price ) products
    min = List.foldl (\next min-> if next < min then next else min) 999999 prices
    max = List.foldl (\next max -> if next > max then next else max) -99999 prices
    minRange = 100
    range = if max - min < minRange then minRange else max - minRange

  in
    ( max - product.price ) / range * 5 * (toFloat weight)



-- MESSAGES


type Msg
  = Changed String String



-- VIEW

view : Model -> Html Msg
view model =
  div [ class "row" ]
  [ div [ class "row" ]
    [ span [class "col-sm-10"] [ text model.label ],
      span [class "col-sm-2"] [ text ( toString model.weight ) ]
    ]
  , div [class "row" ]
    [ div [class "col-sm-12"] 
      [ input 
        [ H.type_ "range"
        , H.min "0"
        , H.max "10" 
        , H.step "1"
        , H.value <| toString model.weight
        , onInput (Changed model.attribute)
        ][]
      ]
    ]
  ]



-- UPDATE

update : Msg -> List Model -> ( List Model, Cmd Msg )
update (Changed name val) measures =
  let
    updatedMeasures = updateWeight measures name (String.toInt val |> Result.withDefault 5 )
  in
    ( updatedMeasures, Cmd.none )



updateWeight : List Model -> String -> Int -> List Model
updateWeight measures name val =
  let 
    updateMeasure measure =
      if measure.attribute == name then
        { measure | weight = val }
        else 
          measure
  in
    List.map updateMeasure measures
